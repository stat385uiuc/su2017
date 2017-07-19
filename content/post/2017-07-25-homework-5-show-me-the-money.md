---
title: "Homework 5: Show Me The Money!"
date: '2017-07-25'
slug: homework-5-show-me-the-money
categories:
  - announcements
  - homework
tags:
  - homework
  - r
  - shiny
  - hpc
  - rcpp
---

> "There are only two hard things in Computer Science: cache invalidation and naming things."
> 
> --- Phil Karlton

# Directions

While working on homework, students are encouraged to work together in a group. 
Though, each student must turn in their own homework answers.  If students opt 
to work together, then it is important that they list the names of the students 
that they have collaborated with. Please note that sharing, copying or providing
any part of a homework solution or code to another student is an infraction of
the University’s rules on Academic Integrity. Rest assured, any violation of 
Academic Integrity will be punished **as severely as possible**.

- Your assignment must be submitted through the e-mail to `balamut2` [at] 
illinois [dot] edu. You are required to attach one (and only one) files to the
*same* e-mail:
    - The R Package source (`.tar.gz`) that is created when building a package 
    should be named with `hw6netid`, e.g.  `hw6balamut2_1.0.0.tar.gz`. 
    - **Note:** The `1.0.0` comes from the description file and is appended at 
    the end when you build the package.
- Under this structure, the content found within the supplied package tar will
be considered a "report" which is the material that will determine the
majority of your grade. Be sure to visibly include all `R` and `C++` code that 
is relevant to answering the exercises. 
(You do not need to include irrelevant code you tried that resulted in error
or did not answer the question correctly.)
- To receive full points for this assignment, your package must **pass** the
*CRAN* check.
- There are no limitations as to the number of submissions that can be made. 
However, only the last submission *before* the deadline will be graded by myself
or the grader.

# Assignment Overview

**Deadline: Sunday, August 2th by 2:00 PM CDT**

## Objectives

1. Functions
2. Roxygen Documentation
3. Packaging
4. Rcpp
5. Parallelization
6. Distributed Computing

# Exercises

## (3 Points) Exercise 0: Bob "the Package" Builder 

The object behind this exercise is to create an *R* package structure that
can be filled in later exercises.

- Create the standard *R* package structure with the addition of the `/src/`
directory to allow for `Rcpp` code.
    - You may wish to use either `Rcpp.package.skeleton("hw5netid")` or 
    `package.skeleton("hw5netid")`
- Within the `DESCRIPTION` file make sure to fill in the correct information.
    - Name your package `hw5netid`
    - Set the `Version:` equivalent to `1.0.0`. 
    - List yourself as the `author`.
    
## (1 Point) Exercise 1: I GitHub my code back and forth!

Make sure to *commit* and *push* the material within your newly created 
`hw5netid` folder to your [`stat385uiuc`](https://github.com/stat385uiuc)
private repository. 

To be awarded these points, **please commit every exercise as you complete them.**

## (7 Points) Exercise 2: Gambler's Ruin

Within this exercise, you should be comfortable writing and packaging *R* code.

A gambler comes to a coin betting table with $n$ dollars. The gambler seeks to win money
by guessing the outcome of the flipped fair coin (head/tail is 0.5). 
If gambler guesses the correct amount, then they are paid $r$ dollars.
Otherwise, the gambler loses $p$ dollars. 
The gambler stops playing when they have either won $z$ dollars or no longer
have any money to bet (e.g. $n < 0$).

Provide two statistics for each game played:

1. How long on average does the game last?
    - Count the amount of turns until the player is either busted or hits cap.
2. How much money does the gambler have after 25 flips? 
    - Store the cash on hand after the 25th game. 

- Create a function called `gamble()` which plays the previously
described scenario with the following parameters:
    - `money = 10` ($n$): the amount of money a gambler has to begin the game with
    - `cost = 1` ($p$): the amount of money a gambler has to pay to play.
    - `reward = 1` ($r$): the amount of money a gambler receives if they win.
    - `endgame = 25` ($z$): the cap of the amount of money a gambler can win.
- Create a function called `many_gambles()` that accepts:
    - All of the above arguments 
    - `B = 100`: the number of times to play
    - Have the `many_gambles()` function call $B$ times the `gamble()` function
    and store output to a matrix.
    - As a result, `many_gambles()` should return a matrix of size $B \times 2$.
- Document all functions using `roxygen2`.

## (10 Points) Exercise 3: I think I'm turning Polyglot

During this exercise, you will learn about how to package _Rcpp_ and parallelized
_R_ code.

- Repeat the above, except using `Rcpp` and place the file in `/src/`.
- Create a parallelized version of the `many_gambles()` _R_ function and call it
  `many_gambles_parallel()`.
     - Why isn't it advisable to parallelize the `gamble()` function? 
- Document all functions using `roxygen2`.

## (4 Points) Exercise 3: Computational Wizardry

- Deploy your package to the campus cluster following the guidelines here: <http://thecoatlessprofessor.com/programming/working-with-r-on-a-cluster/>
     - You will need to create a [Personal Access Token on GitHub](https://help.github.com/articles/creating-an-access-token-for-command-line-use/)
     and use:
     
```r
# On ICC
# install.packages("devtools")
devtools::install_github("stat385/netid", 
                        subdir="hw5netid",
                        auth_token = "???")
```

- Create a job script `gamble_sim.R` that loads your library, reads
parameters passed to it, and runs a parallelized version of the gambler problem.
- Write a `.pbs` worker file that sends the job to the secondary queue with 30
minutes of time allocated.
- Create an `inputs.txt` file that changes various parameters associated
with the gambling problem.
- Download your data and store it in `/data/sim.rda`
  - Make sure to provide documentation for the dataset!
- Based on the simulation results, write a short introduction `/vignette`
for your package.
  - Describe what the package does
  - Give a brief overview of how the functions were implemented.
  - Analyze the results of the simulation data by stating:
      - Indicate the average money after 25 flips.
      - Write which method was faster.
  - What do you think happens when the above default parameters change? 

