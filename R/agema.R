#' Calculate an age from the slope of an isochron.
#'
#' This function computes the age in Ma from the slope of an isochron
#'   calculated by the \code{\link{lsqf}} and \code{\link{tnhf}} model 
#'   regressions and for a given decay constant.
#'
#' @param b Slope from the \code{\link{lsqf}} or \code{\link{tnhf}}
#'   model regression
#' @param lambda Decay constant for the isotopic system.  The default is the
#'   the \eqn{^{176}}Lu decay constant of Soderlund et al., 2004
#' @return Numeric value for the age in million years.
#' 
#' @references Soderlund, U., Patchett, P.J., Vervoort, J.D., and Isachsen, C.E., 
#'   2004, The \eqn{^{176}}Lu decay constant determined by Lu-Hf and U-Pb isotope 
#'   systematics of Precambrian mafic intrusions, Earth and Planetary Science 
#'   Letters, v. 219, p. 311-324.  \url{http://www.sciencedirect.com/science/article
#'   /pii/S0012821X04000123}
#' 
#' @author Sean Mulcahy
#' @export
#' @examples
#' data(pdp133)
#' Y <- lsqf(pdp133$x, pdp133$y, pdp133$sx, pdp133$sy)
#' agema(Y$coef$slope, lambda = 1.867e-11)
agema <- function(b, lambda = 1.867e-11){
	age <- log(b + 1) / lambda * 1e-6
	return(age)
}