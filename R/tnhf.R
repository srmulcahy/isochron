#' Robust fitting of isochron data.
#'
#' This function generates a best fit line using the tanh estimator following the
#'   method outlined by Powell et al., 2002.  The input data are the measured 
#'   values an absolute uncertainties.  Although the uncertainties are not used 
#'   in the calculation they are included for a complete rendering of the output 
#'   for later use in tables or publicaitons.
#' 
#' @param x vector of measured x-axis values.
#' @param y vector of measured y-axis values.
#' @param sx vector of absolute uncertainty in x.
#' @param sy vector of absolute uncertainty in y.
#' @param p w-estimator parameter. Default values are set as in Powell et al., 2002.
#'   set p = 2.5 for hard rejection
#' @param r w-estimator parameter. Default values are set as in Powell et al., 2002.
#'   set r = 0 for hard rejection
#' @return list format of regression coefficients, fit statistics, covariance matrix, 
#'   and input dataset with residuals and calculated weights.
#'
#' @references Powell, R., Hergt, J., and Woodhead, J., 2002, Improving isochron 
#'   calculations with robust statistics and the bootstrap, Chemical Geology,
#'   v. 185, p. 191-204.  \url{http://www.sciencedirect.com/science/article/pii/
#'   S000925410100403X} 
#'
#' @author Sean Mulcahy
#' @export
#' @examples
#' data(russel)
#' P <- tnhf(russel$x, russel$y, russel$sx, russel$sy)
tnhf <- function(x, y, sx, sy, p = 1.634, r = 4){
	
	require(MASS)
	
	# initial least median squares estimation (MASS)
	fit <- lqs(y ~ x, method = "lms")
	theta <- fit$coefficients
	
	# constants
	X <- cbind(1, x)
	lx <- length(x)
	tol <- 1e-9	# tolerance
	d <- tol
	
	# tanh regression
	while (d >= tol){
		b2 <- theta[2]
		e <- y - X %*% theta
		s <- 1.4826 * {1 + {5 / {lx - 2}}} * sqrt(median(e * e))
		u <- as.numeric(abs(e / s))
		W <- diag(ifelse(u < p, 1, ifelse(u > r, 0, {{u - r} / {p - r}})), lx, lx)
		cp <- crossprod(X, W %*% W)
		theta <- solve(cp %*% X) %*% cp %*% y
		d <- abs(theta[2] - b2)
	}
	Vo <- solve(crossprod(X, {W %*% W} %*% X))
	sfit <- sqrt((crossprod(e, W %*% W) %*% e)/(lx - 2))
	
	# output results 
	th <- data.frame(intercept = theta[1], slope = theta[2])
	ft <- data.frame(nmad = s)
	dt <- data.frame(x = x, y = y, sx = sx, sy = sy, e = as.vector(e), w = diag(W))
	list(coef = th, fit = ft, vcov = Vo, dat = dt)
}
