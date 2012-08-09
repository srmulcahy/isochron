#' Calculate epsilon Hf values for Lu-Hf isochrons.
#'
#' This function calcalates epsilon Hf values from the intercept and age 
#'   previously dertermined from \code{\link{lsqf}} or \code{\link{tnhf}}
#'   model regression.  Values for \eqn{^{176}}Hf/\eqn{^{177}}Hf = 0.282785 and \eqn{^{176}}Lu/\eqn{^{177}}Hf = 0.0336 
#'   for CHUR (chondrite uniform reservoir) from Bouvier et al., 2008.
#'
#' @param a Intercept value taken from the intercept of the \code{\link{lsqf}} 
#'   or \code{\link{tnhf}} model regressions
#' @param age Age in Ma determined from the slope of the \code{\link{lsqf}} or 
#'   \code{\link{tnhf}} model regression
#' @return Numeric value of epsilon Hf.
#' @references Bouvier, A., Vervoort, J.D., and Patchett, P.J., 2008, The Lu-Hf 
#'   and Sm-Nd isotopic composition of CHUR: Constraints from unequilibrated 
#'   chondrites and implications for the bulk composition of terrestrial planets,
#'   Earth and Planetary Science Letters, v. 273, p. 48-57.  \url{http://www.sciencedirect.com/
#'   science/article/pii/S0012821X08003828}
#' 
#' @author Sean Mulcahy
#' @export
#' @examples
#' data(pdp133)
#' Y <- lsqf(pdp133$x, pdp133$y, pdp133$sx, pdp133$sy)
#' ehf(Y$coef$intercept, agema(Y$coef$slope, lambda = 1.867e-11))
ehf <- function(a, age){
	chur <- 0.282772 - 0.0332 * (exp(1.867e-11 * age * 1000000) - 1)
	epsilon <- (a / chur - 1) * 10000
	return(epsilon)
}