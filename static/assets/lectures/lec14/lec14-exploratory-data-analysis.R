## ----setup, include=FALSE------------------------------------------------
options(width = 60)
knitr::opts_chunk$set(echo = TRUE, cache = TRUE)

## ---- echo = F, message=F, cache = FALSE---------------------------------
library("magrittr")
library("ggplot2")

## ------------------------------------------------------------------------
# Make some data
n = 20

# Set seed for reproducibility
set.seed(1133)
d = data.frame(id = paste0("s", sample(n, n)),
               sex = sample(c("male", "female"), 
                            n, replace = T),
               food = sample(c("cake", "pie"),
                             n, replace = T),
               trt_a = runif(n),
               trt_b = rnorm(n)
               )

## ----verify_head---------------------------------------------------------
head(d)        # Defaults to showing the first 6 

head(d, n = 2) # Shows the first 2 

## ----verify_tail---------------------------------------------------------
tail(d)        # Defaults to showing the last 6 

tail(d, n = 2) # Shows the last 2 

## ----verify_obs_and_vars-------------------------------------------------
nrow(d)  # Find the number of observations
ncol(d)  # Find the number of variables 
dim(d)   # Both observations and variables (n x p)

## ----verify_data_types---------------------------------------------------
sapply(d, FUN = class)   # Obtain each columns data type

## ----verify_missing_sum_overview-----------------------------------------
sapply(d, FUN = function(x) {
  sum(is.na(x))
})   # Missing values per column

## ----numeric_5-----------------------------------------------------------
stat5summary = function(x, na.rm = T){
  if(class(x) != "numeric") 
    stop("`x` must be numeric data")
  
  # Calculate quantiles
  q = quantile(x, probs = c(0.25, 0.5, 0.75),
               na.rm = na.rm)

  # Return
  c("min" = min(x, na.rm = na.rm),
    "q1" = q[[1]], "median" = q[[2]], "q3" = q[[3]], 
    "max" = max(x, na.rm = na.rm))
}

## ----numeric_5_call------------------------------------------------------
sapply(d[, 4:5], FUN = stat5summary) 

## ----numeric_5_call_summary----------------------------------------------
sapply(d[, 4:5], FUN = summary) 

## ------------------------------------------------------------------------
median_r = function(x) {
  n = length(x)
  half = (n + 1L) %/% 2L
  
  if (n%%2L == 1L) {
    sort(x)[half]
  } else { 
    mean(sort(x)[half + 0L:1L])
  }
}

## ----category_count------------------------------------------------------
sapply(d[, 1:3], FUN = summary) 

## ----category_table------------------------------------------------------
(o = table(d[, 2], d[, 3]))

## ----category_percentages------------------------------------------------
prop.table(o)  # Requires table() object

## ----category_table_error------------------------------------------------
head(table(d[,1], d[,2]))

## ----sample_data---------------------------------------------------------
set.seed(2016) # Set Seed for reproducibility
n = 1e4        # Number of observations

(n*2) %>%      # Generate some data
  rnorm %>%
  matrix(ncol = 2) -> a

runif(n, 0, 2 * pi) %>%
  {0.5 * cbind(sin(.), cos(.))} -> b
  
o = rbind(a,b)   # Combine generate data

x = as.data.frame(o[sample(nrow(o)), ])

colnames(x) = c("x","y")

## ----sample_data_summary-------------------------------------------------
summary(x)    # data.frame implements summary.

## ----ggplot_exploratory, fig.height = 5----------------------------------
ggplot(x) + geom_point(aes(x,y))

## ----ggplot_exploratory_redux, fig.height = 5----------------------------
ggplot(x) + geom_point(aes(x,y), alpha = 0.05)

## ----base_r_exploratory, fig.height = 5----------------------------------
plot(x, col = rgb(0, 0, 0, 0.05)) # Transparent color

## ---- fig.height=5-------------------------------------------------------
plot(NULL, xlim=c(0,1), ylim=c(0,1), 
     ylab="Y Axis label", xlab="X Axis label")

## ----echo = -c(1:3), fig.height=4----------------------------------------
plot(NULL, xlim=c(0,1), ylim=c(0,1), 
     ylab="Y Axis label", xlab="X Axis label")

set.seed(114)
x = runif(10); y = runif(10)
abline(h = .5)                # Horizontal Line
abline(v = .25, col="purple") # Vertical Line w/ color
points(x, y, pch = 1:10)      # Points w/ shapes
axis(1, .5, LETTERS[1], col.axis = "blue")

## ----too_hot_goldilocks, out.width = "200px", fig.retina = NULL, fig.align='center', cache = TRUE, echo = FALSE----
knitr::include_graphics("img/too_hot_goldilocks.jpg")

## ----eval = FALSE--------------------------------------------------------
## type_of_plot(formula, data=list())

## ------------------------------------------------------------------------
library("lattice")
xyplot(mpg ~ disp, data = mtcars)

## ------------------------------------------------------------------------
xyplot(mpg ~ disp | cyl, data = mtcars) # Note the |

## ----too_cold_goldilocks, out.width = "200px", fig.retina = NULL, fig.align='center', cache = TRUE, echo = FALSE----
knitr::include_graphics("img/too_cold_goldilocks.jpg")

## ---- fig.height = 5-----------------------------------------------------
ggplot(mtcars) +               # Supply data.frame
  geom_point(aes(disp, mpg))   # Add points to plot

## ---- fig.height = 5-----------------------------------------------------
ggplot(mtcars) +               # Supply data.frame
  geom_point(aes(disp, mpg)) + # Add points to plot
  facet_wrap(~cyl)             # Write conditioning

## ----just_right, out.width = "200px", fig.retina = NULL, fig.align='center', cache = TRUE, echo = FALSE----
knitr::include_graphics("img/just_right_goldilocks.jpg")

## ----eval = F------------------------------------------------------------
## # install.packages("ggvis")
## library("ggvis")
## mtcars %>% ggvis(~wt, ~mpg) %>% layer_points()

## ----ggvis_scatter_plot, out.width = "175px", fig.retina = NULL, fig.align='center', cache = TRUE, echo = FALSE----
knitr::include_graphics("img/ggvis_mtcars_plot.png")

## ----message = F, warning = F--------------------------------------------
# Extract hospital birth dates
data(births, package="msos")

library("tidyr")
df_births = as.data.frame(births)
df_births$time = seq_len(nrow(df_births))
long_births = gather(df_births, hospital, value, -time)

## ------------------------------------------------------------------------
head(long_births)

## ----long_births, fig.height = 5-----------------------------------------
ggplot(long_births) +       # Initialize ggplot w/ data
  geom_point(               # Add a point layer
    aes(x = time, y = value)# Add an aesthetic mapping
             )

## ----long_births_color, fig.height = 5-----------------------------------
ggplot(long_births) +    # Initialize ggplot w/ data
  geom_point(            # Add a point layer
    aes(x = time,        # Add an aesthetic mapping
        y = value,       
        color = hospital)# Added color
             )

## ----fig.height=4--------------------------------------------------------
g = ggplot(long_births) +   
  geom_point(aes(x = time, y = value))

g

## ----fig.height=4--------------------------------------------------------
(g = g + xlab("Time (hours)") + ylab("Births") + 
  ggtitle("Births vs. Time (hours)"))

## ----fig.height=4--------------------------------------------------------
(g = g + geom_point(aes(x = time, y = value, color = hospital)))

## ----fig.height=4--------------------------------------------------------
(g = g + facet_wrap(~hospital))

## ----fig.height=4--------------------------------------------------------
ggplot(long_births) + 
  geom_histogram(aes(value), binwidth = 1)

## ----fig.height=4--------------------------------------------------------
ggplot(long_births) + 
  geom_histogram(aes(x = value, y = ..density..),
                 binwidth = 1, color = "orange") + 
  geom_density(aes(value), color = "blue")

## ----fig.height=4--------------------------------------------------------
ggplot(long_births, aes(x = value)) +  
  geom_histogram(aes(y = ..density..), # Notice no `x=`
                 binwidth = 1, color = "orange") + 
  geom_density(color = "blue")         # Notice no `x=`

## ----fig.height = 4------------------------------------------------------
ggplot(long_births, aes(x = hospital, y = value)) + 
  geom_boxplot()

## ----fig.height = 4------------------------------------------------------
ggplot(long_births, aes(x = hospital, y = value)) + 
  geom_boxplot() + geom_point()

## ----fig.height = 4------------------------------------------------------
ggplot(long_births, aes(x = hospital, y = value)) + 
  geom_boxplot() + geom_jitter(height = 0, width = 0.4)

## ----fig.height = 4------------------------------------------------------
ggplot(long_births, aes(x = hospital, y = value)) + 
  geom_boxplot() + geom_jitter(height = 0, width = 0.4)

## ----fig.height = 4------------------------------------------------------
ggplot(long_births, aes(x = hospital, y = value)) + 
  geom_boxplot() + geom_jitter(height = 0, width = 0.4) + 
  coord_flip()

## ----fig.height = 4------------------------------------------------------
ggplot(long_births, aes(x = hospital, y = value)) + 
  geom_boxplot()  + theme_bw()

## ----fig.height = 4------------------------------------------------------
ggplot(long_births, aes(x = hospital, y = value)) + 
  geom_boxplot()  

## ----make_data-----------------------------------------------------------
# Set seed for reproducibility
set.seed(111)

# Generate data
x = runif(100,0,1)

## ----fig.height=4--------------------------------------------------------
qqnorm(x)                  # normal q-q plot
qqline(x,lty=2,col="blue") # line through the Q1 and Q3 quartiles

## ----q_qplot-------------------------------------------------------------
qqn = function(w) {
  n = length(w)
  nv = qnorm((1:n)/(n+1)) # Quantiles of Normal Dist.
  plot(nv, sort(w),       # X,Y
       xlab = "Theoretical Quantiles",
       ylab = "Sample Quantiles")
  title("Normal Q-Q Plot")
  m = (quantile(w,0.75)-quantile(w,0.25))/
      (qnorm(0.75)-qnorm(0.25))
  b = quantile(w,0.25) - m*qnorm(0.25)
  abline(b, m, lty=2, col="red") # Line through Q1 & Q3
}

## ---- fig.height=4-------------------------------------------------------
par(mfrow = c(1, 2), pty= "s") #  Two plots, square pts
qqnorm(x)                      # Base R first
qqline(x,lty=2,col="blue")
qqn(x)                # Our Plot

## ---- fig.height = 4-----------------------------------------------------
df_x = as.data.frame(x)
n = nrow(df_x)
m = (quantile(x,0.75)-quantile(x,0.25))/
      (qnorm(0.75)-qnorm(0.25))
b = quantile(x,0.25) - m*qnorm(0.25)
g = ggplot(df_x, aes(sample=x)) + 
      stat_qq() +
      geom_abline(intercept = b,
                  slope = m,
                  color = "purple") +
      xlab("Theoretical Quantiles") +
      ylab("Sample Quantiles") +
      ggtitle("Normal Q-Q Plot")

## ---- echo = F-----------------------------------------------------------
g

## ------------------------------------------------------------------------
g + theme_dark() # Welcome to the dark side!

