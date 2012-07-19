#' Plot a histogram of the bootstrap confidence interval data.
#'
#' This function plots a histogram of slopes generated from the function
#'   \code{\link{tnhci}} which performs bootstrap resampling of residuals to
#'   generate a 95\% confidence interval on the slope.  T
#'
#' @param df Data frame of slope values from \code{\link{tnhci}}
#' @return ggplot of the frequency as bins, and overlay of the expected Gaussian 
#'   normal curve (dashed black line), and the confidence picture using the Epanechnikov 
#'   density kernal (solid black line).
#' 
#' @references Powell, R., Hergt, J., and Woodhead, J., 2002, Improving isochron 
#'   calculations with robust statistics and the bootstrap, Chemical Geology,
#'   v. 185, p. 191-204. (e.g., Figure 7)  \url{http://www.sciencedirect.com/
#'   science/article/pii/S000925410100403X}
#'
#' @author Sean Mulcahy
#' @export
#' @examples
#' data(pdp133)
#' P <- tnh(pdp133$x, pdp133$y, pdp133$sx, pdp133$sy)
#' C <- tnhci(P$dat, P$fit, P$coef$slope, n = 300)
#' ciplt(C$slope)

ciplt <- function(df){
	require(ggplot2)
	
	d <- data.frame(slope = df)
	
	p <- ggplot(d, aes(slope)) + 
	  geom_histogram(aes(y = ..density..), fill = "grey85", colour = "black") +
	  geom_density(colour = "black") + 
	  stat_function(fun = dnorm, args = list(mean = mean(d$slope), sd = sd(d$slope)),
	  colour = "black", linetype = "dashed") + 
	  theme_bw()
	
	return(p)
}