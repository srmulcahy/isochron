\name{tnhf}
\alias{tnhf}
\title{Robust fitting of isochron data.}
\usage{
  tnhf(x, y, sx, sy, p = 1.634, r = 4)
}
\arguments{
  \item{x}{Vector of measured x-axis values.}

  \item{y}{Vector of measured y-axis values.}

  \item{sx}{Vector of absolute uncertainty in x.}

  \item{sy}{Vector of absolute uncertainty in y.}

  \item{p}{w-estimator parameter. Default values are set as
  in Powell et al., 2002.  set p = 2.5 for hard rejection}

  \item{r}{w-estimator parameter. Default values are set as
  in Powell et al., 2002.  set r = 0 for hard rejection}
}
\value{
  A list format of regression coefficients, fit statistics,
  covariance matrix, and input dataset with residuals and
  calculated weights.
}
\description{
  This function generates a best fit line using the tanh
  estimator following the method outlined by Powell et al.,
  2002.  The input data are the measured values an absolute
  uncertainties.  Although the uncertainties are not used
  in the calculation they are included for a complete
  rendering of the output for later use in tables or
  publicaitons.
}
\examples{
data(russel)
P <- tnhf(russel$x, russel$y, russel$sx, russel$sy)
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

