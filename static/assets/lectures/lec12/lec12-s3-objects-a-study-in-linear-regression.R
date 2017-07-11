## ----setup, include=FALSE------------------------------------------------
options(width = 60)
knitr::opts_chunk$set(cache = TRUE)

## ----env_obj_class-------------------------------------------------------
class(3)           # Number

class(sum)         # Function

class(.GlobalEnv)  # Global Environment

## ------------------------------------------------------------------------
pryr::ftype(print)

## ----generic_summary-----------------------------------------------------
summary

## ----method_summary, eval = F--------------------------------------------
## # All classes with a summary.*() function
## methods(summary)

## ----method_summary_eval, echo = FALSE-----------------------------------
# All classes with a summary.*() function
methods(summary)[1:2] # Restrict output

## ----method_data_frame, eval = FALSE-------------------------------------
## # Methods using a particular class
## methods(class='matrix')

## ----method_data_frame_eval, echo = FALSE--------------------------------
# Methods using a particular class
methods(class='matrix')[1:6]

## ----one_step------------------------------------------------------------
# ----- One Step S3 Construct

# Create object `andy` and assign class `student`
andy = structure(list(), class = "student")

class(andy)              # Check class
str(andy)                # Structure

## ----two_step------------------------------------------------------------
# ----- Two Step S3 Construct

andy = list()            # Create object andy
                         # as a list class

class(andy) = "student"  # then set class to student

class(andy)              # Check obj type

str(andy)                # Structure

## ----two_step_attrib-----------------------------------------------------
# ----- Two Step S3 Construct with Attributes

andy = list()                   # Create object andy
                                # as a list class

attr(andy,"class") = "student"  # Set class to student

class(andy)                     # Check obj type

str(andy)                       # Structure

## ----inherit_andy--------------------------------------------------------
inherits(andy, "student")

inherits(andy, "list")

## ----define_generics_human-----------------------------------------------
# Create a role identifier

# method `role` for class `human`
role.human = function(x){             
  cat("Hi there human", x$fname, "!\n")
}

## ----define_generics-----------------------------------------------------

# method `role` for class `instructor`
role.instructor = function(x){
  cat("Greetings and Salutations", x$fname, ",\n",
      "You are an instructor for", x$course, "\n")
}

# method `role` for class `student`
role.student = function(x){
    cat("Hey", x$fname, "!\n",
      "You are inL", x$course, "\n",
      "Your grade is:", x$grade, "\n")
}

## ----generic_func--------------------------------------------------------
# Create a default case
role = function(x, ...){ 
  UseMethod("role") 
}

## ----example_call_inst---------------------------------------------------
# Create object `james` and assign class `instructor`
james = structure(list(fname = 'James',
                       course = "STAT385"),
                 class = "instructor")

role(james)

## ----example_call_two----------------------------------------------------
# Create object `david` and assign classes
# `instructor` and `student`
david = structure(list(fname = 'David',
                       course = "STAT385",
                       grade = "A"),
                  class = c('student','instructor'))

role(david)

## ----example_toad, echo = FALSE------------------------------------------
toad = structure(list(fname = 'McToady',
                      course = "STAT385",
                       grade = "A"),
                 class = 'humbug')

## ----example_call_unknown, eval = FALSE----------------------------------
## toad = structure(list(fname = 'McToady',
##                       course = "STAT385",
##                        grade = "A"),
##                  class = 'humbug')
## 
## role(toad)
## 
## ## Error in UseMethod("role") :
## ##  no applicable method for 'role' applied
## ## to an object of class "list"

## ----protected_generic---------------------------------------------------
role.default = function(x){     # Default case
  cat("I have no clue what your role is. Who are you?")
}

# Try again
role(toad)

## ----inheritance_basic---------------------------------------------------
james = structure(list(fname = "James",
                       course = "STAT385"),
                 class = c("instructor", # Specific
                           "human",      # Less specific
                           "list"))      # Default Object

str(james)                               # Structure

## ----protected_generic_inst, eval = FALSE--------------------------------
## # Bad
## role.instructor(james) # Not always an instructor!
## 
## # Good
## role(james) # Adapts to future change!

## ----make_generic--------------------------------------------------------
my_lm = function(x, ...){ 
  UseMethod("my_lm") 
}

## ----part_one, eval = F--------------------------------------------------
## my_lm.default = function(x, y, ...){
## 
##   # Obtain the QR Decomposition of X
##   # Not a good approach for rank-deficient matrices
##   qr_x = qr(x)
## 
##   # Compute the Beta_hat = (X^T X)^(-1) X^T y estimator
##   beta_hat =  solve.qr(qr_x, y)
## 
##   # Compute the Degrees of Freedom
##   df = nrow(x) - ncol(x)   # n - p
## 

## ----part_two, eval = F--------------------------------------------------
##   # Compute the Standard Deviation of the Residuals
##   sigma2 = sum((y - x %*% beta_hat) ^ 2) / df
## 
##   # Compute the Covariance Matrix
##   # Cov(Beta_hat) = sigma^2 * (X^T X)^(-1)
##   cov_mat = sigma2 * chol2inv(qr_x$qr)
## 
##   # Make name symmetric in covariance matrix
##   rownames(cov_mat) = colnames(x)
##   colnames(cov_mat) = colnames(x)
## 
##   # Return a list
##   return(structure(list(coefs = beta_hat,
##                         cov_mat = cov_mat,
##                         sigma = sqrt(sigma2), df = df),
##                    class = "my_lm"))
## }

## ----combined_echo = FALSE-----------------------------------------------
my_lm.default = function(x, y, ...){
  
  # Obtain the QR Decomposition of X
  # Not a good approach for rank-deficient matrices
  qr_x = qr(x)
  
  # Compute the Beta_hat = (X^T X)^(-1) X^T y estimator
  beta_hat =  solve.qr(qr_x, y)
  
  # Compute the Degrees of Freedom
  df = nrow(x) - ncol(x)   # n - p 
  
  # Compute the Standard Deviation of the Residuals
  sigma2 = sum((y - x %*% beta_hat) ^ 2) / df
  
  # Compute the Covariance Matrix
  # Cov(Beta_hat) = sigma^2 * (X^T X)^(-1)
  cov_mat = sigma2 * chol2inv(qr_x$qr)
  
  # Make name symmetric in covariance matrix
  rownames(cov_mat) = colnames(x)
  colnames(cov_mat) = colnames(x)
  
  # Return a list
  return(structure(list(coefs = beta_hat, 
                        cov_mat = cov_mat, 
                        sigma = sqrt(sigma2), df = df),
                   class = "my_lm"))
}

## ------------------------------------------------------------------------
print.my_lm = function(x, ...){
  cat("\nCoefficients:\n")
  print(x$coefs)
}

## ----writing_summary_my_lm-----------------------------------------------
# Note that summary(object, ...) instead of summary(x, ...)!
summary.my_lm = function(object, ...){
  
  estimate = object$coefs            # Beta Hat
  sterr = sqrt(diag(object$cov_mat)) # STD Error
  t_test = estimate / sterr          # t-Test value
  pval = 2*pt(-abs(t_test), df=object$df) # p-value
  
  # Make output matrix
  mat = cbind("Estimate"= estimate, "Std. Err" = sterr,
             "t value" = t_test, "Pr(>|t|)" = pval)
  
  rownames(mat) = rownames(object$cov_mat) # Naming
  
  return(structure(list(mat = mat), 
                  class = "summary.my_lm"))
}

## ------------------------------------------------------------------------
# Our Implementation of lm
my_lm(x = cbind(1, mtcars$disp), y = mtcars$mpg)

# Base R implementation
lm(mpg~disp, data = mtcars)

## ------------------------------------------------------------------------
# Note that print(x,...)!!
print.summary.my_lm = function(x, ...) {
  printCoefmat(x$mat,
               P.value = TRUE, 
               has.Pvalue = TRUE)
}

## ------------------------------------------------------------------------
# Our Implementation of lm
summary(my_lm(x = cbind("(Intercept)" = 1,
                        "disp" = mtcars$disp),
              y = mtcars$mpg))

## ------------------------------------------------------------------------
# Base R implementation
summary(lm(mpg~disp, data = mtcars))

