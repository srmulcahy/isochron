#' Least squares fitting of isochron data.
#'
#' This function generates a best fit line using the least squares method following 
#'   the approach of York, 1969 and Wendt & Carl, 1991 and summarized by Powell et 
#'   al., 2002.  The input data are the measured values an absolute uncertainties.
#' 
#' @param x vector of measured x-axis values.
#' @param y vector of measured y-axis values.
#' @param sx vector of absolute uncertainty in x.
#' @param sy vector of absolute uncertainty in y.
#' @return list format of regression coefficients, fit statistics, covariance matrix, 
#'   and input dataset with residuals and calculated weights.
#' 
#' @references York, D., 1969 Least squares fitting of a straight line with 
#'   correlated errors, Earth and Planetary Science Letters, v. 5, p. 320-324.
#'   \url{http://www.sciencedirect.com/science/article/pii/S0012821X68800597}
#'
#' Wendt, I. and Carl, C., The statistical distribution of the mean squared 
#'   weighted deviation, Checmial Geology, v. 86, p. 275-285.  \url{http://www.
#'   sciencedirect.com/science/article/pii/016896229190010T}
#'
#' Powell, R., Hergt, J., and Woodhead, J., 2002, Improving isochron 
#'   calculations with robust statistics and the bootstrap, Chemical Geology,
#'   v. 185, p. 191-204. \url{http://www.sciencedirect.com/science/article/pii
#'   /S000925410100403X}
#' 
#' @author Sean Mulcahy
#' @export
#' @examples
#' data(pdp133)
#' Y <- lsqf(pdp133$x, pdp133$y, pdp133$sx, pdp133$sy)
lsqf <- function(x, y, sx, sy){
	
	# initial least squares estimation
	fit <- lm(y ~ x)
	theta <- fit$coefficients

	# constants
	X <- cbind(1, x)
	lx <- length(x)
	tol <- 1e-9
	d <- tol

	# york model least squares fit
	while (d >= tol){
		b2 <- theta[2]
		W <- diag( 1 / sqrt({sy * sy} + {b2 * b2 * sx * sx}))
		cp <- crossprod(X, W %*% W)
		theta <- solve(cp %*% X) %*% cp %*% y
		d <- abs(theta[2] - b2)
	}
	
	e <- y - X %*% theta	
	Vo <- solve(cp %*% X)
	mswd <- {crossprod(e, W %*% W) %*% e} / {lx - 2}
	sfit <- sqrt(mswd)

	# output results
	th <- data.frame(intercept = theta[1], slope = theta[2])
	ft <- data.frame(mswd = mswd, sfit = sfit)
	dt <- data.frame(x = x, y = y, sx = sx, sy = sy, e = as.vector(e), w = diag(W))
	list(coef = th, vcov = Vo, fit = ft, dat = dt)
}