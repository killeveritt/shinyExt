\name{generateHTMLTable}
\alias{generateHTMLTable}
\title{Helper function to create HTML Table with <thead> tags}
\usage{
  generateHTMLTable(df, tableID)
}
\arguments{
  \item{df}{Input data.frame()}

  \item{tableID}{Unique ID (id attribute in <table>) to
  assign}
}
\value{
  A HTML table with column names enclosed in <thead/>
}
\description{
  By default, xtable does not generate HTML tables with the
  column headers enclosed in <thead> </thead>. DataTables
  require a html table with <thead/>
}
\examples{
generateHTMLTable(df, "myTblJS1")
}

