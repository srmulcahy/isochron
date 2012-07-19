\name{agema}
\alias{agema}
\title{Calculate an age from the slope of an isochron.}
\usage{
  agema(b, lambda = 1.867e-11)
}
\arguments{
  \item{b}{Slope from the \code{\link{lsqf}} or
  \code{\link{tnh}} model regression}

  \item{lambda}{Decay constant for the isotopic system.
  The default is the the \eqn{^{176}}Lu decay constant of
  Soderlund et al., 2004}
}
\value{
  Numeric value for the age in million years.
}
\description{
  This function computes the age in Ma from the slope of an
  isochron calculated by the \code{\link{lsqf}} and
  \code{\link{tnh}} model regressions and for a given decay
  constant.
}
\examples{
data(pdp133)
Y <- lsqf(pdp133$x, pdp133$y, pdp133$sx, pdp133$sy)
agema(Y$coef$slope, lambda = 1.867e-11)
}
\author{
  Sean Mulcahy
}
\references{
  Soderlund, U., Patchett, P.J., Vervoort, J.D., and
  Isachsen, C.E., 2004, The \eqn{^{176}}Lu decay constant
  determined by Lu-Hf and U-Pb isotope systematics of
  Precambrian mafic intrusions, Earth and Planetary Science
  Letters, v. 219, p. 311-324.
  \url{http://www.sciencedirect.com/science/article
  /pii/S0012821X04000123}
}

