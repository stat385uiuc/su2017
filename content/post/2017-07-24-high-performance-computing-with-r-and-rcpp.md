---
title: High Performance Computing with R and Rcpp
author: ''
date: '2017-07-24'
slug: high-performance-computing-with-r-and-rcpp
categories:
  - announcements
tags: [r, hpc, high performance computing, rcpp, rtools]
---

# Overview

*R* enables an **interactive** exploration environment for data
but sacrifices *speed* to accomplish this goal. In a world where you can sit in 
a Maine dinner, order clam chowder, have a random thought about statistics that
can be solved by pulling out a smartphone to instanteously search for a result,
any delay will discourage people from using the method. Part of the 
High Performance Computing push is to encourage the creation of highly
performant code. To do so within *R*, we turn to using [Rcpp](http://rcpp.org).

# Guides to Setting up a Compiler

By Operating System:

- [Rtools for Windows](http://thecoatlessprofessor.com/programming/rcpp/install-rtools-for-rcpp/)
- [macOS (General Instructions)](http://thecoatlessprofessor.com/programming/r-compiler-tools-for-rcpp-on-os-x/)
- [clang4 Binary Installer for macOS](https://uofi.box.com/v/r-macos-clang-pkg)
- Linux: make sure to have `r-base-dev` installed.

# Files of Interest 

Rendered Files:

* [Lecture 17: High Performance Computing and Rcpp (PDF)](/assets/lectures/lec15/lec15-high-performance-computing-and-rcpp.pdf)

Generation Files:

* [Lecture 17: High Performance Computing and Rcpp (Rmd)](/assets/lectures/lec17/lec17-high-performance-computing-and-rcpp.Rmd)
* [Lecture 17: High Performance Computing and Rcpp (R)](/assets/lectures/lec17/lec17-high-performance-computing-and-rcpp.R)

# Source Material

Source of all materials: 

* <http://github.com/stat385uiuc/su2017/tree/master/static/assets/lectures/lec17>