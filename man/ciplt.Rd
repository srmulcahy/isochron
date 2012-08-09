\name{ciplt}
\alias{ciplt}
\title{Plot a histogram of the bootstrap confidence interval data.}
\usage{
  ciplt(df)
}
\arguments{
  \item{df}{data frame of slope values from
  \code{\link{tnhc}}}
}
\value{
  ggplot of the frequency as bins, and overlay of the
  expected Gaussian normal curve (dashed black line), and
  the confidence picture using the Epanechnikov density
  kernal (solid black line).
}
\description{
  This function plots a histogram of slopes generated from
  the function \code{\link{tnhc}} which performs bootstrap
  resampling of residuals to generate a 95\% confidence
  interval on the slope.  T
}
\examples{
data(pdp133)
P <- tnhf(pdp133$x, pdp133$y, pdp133$sx, pdp133$sy)
C <- tnhc(P$dat, P$fit, P$coef$slope, n = 300)
ciplt(C$slope)
}
\author{
  Sean Mulcahy
}
\references{
  Powell, R., Hergt, J., and Woodhead, J., 2002, Improving
  isochron calculations with robust statistics and the
  bootstrap, Chemical Geology, v. 185, p. 191-204. (e.g.,
  Figure 7) \url{http://www.sciencedirect.com/
  science/article/pii/S000925410100403X}
}

