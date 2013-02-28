\name{getDataTableJSScriptlet}
\alias{getDataTableJSScriptlet}
\title{DataTable activation Javascript scriptlet}
\usage{
  getDataTableJSScriptlet(tableID)
}
\arguments{
  \item{tableID}{Unique ID that was assigned to the
  datatable html}
}
\value{
  Scriptlet to attach to a DataTable html table
}
\description{
  Helper function which creates the JS script to active a
  DataTable
}
\examples{
getDataTableJSScriptlet(df, "myTblJS1")
}

