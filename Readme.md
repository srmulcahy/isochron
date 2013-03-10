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


### Classic least-squares fitting of isochron data (e.g. *York, 1969*)

	data(pdp133)
	Y <- lsqf(pdp133$x, pdp133$y, pdp133$sx, pdp133$sy)

Resutls in a list (Y) with the fit coeficients to the data, variance-covariance matrix, fit statistics, and the original dataset, resudisuals (e), and weighting factors (w) for the fit.

	$coef
 	  intercept       slope
	1 0.2829901 0.008775401

	$vcov
                            x
   	   7.322186e-11 -1.016172e-10
	x -1.016172e-10  3.494587e-10

	$fit
        sfit     mswd         p n
	1 1.1898 1.415625 0.2148947 7

	$dat
 	       x        y          sx       sy             e        w
	1 0.02360 0.283217 0.000059000 1.42e-05  1.980718e-05 70375.77
	2 0.03940 0.283333 0.000098500 1.42e-05 -2.844145e-06 70292.43
	3 0.04108 0.283334 0.000102700 1.42e-05 -1.658682e-05 70281.13
	4 0.70232 0.289151 0.001755800 1.45e-05 -2.232688e-06 47263.93
	5 0.80660 0.290105 0.002016500 1.45e-05  3.666854e-05 43710.90
	6 0.95970 0.291396 0.002399250 1.46e-05 -1.584529e-05 39030.15
	7 0.65591 0.288728 0.001639775 1.45e-05 -1.796635e-05 48951.84

### Robust fitting of isochron data (*Powell et al., 2002*)

	T <- tnhf(pdp133$x, pdp133$y, pdp133$sx, pdp133$sy)

Gives output in the same format, though notice the different weighting assigned to the individual points.  In the below example, no outliers are detected as all of the points are assigned equal weights.

	$coef
  	   intercept       slope
	1 0.2829901 0.008775629

	$fit
    	      nmad
	1 4.932285e-05

	$vcov
    	                  x
   	   0.3535332 -0.4567701
	x -0.4567701  0.9903304

	$dat
    	    x        y          sx       sy             e w
	1 0.02360 0.283217 0.000059000 1.42e-05  1.976409e-05 1
	2 0.03940 0.283333 0.000098500 1.42e-05 -2.890846e-06 1
	3 0.04108 0.283334 0.000102700 1.42e-05 -1.663390e-05 1
	4 0.70232 0.289151 0.001755800 1.45e-05 -2.430601e-06 1
	5 0.80660 0.290105 0.002016500 1.45e-05  3.644684e-05 1
	6 0.95970 0.291396 0.002399250 1.46e-05 -1.610191e-05 1
	7 0.65591 0.288728 0.001639775 1.45e-05 -1.815367e-05 1

### Plotting Fits to Data (Isochrons)
Plotting isochrons of fitted data is accomplished with the function `isoplt`.  For the York fit (Y) above, calling the funtion produces the following plot.

	isoplt(Y, main = "PdP13-3: York Fit", xlab = "176Lu/177Hf", ylab = "176Hf/177Hf")

![pdp133-york](https://raw.github.com/srmulcahy/isochron/master/inst/img/pdp133-york.png)

### Calculating an Age
I prefer to keep the age determination separate from the fitting and that's the convention taken here.  Once the fit is statisfacory, the age can be determined from the slope of the fit and the decay constant (lambda).  Similairy the uncertainty on the age can be determined from the variance on the slope.
	
	# Calculate the age in Ma
	agema(Y$coef$slope, lambda = 1.867e-11)
	# 467.9765
	
	# Calculate the 2-sigma uncertainty on the age in Ma
	agema(2 * sqrt(Y$vcov[2, 2]), lambda = 1.867e-11)
	# 2.002514
	


## Classic least-squares (York) vs robust fitting (Powell).
The difference in the two methods can be seen by plotting the data from *Russel, 1995* as illustrated by *Powell et al., 2002*.

	data(russel)
	Y <- lsqf(russel$x, russel$y, russel$sx, russel$sy)
	P <- tnhf(russel$x, russel$y, russel$sx, russel$sy)
	isoplt(Y)	
	isoplt(P)

The resulting isochrons show the differences in weighting by the two routines.  With the tanh estimator, all points are given the same weight, with the exception of two outliers near the intercept, whose weights are greatly reduced. (Brighter shades of blue correspond to greater weights and vice versa).

![fit](https://raw.github.com/srmulcahy/isochron/master/inst/img/fit-compare.png)

	
References
-----------

1. Powell, R., Hergt, J., and Woodhead, J., 2002, Improving isochron calculations with robust statistics and the bootstrap: *Chemical Geology*, v. 185, p. 191–204. ([http](http://www.sciencedirect.com/science/article/pii/S000925410100403X))
2. Russell, J., 1995, Direct Pb/Pb dating of Silurian macrofossils from Gotland, Sweden: *Geological Society, London, Special Publications*, v. 89, p. 175–200. ([http](http://sp.lyellcollection.org/content/89/1/175.abstract))
3. York, D., 1969, Least squares fitting of a straight line with coordinated errors: *Earth and Planetary Science Letters*, v. 5, p. 320–324. ([http](http://www.sciencedirect.com/science/article/pii/S0012821X68800597))
