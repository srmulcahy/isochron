\name{lsqf}
\alias{lsqf}
\title{Least squares fitting of isochron data.}
\usage{
  lsqf(x, y, sx, sy)
}
\arguments{
  \item{x}{Vector of measured x-axis values.}

  \item{y}{Vector of measured y-axis values.}

  \item{sx}{Vector of absolute uncertainty in x.}

  \item{sy}{Vector of absolute uncertainty in y.}
}
\value{
  A list format of regression coefficients, fit statistics,
  covariance matrix, and input dataset with residuals and
  calculated weights.
}
\description{
  This function generates a best fit line using the least
  squares method following the approach of York, 1969 and
  Wendt & Carl, 1991 and summarized by Powell et al., 2002.
  The input data are the measured values an absolute
  uncertainties.
}
\examples{
data(pdp133)
Y <- lsqf(pdp133$x, pdp133$y, pdp133$sx, pdp133$sy)
}
\author{
  Sean Mulcahy
}
\references{
  York, D., 1969 Least squares fitting of a straight line
  with correlated errors, Earth and Planetary Science
  Letters, v. 5, p. 320-324.
  \url{http://www.sciencedirect.com/science/article/pii/S0012821X68800597}

  Wendt, I. and Carl, C., The statistical distribution of
  the mean squared weighted deviation, Checmial Geology, v.
  86, p. 275-285.  \url{http://www.
  sciencedirect.com/science/article/pii/016896229190010T}

  Powell, R., Hergt, J., and Woodhead, J., 2002, Improving
  isochron calculations with robust statistics and the
  bootstrap, Chemical Geology, v. 185, p. 191-204.
  \url{http://www.sciencedirect.com/science/article/pii
  /S000925410100403X}
}

