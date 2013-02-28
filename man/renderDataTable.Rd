\name{renderDataTable}
\alias{renderDataTable}
\title{Create a reactive DataTable}
\usage{
  renderDataTable(expr, tableID, ..., env = parent.frame(),
    quoted = FALSE)
}
\arguments{
  \item{inputId}{Input variable to assign the control's
  value to}

  \item{label}{Display label for the control}

  \item{...}{other parameters to selectInput}
}
\value{
  A select control that can be added to a UI definition.
}
\description{
  Create a reactive DataTable (enhanced html that supports
  sorting, pagination, search, csv/pdf/etc export of data)
}
\examples{
renderDataTable({data.frame(x=rnorm(10), y=rnorm(10))}, tableID='myTblJS1')
}

