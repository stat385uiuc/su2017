---
title: Parallel Processing in R and Rcpp
author: ''
date: '2017-07-27'
slug: parallel-processing-in-r-and-rcpp
categories:
  - announcements
tags: [r, hpc, high performance computing, openmp, rcpp, foreach, doParallel]
---

# Overview

Continuing from the previous class, we opt to explore in greater detail 
different parallelization scenarios using `Rcpp` and `doParallel`. Parallelization
within `Rcpp` will be dealt with using `OpenMP` instead of 
[`RcppParallel`](https://www.threadingbuildingblocks.org/), which uses
[thread building blocks (TBB)](https://rcppcore.github.io/RcppParallel/).

# Files of Interest 

Rendered Files:

* [Lecture 19: Parallel Processing in R and Rcpp (PDF)](/assets/lectures/lec19/lec19-parallel-processing-in-r-and-rcpp.pdf)

Generation Files:

* [Lecture 19: Parallel Processing in R and Rcpp (Rmd)](/assets/lectures/lec19/lec19-parallel-processing-in-r-and-rcpp.Rmd)
* [Lecture 19: Parallel Processing in R and Rcpp (R)](/assets/lectures/lec19/lec19-parallel-processing-in-r-and-rcpp.R)


* <http://github.com/stat385uiuc/su2017/tree/master/static/assets/lectures/lec19>