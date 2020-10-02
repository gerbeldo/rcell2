##################### Plotting Functions ##################################

#*************************************************************************#
#public
# Addapted from qplot in package ggplot2
# cplot is a convenient wrapper function for creating ggplot objects of a cell.data object.
# ToDo: Allow expresion when y is a vector
# ToDo: dont transform x and y to factor if log scale is used
# ToDo: change behaviour of as.factor for x/y vs other aesthetics
# ToDo: when using vector as y, use order of variables in vector to assign color (ordered factor)
# ToDo: include parent environment on the search of the eval of subset. When called from within a function, it has problems.
cplot <- function(X=NULL, x=NULL, subset=NULL, y=NULL, z=NULL, ... 
                  , facets = NULL, margins=FALSE, geom = "auto"
                  , stat=list(NULL), position=list(NULL), log = "", as.factor="as.factor"
                  , xlim = c(NA, NA), ylim = c(NA, NA), xzoom = c(NA,NA), yzoom = c(NA,NA)
                  , xlab = deparse(substitute(x)), ylab = deparse(substitute(y)), asp = NA
                  , select = NULL, exclude = NULL, na.rm = TRUE, QC.filter = TRUE
                  , main = NULL, add = FALSE, layer = FALSE) {
  
  subset=substitute(subset)
  on.exit(gc())
  
  #Asserting arguments
  if(add&&layer) stop("add and layer are mutually exclusive arguments\n") 
  
  #dealing with cell.data or data.frame
  if(!is.null(X)){			
    if(is.cell.data(X)) data <- X$data
    else if(is.data.frame(X)) data <- X
    else stop("First argument should be of class cell.data or data.frame, not ",class(X)[1])
    
    #filtering by QC variable
    if(is.logical(data$QC) && QC.filter){
      if(!is.cell.data(X)) cat("Filtering by QC variable\n")
      data=data[data$QC,]
    }
  }
  
  argnames <- names(as.list(match.call(expand.dots=FALSE)[-1]))
  arguments <- as.list(match.call()[-1])
  
  #dealing with formula notation
  if(isTRUE(try(plyr::is.formula(x),silent=TRUE))){
    if(length(x)==3){ # y~x
      argnames=c(argnames,"y")
      arguments$y=(y=x[[2]])
      arguments$x=(x=x[[3]])
    } else if (length(x)==2){ # ~x
      arguments$x=(x=x[[2]])
    } else stop("formula should be of the form y~x or ~x")	
  }
  
  aesthetics <- plyr::compact(arguments[.all_aesthetics])
  aesthetics <- aesthetics[!is.constant(aesthetics)]
  
  #defining aesthetics as dataset variables only
  SPECIAL.AESTHETICS <- c("..density..","..count..","variable")
  var_names <- .get_var_names(arguments,names(data),warn=TRUE)	
  aesthetics <- aesthetics[aesthetics %in% var_names | sapply(aesthetics,class)=="call" | aesthetics %in% SPECIAL.AESTHETICS] 
  
  aes_names <- names(aesthetics)
  aesthetics <- rename_aes(aesthetics)
  class(aesthetics) <- "uneval"
  
  #dealing with new data
  if(!is.null(X)){ 
    
    inherit.aes=FALSE 
    
    #no x aesthetic
    if(is.null(substitute(x))) 
      if(!layer){ stop("x aesthetic required for new plot")
      }else{
        message("x aesthetic missing, inheriting aesthetics from plot, complete dataset included in layer")
        var_names=names(data)	
        inherit.aes=TRUE
      }
    
    #variable selection to keep in ggplot object
    if(!is.null(select)|!is.null(exclude)){
      if(is.cell.data(X)) var_names=union(var_names,.select(X$variables,select,exclude))
      else var_names=union(var_names,.select(list(all=names(data)),select,exclude))
    }
    
    #subsetting the data
    if(!is.null(subset)) data <- data[eval(subset,data,parent.frame(n=1)),]
    if(dim(data)[1]==0) stop("no data left after subset")
    data <- data[var_names] 
    
    #removing NAs
    if(isTRUE(na.rm)) data<-na.omit(data)
    if(dim(data)[1]==0) stop("no data left after eliminating registers with NAs. Change na.rm to FALSE")
    
    #transforming as.factor variables to factors
    if(!is.null(as.factor)){
      if(is.cell.data(X)){
        var_as_factors=intersect(var_names,.select(X$variables,as.factor))
      } else if(is.data.frame(X)) {
        var_as_factors=intersect(var_names,as.factor)
      }
      for(i in var_as_factors)
        data[[i]]<-base::as.factor(data[[i]])
      if(length(var_as_factors)>0) message(paste("treating",toString(var_as_factors),"as factor"))
    }
  }
  
  #dealing with vectorial y aesthetic
  sy=substitute(y)
  if(class(sy)=="call")
    if(sy[[1]]=="c"){
      if(is.null(X)) stop("data required when using multiple \"y\" mapping\n")
      data <- melt(data,measure.vars=.get_var_names(sy,names(data)))
      aesthetics$y <- quote(value)
      if(is.null(aesthetics$colour)) aesthetics$colour <- quote(variable)
      aes_names <- names(aesthetics)
      aesthetics <- rename_aes(aesthetics)		
    }
  
  
  # Work out plot data, and modify aesthetics, if necessary
  if ("auto" %in% geom) {
    if (stat == "qq" || "sample" %in% aes_names) {
      geom[geom == "auto"] <- "point"
      stat <- "qq"
    } else if (missing(y)) {
      geom[geom == "auto"] <- "histogram"
      if (is.null(ylab)) ylab <- "count"
    } else {
      if (missing(x)) {
        aesthetics$x <- bquote(seq_along(.(y)), aesthetics)
      }
      geom[geom == "auto"] <- "point"
    }
  }
  
  env <- parent.frame()
  
  #creating layer list
  l=list()
  
  # Add geoms/statistics
  if (proto::is.proto(position)) position <- list(position)
  mapply(function(g, s, ps) {
    if(is.character(g)) g <- ggplot2:::Geom$find(g)
    if(is.character(s)) s <- ggplot2:::Stat$find(s)
    if(is.character(ps)) ps <- ggplot2:::Position$find(ps)
    
    params <- arguments[setdiff(names(arguments), c(aes_names, argnames))]
    params <- lapply(params, eval, parent.frame(n=1))
    if(!is.null(X)){
      l <<- c(l, list(layer(geom=g, stat=s, geom_params=params, stat_params=params
                            ,position=ps, data=data, inherit.aes=inherit.aes, mapping=aesthetics) ))
    }else{
      l <<- c(l, list(layer(geom=g, stat=s, geom_params=params, stat_params=params
                            ,position=ps, mapping=aesthetics)))
    }
  }, geom, stat, position)
  
  #dealing with facets
  if (is.null(facets)) {
    l <- c(l,list(facet_null()))
  } else if (plyr::is.formula(facets) && length(facets) == 2) {
    l <- c(l,list(facet_wrap(facets)))
  } else {
    l <- c(l,list(facet_grid(facets = deparse(facets), margins = margins)))
  }    
  
  logv <- function(var) var %in% strsplit(log, "")[[1]]
  
  if (logv("x")) l <- c(l, list(scale_x_log10()))
  if (logv("y")) l <- c(l, list(scale_y_log10()))
  
  if (!missing(xlim)) l <- c(l, list(xlim(xlim)))
  if (!missing(ylim)) l <- c(l, list(ylim(ylim)))
  
  if (!missing(xzoom)) l <- c(l, list(xzoom(xzoom)))
  if (!missing(yzoom)) l <- c(l, list(yzoom(yzoom)))
  
  if(layer)
    return(l)
  else{
    if(add)	p <- last_plot()
    else p <- ggplot(data=data, aesthetics, environment = parent.frame(n=1)) #env
    p <- p + l 
    if (!missing(xlab)) p <- p + xlab(xlab)
    if (!missing(ylab)) p <- p + ylab(ylab)
    
    if (!is.null(main)) p <- p + ggtitle(main)
    if (!is.na(asp)) p <- p + theme(aspect.ratio = asp)
    
    return(p)
  }  
}

