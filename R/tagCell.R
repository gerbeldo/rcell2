# Added to remove NOTES from devtools:check()
# https://stackoverflow.com/questions/9439256/how-can-i-handle-r-cmd-check-no-visible-binding-for-global-variable-notes-when
# globalVariables(strsplit("channel choice counts h i level pos saved treatment w x y", " ")[[1]])
# "A horrible hack" (?)

# I have found the cause of re-rendering plots.
# clientData$output_scatterplot_width changes 10 PIXELS for no reason and triggers a re-render.
# Maybe its the scrollbar or something...

#' Filtrar cdata usando gráficos y dibujando regiones
#'
#' @param cdata dataframe of "cell data"
#' @param pdata dataframe "position data"
#' @param paths dataframe of image paths 
#' @param cell_tags list of named vectors corresponding to tag groups and tags: list(named_item1 = c(option1, option2, ...), named_item2 ...)
#' @param randomize_ucids Randomize ucid order.
#' @param tag_box_size size of the image crop in pixels (integer)
#' @param cell_resize resize of the image crop in pixels (integer)
#' @param tag_channels_select a vector giving names for the image channels: c("BF", "YFP.out", etc....)
#' @param equalize_images Use magick's function to "equalize" the images.
#' @param normalize_images Use magick's function to "normalize" the images.
#' @param n_max max number of boxes in the image
#' @param seed seed for random sampling of images
#' @param tmp_output_file File path into which tagging information will be dumped by user request. NULL by default, to automatically create and append to a tmp file.
#' @param tag_ggplot a ggplot object to display in the second tab, may be used for something someday.
#' @param debug_messages print debug messages
# @param ... extra arguments, not used.
#' @return Lots of stuff.
#' @examples
#' path <- "/mac/apesta/trololololol/"
#' 
#' cell.data <- rcell2::cell.load.alt(path = path)
#' 
#' image.paths <- cell.data$d.paths  # Si usaste load_cell es: image.paths <- rcell2::magickPaths(cell.data)
#' 
#' pdata <- read_tsv(paste0(path, "pdata.csv"))
#' 
#' cdata <- left_join(cell.data$d, pdata)
#' 
#' p <- ggplot() + 
#'   geom_line(aes(x=t.frame, y=cf.y, group=ucid))
#' 
#' tag_channels_select <- c("BF", "BF.out", "YFP", "YFP.out")
#' 
#' saved <- rcell2::tagCell(cdata,
#'                          pdata, 
#'                          image.paths,
#'                          cell_tags = list(far1_drop = c(TRUE,
#'                                                         FALSE),
#'                                           budding =   c("emergence",
#'                                                         "division", 
#'                                                         "shmoo_o_algo"),
#'                                           artifact =  c("segmentation",
#'                                                         "crowding",
#'                                                         "out_of_focus",
#'                                                         "interesante",
#'                                                         "death",
#'                                                         "flown_away",
#'                                                         "not_a_cell")
#'                          ),
#'                          tag_channels_select = tag_channels_select,
#'                          .equalize = T,
#'                          .normalize = F,
#'                          n_max = 50,
#'                          tag_box_size = 75,
#'                          cell_resize = 300,
#'                          tag_ggplot = p,
#'                          tmp_output_file = "../output/annotations/progress.csv", 
#'                          debug_messages = F,
#'                          annotation_params = c(color = "none", background = "none")
#'                          )
#'                          
#' @import shiny ggplot2 magick
#' @importFrom grDevices rgb
#' @importFrom utils head
#' @export
tagCell <- function(cdata,
                    pdata,
                    paths,
                    cell_tags,
                    randomize_ucids = FALSE,
                    tag_box_size = 50,
                    cell_resize=NULL,
                    tag_channels_select=c("BF"),
                    n_max=10,
                    seed = 1,
                    tmp_output_file=NULL,
                    tag_ggplot = NULL,
                    equalize_images = F,
                    normalize_images = F,
                    debug_messages = F){
  
  # To-do
  # Invalid input$facet generates warnings and errors, this should be handled. Also, only "~", "." and "+" are handled in forumlas.
  # Implement more-than-2 variable faceting. The third and ith faceting variables of the brush are stored in "panelvar3" and so on (?)
  # Integrate polygon filter functionality, currently the drawn polygons do nothing (except show up).
  
  # Check NAs in ucid variable
  if(any(is.na(cdata[["ucid"]]))) stop("\ntagCell: ucid variable contains NA values")
  
  # Check ucid type and convert to integer
  ucid_class_check <- class(cdata[["ucid"]])
  if(ucid_class_check != "integer"){
    warning(paste("\ntagCell: cohercing", ucid_class_check, "ucid to integer type"))
    
    if(ucid_class_check == "factor"){
      cdata <- dplyr::mutate(cdata, ucid = as.integer(as.character.factor(ucid)))
      
    } else {
      cdata <- mutate(cdata, ucid = as.integer(ucid))
    }
  }
  
  # Progress file
  if(is.null(tmp_output_file)){
    tmp_output_file <- tempfile(tmpdir = tempdir(), fileext = ".txt", pattern = "tagCell_progress")
  } else {
    dir.create(dirname(normalizePath(tmp_output_file)), recursive = T, showWarnings = F)
  }
  if(debug_messages) print(paste("Appending tagging progress to tempfile:", tmp_output_file))
  
  # Setup environments for the shiny app, from this environment
  environment(tagCellServer) <- environment()
  environment(tagCellUi) <- environment()
  
  #### RUN APP ####
  saved <- shiny::runApp(list(ui = tagCellUi(), server = tagCellServer))
  
  #### RETURN RESULT ####
  # Devolver una lista con los objetos cdata cfilter y los stringFilters
  return(saved)
}