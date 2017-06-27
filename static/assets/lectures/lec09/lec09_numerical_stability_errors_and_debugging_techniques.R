## ----setup, include=FALSE------------------------------------------------
knitr::opts_chunk$set(echo = FALSE)

## ----overflow_integer, cache = TRUE, echo = TRUE-------------------------
(x = (1.0024e6)^2)               # Uncorrected
(y = (1.0024e6 - 1.0000156e6)^2) # Corrected

## ----max_integer, cache = TRUE, echo = TRUE------------------------------
.Machine$integer.max  # Maximum integer in memory

## ----max_double, cache = TRUE, echo = TRUE-------------------------------
.Machine$double.xmax  # Maximum numeric in memory

## ----var_algo_naive, cache = TRUE, echo = TRUE---------------------------
var_naive = function(x){
  n = length(x)           # Obtain the length
  sum_x = 0               # Storage for Sum of X
  sum_x2 = 0              # Storage for Sum of X^2
  for(i in seq_along(x)){ # Calculate sums
    sum_x = sum_x + x[i]
    sum_x2 = sum_x2 + x[i]^2
  }
  
  # Compute the variance
  v = (sum_x2 - sum_x*sum_x/n)/n
  return(v)
}

## ----var_algo_2p, cache = TRUE, echo = TRUE------------------------------
var_2p = function(x){
  n  = length(x)           # Length
  mu = 0; v = 0            # Storage for mean and var
  
  for(i in seq_along(x)){  # Calculate the Sum for Mean
    mu = mu + x[i]         
  }
  
  mu = mu / n              # Calculate the Mean
  
  for(i in seq_along(x)){  # Calculate Sum for Variance
    v = v + (x[i] - mu)*(x[i] - mu)
  }
  
  v = v/n                  # Calculate Variance
  return(v)                # Return
}

## ----example_break, cache = TRUE, echo = TRUE----------------------------
set.seed(1234) # Set seed for reproducibility
x = rnorm(2e6, mean = 1e20, sd = 1e12)

(method1 = var_naive(x))
(method2 = var_2p(x))
(baser = var(x)*((2e6)-1)/(2e6))

all.equal(method1, method2)
all.equal(method2, baser)

## ----numeric_example, cache = TRUE, echo = TRUE--------------------------
x = 0.1
x = x + 0.05
x
if(x == 0.15){
  cat("x equals 0.15")
} else { 
  cat("x is not equal to 0.15")
}

## ----numeric_string, cache = TRUE, echo = TRUE---------------------------
sprintf("%.20f", 0.15) # Formats Numeric
sprintf("%.20f", x)    

## ----epsilon_neighborhood, out.width = "250px", fig.retina = NULL, fig.align='center', echo = F, cache = T----
knitr::include_graphics("img/epsilon_neighborhood.png")

## ----machine_eps_neighborhood, cache = TRUE, echo = TRUE-----------------
.Machine$double.eps

## ----eps_example, cache = TRUE, echo = TRUE------------------------------
sprintf("%.15f", 1 + c(-1,1)*.Machine$double.eps)

## ----all_equal_example, cache = TRUE, echo = TRUE------------------------
all.equal(x, 0.15, tolerance = 1e-3)

## ----is_true_value, cache = TRUE, echo = TRUE----------------------------
isTRUE(all.equal(x, 0.15))

## ----is_true_numeric, cache = TRUE, echo = TRUE--------------------------
if(isTRUE(all.equal(x, 0.15))){
  cat("In threshold")
} else {
  cat("Out of threshold")
}

## ----bad_loop_example, cache = TRUE, echo = TRUE, eval = FALSE-----------
## inc_value = 360L / 14L # Value to increment
## i = 0                  # Increment storage
## while(i != 360){       # Loop
##   i = i + inc_value    # Add values
## }

## ----good_loop_example, cache = TRUE, echo = TRUE------------------------
inc_value = 360 / 14 # Value
i = 0L               # Integer
o = 0                # Numeric
while(i != 14L){
  o = o + inc_value  # Sum
  i = i + 1L         # Increment loop
}
i

## ----if_assignment_error, cache = TRUE, eval = FALSE, echo = TRUE--------
## # Assigning in `if`
## if(x = 42) { cat("Life!") }
## ## Error: unexpected '=' in "if(x ="
## 
## # Correct
## if(x == 42) { cat("Life!") }

## ----assignment_error, cache = T, eval = FALSE, echo = TRUE--------------
## # Equality Check instead of Assignment
## x == 42
## ## No Error, but prints `TRUE` or `FALSE`
## 
## # Correct
## x = 42

## ----if_vectorized, cache = TRUE, eval = FALSE, echo = TRUE--------------
## x = 1:5
## y = 2:6
## if(x > y){ T }
## ## Warning messages:
## ## In if (x > y) { : the condition has length > 1 and only the first element will be used
## 
## # Correct
## ifelse(x > y, T, F)

## ----calc_vectorized, cache = TRUE, eval = FALSE, echo = TRUE------------
## x = 1:5
## y = 2:3
## 
## x + y
## ## Warning message:
## ## In x + y : longer object length is not a multiple
## ## of shorter object length
## 
## # Correct
## x = 1:4
## y = 2:3
## x + y
## # Repeats y twice
## # 1 + 2, 2 + 3, 3 + 2, 4 + 3

## ----mismatched_brackets, cache = TRUE, eval = FALSE, echo = TRUE--------
## 2*(x + y))
## ## Error: unexpected ')' in "2*(x + y))"
## 
## # Corrected
## 2*((x + y))

## ----no_multiplication, cache = TRUE, eval = FALSE, echo = TRUE----------
## 2x+4
## ## Error: unexpected symbol in "2x"
## 
## # Correct
## 2*x + 4

## ----manual_entry, cache = TRUE, eval = FALSE, echo = TRUE---------------
## c(1, 2 3, 4)
## ## Error: unexpected numeric constant in "c(1,2 3"
## 
## # Correct
## c(1, 2, 3, 4)

## ----quoting_string, cache = TRUE, eval = FALSE, echo = TRUE-------------
## "toad"princess"
## ## Error: unexpected symbol in ""toad"princess"
## 
## # Corrected
## "toad\"princess"
## 'toad"princess'

## ----missing_values_issues, cache = TRUE, eval = FALSE, echo = TRUE------
## x = c(1,NA,2)
## 3 + x
## # No Error, but: [1] NA
## 
## sum(x)
## # No Error, but: [1] NA
## 
## # Corrected
## 1 + na.omit(x)    # Deletes NA
## sum(x, na.rm = T) # Removes NA inside function

## ----finite_missing_values, cache = TRUE, eval = FALSE, echo = TRUE------
## x = c(NA,-Inf, Inf ,NaN)
## is.na(x)
## # No error, but: [1]  TRUE FALSE FALSE  TRUE
## 
## is.infinite(x)
## # No error, but: [1] FALSE  TRUE  TRUE FALSE
## 
## # Correct
## is.finite(x)
## # [1] FALSE FALSE FALSE FALSE

