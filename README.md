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

Install directly from Github using the [devtools package](https://github.com/hadley/devtools)

```r
library(devtools)
install_github("isochron", "srmulcahy")
library(isochron)
````

Quick start
-----------

Classic least-squares (york) fitting of isochron data
```r
data(pdp133)
Y <- lsqf(pdp133$x, pdp133$y, pdp133$sx, pdp133$sy)
Y
agema(Y$coef$slope, lambda = 1.867e-11)
isoplt(Y)
```

Robust fitting of isochron data
```r
data(pdp133)
T <- tanh(pdp133$x, pdp133$y, pdp133$sx, pdp133$sy)
T
agema(T$coef$slope, lambda = 1.867e-11)
isoplt(T)
```