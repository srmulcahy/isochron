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
	T <- tnhf(pdp133$x, pdp133$y, pdp133$sx, pdp133$sy)
	T
	agema(T$coef$slope, lambda = 1.867e-11)
	isoplt(T, main = "PdP13-3", xlab = "176Lu/177Hf", ylab = "176Hf/177Hf")

The difference in the two methods can be seen by plotting the data from *Russel, 1995* as illustrated by *Powell et al., 2002*.

	data(russel)
	Y <- lsqf(russel$x, russel$y, russel$sx, russel$sy)
	isoplt(Y)
	P <- tnhf(russel$x, russel$y, russel$sx, russel$sy)
	isoplt(P)

The resulting isochrons show the differences in weighting by the two routines.  With the tanh estimator, all points are given the same weight, with the exception of two outliers near the intercept, whose weights are greatly reduced. (Brighter shades of blue correspond to greater weights and vice versa).

![york](https://raw.github.com/srmulcahy/isochron/master/inst/img/lsqf_russel.png)
![powell](https://raw.github.com/srmulcahy/isochron/master/inst/img/tnhf_russel.png)

	
References
-----------

1. Powell, R., Hergt, J., and Woodhead, J., 2002, Improving isochron calculations with robust statistics and the bootstrap: *Chemical Geology*, v. 185, p. 191–204. ([http](http://www.sciencedirect.com/science/article/pii/S000925410100403X))
2. Russell, J., 1995, Direct Pb/Pb dating of Silurian macrofossils from Gotland, Sweden: *Geological Society, London, Special Publications*, v. 89, no. 1, p. 175–200. ([http](http://sp.lyellcollection.org/content/89/1/175.abstract))
3. York, D., 1969, Least squares fitting of a straight line with coordinated errors: *Earth and Planetary Science Letters*, v. 5, p. 320–324. ([http](http://www.sciencedirect.com/science/article/pii/S0012821X68800597)
