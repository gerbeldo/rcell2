#' Armar mosaicos cuadrados a partir de un vector de imagenes en magick de cualquier longitud
#' @param images A magick image vector, with images of the same size preferably.
#' @param nRow An integer indicating number of rows. If specified, nCol must be specified too.
#' @param nCol An integer indicating number of rows. If specified, nRow must be specified too.
#' @return A single magick image of the squared tile.
# @examples
# square_tile(images)
#' @import magick dplyr
#' @rawNamespace import(foreach, except = c("when", "accumulate"))
#' @export
square_tile <- function(images, nRow = NULL, nCol = NULL){
  
  if(sum(is.null(nRow), is.null(nCol)) == 1) 
    stop("square_tile error: if at least one of nRow or nCol is specified, both of them must.")
  
  if(any(is.null(nRow), is.null(nCol))) nRow <- ceiling(sqrt(length(images)))
  if(any(is.null(nRow), is.null(nCol))) nCol <- ceiling(length(images)/nRow)
  
  image.tile <- foreach::foreach(tile_row=0:(nRow-1), .combine=c) %do% {
    
    row_images_index = (1 + tile_row * nCol):(tile_row * nCol + nCol)
    
    # Important for the last row
    if(nRow * nCol > length(images)){
      row_images_index <- row_images_index[row_images_index <= length(images)]
    }
    print(row_images_index)
    images[row_images_index] %>% 
      magick::image_border(color = "white", geometry = "20x20") %>% 
      magick::image_annotate(text = row_images_index, size = 20, gravity = "north") %>% 
      magick::image_append()
  }
  
  image.tile <- magick::image_append(image.tile, stack = T)
  
  if(length(images) > 50) message("square_tile says: you have more than 50 images in the input array ¿Are you sure that this is ok?")
  return(image.tile)
}

#' Test whether all elements in a vector are unique
#' 
#' Uses \code{length()}.
#' 
all.unique <- function(test_vector){
  length(test_vector) == length(unique(test_vector))
}

#' cellMagick configured for prodicing a ucid's gif
#' 
#' @inheritParams magickCell
#' @param animation_delay Delay between animation frames in seconds.
#' @param stack_channels_horizontally Time increases from left to right (TRUE) or from up to down (FALSE).
#' @param channels Name of the CellID channel (BF, BF.out, RFP, etc.). "BF.out" by default.
#' @param ... Arguments passed on to magickCell.
#' 
cellGif <- function(cdata,
                    paths,
                    equalize_images = F,
                    normalize_images = F,
                    channels = c("BF.out"), 
                    animation_delay = 1/3,
                    id_column = "ucid", time_colum = "t.frame",
                    stack_channels_horizontally = TRUE,
                    ...){
  
  if(!all.unique(cdata[,id_column,drop=T]) & length(unique(cdata[,id_column,drop=T])) > 1)
    stop(paste0("Error in cellGif: id column '", 
                id_column, 
                "' is not a primary key."))
  
  img <- arrange(cdata, !!as.symbol(time_colum)) %>% 
    magickCell(paths,
               equalize_images = equalize_images, 
               normalize_images = normalize_images,
               cell_resize = 200,
               ch = channels,
               return_single_imgs = TRUE,
               stack_vertical_first = !stack_channels_horizontally,
               ...) %>% 
    magick::image_animate(delay = animation_delay*100)
  
  return(img)
}

#' cellMagick configured for prodicing a ucid's strip
#' 
#' @inheritParams magickCell
#' @param stack_time_horizontally Time increases from left to right (TRUE) or from up to down (FALSE).
#' @param channels Name of the CellID channel (BF, BF.out, RFP, etc.). "BF.out" by default.
#' @param ... Arguments passed on to magickCell.
#' 
cellStrip <- function(cdata,
                      paths,
                      equalize_images = F,
                      normalize_images = F,
                      channels = c("BF.out"), 
                      animation_delay = 1/3,
                      stack_time_horizontally = TRUE,
                      id_column = "ucid", time_colum = "t.frame",
                      ...){
  
  multiple_ids <- length(unique(cdata[, id_column,drop=T])) > 1
  ids_unique <- all.unique(cdata[, id_column, drop=T])
  # If there is more than one unique ID, but they are not all different,
  # then the column cannot be used to split 
  if(multiple_ids & !ids_unique)
    warning(paste0("Warning in cellGif: id column '", 
                   id_column, "' is not a primary key."))
  
  img <- dplyr::arrange(cdata, !!as.symbol(time_colum)) %>% 
    magickCell(paths,
               equalize_images = equalize_images, 
               normalize_images = normalize_images,
               cell_resize = 200,
               ch = channels,
               return_single_imgs = TRUE,
               stack_vertical_first = stack_time_horizontally,
               ...)
  
  magick::image_append(img, stack = !stack_time_horizontally)
}

#' Wraps cellMagick to make strips, optionally cutting them.
#' 
#' `cdata` is split by `split_col` and then images are generated.
#' 
#' `images` are split with `cut`, useful wen strips are too long.
#' 
#' @inheritParams cellStrip
#' @param n_ucids will select the first `n_ucids`
#' @param cut_strips Use `cut` to split the image series.
#' 
cellStrips <- function(cdata,
                       paths,
                       n_ucids = NULL,
                       cut_breaks = 1,
                       split_col = "ucid",
                       ch = c("BF.out", "YFP.out"),
                       sortVar = "t.frame",
                       ...){

  if(is.null(n_ucids)) n_ucids <- length(unique(cdata[[split_col]]))
    
  # Una random
  # split(cdata, cdata$ucid) %>% sample(1) %>% bind_rows() %>% 
  # Una específicamente
  images <- 
    split(cdata, cdata[[split_col]]) %>% .[1:n_ucids] %>% 
    lapply(function(ucid.cdata){
      ucid_images <- 
        magickCell(cdata = ucid.cdata, paths = paths, 
                   sortVar = sortVar, ch = ch,
                   seed = NULL,
                   return_single_imgs = T,
                   stack_vertical_first = T,
                   ...)
      
      if(cut_breaks > 1)
        ucid_images.list <- split(ucid_images, 
                                   cut(1:length(ucid_images),
                                       breaks = min(length(ucid_images),
                                                    cut_breaks)
                                   ))
      else
        ucid_images.list <- list(ucid_images)
      
      return(ucid_images.list)
    }
    )
  
  
  images <- lapply(images, 
                   function(images.split)
                     lapply(images.split, magick::image_append)
  )
  
  return(images)
}

#' Update a list's value using another list, by common names.
#' 
#' Names of `l2` present in `l1` will update values in `l1`.
#' 
#' Names of `l2` absent in `l1` will be ignored, unless `only.common.names=F`.
#' 
#' @param l1 List to be updated (with the "original" or "old" values).
#' @param l2 List used for updating (with the "newer" values). Note: it needn't have all names
#' @param ... Arguments passed on to magickCell.
#' 
updateList <- function(l1, l2, only.common.names=T){
  if(!is.list(l2) | !is.list(l1)) stop("Error: input must be two named lists.")
  
  if(only.common.names){
    common.names <- names(l2)[names(l2) %in% names(l1)]
    l1[common.names] <- l2[common.names]
  } else{
    l1[names(l2)] <- l2[names(l2)]
  }
  return(l1)
}

#' 2D binning of data and tiling of cell pictures
#' 
#' @inheritParams magickCell
#' @param xvar,yvar Strings indicating names for the variables to plot in the horizontal (x) and vertical (y) axis.
#' @param x.cuts,y.cuts Integers indicating the number of cuts for each variable.
#' @param for_plotting Return value changes to list of elements important for plotting.
#' @param ... Arguments passed on to magickCell.
#' 
cellSpread <- function(cdata, paths,
                       ch = "BF.out", boxSize = 80,
                       xvar = "a.tot", yvar="fft.stat",
                       x.cuts = 7, y.cuts = 7,
                       for_plotting = F, ...){
  
  cdata.binned <- cdata
  
  x_data <- cdata.binned[,xvar, drop =T]
  y_data <- cdata.binned[,yvar, drop =T]
  
  cdata.binned$x_bins <- cut(x_data, breaks = x.cuts, ordered_result=T, dig.lab = 2)  #, labels = 1:x.cuts)  # labels = FALSE
  cdata.binned$y_bins <- cut(y_data, breaks = y.cuts, ordered_result=T, dig.lab = 2)  #, labels = 1:y.cuts)  # labels = FALSE
  
  # cdata.binned %>% group_by(x_bins,
  #                           y_bins) %>% 
  #   sample_n(1) %>% select(ucid, t.frame, x_bins, y_bins) %>% 
  #   arrange(desc(y_bins), x_bins)
  
  blank_image <- magick::image_blank(boxSize,boxSize,color = "black") %>% 
    magick::image_annotate(text = "NA", gravity = "Center", color = "white") %>% 
    magick::image_border("green","1x1")
  cell_tile_array <- blank_image  # initialize
  
  for(channel in ch){
    image_array <- blank_image  # initialize or reset
    
    for(row_i in 1:y.cuts){
      for(col_i in 1:x.cuts){
        
        row_level <- rev(levels(cdata.binned$y_bins))[row_i]
        col_level <- levels(cdata.binned$x_bins)[col_i]
        
        cdata.bin <- cdata.binned[cdata.binned$x_bins == col_level & cdata.binned$y_bins == row_level,]
        cdata.bin_n <- nrow(cdata.bin)
        
        if(cdata.bin_n >= 1){
          cdata.bin.one <- sample_n(cdata.bin, 1)
          
          img <- magickCell(cdata = cdata.bin.one, 
                            paths = paths, return_single_imgs = T,
                            ch = channel, boxSize = boxSize, ...) %>% 
            magick::image_annotate(text = cdata.bin_n, gravity = "northeast", 
                                   color = "white", boxcolor = "black")
        } else {
          img <- blank_image
        }
        
        image_array <- c(image_array, img)
      }
    }
    
    cell_tile <- square_tile(image_array[-1], nRow = y.cuts, nCol = x.cuts)
    
    axis_text_box <- magick::image_blank(width = boxSize, height = boxSize,  color = "white")
    axis_label_box_x <- magick::image_blank(width = boxSize*(x.cuts+1), height = boxSize/2, color = "white") %>% 
      image_annotate(text = xvar, size = boxSize/4, gravity = "Center", color = "black", degrees = 0)
    axis_label_box_y <- magick::image_blank(width = boxSize/2, height = boxSize*(y.cuts+1), color = "white") %>% 
      image_annotate(text = yvar, size = boxSize/4, gravity = "Center", color = "black", degrees = -90)
    
    axis_text_boxes_x <- 
      rep(axis_text_box, x.cuts) %>% 
      magick::image_annotate(text = levels(cdata.binned$x_bins), 
                             gravity = "Center", color = "black", degrees = -45) %>% 
      image_append()
    
    axis_text_boxes_y <- 
      rep(axis_text_box, x.cuts) %>% 
      magick::image_annotate(text = rev(levels(cdata.binned$y_bins)), 
                             gravity = "Center", color = "black", degrees = -45) %>% 
      image_append(stack = T)
    
    if(for_plotting){
      cell_tile_labeled <- cell_tile
    } else {
      cell_tile_labeled <- cell_tile %>% 
        {magick::image_append(c(., axis_text_boxes_x, axis_label_box_x), stack = T)} %>% 
        {magick::image_append(c(axis_label_box_y, axis_text_boxes_y, .), stack = F)}
    }

    cell_tile_array <- c(cell_tile_array, cell_tile_labeled)
  }

  if(for_plotting)
    return(list(cell_tiles = cell_tile_array[-1],
                channels = ch,
                row_levels = rev(levels(cdata.binned$y_bins)),
                col_levels = levels(cdata.binned$x_bins),
                xvar = xvar,
                yvar = yvar,
                x.cuts = x.cuts,
                y.cuts = y.cuts))
  else 
    return(cell_tile_array[-1])
}

#' Plot for 2D binning of data and tiling of cell pictures
#' 
#' @inheritParams cellSpread
#' @param overlay_points Overlay data points to the image plot.
#' @param underlay_points Underlay data points to the image plot.
#' @param draw_contour_breaks Overlay a ggplot2::stat_density2d layer. If TRUE, use the default breaks. Otherwise NULL for none, or a numeric vector for the density breaks.
#' 
cellSpreadPlot <- function(cdata, paths,
                           ch = "BF.out", boxSize = 80,
                           xvar = "a.tot", yvar="fft.stat",
                           overlay_points = F, underlay_points = F,
                           draw_contour_breaks = NULL,
                           x.cuts = 7, y.cuts = 7, ...){
  
  plot_list <- list()
  
  xvar_sym <- as.symbol(xvar)
  yvar_sym <- as.symbol(yvar)
  
  for(channel in ch){
    cell_tile <- cellSpread(cdata = cdata, paths = paths, ch = channel, boxSize = boxSize, 
                            xvar, yvar, x.cuts = x.cuts, y.cuts = y.cuts, for_plotting = T, ...)
    
    raster <- as.raster(cell_tile$cell_tiles[1])
    
    p <- ggplot(cdata,
                aes(x = !!xvar_sym, 
                    y = !!yvar_sym)) + 
      {if(underlay_points) geom_point() else NULL} +
      # annotation_raster(raster=raster, -Inf, Inf, -Inf, Inf) +
      annotation_raster(raster=raster,
                        xmin = min(cdata[, xvar, drop = T]),
                        xmax = max(cdata[, xvar, drop = T]),
                        ymin = min(cdata[, yvar, drop = T]),
                        ymax = max(cdata[, yvar, drop = T])) +
      {if(overlay_points) geom_point(shape = 21, colour = alpha("black", 0.3), 
                                     fill = alpha("white", 0.1), stroke = 1.25) else NULL} +
      geom_blank() +
      scale_x_continuous(limits = range(cdata[, xvar, drop = T]),
                         expand = expansion(1/100)) +
      scale_y_continuous(limits = range(cdata[, yvar, drop = T]),
                         expand = expansion(1/100)) +
      theme_minimal() +
      theme(legend.position = "none")  #, plot.margin = unit(rep(0,4), "mm"))
    
    if(!is.null(draw_contour_breaks)){
      if(isTRUE(draw_contour_breaks)) draw_contour_breaks <- 2^-seq(8,8+2*4,by=2)
      p <- p +
        stat_density2d(breaks=draw_contour_breaks, alpha = .4,
                       geom="contour", adjust = 1.25, color = "white",
                       # bins=4, 
                       size= 2)
      # p + geom_density_2d(color = "white", bins = 20, breaks = )
      # p + stat_density2d(aes(color = ..level..))
    }
    
    plot_list[[channel]] <- p
  }
  
  # raster <- p$layers[[1]]$geom_params$raster
  # plot(raster)
  return(plot_list)
}


#' Geometria para agarrar un cuadradito de una imagen con magick por coordenada del centro
#' 
#' https://ropensci.org/blog/2017/08/15/magick-10/
#' 
#' https://livefreeordichotomize.com/2017/07/18/the-making-of-we-r-ladies/
#' 
#' @param xpos x pixel coordinate.
#' @param ypos y pixel coordinate.
#' @param boxSize side length of the final square
#' @return magick::geometry_area configured for cellMagick
#' 
getCellGeom <- function(xpos, ypos, boxSize = 50){
  geometry <- magick::geometry_area(width = boxSize,
                                    height = boxSize,
                                    x_off = xpos - base::ceiling(boxSize)/2,
                                    y_off = ypos - base::ceiling(boxSize)/2)
  return(geometry)
}


#' Funcion copada para mostrar fotos de Cell-ID basada en magick
#' 
#' @description 
#' El uso más básico es \code{magickCell(cdata=cell.data$data, paths=cell.data$images)}.
#' 
#' Para mostrar algunas celulas en particular, solo hay que pasarle un \code{cdata} filtrado.
#' 
#' Ver la descripción de argumentos más abajo para aprender sobre las opciones.
#' 
#' Al fondo, en los detalles, hay una descripción de como debería ser el \code{paths} dataframe.
#' 
#' @details
#' Paths dataframe structure. Output example from \code{glimpse(paths)}:
#' 
#' \preformatted{Columns: 6
#' $ pos     <int> 1
#' $ t.frame <int> 0
#' $ channel <chr> "YFP"
#' $ image   <chr> "picture_filename.tif"
#' $ path    <chr> "/path/to/directory/with/pictures/"
#' $ file    <chr> "/path/to/directory/with/pictures/picture_filename.tif"
#' $ is.out  <lgl> FALSE
#' }
#'
#' @param cdata A Rcell data.frame (not the object).
#' @param paths A paths dataframe with file path, t.frame, position and channel information of each picture.
#' @param max_composite_size Maximum size of the final composite image (this resize is applied last) in pixels. 1000 by default.
#' @param cell_resize Resize string for the individual cell images (\code{NULL} translates to \code{boxSize}x\code{boxSize} by default).
#' @param boxSize Size of the box containing the individual cell images. 50 by default.
#' @param n.cells maximum number of cells to display.
#' @param equalize_images Use magick's function to "equalize" the image when TRUE (FALSE by default).
#' @param normalize_images Use magick's function to "normalize" the image when TRUE (FALSE by default).
#' @param ch Name of the CellID channel (BF, BF.out, RFP, etc.). "BF.out" by default.
#' @param sortVar Variable name used to sort the rows after sampling if a \code{seed} was specified. NULL by default, to preserve the original or random sampling order.
#' @param seed Seed value for sampling of cell images. NULL by default, to disable sampling.
#' @param .debug Print more messages if TRUE.
#' @param return_single_imgs If TRUE, return a vector of images instead of a tile.
#' @param return_ucid_df If TRUE, return is a list of magick images and ucid dataframes.
#' @param annotation_params Set to NULL to skip annotations, or a named list with values for magick::annotate options (one or more of the names "color" "background" "size"). Note that size close to zero can be invisible.
#' @param stack_vertical_first Set to TRUE to stack images vertically first (useful when \code{return_single_imgs = T}).
#' @param return_raw Returns loaded images prematurely (i.e. without any processing other than magick::image_read and magick::image_crop).
#' @return A list of two elements: the magick image and the ucids in the image.
# @examples
# magickCell(cdataFiltered, sample_tiff$file, position = sample_tiff$pos, resize_string = "1000x1000")
#' @import magick dplyr
#' @rawNamespace import(foreach, except = c("when", "accumulate"))
#' @export
magickCell <- function(cdata, paths,
                       max_composite_size = 1000, 
                       cell_resize = NULL,
                       boxSize = 80, 
                       n.cells = 25,
                       equalize_images = F, 
                       normalize_images = F,
                       ch = "BF.out",
                       sortVar = NULL,
                       seed = NULL, 
                       .debug=FALSE, 
                       return_single_imgs = FALSE, 
                       return_ucid_df = FALSE,
                       annotation_params = list(color = "white", 
                                                background = "black"),
                       stack_vertical_first = FALSE,
                       return_raw = FALSE
                       ){
  if(.debug) print("F8")
  if(!nrow(cdata) > 0){
    warning("rcell2::magickCell warning: the 'cdata' data.frame is empty, returning NULL.")
    return(NULL)
  }
  if(!nrow(paths) > 0){
    warning("rcell2::magickCell warning: the 'paths' data.frame is empty, returning NULL.")
    return(NULL)
  }

  # "100x100" pixels
  if(is.null(cell_resize)) cell_resize <- boxSize
  cell_resize_string <- paste0(cell_resize, "x", cell_resize)
  
  ch.avail <- unique(paths[,"channel",drop=T])
  
  # Filter paths by pos and t.frame on cdata
  if(!all(ch %in% paths[,"channel",drop=T])){
    stop(cat(
      paste0("\nmagickCell error: channels '",
             ch[!ch %in% ch.avail],
             "' are not in the paths dataframe. ",
             "\n\nPossible values are: '", 
             paste(ch.avail, collapse = "', '"),
             "'\n")
    ))
  }
  paths <- filter(paths, pos %in% cdata[,"pos", drop = T] & t.frame %in% cdata[,"t.frame", drop = T])
  
  # Add file path column if absent
  if(!"file" %in% names(paths)){
    paths$file <- normalizePath(paste0(paths$path, "/", paths$image))
    warning("\nWarning (magickCell): 'file' variable absent in paths dataframe. Recreating it from 'path' and 'image' variables.\n")
  }
  
  # Annotation parameters
  annotation_params_default = list(color = "white",
                                   background = "black",
                                   size = cell_resize/7)
  if(!is.null(annotation_params)) 
    annotation_params <- updateList(annotation_params_default, 
                                    annotation_params)
  

  n.cells <- min(c(n.cells, nrow(cdata))) # Limit amount of pics to "n.cells"
  
  # To-do:
  ## Using more than one channel with default options
  ## does not produce the expected output: one square tile per channel.

  # TO-DO
  ## Read only parts of the TIFF matrix to speed up stuff: https://stackoverflow.com/questions/51920316/open-only-part-of-an-image-jpeg-tiff-etc-in-r
  ## Bin the data in 2D and sample 1 cell from within both bin groups.
  ## Can be an animated GIF to show more than 1 cell per bin.
  ## https://rdrr.io/cran/magick/man/image_ggplot.html
  ## funcion cut() https://www.jdatalab.com/data_science_and_data_mining/2017/01/30/data-binning-plot.html
  ## http://finzi.psych.upenn.edu/R/library/ks/html/binning.html
  ## https://rdrr.io/cran/ks/man/binning.html
  ## https://www.rdocumentation.org/packages/npsp/versions/0.7-5/topics/binning

  # Sample the cdata dataframe
  cdataSample <- cdata[,unique(c("pos", "xpos", "ypos", "ucid", "t.frame", sortVar))]  # keep only the necessary columns
  
  # Set seed if specified, and sample "n.cells" from the dataframe
  if(!is.null(seed)){ 
    set.seed(seed)
    # Sample
    cdataSample <- cdata[sample(1:nrow(cdata), size = n.cells, replace = F),] # sample n.cells rows from cdata
  } else {
    # Else, just take the first "n.cells" rows
    # This was possibly missing: not subsetting of cdata caused all images to be loaded,
    # even though only a few "n.cells" had been requested. This seems to make magickCell much faster (not really tested).
    cdataSample <- cdata[1:n.cells,]
  }
  # Sort cdata
  if(!is.null(sortVar)) cdataSample <- cdataSample[order(cdataSample[[sortVar]]),]  # sort the sample by "sortVar"

  imga <-
    foreach::foreach(i=1:nrow(cdataSample), .combine=c) %do% {
  
      position <- cdataSample$pos[i]
      ucid <- cdataSample$ucid[i]
      t_frame <- cdataSample$t.frame[i]
      picPath.df <- subset(paths, pos == position & channel %in% ch & t.frame == t_frame)
      picPath <- picPath.df$file[order(match(picPath.df$channel, ch))]  # order paths according to ch argument
      
      stopifnot(length(position) == 1 &length(ucid) == 1 &length(t_frame) == 1) # Checks
      stopifnot(length(picPath) == length(ch) & is.character(picPath)) # Checks
      
      imgs.raw <- 
        magick::image_read(picPath) %>%
          magick::image_crop(getCellGeom(xpos = cdataSample$xpos[i],
                                         ypos = cdataSample$ypos[i],
                                         boxSize))
      
      if(return_raw){
        # Return
        imgs.raw
      } else {
        imgs.proceesed <- imgs.raw %>%
          {if (equalize_images) magick::image_normalize(.) else .} %>%
          {if (normalize_images) magick::image_equalize(.) else .} %>%
          # Add square black box
          {magick::image_composite(
            magick::image_blank(boxSize, boxSize, "black"),
            ., gravity = "Center"
          )} %>% 
          # Resize
          magick::image_scale(cell_resize_string) %>%
          # Annotate
          {if(is.null(annotation_params)) . else 
            magick::image_annotate(.,
                                   text = paste(paste0("Pos", as.character(position)),
                                                paste0("t", t_frame),
                                                ch),
                                   color = annotation_params[["color"]],
                                   boxcolor = annotation_params[["background"]],
                                   size = annotation_params[["size"]],
                                   font = "Comic sans",
                                   gravity = "SouthEast")} %>%
          {if(is.null(annotation_params)) . else 
            magick::image_annotate(.,
                                   text = as.character(ucid),
                                   color = annotation_params[["color"]],
                                   boxcolor = annotation_params[["background"]],
                                   size = annotation_params[["size"]],
                                   font = "Comic sans",
                                   gravity = "NorthWest")} %>%
          # Add black border
          magick::image_border("black","1x1") %>% 
          # Tile horizontally
          magick::image_append(stack = stack_vertical_first)
        
        # Return
        imgs.proceesed
      }
    }

  stopifnot(length(imga) == nrow(cdataSample)) # Checks
  
  if(return_single_imgs) {
    if(return_ucid_df) {
      return(list("img" = imga, "ucids" = cdataSample$ucid))
    } else {
      return(imga)
    }
  }
  
  nRow <- ceiling(sqrt(n.cells))
  nCol <- ceiling(n.cells/nRow)
  
  max.width <- max(magick::image_info(imga)$width)
  max.height <- max(magick::image_info(imga)$height)

  imgb <- foreach::foreach(i=0:(nRow-1), .combine=c) %do% {

    j = (1 + i*nCol):(i*nCol + nCol)
    j = j[j <= n.cells]

    magick::image_apply(imga[j], function(i){
      magick::image_blank(width = max.width, height = max.height, color = "black") %>%
        # Now unnecesary, image_blank size is based on maximum sizes in 'imga'.
        # magick::image_scale(cell_resize_string) %>%
        magick::image_composite(i) }) %>%
      magick::image_append(stack = stack_vertical_first)
  }
  imgb <- magick::image_append(imgb, 
                               stack = !stack_vertical_first)

  if(nRow*cell_resize >= max_composite_size || nCol*cell_resize >= max_composite_size){
    resize_string <- paste0(max_composite_size, "x", max_composite_size)
    imgb <- magick::image_scale(imgb, resize_string)
  }

  
  if(return_ucid_df)
    return(list("img" = imgb,
                "ucids" = cdataSample$ucid))
  else return(imgb)
}

#' magickCell alias
#' 
#' @inheritParams magickCell
#' 
cellMagick <- function(...){
  magickCell(...)
}

#' Funcion copada para mostrar fotos basada en magick
#'
#' @param picPath Image path for the correct position, only one.
#' @param interpolate Passed on to layer params.
#' @return A custom annotation_raster for ggplot.
# @examples
# annotation_magick(.img.path)
#' @import magick grDevices ggplot2
#' @export
annotation_magick <- function(picPath, interpolate = FALSE) {

  # Por ahi era mas facil armarla con NSE: https://wiki.frubox.org/proyectos/atr/rdevel#filter

  stopifnot(length(picPath) == 1 & is.character(picPath)) # Checks

  .img <- picPath %>%
    magick::image_read() %>%
    magick::image_normalize() %>%
    # magick::image_rotate(180) %>%
    magick::image_flip() %>%
    magick::image_fill("none")

  raster <- as.raster(.img)

  .img.info <- magick::image_info(.img)

  raster <- grDevices::as.raster(raster)
  ggplot2::layer(#data = dummy_data(),
    data = data.frame(x = NA),
    mapping = NULL, stat = ggplot2::StatIdentity,
    position = ggplot2::PositionIdentity, geom = ggplot2::GeomRasterAnn, inherit.aes = FALSE,
    params = list(raster = raster,
                  xmin = 0,
                  xmax = .img.info$width,
                  ymin = 0,
                  ymax = .img.info$height,
                  interpolate = interpolate))
}
