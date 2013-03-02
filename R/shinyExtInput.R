#' Create a password input control
#' 
#' Create an input control for entry of password values
#' 
#' @param inputId Input variable to assign the control's value to
#' @param label Display label for the control
#' @return A password input control that can be added to a UI definition.
#' 
#' @examples
#' passwordInput("passwd", "Password:")
#' 
#' @import shiny 
#' @export
passwordInput <- function(inputId, label) {
  addResourcePath(
    prefix='shinyExt',
    directoryPath =  system.file('inputExt',
                                 package='shinyExt')
    )
  tagList(
    singleton(tags$head(tags$script(src = 'shinyExt/js/inputExt.js'))),
    tags$label(label),
    tags$input(id = inputId, type="password", value="")
  )
}


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


#' Action button
#' 
#' Creates an action button whose value is initially zero, and increments by one
#' each time it is pressed.
#' 
#' @param inputId Specifies the input slot that will be used to access the 
#'   value.
#' @param label The contents of the button--usually a text label, but you could
#'   also use any other HTML, like an image.
#'   
#' @export
actionButton <- function(inputId, label) {
  addResourcePath(
    prefix='shinyExt', 
    directoryPath=system.file('inputExt', 
                              package='shinyExt'))
  tagList(
    singleton(tags$head(tags$script(src = 'shinyExt/js/inputExt.js'))),
    tags$button(id=inputId, type="button", class="btn action-button", label)
  )
}

#' Date Range Picker
#' 
#' Creates a dropdown menu from which a user can select a range of dates.
#' This is based on https://github.com/dangrossman/bootstrap-daterangepicker.
#' 
#' @seealso [bootstrap-daterangepicker](https://github.com/dangrossman/bootstrap-daterangepicker) 
#' 
#' @param inputId Specifies the input slot that will be used to access the 
#'  value.
#' @param label The contents of the button--usually a text label, but you could
#'   also use any other HTML, like an image.
#' @param defaultValue Default Value to show
#' 
#'   
#' @export
daterangePicker <- function(inputId, label, defaultValue="") {
  addResourcePath(
    prefix='shinyExt', 
    directoryPath=system.file('inputExt', 
                              package='shinyExt'))
  tagList(
    singleton(tags$head(tags$script(src = 'shinyExt/js/inputExt.js'),
                        tags$script(src = 'shinyExt/js/date.js'),
                        tags$script(src = 'shinyExt/js/daterangepicker.js'),
                        tags$link(rel = "stylesheet", type = "text/css",
                                  href = 'shinyExt/css/daterangepicker.css'),
                        tags$script(src = 'shinyExt/js/jquery-common.js'))),
    tags$label(label),
    tags$input(id = inputId, type="text", value=defaultValue, name ="daterange-picker")
  )
}

#' Bootstrap Date Picker
#' 
#' Creates a dropdown menu from which a user can select a date.
#' This is based on https://github.com/eternicode/bootstrap-datepicker.
#' 
#' @seealso [bootstrap-datepicker](https://github.com/eternicode/bootstrap-datepicker) 
#' 
#' @param inputId Specifies the input slot that will be used to access the 
#'  value.
#' @param label The contents of the button--usually a text label, but you could
#'   also use any other HTML, like an image.
#' @param default Default date value, if empty Sys.Date() is used.
#' @param format Date format, if empty "dd-mm-yyyy" is used.
#'   
#' @export
datePicker <- function(inputId, label, default=Sys.Date(),
  format="dd-mm-yyyy") {
  addResourcePath(
    prefix='shinyExt', 
    directoryPath=system.file('inputExt', 
                              package='shinyExt'))
  tagList(
    singleton(tags$head(tags$script(src = 'shinyExt/js/inputExt.js'),
                        tags$script(src = 'shinyExt/js/date.js'),
                        tags$script(src = 'shinyExt/js/daterangepicker.js'),
                        tags$script(src = 'shinyExt/js/bootstrap-datepicker.js'),
                        tags$link(rel = "stylesheet", type = "text/css",
                                  href = 'shinyExt/css/datepicker.css'),
                        tags$script(src = 'shinyExt/js/jquery-common.js'))),
    tags$label(label),
    tags$input(id = inputId, type="text", 
               value=default, 
               name ="bootstrap-date-picker",
               'data-date-format'=format)
  )
}