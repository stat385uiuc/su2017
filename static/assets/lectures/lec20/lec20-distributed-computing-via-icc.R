## ----setup, include=FALSE------------------------------------------------
options(width = 60)
knitr::opts_chunk$set(echo = TRUE, cache = TRUE)

## ----cc_diagram, out.width = "275px", fig.retina = NULL, fig.align='center', cache = TRUE, echo = FALSE----
knitr::include_graphics("img/cc-diagram.png")

## ssh netid@cc-login.campuscluster.illinois.edu

## ssh balamut2@cc-login.campuscluster.illinois.edu

## # Create a directory for your R packages

## cat <<EOF >> ~/.bashrc

## # Use the install.packages function to install your R package.

## # Transferring a file on your local system to your

## # Transferring a file in your home directory on the

## ----eval = F------------------------------------------------------------
## n = 20              # Same 20
## mu = 5              # Mean of 5
## set.seed(111)       # Set seed for reproducibility
## rnorm(n, mean = mu) # Generate Observations

## ----eval = F------------------------------------------------------------
## # Expect command line args at the end.
## args = commandArgs(trailingOnly = TRUE)
## 
## # Skip args[1] to prevent getting --args
## 
## # Extract and cast as numeric from character
## rnorm(n = as.numeric(args[2]), mean = as.numeric(args[3]))

## #!/bin/bash

## ## Grab the job id from an environment variable

## qsub sim_job.pbs

## qstat -u netid

## ## Run with job array indices 1 through 6.

## #PBS -t 1-10:2

## #!/bin/bash

## export JOBID=`echo "$PBS_JOBID" | cut -d"[" -f1`

## 0 1

## ----eval = F------------------------------------------------------------
## # Expect command line args at the end.
## args = commandArgs(trailingOnly = TRUE)
## 
## # Skip args[1] to prevent getting --args
## 
## # Obtain the ID being accessed from the array
## jobid = as.integer(Sys.getenv("PBS_ARRAYID"))
## 
## # Set seed for reproducibility
## set.seed(jobid)
## 
## # Extract and cast as numeric from character
## rnorm(n = as.numeric(args[2]), mean = as.numeric(args[3]))

