\name{tnhci}
\alias{tnhci}
\title{Calculate the 95\% condifence interval on the tanh determined slope.}
\usage{
  tnhci(df, b, nmad, n = 999)
}
\arguments{
  \item{df}{Input data frame for results of
  \code{\link{tnh}} regression}

  \item{b}{Slope of the \code{\link{tnh}} regression
  through the data}

  \item{nmad}{nMad of the \code{\link{tnh}} regression
  through the data}

  \item{n}{Number of times to resample}
}
\value{
  A list format with bootstrap results for slope, nMad, and
  the 95\% confidence interval of the slope.
}
\description{
  Boostrap sampling with replacement to calculate the 95\%
  condifence interval on the slope of an isochron.  Input
  parameters are taken from the results of the
  \code{\link{tnh}} model regression.  The output cofidence
  intervals can be converted to age with
  \code{\link{agema}}.  The output data frame, df.slope,
  can be used to generate histograms for the simulated data
  set with \code{\link{ciplt}}
}
\examples{
data(pdp133)
P <- tnh(pdp133$x, pdp133$y, pdp133$sx, pdp133$sy)
C <- tnhci(P$dat, P$coef$slope, P$fit$nmad, n = 300)
}
\author{
  Sean Mulcahy
}
\references{
  Powell, R., Hergt, J., and Woodhead, J., 2002, Improving
  isochron calculations with robust statistics and the
  bootstrap, Chemical Geology, v. 185, p. 191-204.
  \url{http://www.sciencedirect.com/science/article/pii/
  S000925410100403X}
}

