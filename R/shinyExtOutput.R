#' Create a reactive DataTable 
#' 
#' Create a reactive DataTable (enhanced html that supports sorting, pagination, search, csv/pdf/etc export of data)
#' 
#' @param inputId Input variable to assign the control's value to
#' @param label Display label for the control
#' @param ... other parameters to selectInput 
#' @return A select control that can be added to a UI definition.
#' 
#' @examples
#'  renderDataTable({data.frame(x=rnorm(10), y=rnorm(10))}, tableID='myTblJS1')
#' 
#' @import shiny 
#' @export
renderDataTable <- function(expr, tableID, ..., env = parent.frame(), quoted = FALSE) {
  func = exprToFunction(expr, env, quoted)
  
  function() {    
    data <- func()
    if (is.null(data)) 
      return("")

    data[] = lapply(data, function(.col) { if (is.numeric(.col)) return(round(.col, 4)) else return(.col) } )
    data = format(data, big.mark=',', digits=4, scientific=FALSE)

    return(paste(generateHTMLTable(data, tableID), getDataTableJSScriptlet(tableID)))
  }  
}

#' Get DataTable Header Tags
#' 
#' @return TagList of JS/CSS includes
#' 
#' @examples
#'  getDataTableHeaderTags()
#' 
#' @import shiny 
#' @export
getDataTableHeaderTags <- function()
{
  addResourcePath(
    prefix='shinyOutExt',
    directoryPath =  system.file('outputExt',
                                 package='shinyExt')
  )  
  tagList(
    singleton(
      tags$head(
        tags$link(rel="stylesheet", type="text/css", href="shinyOutExt/css/DT_bootstrap.css"),
        tags$link(rel="stylesheet", type="text/css", href="shinyOutExt/css/TableTools.css"),        
        tags$script(src="shinyOutExt/js/jquery.dataTables.js",type="text/javascript"),
        tags$script(src="shinyOutExt/js/dataTables.numericCommaSort.js",type="text/javascript"),
        tags$script(src="shinyOutExt/js/dataTables.numericCommaTypeDetect.js",type="text/javascript"),
        tags$script(src="shinyOutExt/js/DT_bootstrap.js",type="text/javascript"),
        tags$script(src="shinyOutExt/js/TableTools.min.js",type="text/javascript")
      )
    )
  )            
}



#' Helper function to create HTML Table with <thead> tags 
#' 
#' By default, xtable does not generate HTML tables with the column headers enclosed in <thead> </thead>. 
#' DataTables require a html table with <thead/> 
#' 
#' @param df Input data.frame()
#' @param tableID Unique ID (id attribute in <table>) to assign
#' @return A HTML table with column names enclosed in <thead/>
#' 
#' @examples
#'  generateHTMLTable(df, "myTblJS1")
#' 
#' @import xtable 
#' @import stringr
#' @export
generateHTMLTable <- function(df, tableID)
{
  thead = generateHTMLTableHeader(df)
  res = capture.output(print(xtable(df), type='html', only.contents=TRUE,include.rownames=FALSE, include.colnames=FALSE, sep='\n'))
  tbody = paste(c('<tbody>', res, '</tbody>'), sep='\n', collapse=' ')
  
  tblHtmlS = paste('<table cellpadding="0" cellspacing="0" border="0" class="table table-striped table-bordered" id="',tableID,'">',sep="")
  tblHtmlE = '</table>'
  
  tbl = paste(c(tblHtmlS, thead, tbody, tblHtmlE), sep='\n', collapse=' ')  
  return(tbl)
}

#' Generate HTML Table <thead/>
#' 
#' Helper function which generates the html <thead/> to wrap the given data.frame()'s column names
#' 
#' @param df data.frame() to convert to a html table
#' @return HTML <thead/>
#' 
#' @examples
#'  generateHTMLTableHeader(df)
#' 
#' @import xtable 
#' @import stringr
generateHTMLTableHeader <- function(df)
{
  cNames = colnames(df)
  res = paste('<TR> <TH> ', str_c(cNames, collapse='</TH> \n <TH> '), '</TH> \n </TR>')
  thead = paste(c('<thead>', res, '</thead>'), sep='\n', collapse=' ')
  return(thead)
}

#' DataTable activation Javascript scriptlet
#' 
#' Helper function which creates the JS script to active a DataTable 
#' 
#' @param tableID Unique ID that was assigned to the datatable html
#' @return Scriptlet to attach to a DataTable html table
#' 
#' @examples
#'  getDataTableJSScriptlet(df, "myTblJS1")
#' 
#' @import xtable 
#' @import stringr
#' @export
getDataTableJSScriptlet <- function(tableID) {
  return(paste('<script>
                $(function() {$("#', tableID, '").dataTable({"sDom": \'T<"clear">lfrtip\',
                                                             "oTableTools": { "sSwfPath": "shinyOutExt/swf/copy_csv_xls_pdf.swf" }
                }); });
               </script>', sep=""))
}
