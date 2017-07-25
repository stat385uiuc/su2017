## ----setup, include=FALSE------------------------------------------------
options(width = 60)
knitr::opts_chunk$set(echo = TRUE, cache = TRUE)

## ----rpi_cluster, out.width = "175px", fig.retina = NULL, fig.align='center', cache = TRUE, echo = FALSE----
knitr::include_graphics("img/rpicluster.jpg")

## ----head_vs_workers, out.width = "175px", fig.retina = NULL, fig.align='center', cache = TRUE, echo = FALSE----
knitr::include_graphics("img/head_vs_workers.png")

## ----parallel_processing, out.width = "250px", fig.retina = NULL, fig.align='center', cache = TRUE, echo = FALSE----
knitr::include_graphics("img/parallel_processing.pngs")

## ----simpsons_grad, out.width = "200px", fig.retina = NULL, fig.align='center', cache = TRUE, echo = FALSE----
knitr::include_graphics("img/simpsons_grad_workers.png")

## ----serial_processing, out.width = "300px", fig.retina = NULL, fig.align='center', cache = TRUE, echo = FALSE----
knitr::include_graphics("img/serial_processing.pngs")

## ------------------------------------------------------------------------
n = 10000                          # Number of obs
x = numeric(n)                     # Set up storage
system.time({
  for(i in seq_along(x)){          # For loop
    x[i] = pf(i, df1 = 4, df2 = 5)    
  }
})

## ------------------------------------------------------------------------
n = 10000                        # Number of obs
system.time({
  x = pf(1:n, df1 = 4, df2 = 5)  # Pre-vectorized
})

## ----serial_wait---------------------------------------------------------
# Wrapper function for use in *apply
wait = function(i) {
  function(x){ Sys.sleep(i) }
}

# 10 iterations * .25 seconds = 2.5 seconds elapsed
system.time({ sapply(1:10, wait(0.25)) }) 

## ------------------------------------------------------------------------
# Load doParallel, which will load parallel
require(doParallel, quiet = TRUE)

# How many cores do you have?
( cores = detectCores() )

## ------------------------------------------------------------------------
# Start a cluster with that many cores
cl = makeCluster(cores)

## ------------------------------------------------------------------------
# Stop the cluster
stopCluster(cl)

## ------------------------------------------------------------------------
cl = makeCluster(3)    # Create snow Cluster
registerDoParallel(cl) # Register it with foreach
n = 10000              # Number of obs

# Use foreach in place of for to parallelize loop
system.time({   
  out = foreach(i = 1:n, .combine=rbind) %dopar% {
    pf(i, df1 = 4, df2 = 5) # Note the different loop syntax
  }
})

stopCluster(cl) # Stop the cluster

## ------------------------------------------------------------------------
cl = makeCluster(3) # Create snow Cluster
n = 10000           # Number of obs

# Use parApply to parallelize apply.
system.time({
  out = parSapply(cl = cl,   # Cluster
                 X = 1:n,    # Data
                 FUN = pf,   # Function
                 df1 = 4,    # Function params
                 df2 = 5) 
})
stopCluster(cl) # Stop the cluster

## ----warning = F---------------------------------------------------------
# Create snow Cluster
cl = makeCluster(4)

system.time({ 
  parLapply(cl = cl, X = 1:10, fun = wait(0.25))
})

# Stop the cluster
stopCluster(cl) 

## ----parallel_job_diag_4n, fig.cap="Job Creation with 4 Cores in Cluster", out.width = "300px", fig.retina = NULL, fig.align='center', cache = TRUE, echo = FALSE----
knitr::include_graphics("img/parallel_job_diag_4n.png")

## ----parallel_job_diag_5n, fig.cap="Job Creation with 5 Cores in Cluster", out.width = "300px", fig.retina = NULL, fig.align='center', cache = TRUE, echo = FALSE----
knitr::include_graphics("img/parallel_job_diag_5n.png")

## ----shared_memory, out.width = "300px", fig.retina = NULL, fig.align='center', cache = TRUE, echo = FALSE----
knitr::include_graphics("img/shared_memory.png")

## ----distributed_memory, out.width = "300px", fig.retina = NULL, fig.align='center', cache = TRUE, echo = FALSE----
knitr::include_graphics("img/distributed_memory.png")

## ----parallel_doc, out.width = "200px", fig.retina = NULL, fig.align='center', cache = TRUE, echo = FALSE----
knitr::include_graphics("img/parallel_doc.png")

## ------------------------------------------------------------------------
# Load doParallel package
library(doParallel, quiet = TRUE) 

( cores = detectCores() ) # Number of Cores

cl = makeCluster(cores)   # Start Cluster

stopCluster(cl)           # Stop the cluster

## ------------------------------------------------------------------------
hello.world = function(){ print("Hello Parallel World!") }

cl = makeCluster(3)  # Create snow Cluster

# Issue function to all threads
clusterCall(cl = cl, fun = hello.world)

stopCluster(cl)      # Stop cluster

## ------------------------------------------------------------------------
cl = makeCluster(2)             # Create cluster for snow

clusterEvalQ(cl, library(cIRT)) # Load package on all nodes

stopCluster(cl)                 # Stop cluster

## ------------------------------------------------------------------------
cl = makeCluster(2)    # Create cluster for snow

x = 1:5                # Create variable on master

clusterExport(cl = cl, # Send variable to slaves
              varlist = c("x"))

stopCluster(cl)       # Stop cluster

## ------------------------------------------------------------------------
# regular apply
mat = matrix(1:100000, ncol=5)

system.time({
  apply(X = mat, MARGIN = 2, FUN = sum)
})

## ------------------------------------------------------------------------
x = 1:10000000          # Data
mat = matrix(x, ncol=5) # Matrix form

cl = makeCluster(4)     # Create snow Cluster

system.time({           # Parallel Apply
  parApply(cl = cl, X = mat,
           MARGIN = 2, FUN = sum)
})

stopCluster(cl)         # Stop cluster

## ------------------------------------------------------------------------
square_x = function(x){ # Squaring function
  for(i in seq_along(x)){
    x[i] = x[i]^2
  }
  return(x)
}

x = 1:1e7                # Data

system.time({ 
  out = square_x(x)
})

## ------------------------------------------------------------------------
system.time({
  y = sapply(x, function(x) x^2) # 1-line call to apply
})

## ------------------------------------------------------------------------
cl = makeCluster(4)

squared = function(x) { x^2 }

system.time({
  parSapply(cl = cl, X = x,
           FUN = squared)
})

# End cluster for snow
stopCluster(cl)

