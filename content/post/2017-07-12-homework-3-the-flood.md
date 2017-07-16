---
title: "Homework 3: The Flood"
date: '2017-07-12'
slug: homework-3-the-flood
categories:
  - announcements
  - homework
tags:
  - homework
---

> "It is a capital mistake to theorize before one has data."
> 
> --- Sherlock Holmes, *A Study in Scarlett* by Arthur Conan Doyle

# Directions

While working on homework, students are encouraged to work together in a group.
Though, each student must turn in their own homework answers.  If students opt
to work together, then it is important that they list the names of the students 
that they have collaborated with. Please note that sharing, copying or providing
any part of a homework solution or code to another student is an infraction of
the University’s rules on Academic Integrity. Rest assured, any violation of
Academic Integrity will be punished **as severely as possible**.

* Your assignment must be submitted through the e-mail to `balamut2` [at]
  illinois [dot] edu. You are required to attach two (and only two) files to
  the *same* e-mail:
    * The RMarkdown (`.Rmd`) file must be saved as `hw3_yourNetID.Rmd`, e.g.
    `hw3_balamut2.Rmd`
    * The generated output from the `.Rmd` file is then contained in
    `hw3_yourNetID.html`, e.g. `hw3_balamut2.html`.
* Under this structure, the content found within the `.html` file will be
  considered a "report" which is the material that will determine the majority
  of your grade. Be sure to visibly include all `R` code and output that is
  relevant to answering the exercises. (You do not need to include irrelevant
  code you tried that resulted in error or did not answer the question correctly.)
* There are no limitations as to the number of submissions that can be made. 
  However, only the last submission *before* the deadline will be graded by
  myself or the grader.

# Assignment Overview

**Deadline:** Tuesday, July 18th by 2:00 PM CDT

## Objectives

1. Handle Reshaping Data
2. Reading Data
3. Modifying a Data Set
4. Extracting Information from Strings
5. Creating Time Stamps
6. Writing S3 Objects

# Exercises

## (1 Point) Exercise 0: Hop on the Magic GitHub Bus!

Keeping in line with our commitment to using versioning control, please:

1. Create a new folder called `hw3` within your `stat385uiuc/netid` repository.
1. **Please commit every exercise as you complete them.**
1. Provide a link within your RMarkdown document to your GitHub repository.
1. Update your `README.md` so that it contains a description of the contents
   of the repository. Please provide an _unordered_ list containing links to each
   of your homework's `Rmd` files with a link to the output.
   For example:
   
```
# Name of repository

Description of repository contents here

- HW1: [Source](path/to/hw1/source.Rmd), [Output](path/to/hw1/output.html)
- HWX: ...
```

## (4 Points) Exercise 1: I vant to *automatically* read your data! 

The goal behind this exercise is to expose you to different ways to read in data
to R. 

- Alas, one of your clients has decided to move all of their consulting work
  to your practice! However, their old firm wanted to try and impede their release
  by supplying active datasets with formats they new spanned a large collection of
  statistical software. 
- To impress your clientele please:
    1. import the data into R,
    2. describe the number of observations and number of variables,
    3. provide a summary of each data set to indicate what kind of data is contained,
    4. an overview of each columns variables,
    5. export the data as a `.csv` and save a copy as a `.rda` using `save(obj, file="name.rda")`
- The client has provided the following raw data files:
    - [`ship_data.dta`](/assets/hw/hw3/data/ship_data.dta)
    - [`point_totals.sas7bdat`](/assets/hw/hw3/data/point_totals.sas7bdat)
    - [`child_data.sav`](/assets/hw/hw3/data/child_data.sav)
    - [`ge2011info.xls`](/assets/hw/hw3/data/ge2011info.xls)
        - Remove the first row and set the second row as the column names.
    - [`flowers.rda`](/assets/hw/hw3/data/flowers.rda)
- Please note: You are **not** allowed to modify the raw data files.
    
## (5 Points) Exercise 2: I vant to *manually* read your data! 

The objective behind this exercise is to understand that sometimes it might 
be faster or simply easier to directly write the results into R. 

- A biologist sent you an e-mail with the following contigency table that
details whether a patient contracted STD and whether their test was positive
or negative. Unfortunately, the results were written in HTML. To make matters
worse, the biologist asked you to quickly obtain the **percentage** per each cell. 
     - Please make sure to set the correct row and column names of the matrix!
     - **Psst** You will _not_ be able to set `Disease`!
    
| Disease  | Test +  | Test -  | Total|
|----------|---------|---------|------|
| **STD+** |  21     |   5     |  26  |
| **STD-** |   2     |  99     | 101  |
|**Total** |  23     | 104     | 127  |

- One of the national testing programs recently sent over data relating 
how students are scoring on their exams. They are having difficulty reshaping
the data so that each score has its own row. 
    - Make sure to cast `sex` and `race` to be of type `factor`

```bash
 id    sex             race write math science
 30   male            Asian    52   37       3
 21   male African American    59   90      25
 33 female  Native American    33   27      29
 15 female African American    44   20      56
  9   male        Caucasian    52   19      25
 10 female African American    52    5      39
  4   male African American    58   84      83
 12   male        Caucasian    46   27      46
 13 female  Native American    57   52      37
 11 female            Asian    55   33      79
```

## (5 Points) Exercise 3: We the People of the United States of America 

The tenets of this exercise are meant to briefly expose the notion of 
scrapping information from a website and getting it into a functional analysis
state.

- For the next exercise, the attention is focused on the [list of U.S. states by date of statehood](https://simple.wikipedia.org/wiki/List_of_U.S._states_by_date_of_statehood) given on [Wikipedia](https://en.wikipedia.org). We would like to know the average amount
of time between states becoming apart of the United States of America.
     - To obtain this data, we can use:

```r
# install.packages("rvest")
library("rvest")

d = read_html("https://simple.wikipedia.org/wiki/List_of_U.S._states_by_date_of_statehood")

d %>% 
  html_node("#mw-content-text > div > table.wikitable") %>%
  html_table() -> statehood
```

**Suggested Steps**

- Step 1: Remove any extra symbols (e.g. ‡ and `*`) from the `Date joined` column
  in `statehood`.
- Step 2: Convert the `Date joined` column from the `character` class to `POSIXct`.
- Step 3: Calculate the time difference between rows.
- Step 4: Take an average of the time difference. 

## (5 Points) Exercise 4: Battle of the Regex

The idea behind this exercise is to provide lots of exposure to regex patterns.

- Write a pattern that matches **only** lower case letters.
      - Matches a, b, c, ... , z but not A B C... Z or 0-9.
      - Test strings: `c("toad","flo","FOOD","123","fake92","RA21")`
- Construct a pattern that will match the words either goal or space.
      - Matches goal or space regardless of **case** e.g. SpAcE works as well.
      - Test strings: `c("GOAL!!!", "SpaceX", "gola", "caps")`.
      - *Psst*: `ignore.case=TRUE`
- Validate an alphanumeric password that must be between 5 and 9 characters long
      - Matches a password with length of 5-9 characters that has only a-z, A-Z, 0-9.
      - Test Strings: `c("flyingFish1", "toadie23","h!toyou!")`
- Extract hashtag references from embedded text.
      - Matches `#text` and extracts the values
      - Test Strings: `c("no tag", "#rstats #rcpp", "hi #stat385", "my #regex is #improving")`
- Isolate file IDs from file extensions
      - Capture `file_xxxxx` and discard file extensions (e.g. `.pdf`, `.png`)
      - Test Strings: `c("file_transcript.pdf	", "file_t123.pdf", "file_5128.jpg", "991.docx")`


## (5 Points) Exercise 5: Students and the Last Crusade!

The objective behind this exercise is to have you write your own simple linear
regression function using _R_'s S3 system. 

The following formulae will be helpful:

$$
\begin{aligned}
  { {\hat \beta }_0} &= \bar y - { {\hat \beta }_1}\bar x \\
  { {\hat \beta }_1} &= \frac{ { {S_{xy} } } }{ { {S_{xx} } } } \\
  { {\hat \sigma }^2} &= \frac{ {RSS} }{ {n - 2} } \\
  {R^2} &= 1 - \frac{ {RSS} }{ {TSS} } \\ 
  se\left( { { {\hat \beta }_0} } \right) &= \sqrt {\frac{ { { {\hat \sigma }^2}\sum\limits_{i = 1}^n {x_i^2} } }{ {n\sum\limits_{i = 1}^n {x_i^2}  - { {\left( {\sum\limits_{i = 1}^n { {x_i} } } \right)}^2} } } } \\
  se\left( { { {\hat \beta }_1} } \right) &= \sqrt {\frac{ { { {\hat \sigma }^2}n} }{ {n\sum\limits_{i = 1}^n {x_i^2}  - { {\left( {\sum\limits_{i = 1}^n { {x_i} } } \right)}^2} } } } \\ 
\end{aligned}
$$

- Create a `slr(x, ...)` generic function.

- Write `slr.default(x, y, ...)` method that enables the computation of
$\beta_1$, $\beta_2$, and their standard errors.
  - Note that this function receives _vectors_ `x` and `y`.

- Provide support for the R `formula` object by including:

```r
slr.formula = function(formula, data=list(), ...) {

    # Create a design matrix
    m_info = model.frame(formula = formula, data = data)
    x = model.matrix(attr(m_info, "terms"), data = m_info)
    y = model.response(m_info)
    
    # Due to the formulae given above for SLR,
    # we can remove the first column of the design matrix since
    # it consists solely of 1s.
    return(slr(x[,2], y, ...))
}
```

- What is the benefit of providing a way to supply a `formula` object compared 
  to the `matrix` approach used in the class MLR version? 

- Write a `summary()` and `print.summary.slr()` function that performs 
  inference on the estimates, provides the $R^2$ value, and displays the inference
  values in an appropriate manner. 

- Construct a function that also computes the prediction via `predict.slr()`.

