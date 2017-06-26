## ----setup, include=FALSE------------------------------------------------
knitr::opts_chunk$set(echo = TRUE)

## ----hello_world_func, eval = F------------------------------------------
## cat("Hello World!")

## ---- out.width = "150px", fig.retina = NULL, fig.align='center', echo = F, cache = T----
knitr::include_graphics("figures/function_machine.png")

## ---- cache = T, eval = FALSE--------------------------------------------
## function_name = function ()  {
##   # body
## }

## ---- cache = TRUE, eval = FALSE-----------------------------------------
## function_name()

## ------------------------------------------------------------------------
hello_world = function() { # Function Declaration
  cat("Hello World!\n")    # Body Statement
}

hello_world()              # Call Function

## ----cache = TRUE, eval = FALSE------------------------------------------
## func_dynamic = function (parameter1, parameter2 = NULL)  {
##   # body
## }

## ----cache = TRUE, eval = FALSE------------------------------------------
## # Specify both values
## func_dynamic(parameter1, paramter2)
## 
## # Parameter2 will use NULL as the value
## func_dynamic(parameter1)

## ----format_percent, cache = T-------------------------------------------
# Function Declaration
format_percent = function(x, digits = 3){   # Define Func
  percent = round(x * 100, digits = digits) # Round digits
  result = paste0(percent, "%")             # Add % sign
  
  return(result)                            # Return
}

## ----format_percent_call, cache = T--------------------------------------
x = runif(5)

format_percent(x)

format_percent(x, digits = 0)

## ----format_precent_no_return, cache = T---------------------------------
format_percent = function(x, digits = 4){
 percent = round(x * 100, digits = digits)
 result = paste0(percent, "%")            

 result  # Last Result
}

## ----return_example, cache = TRUE----------------------------------------
example_return = function(value = TRUE) {
 if(value) {
   return(TRUE)  # Clear
 } else {
   return(FALSE) # Clear
 }
}

## ----return_example_v2, cache = TRUE-------------------------------------
example_return = function(value = TRUE) {
 output = NULL
 if(value) {
   output = TRUE
 } else {
   output = FALSE
 }
 output           # Not Clear
}

## ----format_precent_sign, cache = T--------------------------------------
format_percent = function(x, digits = 4, psign = TRUE){  
  percent = round(x * 100, digits = digits) 
  
  if(psign){  # Check to see if % should be added
    result = paste0(percent, "%")
  } else {
    # Coerce to character to match % output.
    result = as.character(percent) 
  }
  result
}

## ----fun_breaks, cache = TRUE--------------------------------------------
compute_tss = function (y, y_bar)  {
  return(sum( (y - y_bar)^2 ))
}

compute_fss = function (y_hat, y_bar)  {
  return(sum( (y_hat - y_bar)^2 ))
}

compute_rss = function (y, y_hat)  {
  return(sum( (y - y_hat)^2 ))
}

## ----tss_rel, cache = TRUE-----------------------------------------------
tss_relationship = function (y, y_hat, y_bar)  {
  rss = compute_rss(y, y_hat)
  fss = compute_fss(y_hat, y_bar)
  tss = rss + fss
  return( tss )
}

## ----data_setup, cache = TRUE--------------------------------------------
# Number of Observations
n = 10
# Generate x
x = seq(0, 1, length.out = n)

# Generate random y
# Set seed for reproducibility
set.seed(114)
y = runif(n)

# Calculate mean
y_bar = mean(y)

# Obtain y_hat
y_hat = lm(y~x)$fitted.values

## ----computations, cache = T---------------------------------------------
# Compute
rss = compute_rss(y, y_bar)
fss = compute_fss(y_hat, y_bar)
tss = compute_tss(y, y_bar)
tss_v2 = tss_relationship(y, y_hat, y_bar)

# Verify equality
all.equal(tss, tss_v2)

## ---- eval = F, cache = T------------------------------------------------
## # Note `value` has not been defined.
## multiple_constant = function(x) {
##   return(value * x)
## }
## 
## # Only on call is an error detected.
## multiple_constant(5)
## ## Error in multiple_constant(5) :
## ## object 'value' not found

## ----test_case, eval = T, cache = T--------------------------------------
# Define value in global environment
# (e.g. outside of the function)
value = 3

multiple_constant = function(x) { 
  # `value` is not been defined in the function.
  return(value * x) 
}

multiple_constant(5)

## ---- out.width = "250px", fig.retina = NULL, fig.align='center', echo = F, cache = T----
knitr::include_graphics("figures/google_recursion.png")

## ----pow_loop, cache = T-------------------------------------------------
pow_loop = function(x, n){ # Define function
  
  result = 1               # Setup output variable
  
  for(i in seq_len(n)){    # Loop over the power
    result = result*x
  }
  
  result                   # Return the result
}

## ----pow, cache = T------------------------------------------------------
pow = function(x, n){ # Define function
  
    if (n <= 0){      # Set a base case
      return(1)       # No recursive call
    } 
    
    # Solve a small part of the larger problem
    return(x * pow(x, n - 1)) # Call ourself
}

## ----test_example, cache = T---------------------------------------------
pow = function(x, n, d){ # Define function
    # Add a tracer into the function
    spacer = ""; 
    for (i in seq_len(d)) {
        spacer = paste0(spacer, " ", collapse = "")
    }
    cat(spacer, "pow(",x,",",n,")\n", sep="")

    # --------- Same code as before
    
    if (n <= 0){       # Set a base case
      return(1)       # No recursive call
    } 
    
    # Solve a small part of the larger problem
    return(x * pow(x, n - 1, d + 4)) # Call ourself
}

## ----tracer_output, cache = T--------------------------------------------
cat(pow(7, 2, 0))

## ------------------------------------------------------------------------
factorial_r <- function(x){    # Function Definition
  if(x <= 1){
    return(1)
  } else {
    return(x*factorial_r(x-1))
  }
}

## ---- out.width = "150px", fig.retina = NULL, fig.align='center', echo = F, cache = T----
knitr::include_graphics("figures/microscope.jpg")

## ----simple_benchmark, cache = TRUE--------------------------------------
out = system.time({Sys.sleep(1)})
out

out[3]

## ----benchmark_data_structure, cache = TRUE------------------------------
# Set seed for reproducibility
set.seed(1337)

# Construct large matrix object
matrix.op = matrix(rnorm(10000*100), 10000, 100)

# Convert matrix object to data.frame
dataframe.op = as.data.frame(matrix.op)

## ----benchmark_brackets, cache = TRUE------------------------------------
# Different R implementations
f = function(n, x=1) for (i in 1:n) x=1/(1+x)
g = function(n, x=1) for (i in 1:n) x=(1/(1+x))
h = function(n, x=1) for (i in 1:n) x=(1+x)^(-1)
j = function(n, x=1) for (i in 1:n) x={1/{1+x} }
k = function(n, x=1) for (i in 1:n) x=1/{1+x}

## ----benchmark_rcpp_brackets, cache = TRUE-------------------------------
# Load Rcpp
library(Rcpp)

# Define a version in C++ called 
cppFunction(code='int d(int n, double x = 1.0){
                  for (int i=0; i<n; i++) x=1/(1+x);
                  return x;
                  }')

## ----demo_benchmark, eval=FALSE, cache = TRUE----------------------------
## # Load Library
## library('rbenchmark')
## 
## # Run benchmark
## benchmark(testfun1 = somefun(),
##           testfun2 = otherfun())

## ----benchmark_demo_data_structure, cache = TRUE-------------------------
# Load Library
library('rbenchmark')

# Run benchmark
out = benchmark(mat.op = apply(matrix.op, 2, sd), 
                df.op = apply(dataframe.op, 2, sd))


## ----op_out_benchmark, cache = TRUE, eval = FALSE------------------------
## # Table Object
## out

## ----op_out_benchmark_table, cache = TRUE, echo = FALSE------------------
knitr::kable(out, digits = 2, row.names = F)

## ----benchmark_demo_data_structure_avg_time, cache = TRUE----------------
# Average time spent per iteration
out[,"elapsed"]/out[,"replications"]

## ----benchmark_demo_curly_paran, cache = TRUE, size='scriptsize'---------
N = 1e6 # Number of Times to Run Loop
out = benchmark(f(N, 1), g(N, 1), h(N, 1), j(N, 1), k(N, 1), d(N, 1), # Test Funcs
          columns = c("test", "replications", "elapsed", "relative"), 
          order="relative",  # Order the results by speed (lower is better)
          replications=20)   # Number of runs for each function

## ----benchmark_demo_curly_paran_sum_obj, cache = TRUE, echo = FALSE, eval = FALSE----
## out

## ----benchmark_demo_curly_paran_sum, cache = TRUE, echo = FALSE----------
knitr::kable(out)

## ----cache = T-----------------------------------------------------------
out[,"elapsed"] / out[,"replications"]

## ----demo_microbenchmark, cache = TRUE, eval=FALSE-----------------------
## # Load Library
## library('microbenchmark')
## 
## # Run benchmark
## microbenchmark(testfun1 = somefun(), # List Functions
##                testfun2 = otherfun(),
##                times = 100) # Number of Replications

## ----demo_microbenchmark_data_structure, cache = TRUE--------------------
# Load Library
library('microbenchmark')

# Run benchmark
out = microbenchmark(mat.op = apply(matrix.op, 2, sd), 
                     df.op = apply(dataframe.op, 2, sd))


## ----demo_mb_data_structure_table, cache = T, eval = F-------------------
## # Table Object
## summary(out)

## ----demo_mb_data_structure_table_render_kable, cache = T, echo = F------
knitr::kable(summary(out), digits = 2)

## ----demo_microbenchmark_curly_paran, cache = TRUE-----------------------
N = 1e6 # Number of Times to Run Loop
out = microbenchmark(f(N, 1), g(N, 1), h(N, 1), # Funcs
                     j(N, 1), k(N, 1), d(N, 1),
                     times = 20)   # Number of Reps

## ----demo_microbenchmark_curly_paran_table, cache = TRUE, eval = FALSE----
## summary(out) # Obtain quantile information

## ----demo_mb_curly_paran_table_render, cache = TRUE, echo = FALSE--------
knitr::kable(summary(out), digits = 2)

## ----compare_ggplot2, cache = TRUE, fig.height=2, fig.width=5------------
library(ggplot2)
autoplot(out)   # Creates a violin plot of the data

## ----fib-----------------------------------------------------------------
fibonacci = function(n) {
   if (n <= 2) {
     return(1)
   }
  
   return(fibonacci(n-2) + fibonacci(n-1))
}

## ---- cache = T, echo = F------------------------------------------------
library("ggplot2")
d = data.frame(Fibonacci = sapply(1:10, fibonacci),
               N = 1L:10L)

ggplot(d, aes(N, Fibonacci)) + geom_line() + geom_point() +
  scale_x_continuous(labels = function (x) floor(x))

## ----mem_example, cache = TRUE-------------------------------------------
library("memoise")
mem_fib = memoise(fibonacci)

## ----mem_ized, cache = TRUE----------------------------------------------
fibonacci(5) # Normal
mem_fib(5)   # Memoized

## ----mem_ized_fib, cache = TRUE------------------------------------------
system.time({mem_fib(34)}) # First time calculation
system.time({mem_fib(35)}) # First time calculation

## ----memized_fib_v2, cache = TRUE----------------------------------------
internal_mem_fib = memoise(function(n) { 
  if (n <= 2){
    return(1)
  }
  
  # Note the reference to the outside declaration
  return(internal_mem_fib(n - 2) + internal_mem_fib(n - 1))
})

## ----memoized_v2, cache = T----------------------------------------------
system.time({mem_fib(25)}) # Registers value in map
system.time({mem_fib(25)}) # Extracts value from map
system.time({internal_mem_fib(25)}) # Built in Memoization

## ----memized_cache, cache = TRUE-----------------------------------------
forget(mem_fib)
forget(internal_mem_fib)

