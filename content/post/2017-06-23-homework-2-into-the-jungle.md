---
title: "Homework 2: Into the Jungle"
date: '2017-06-23'
slug: homework-2-into-the-jungle
categories:
  - announcements
  - homework
tags:
  - homework
from_Rmd: yes
---

> "There are no routine statistical question; only questionable statistical routines." 
>
> --- **D.R. Cox** quoted in Chatfield, C. 1991. Avoiding statistical pitfalls. Statistical Science 6: 240-268.

# Directions

While working on homework, students are encouraged to work together in a group. Though, each student must turn in their own homework answers.  If students opt to work together, then it is important that they list the names of the students that they have collaborated with. Please note that sharing, copying or providing any part of a homework solution or code to another student is an infraction of the University’s rules on Academic Integrity. Rest assured, any violation of Academic Integrity will be punished **as severely as possible**.

* Your assignment must be submitted through the e-mail to `balamut2` [at] illinois [dot] edu. You are required to attach two (and only two) files to the *same* e-mail:
    * The RMarkdown (`.Rmd`) file must be saved as `hw2_yourNetID.Rmd`, e.g.  `hw2_balamut2.Rmd`
    * The generated output from the `.Rmd` file is then contained in `hw2_yourNetID.html`, e.g. `hw2_balamut2.Rmd`.
* Under this structure, the content found within the `.html` file will be considered a "report" which is the material that will determine the majority of your grade. Be sure to visibly include all `R` code and output that is relevant to answering the exercises. (You do not need to include irrelevant code you tried that resulted in error or did not answer the question correctly.)
* There are no limitations as to the number of submissions that can be made. However, only the last submission *before* the deadline will be graded by myself or the grader.

# Assignment Overview

**Deadline:** Sunday, July 2nd by 11:59 PM CDT

## Objectives

1. Untangle and understand undocumented code
1. Document Code
1. Writing a Function
1. Assertions and Defensive Coding
1. Logical Statements
1. Looping
1. Recursion
1. Memoziation Techniques

# Exercises

## (1 Point) Exercise 0: Students To the GitHub Mobile!

Keeping in line with our commitment to using versioning control, please:

1. Create a new folder called `hw2` within your `stat385uiuc/netid` repository.
1. **Please commit every exercise as you complete them.**
1. Provide a link within your Rmarkdown document to your GitHub repository.
1. Update your `README.md` to remove the numeric summary of the `bash` script
   and add a link to the HW2 homework `Rmd` file.

## (2 Points) Exercise 1: Fizz, Buzz, or FizzBuzz Redux

The idea behind this exercise is to have you take code initially written  
to do a specific task within a script and generalize it so that it can be reused.

- Recall the Fizz, Buzz, or FizzBuzz Job Prompt:

> Write a program that prints the numbers from 1 to 100. But for multiples of 
> three print "Fizz" instead of the number and for the multiples of five print 
> "Buzz". For numbers which are multiples of both three and five print
> "FizzBuzz".

- Instead of writing a script that traverses the range of 1 to 100, please create
  a function that allows for a _dynamic_ _integer_ range to be set.
    - That is, the function should provide inputs for _integer_ starting and ending
      numbers that have the appropriate default values given in the prompt.
    - Please add checks to ensure that the starting and ending numbers are of
      type _integer_ and length 1.

# (2 Points) Exercise 3: An Ode to Protectionism

The objective of the next exercise is to highlight areas where loop
protection is problematic.

Your friend has decided to implement their own version of the `which` 
function because they believed _R_'s version is a bit slow. However, after
taking STAT 385, you immediately realize that the function will error.
    - Figure out the case where _R_ will error under this version of `which_r`.
    - Patch the `which_r` function such that the error no longer occurs.
   
```r
x = _____

which_r = function(x){
  idx = 1:length(x)
  idx[!is.na(x) & x]
}
```

# (3 Points) Exercise 4: Scientists Rock!

The objective of this exercise is to write functions that provide a way
to convert temperature between celcius and fahrenheit.

1. Develop a function that converts fahrenheit to celcius given the definition
   of: 
   \[f(x) = \frac{{5\left( {x - 32} \right)}}{9}\]

2. Now, create a function that does the inverse of the previous one. That is,
   write `\(f^{-1}(x)\)` which translates celcius to fahrenheit.

3. What kind of input protections did you implement? Why? 

## (3 Points) Exercise 5: It's a Mad, Mad, Mad, Mad Computational World

The tenets behind this exercise are to prepare you to create different 
implementations and provide benchmarks for each implementation. 

Recall the different Sum of Squares, (*RSS*, *FSS*, *TSS*) formulations presented in [Lecture 5](http://stat385.thecoatlessprofessor.com/assets/lectures/lec08/lec08_functions_recursion_memoization_benchmarking.pdf#page=21). 

- Recreate the three sum of square functions given using loops **AND** recreate
  `tss_relationship` such that it uses these newly created functions.
   - Thus, you must "unvectorize" the computation. 
   - Call these functions: `compute_rss_loop`, `compute_fss_loop`, `compute_tss_loop`, and `tss_relationship_loop`.
- Check that the looping functions are equivalent to the vectorized components
  via `all.equal()`. Does the equality change between functions if 
  the `tolerance` parameter in `all.equal` changes? (e.g. from `1e-3` to `0`) **Why?**
    - Use the [Creating Sample Data for Functions](http://stat385.thecoatlessprofessor.com/assets/lectures/lec08/lec08_functions_recursion_memoization_benchmarking.pdf#page=24) to generate data.
    - Increase the number of observation in the script to `n = 1e4`
    - **Note:** You will have to use `check.attributes = F` to avoid `"names for current but not for target"`
- Perform the two different types of benchmarking operations using `rbenchmark`
  and `microbenchmark` as discussed in class. Comment as to whether there is a
  noticably difference in performance between the functions. Provide a
  recommendation as to the correct style to use in the future.
    - Make sure to **cache** the benchmark results in the `Rmd` document!


## (4 Points) Exercise 6: Awake in a Nightmare

The objective in this exercise is to understand unfamiliar code and improve it.
While working on this problem, keep in mind the following quotation:

> "Always code as if the guy who ends up maintaining your code will be a violent
>  psychopath who knows where you live. Code for readability."
> 
> --- John F. Woods ([Newsgroup comp.lang.c++](https://groups.google.com/forum/#!msg/comp.lang.c++/rYCO5yn4lXw/oITtSkZOtoUJ))


* Recently, a coworker left the company and your boss asked you to figure out
the computations behind a graph the coworker had written. He wasn't entirely
sure what was happening behind the scenes but the graph looked nice and the
code could still be run. Your previous co-worker wrote the following code:


```r
d = function(x) {
  length(x)
}

s = function(x) {
  x * x
}

u = function(x, ...) {
  m = 0
  k = 1
  while (k <= d(x)) {
    m = m + x[k]
    k = k + 1
  }
  m/d(x)
}

w = function(b, v, q = T) {
  n = d(b)
  o = 0
  for (i in seq_len(n)) {
    o = o + s(b[i] - v)
  }
  (1/(n - 1 * (q == T)) * o)^(0.5)
}

n = function(p, i, ...) {
  m = u(i, ...)
  r = w(i, m)
  (p - m)/r
}

z = function(p, i, h = T, ...) {
  g = seq(-3, 3, length = 1000)
  gg = dnorm(g)
  plot(g, gg, type = "l", lwd = 1, ...)
  k = n(p = p, i = i, ...)
  if (h) {
    tt = c(g[g <= k], k, -3)
    ll = c(gg[g <= k], 0, 0)
  } else {
    tt = c(k, g[g >= k], 3)
    ll = c(0, gg[g >= k], 0)
  }
  polygon(tt, ll, col = "red")
}
```

* The coworker left the following comment:


```r
# Main function runs well
i = c(-1.21, 0.28, 1.08, -2.35, 0.43, 0.51, -0.57, -0.55, -0.56, 
  -0.89)
z(1.57, i)
z(-2.33, i, h = F)
```

![plot of chunk unnamed-chunk-2](/figures/post/2017-06-23-homework-2-into-the-jungle/unnamed-chunk-2-1.png)![plot of chunk unnamed-chunk-2](/figures/post/2017-06-23-homework-2-into-the-jungle/unnamed-chunk-2-2.png)

1. First try to figure out what is happening 
    - What distribution does the graph look like?
    - What kind of calculation is occurring? 
    - Are there any redundancies in the code? (e.g. redefinition of common functions)
2. Document each part of the code using comments `# Function does...`
    - Provide clarity behind the parameters of the functions.
    - Emphasize what is being returned at each stage. 
    - You may need to reference help for function information via: `?`
3. Try to clean up the code. 
    - Use intuitive variable and function names
    - Correct the indentation and split statements up to multiple lines.
    - Implement vectorized or base function.
4. Make sure the output is the **same** between your version and the cleaned up version.
    - You may wish to individually test each function using `all.equal(bad_func(),your_func())`.
  
## (4 Points) Exercise 7: Recursion is Recursion is Recursion is ...

> "To iterate is human, to recurse divine."
>
> --- L. Peter Deutsch

Within this exercise, you will explore the concept of recursion and converting to and fro *tail* recursive statements. 

A common operation within Statistics is to obtain an **average** over data. The average in this case is given as: `$${ {\bar x}_n} = \frac{1}{n}\sum\limits_{i = 1}^n { {x_i} }$$` where the subscript `\(n\)` on `\({ {\bar x} }\)` represents the sample size.

- Implement two functions that obtains the average of a vector `x` where one function uses a loop and the other is vectorized.
    - The function must return `NaN` if the length of `x` is `0`. 
    - If the vector `x` contains `NA` values, then remove them using `na.omit()`.
    - **Note:** You are *not* permitted to call the base R implementation of `mean()`. However, you should check if the values are equal using `all.equal(x, y)`.

- We can also implement a recursive cummulative average if we modify the definition for `$${ {\bar x}_n}$$` to depend on itself by `\({ {\bar x}_{n-1} }\)`. 
    - Try to show that `$${ {\bar x}_n} = \frac{1}{n}\left[ {\left( {n - 1} \right){ {\bar x}_{n - 1} } + {x_n} } \right]$$`.

- Please implement the following recursive formula:
`$${ {\bar x}_n} = \frac{1}{n}\left[ {\left( {n - 1} \right){ {\bar x}_{n - 1} } + {x_n} } \right]$$`
    - Do not worry about returning `NaN` or detecting `NA` values. Focus only on writing the recursion case.


## (3 Points) Exercise 8: Memoize Me!

The objective here is to construct different functions that are able to perform underneath memoization.

Recall from [Lecture 8](http://stat385.thecoatlessprofessor.com/assets/lectures/lec08/lec08_functions_recursion_memoization_benchmarking.pdf#page=37) the `factorial`.

- Create one *internal* and one *external* **memoized** factorial function.
  - Do **not** name it `factorial()`.
- Check for equality between the factorial functions using the base R
  implementation of `factorial()`.
- Perform a benchmark on all *four* functions. 
  - Compare the function against the base R and the two memoized versions.
- Use the function with the best *timing* to implement combinations: `$$C\left( {n,k} \right) = \frac{ {n!} }{ {k!\left( {n - k} \right)!} }$$`
  - Compare the combination function against `choose()` in base R. 
  
  
# (3 Points) Exercise 9: Mr. Recycler

The objective behind this set of exercises is to emphasize _R_'s recycling
properties when it comes to working with a vector.

1. If we define `x = c(1, 2)` and `y = c(1, 2, 3, 4)`, what should the output
   of `x * y` be?
2. Build the ones vector `i` of length 25 such that the vector has an 
   alternating current between polarity (e.g. 1 and -1).
3. Consider the following matrix:

| a | b |
|:-:|:-:|
|  1|  2|
|  3|  4|
|  5|  6|

Transform it so that it is:

| a | b |
|:-:|:-:|
|  3|  3|
|  4|  6|
|  7|  7|

4. Construct the following sequence `j`: `\(1, -2, 2, -2, 3, −2, \ldots, 30, −2\)`.

