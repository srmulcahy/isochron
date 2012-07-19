\name{isoplt}
\alias{isoplt}
\title{Plot an isochron diagram.}
\usage{
  isoplt(df, main = "Title", xlab = "x-value",
    ylab = "y-value")
}
\arguments{
  \item{df}{Data frame result from \code{\link{lsqf}} or
  \code{\link{tnh}} regression}

  \item{main}{Plot title}

  \item{xlab}{x-axis label}

  \item{ylab}{y-axis label}
}
\value{
  ggplot of isochron of x-y data and best fit line.  The
  function currently colors each point according to weight.
}
\description{
  This function plots an isochron diagram from the results
  of \code{\link{lsqf}} and \code{\link{tnh}} model
  regressions.
}
\examples{
data(russel)
R <- tnh(russel$x, russel$y, russel$sx, russel$sy)
isoplt(R, main = "Russel, 1995", xlab = "206Pb/204Pb", ylab = "207Pb/204Pb")
}
\author{
  Sean Mulcahy
}

