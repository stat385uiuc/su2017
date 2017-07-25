## ----setup, include=FALSE------------------------------------------------
options(width = 60)
knitr::opts_chunk$set(echo = TRUE, cache = TRUE)

## ----quad_core_cpu, out.width = "125px", fig.retina = NULL, fig.align='center', cache = TRUE, echo = FALSE----
knitr::include_graphics("img/cpu_i7.jpg")

## ----quad_core, out.width = "100px", fig.retina = NULL, fig.align='center', cache = TRUE, echo = FALSE----
knitr::include_graphics(c("img/quad_core_inside.jpg","img/LFDDieLayout.jpg"))

## ----cpp_file_create_dropdown, out.width = "125px", fig.retina = NULL, fig.align='center', cache = TRUE, echo = FALSE----
knitr::include_graphics("img/cpp_file_dropdown.png")

## ----cpp_file_create, out.width = "100px", fig.retina = NULL, fig.align='center', cache = TRUE, echo = FALSE----
knitr::include_graphics("img/create_cpp.png")

## ----rcpp_in_rstudio, out.width = "325px", fig.retina = NULL, fig.align='center', cache = TRUE, echo = FALSE----
knitr::include_graphics("img/rstudio_editor_cpp.png")

## ----eval = F------------------------------------------------------------
## Rcpp::sourceCpp("rcpp_twotimes.cpp")

## ----rcpp_source, out.width = "125px", fig.retina = NULL, fig.align='center', cache = TRUE, echo = FALSE----
knitr::include_graphics("img/source_cpp.png")

## ----eval = F------------------------------------------------------------
## timesTwo(42)
## ## [1] 84

## #include <Rcpp.h>     // Includes the Rcpp C++ header

## using namespace Rcpp; // C++ search scope

## #include <Rcpp.h>     // Includes the Rcpp C++ header

## /* Group comment

## ------------------------------------------------------------------------
# pound/hash commment

## ----eval = F------------------------------------------------------------
## hello = function(){
##   cat("Hello R/C++ World!\n")
## }

## // Akin to cat("Hello R/C++ World!\n")

## // [[Rcpp::export]]

## #include <Rcpp.h>

## <<hello_world_ex>>

## ------------------------------------------------------------------------
# Call C++ Code like a normal R function
hello()    

## <<hello_world_ex>>

## ------------------------------------------------------------------------
hello

## ------------------------------------------------------------------------
add = function(a,b){
  return(a + b)
}

add(0L, 2L)   # Remember L means integer!
add(2.5, 1.1) # Double/numeric

## #include <Rcpp.h>

## ------------------------------------------------------------------------
add(0L, 2L)   # Integers into double
add(2.5, 1.1) # Double into double

## #include <Rcpp.h>

## ------------------------------------------------------------------------
addRcppInt(2.5, 1.1)  # Call in *R*

## ------------------------------------------------------------------------
muR = function(x) {
  sum_r = 0
  for (i in seq_along(x)) {
    sum_r = sum_r + x[i]
  }
  
  sum_r / length(x)
}

## #include <Rcpp.h>

## ------------------------------------------------------------------------
# Done in *R*

set.seed(112)                # Set seed

x = rnorm(10)                # Generate data

all.equal(muRcpp(x), muR(x)) # Test Functions

## #include <Rcpp.h>

## ------------------------------------------------------------------------
(x = 1:10)  # Span from 1 to 10
ref_ex(x)   # No output due to no return
x           # Different Span!

## ------------------------------------------------------------------------
(x = seq(0.5,5.5))  # Span from 0.5 to 5.5
ref_ex(x)            # No output due to no return
x                    # Same span????

## ----eval = F------------------------------------------------------------
## typeof(x)

