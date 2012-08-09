isochron
=============

- **Author**: Sean R. Mulcahy
- **License**: [MIT](http://www.opensource.org/licenses/mit-license.php)
- [Package source code on Github](https://github.com/srmulcahy/isochron)

`isochron` is an R package that calculates best fit lines to geochemical data 
for the construction and interpretation of isochrons.  Two common methods of 
fitting the data are provided as well as functions to determine the age, 
uncertainty, and fit statistics from the measured data.

Installation 
------------

`isochron` is still under active development, so is not yet available from CRAN.
You can install the latest development version from github using the
[devtools package](https://github.com/hadley/devtools).

	library(devtools)
	install_github("isochron", "srmulcahy")
	library(isochron)


Quick start
-----------

Classic least-squares fitting of isochron data (*e.g. York, 1969*)

	data(pdp133)
	Y <- lsqf(pdp133$x, pdp133$y, pdp133$sx, pdp133$sy)
	Y
	agema(Y$coef$slope, lambda = 1.867e-11)
	isoplt(Y, main = "PdP13-3", xlab = "176Lu/177Hf", ylab = "176Hf/177Hf")

Robust fitting of isochron data (*Powell et al., 2002*)

	data(pdp133)
	T <- tnh(pdp133$x, pdp133$y, pdp133$sx, pdp133$sy)
	T
	agema(T$coef$slope, lambda = 1.867e-11)
	isoplt(T, main = "PdP13-3", xlab = "176Lu/177Hf", ylab = "176Hf/177Hf")


References
-----------
1. York, D., 1969, Least squares fitting of a straight line with coordinated errors: *Earth and Planetary Science Letters*, v. 5, p. 320–324.
2. Powell, R., Hergt, J., and Woodhead, J., 2002, Improving isochron calculations with robust statistics and the bootstrap: *Chemical Geology*, v. 185, p. 191–204.
