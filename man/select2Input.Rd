\name{select2Input}
\alias{select2Input}
\title{Create a Select2 control}
\usage{
  select2Input(inputId, label, choices,
    inputWidth = "resolve", selected = NULL,
    multiple = FALSE)
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
  Create an select control which search functionality
}
\examples{
select2Input(inputId, label, choices, inputWidth = '50\%', selected = NULL, multiple = FALSE)
}

