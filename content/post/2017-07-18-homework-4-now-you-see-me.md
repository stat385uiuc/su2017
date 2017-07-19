---
title: "Homework 4: Now You See Me"
date: '2017-07-18'
slug: homework-4-now-you-see-me
categories:
  - announcements
  - homework
tags:
  - homework 
  - eda
  - ggplot2
  - shiny
  - r
---

> "There are three types of lies -- lies, damn lies, and statistics."
>
> --- Benjamin Disraeli

# Directions

While working on homework, students are encouraged to work together in a group.
Though, each student must turn in their own homework answers.  If students opt
to work together, then it is important that they list the names of the students
that they have collaborated with. Please note that sharing, copying or providing
any part of a homework solution or code to another student is an infraction of
the University’s rules on Academic Integrity. Rest assured, any violation of
Academic Integrity will be punished **as severely as possible**.

* Your assignment must be submitted through the e-mail to `balamut2` [at]
  illinois [dot] edu. You are required to attach five (and only five) files to
  the *same* e-mail:
    * The RMarkdown (`.Rmd`) file must be saved as `hw4_yourNetID.Rmd`, e.g.  `hw4_balamut2.Rmd`
    * The generated output from the `.Rmd` file is then contained in `hw4_yourNetID.html`, e.g. `hw4_balamut2.html`.
    * The files associated with your shiny applications that are given as 
      `server.R`, `ui.R`, and `hw4_yourNetID_shiny.Rproj`, e.g. `hw4_balamut2_shiny.Rproj`.
* Under this structure, the content found within the `.html` file will be
  considered a "report" which is the material that will determine the majority
  of your grade. Be sure to visibly include all `R` code and output that is
  relevant to answering the exercises. (You do not need to include irrelevant
  code you tried that resulted in error or did not answer the question
  correctly.)
* There are no limitations as to the number of submissions that can be made.
  However, only the last submission *before* the deadline will be graded by
  myself or the grader.

# Assignment Overview

**Deadline:** Tuesday, July 25th by **2:00 PM CDT**

## Objectives

1. Verify Data
1. Categorical and Quantitative Variables
1. Univariate Summaries
1. Grammar of Graphics
1. Shiny

# Exercises

## (1 Point) Exercise 0: Listen to the rhythm, the rhythm of the GitHub!

Keeping in line with our commitment to using versioning control, please:

1. Create a new folder called `hw4` within your `stat385uiuc/netid` repository.
1. **Please commit every exercise as you complete them.**
1. Provide a link within your RMarkdown document to your GitHub repository.
1. Update your `README.md` so that it contains a link in the list to _HW4_.
   
## (3 Points) Exercise 1: Is this... Real?

The objective behind this exercise is to practice the EDA and PDP cycle.

- Obtain the [trial_diabetes.csv](/assets/hw/hw4/data/trial_diabetes.csv) and read it into *R*.
- Determine the different kinds of variable data.
   - Do these kinds make sense? If no, then transform the columns to the appropriate cast.
   - If a transformation was performed, then print out the new classes.
- Provide separate appropriate numerical summaries of the frequencies of 
  `quantitative` and `categorical` variables.
- Summarize the counts and proportions associated with the cross between 
  `gender` and `frame`.

## (5 Points) Exercise 2: Row, Row, Row your data

The tenets behind this exercise are meant to expose you to creating EDA 
functions in _R_.

- Create a function that is able to floor and cap values at quantiles 1% and 99%.
    - Values **beneath** the 1% quantile will be _raised_ to be at the 1% quantile.
    - Values **above** the 99% quantile will be _lowered_ to be at the 99% quantile.
- Write a function that determines whether or not _numeric_ variables have less
  than 20 distinct values. If so, then cast the variables as a factor.
- Develop two functions that are related to each other:
    1. Count the number of missing values per data type **AND** provide an
       overall total of missing values for each row of a data set.
       You should return a `data.frame` that has columns: 
       `numeric`, `integer`, `character`, `complex`, `logical`, `raw`, and `factor`.
    1. Graph the frequency of each missing value type in a `ggplot`. 

Test your code against the `pima` data set in the `faraway` package with the
following `NA` modification discussed in class.

```r
# install.packages("faraway")
data("pima", "faraway")

# Run this to correctly impute NAs for the 0 values.
pima[, 2:8] = sapply(pima[, -c(1, 9)], 
                     FUN = function(x) ifelse(x == 0, NA, x) )
```

## (4 Points) Exercise 3: Stuff that matters.

Behind this exercise is a **session** based web scraping experience.

**Part 1:**
 
- Download the html for <http://xkcd.com/>
- Extract the URL for the daily comic.
- Download the comic image to disk.
    - Include the Comic picture inside the R Markdown file.

**Part 2:**

- Establish an `html_session` with `rvest` pointed at <https://slashdot.org/>.
    - You are only allowed to hardcode <https://slashdot.org/>
- Navigate to the *Technology* news section of slashdot given at 
<https://technology.slashdot.org/> by having `rvest` click the appropriate link.
- Scrap all of the titles of the articles on the first and second pages.
    - Provide the selector information that you used.
- Scrap all the URLs given within each of the story descriptions.
    - Provide the selector information that you used.
- List the URLs next to the Titles.
    - You can embed a `list` with the titles inside a `data.frame`!

## (4 Points) Exercise 4: Your Choice.

The idea behind this exercise is to make it highly unstructured and allow you
to investigate a problem you might be interested in.

1. Specify the name of the dataset that you wish to use. Post it on piazza. Everyone
must have their **own** unique data set.
    - You may want to grab data from <https://www.data.gov/> or <http://espn.go.com/>
    - The data set *must* have both numerical and categorical variables (at least 8).
2. Perform EDA and PDP on the copy of data you received.
3. Create graphs that you believe help tell the story best of your data
4. Provide a summary of each step that you did in paragraph form. Defend your actions.

## (7 Points) Exercise 5: So Shiny! It's... My Precious.

The objective behind this exercise is to create a working shiny application.

Prof. Toad has called saying they are unable to fit a linear regression
easily in _R_. Being the amazing student you are, you sit down and start
writing a shiny application that allows the good professor to manipulate
an interface to get regression output. 

- Construct an interface that allows the professor to work with the `mtcars` data set
  with the features:
   - Select two variables -- dependent and independent variable -- for the linear regression.
      - Psst, the following allows you to construct a "dynamic" formula object 
        for the `lm` function `formula_dynamic = paste(y_name, "~", x_name)`
   - Outputs the summary of the linear regression as verbatim text.
   - Provide a scatter plot graph of the points with the **option** to add a regression line fit to it.
   - Press a "Submit" button to generate results. 
      - This means you will need to use an observer!