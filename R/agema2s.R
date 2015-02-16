# absolute age uncertainty including uncertainty of decay constant
agema2s <- function(slope, slope.2s, lambda=1.666*10^-11, lambda.2s=0.017*10^-11){
  rg2s <- abs(-log(slope+1)*lambda^-2)*lambda.2s
  dcay2s <- abs(1/(lambda*(slope+1)))*slope.2s
  age2s <- rg2s + dcay2s
  return(data.frame(age2s, rg2s, dcay2s))
}
