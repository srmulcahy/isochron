\name{ehf}
\alias{ehf}
\title{Calculate epsilon Hf values for Lu-Hf isochrons.}
\usage{
  ehf(a, age)
}
\arguments{
  \item{a}{intercept of the isochron}

  \item{age}{age in Ma determined from the slope of the
  isochron}
}
\value{
  numeric value of epsilon Hf.
}
\description{
  This function calcalates epsilon Hf values from the
  intercept and age previously dertermined from
  \code{\link{lsqf}} or \code{\link{tnhf}} model
  regression.  Values for \eqn{^{176}}Hf/\eqn{^{177}}Hf =
  0.282785 and \eqn{^{176}}Lu/\eqn{^{177}}Hf = 0.0336 for
  CHUR (chondrite uniform reservoir) from Bouvier et al.,
  2008.
}
\examples{
data(pdp133)
Y <- lsqf(pdp133$x, pdp133$y, pdp133$sx, pdp133$sy)
ehf(Y$coef$intercept, agema(Y$coef$slope, lambda = 1.867e-11))
}
\author{
  Sean Mulcahy
}
\references{
  Bouvier, A., Vervoort, J.D., and Patchett, P.J., 2008,
  The Lu-Hf and Sm-Nd isotopic composition of CHUR:
  Constraints from unequilibrated chondrites and
  implications for the bulk composition of terrestrial
  planets, Earth and Planetary Science Letters, v. 273, p.
  48-57.  \url{http://www.sciencedirect.com/
  science/article/pii/S0012821X08003828}
}

