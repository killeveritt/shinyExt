#' Create a Select2 control
#' 
#' Create an select control which search functionality
#' 
#' @param inputId Input variable to assign the control's value to
#' @param label Display label for the control
#' @param ... other parameters to selectInput 
#' @return A select control that can be added to a UI definition.
#' 
#' @examples
#'  select2Input(inputId, label, choices, inputWidth = '50%', selected = NULL, multiple = FALSE)
#' 
#' @import shiny 
#' @export
select2Input <- function(inputId, label, choices, inputWidth = 'resolve', selected = NULL, multiple = FALSE) {
  addResourcePath(
    prefix='shinyExt',
    directoryPath =  system.file('inputExt',
                                 package='shinyExt')
  )
  tagList(
    singleton(
              tags$head(
                tags$script(src="shinyExt/js/select2.js"),
                tags$link(rel="stylesheet", type="text/css", href="shinyExt/css/select2.css")
                )
              ),
    selectInput(inputId, label, choices, selected, multiple),
    tags$script(paste("$(function() { $('#", inputId, "').select2({width:'", inputWidth, "'}); });", sep=""))
  )
}
