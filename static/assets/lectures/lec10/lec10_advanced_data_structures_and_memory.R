## ----setup, include=FALSE------------------------------------------------
knitr::opts_chunk$set(echo = TRUE)

## ----matrix_rnorm_col, echo = TRUE, cache = TRUE-------------------------
(x = c(c(1,2,3),c(1,2,3)) )  # Create data
(y = matrix(x, nrow = 3, ncol = 2)) # Make the Matrix

## ----matrix_rnorm_row, echo = TRUE, cache = TRUE-------------------------
(y = matrix(x, nrow = 3, ncol = 2)) # Previous matrix
(y2 = matrix(x, nrow = 3, ncol = 2, byrow = TRUE))

## ----matrix_dimensions, cache = TRUE-------------------------------------
nrow(y) # Returns Row information
ncol(y) # Returns Column information
dim(y)  # Returns Row, Column Information 

## ----atomic_vector, cache = TRUE-----------------------------------------
numeric(4)
matrix(0,  ncol = 4) # 1 x 4 matrix w/ 0's

## ----cbind_ex, cache = TRUE, echo = TRUE---------------------------------
m = matrix(1:6, nrow = 2)
x = 7:9   # Matches the p dimension
rbind(m,x)

## ----rbind_ex, cache = TRUE, echo = TRUE---------------------------------
x = 7:8     # Decreased to match the n dimension
cbind(m,x)

## ----subset_example, cache = TRUE----------------------------------------
m[1, ]               # First row, simplify to vector
m[1, , drop = FALSE] # First row & Maintain Matrix form

m[1, 2]              # Obs in first row, second column

## ----subset_example_cols, cache = TRUE-----------------------------------
m[, 2]               # Second column, simplify to vector
m[, 2, drop = FALSE] # Second column & Maintain Matrix form

## ----subset_example_matrix, cache = TRUE---------------------------------
sub_m = cbind(c(1,2), c(2,3)) # R1,C2 and R2, C3
m[sub_m]                      # Select multiple points

# Wrong
m[c(1,2),c(2,3)]              # Not a desired behavior

## ----matrix_element_setup, cache = TRUE----------------------------------
(a = matrix(1:4, ncol = 2, byrow = T))
(b = matrix(4:1, ncol = 2, byrow = T))

## ----matrix_element_wise, cache = TRUE-----------------------------------
a - b # Element-wise
a * b # Element-wise
a / b # Element-wise

## ----matrix_scalar, cache = TRUE-----------------------------------------
3 * a # Scalar multiplication

## ----matrix_multiplication-----------------------------------------------
a %*% b

## ----mat_transpose_square, cache = TRUE, echo = TRUE---------------------
(x = matrix(1:4, ncol = 2, byrow = TRUE))
(xt = t(x))

## ----inverse_sol, cache = TRUE, echo = TRUE------------------------------
(x = matrix(c(1,3,3,4), nrow = 2))
(x_inv = solve(x))

## ----inverse_sol_identity, cache = TRUE, echo = TRUE---------------------
x_inv %*% x

x %*% x_inv

## ----example_multiplication, cache = TRUE--------------------------------
set.seed(4142)          # Set seed for Reproducibility
x = cbind(1, rnorm(10)) # Design Matrix
error = rnorm(10)       # Error
beta = c(1,2)           # Specify the beta
y = x%*%beta + error    # Generate Y

# Solve for beta_hat
(beta_hat = solve(t(x)%*%x, t(x)%*%y))

## ----array_construct_simple, cache = TRUE, echo = TRUE-------------------
numeric(4)            # 1 x 4 vector w/0's
matrix(0, ncol = 4)   # 1 x 4 matrix w/ 0's
array(0, dim = c(4))  # 1 x 4 array w/ 0's
array(0, dim = c(1,4))# 1 x 4 array w/ 0's

## ----array_construct, cache = TRUE, echo = TRUE--------------------------
x = matrix(1, nrow = 2, ncol = 3) # 2 x 3 matrix w/ 1's
y = matrix(2, nrow = 2, ncol = 3) # 2 x 3 matrix w/ 2's
(z = array(c(x, y), dim = c(2, 3, 2))) # 2 x 3 x 2 array 

## ----array_subset, cache = TRUE, echo = TRUE-----------------------------
z[1,,] # First row     (across all)
z[,2,] # Second column (across all)
z[,,1] # First time dimension

## ----list_creation, cache = TRUE-----------------------------------------
x = list(1:4L,          # Integer
         c("a","b"),    # Character 
         c(TRUE, FALSE),# Logical
         c(2.3, 5.9),   # Numeric
         list(1,2))     # List!

str(x)                  # See contents

## ----listception, cache = TRUE-------------------------------------------
x = list(list(list(list()))) # Construct Lists in List
str(x)                       # See contents

## ----list_me, cache = TRUE-----------------------------------------------
x = c(list("a", "b"), c("c", "d"))  # Created list
str(x)                              # Contents

## ----list_creation_empty, cache = TRUE-----------------------------------
n = 5                 # Number of entries
x = vector('list', n) # Create list
str(x)                # Contents

## ----list_creation_named, cache = TRUE-----------------------------------
x = list("a" = c(1,2,3),
         "b" = list(c(1,2)),
         "c" = c("fake","name"))

str(x)                # Contents

## ----list_subset_numeric, cache = TRUE-----------------------------------
x[1]     # Index
x[[1]]   # Index Preservation

## ----list_subset, cache = TRUE-------------------------------------------
x["a"]   # Named
x$a      # Named
x[["a"]] # Named Preservation

## ----df_make, cache = T--------------------------------------------------
n = 20
d = data.frame(a = numeric(n),
               b = character(n),
               c = integer(n),
               stringsAsFactors = FALSE) # Never forget.

## ----pryr_install--------------------------------------------------------
# install.packages("pryr")

library("pryr")

## ------------------------------------------------------------------------
x = 1:5

object_size(x)           # Size of a vector
object_size(ChickWeight) # Size of a dataset
object_size(sum)         # Size of a function

## ----allotment, cache = TRUE---------------------------------------------
sizes = sapply(0:50, function(n) object_size(seq_len(n)))
plot(0:50, sizes, xlab = "Length", ylab = "Size (bytes)", type = "s")

## ----function_failure, cache = TRUE--------------------------------------
x = 2             # Set initial value

sq = function(x){ # Define Function
  x = x * x       # Square operation
}

sq(x)             # Pass Function x

x                 # Result

## ----mod_tester, cache = TRUE--------------------------------------------
mod_test = function(x, val = 3) {
  x$elem = val # Modify the element
  invisible(x) # Hide output 
}

## ----mod_tester_env, cache = TRUE----------------------------------------
x_env = new.env() # Create an environment
x_env$elem = 1    # Add an element
mod_test(x_env)   # Try to Modify Elem
x_env$elem        # Print elem

## ----mod_tester_copy_list, cache = TRUE----------------------------------
x_list = list("elem" = 1) # Construct the List
mod_test(x_list)          # Try to Modify
x_list                    # Print list

## ----list_example, cache = TRUE------------------------------------------
x = 1:1e6
object_size(x)

y = list(x, x)
object_size(y)

## ----list_example_modification, cache = TRUE-----------------------------
x2 = x-1
object_size(x2)

y = list(x, x2)
object_size(y)

## ----inside_the_machine, cache = T---------------------------------------

# For reproducibility
set.seed(1337)

# Generate a random matrix
a = matrix(rnorm(625000), nrow = 62500, ncol = 10)

# Matrix memory size
pryr::object_size(a)

