#' Plot an isochron diagram.
#'
#' This function plots an isochron diagram from the results of  
#'   \code{\link{lsqf}} and \code{\link{tnh}} model regressions.
#'
#' @param df Data frame result from \code{\link{lsqf}} or \code{\link{tnh}} regression
#' @param main Plot title
#' @param xlab x-axis label
#' @param ylab y-axis label
#' @return ggplot of isochron of x-y data and best fit line.  The function currently colors
#'   each point according to weight.
#' @author Sean Mulcahy 
#' @export
#' @examples
#' data(russel)
#' R <- tnh(russel$x, russel$y, russel$sx, russel$sy)
#' isoplt(R, main = "Russel, 1995", xlab = "206Pb/204Pb", ylab = "207Pb/204Pb")
isoplt <- function(df, main = "Title", xlab = "x-value", ylab = "y-value"){
	
	require(ggplot2)
	
	p <- ggplot(df$dat, aes(x, y, colour = "black")) + geom_point() + 
		geom_errorbar(aes(ymin = y - sy, ymax = y + sy), width = 0) +
  	geom_errorbarh(aes(xmin = x - sx, xmax = x + sx), height = 0) +
	  geom_abline(intercept = df$coef$intercept, slope = df$coef$slope) +
	  theme_bw() +
		labs(x = xlab, y = ylab) + 
	  opts(title = main, legend.position = "none")
	
	return(p)
}