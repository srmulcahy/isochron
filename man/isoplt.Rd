\name{isoplt}
\alias{isoplt}
\title{Plot an isochron diagram.}
\usage{
  isoplt(df, main = "Isochron", xlab = "x-value",
    ylab = "y-value")
}
\arguments{
  \item{df}{data.frame result from \code{\link{lsqf}} or
  \code{\link{tnhf}} regression}

  \item{main}{plot title}

  \item{xlab}{x-axis label}

  \item{ylab}{y-axis label}
}
\value{
  ggplot of isochron of x-y data and best fit line
}
\description{
  This function plots an isochron diagram from the results
  of \code{\link{lsqf}} and \code{\link{tnhf}} model
  regressions.
}
\examples{
data(russel)
R <- tnhf(russel$x, russel$y, russel$sx, russel$sy)
isoplt(R, main = "Russel, 1995", xlab = "206Pb/204Pb", ylab = "207Pb/204Pb")
}
\author{
  Sean Mulcahy
}

