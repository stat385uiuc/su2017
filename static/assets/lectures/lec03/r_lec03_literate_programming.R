## @knitr loadpackages
#Any package that is required by the script below is given here
inst_pkgs = load_pkgs =  c("xtable")
#Check to see if the packages are already installed 
inst_pkgs = inst_pkgs[!(inst_pkgs %in%
                          installed.packages()[,"Package"])]
#Installs any missing package
if(length(inst_pkgs)) install.packages(inst_pkgs)

#Dynamically load required packages
pkgs_loaded = lapply(load_pkgs, require, character.only=T)


## @knitr example-code-chunk-name
#R Code Here
x = 1+9
y = (4*3)/2
x+y

## @knitr mychunk-name
#R Code
n = 5
( xValues = rnorm(n) )
( yValues = rnorm(n, mean = 3, sd = 4) )
plot(xValues,yValues)

## @knitr set_extra_cache_opt
# Set global chunk options
opts_chunk$set(cache.extra = rand_seed)

## @knitr set_extra_cache_opt_limit
# Set global chunk options
opts_chunk$set(cache.extra = 
                 list(R.version,     # R version info w/ OS
                      rand_seed,     # .Random.seed
                      sessionInfo(), # Current Configuration
                      # Month timestamp
                      format(Sys.Date(), '%Y-%m')) 
               
## @knitr set_individual_files
#' @param files is a character vector containing filenames
#' @return time stamp
mtime = function(files){
  lapply(Sys.glob(files),function(x) file.info(x)$mtime)
}


## @knitr data_read_in
data = read.csv("apple.csv")

## @knitr external_code
(x = "Rawr?")

## @knitr external_code_load
read_chunk('analysis_code.R') # Setups code chunks


## @knitr rmd_to_wordpress

# Check to see if RWordPress is install and install if necessary.
if (!require('RWordPress'))
  install.packages('RWordPress', repos = 'http://www.omegahat.org/R', type = 'source')

# Load Library
library(RWordPress)
# Pass user credentials
options(WordpressLogin = c(Username = 'password'),
        WordpressURL = 'http://publish.illinois.edu/<netid>/xmlrpc.php')

# Initialize knitr
library(knitr)

# Uploads r generated images to server. Can be switched to imgur, etc.
opts_knit$set(upload.fun = function(file){
  library(RWordPress) 
  uploadFile(file)$url
})

# Push rmarkdown to wordpress site
knit2wp('file_name.Rmd', title = 'Test r post')


## @knitr kable_example
kable(head(iris,3),        # Data to be converted to table
      row.names = FALSE,   # Show rownames
      align = c('l', 'c', 'r', 'l', 'r'), # Sets column alignment
      digits = 1           # Restrict amount of digits after decimal
      )