#' Calculate the 95\% condifence interval on the tanh determined slope.
#'
#' Boostrap sampling with replacement to calculate the 95\% condifence interval on the
#'   slope of an isochron.  Input parameters are taken from the results of the
#'   \code{\link{tnhf}} model regression.  The output cofidence intervals can be
#'   converted to age with \code{\link{agema}}.  The output data frame, df.slope,
#'   can be used to generate histograms for the simulated data set with 
#'   \code{\link{ciplt}}
#' 
#' @param df Input data frame for results of \code{\link{tnhf}} regression 
#' @param b Slope of the \code{\link{tnhf}} regression through the data
#' @param nmad nMad of the \code{\link{tnhf}} regression through the data
#' @param n Number of times to resample
#' @return A list format with bootstrap results for slope, nMad, and the 95\%
#'    confidence interval of the slope.
#'
#' @references Powell, R., Hergt, J., and Woodhead, J., 2002, Improving isochron 
#'   calculations with robust statistics and the bootstrap, Chemical Geology,
#'   v. 185, p. 191-204.  \url{http://www.sciencedirect.com/science/article/pii/
#'   S000925410100403X}
#' @author Sean Mulcahy
#' @export
#' @examples
#' data(pdp133)
#' P <- tnhf(pdp133$x, pdp133$y, pdp133$sx, pdp133$sy)
#' C <- tnhc(P$dat, P$coef$slope, P$fit$nmad, n = 300)
tnhc <- function(df, b, nmad, n = 999){
	require(plyr)
	lx <- length(df$e)
	
	# generate n samples of residuals e with replacement
	es <- replicate(n, sample(df$e, length(df$e), replace = TRUE))
	
	# calculate the slope for each resample
	ys <- df$y + es
	ls <- split(ys, col(ys))
	f <- function(ls){
	  tnhf(df$x, unlist(ls), df$sx, df$sy, p = 2.5, r = 0)$coef$slope
	}
	ts <- llply(ls, f, .progress = "text")
	theta <- unlist(ts)
	
	# calculate  the nMad for each resample
	e <- split(es, col(es))
	f2 <- function(e){
		1.4826 * {1 + {5 / {lx - 2}}} * sqrt(median(e * e))
	}
	s <- llply(e, f2)
	ss <- unlist(s)
	
	# calculate the confidence interval on the slope
	psi <- sqrt(lx) * {theta - b} / ss
	q <- quantile(psi, probs = c(0.025, 0.975))
	b1 <- b - nmad * abs(q[2]) / sqrt(lx)
	b2 <- b + nmad * abs(q[1]) / sqrt(lx)  
	ci <- data.frame(ci1 = b1, ci2 = b2)
	list(slope = theta, nmad = ss, ci = ci)
}
