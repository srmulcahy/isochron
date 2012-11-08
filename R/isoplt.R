#' Plot an isochron diagram.
#'
#' This function plots an isochron diagram from the results of  
#'   \code{\link{lsqf}} and \code{\link{tnhf}} model regressions.
#'
#' @param df data.frame result from \code{\link{lsqf}} or \code{\link{tnhf}} regression
#' @param main plot title
#' @param xlab x-axis label
#' @param ylab y-axis label
#' @return ggplot of isochron of x-y data and best fit line
#' @author Sean Mulcahy 
#' @export
#' @examples
#' data(russel)
#' R <- tnhf(russel$x, russel$y, russel$sx, russel$sy)
#' isoplt(R, main = "Russel, 1995", xlab = "206Pb/204Pb", ylab = "207Pb/204Pb")
isoplt <- function(df, main = "Isochron", xlab = "x-value", ylab = "y-value"){
  
	require(ggplot2)
	
	p <- ggplot(df$dat, aes(x, y)) + geom_point() + 
		geom_errorbar(aes(ymin = y - sy, ymax = y + sy), width = 0) +
  		geom_errorbarh(aes(xmin = x - sx, xmax = x + sx), height = 0) +
	  	geom_abline(intercept = df$coef$intercept, slope = df$coef$slope) +
		labs(x = xlab, y = ylab, title = main) 
	
	return(p)
}