---
title: "Homework 1: Crash into Programming"
date: '2017-06-16'
slug: homework-1-crash-into-programming
categories:
  - announcements
tags:
  - homework
---

> "People think that computer science is the art of geniuses but the actual 
> reality is the opposite, just many people doing things that build on each
> other, like a wall of mini stones."
>
> --- **Donald Knuth** 

# Directions

While working on homework, students are encouraged to work together in a group.
Though, each student must turn in their own homework answers.  If students opt
to work together, then it is important that they list the names of the students
that they have collaborated with. Please note that sharing, copying or providing
any part of a homework solution or code to another student is an infraction of
the University’s rules on Academic Integrity. Rest assured, any violation of
Academic Integrity will be punished **as severely as possible**.

* Your assignment must be submitted through the e-mail to `balamut2` [at]
  illinois [dot] edu. You are required to attach three (and only three) files to
  the *same* e-mail:
    * The RMarkdown (`.Rmd`) file must be saved as `hw1_yourNetID.Rmd`,
      e.g.  `hw1_balamut2.Rmd`
    * The generated output from the `.Rmd` file is then contained in
      `hw1_yourNetID.html`, e.g. `hw1_balamut2.Rmd`.
    * Any code should be placed in an external file given as
      `r_hw1_yourNetID.R`, e.g. `r_hw1_balamut2.R`.
* Under this structure, the content found within the `.html` file will be 
  considered a "report" which is the material that will determine the majority
  of your grade. Be sure to visibly include all `R` code and output that is
  relevant to answering the exercises. (You do not need to include irrelevant
  code you tried that resulted in error or did not answer the question correctly.)
* There are no limitations as to the number of submissions that can be made. 
  However, only the last submission *before* the deadline will be graded by
  myself or the grader.

**Deadline:** Sunday, June 25th by 11:59 PM CDT

# Assignment

## Objectives:

1. Familiarity with the course syllabus
1. Setup your computing environment
1. Markdown and RMarkdown Usage
1. Create a GitHub account
1. Clone a Repository
1. Make an RStudio project linked to version control. 
1. Commit and Push a change. 
1. Vector Operations
1. Random Number Generation
1. Introduction to Functions

## (1 Point) Exercise 0: Know Thine Environment

For this exercise, you will use either your local install of
[R](https://cloud.r-project.org/) + [RStudio](https://rstudio.com/download) or
the [Online Analytical Environment](https://rstudio.stat.illinois.edu/rstudio).

To verify the success of this exercise (and your choice) please take a 
screenshot of each application and included it within your RMarkdown document.

To take a screenshot press:

1. Windows: [`Windows Key` + `PrtScn`](http://windows.microsoft.com/en-us/windows/take-screen-capture-print-screen#take-screen-capture-print-screen=windows-8) or use the [Snipping tool](http://windows.microsoft.com/en-us/windows/use-snipping-tool-capture-screen-shots#1TC=windows-8)
2. macOS: [`Command` + `Shift` + `3`](https://support.apple.com/en-us/HT201361) or use [`Command` + `Shift` + `4`](https://support.apple.com/en-us/HT201361) for part of your screen.

### Local:

If you are running on **Windows**, please install all software under Admin. e.g. Right click on the installer and select `Run as administrator` from the context menu.

Install and configure the following software:

1. [R](https://cloud.r-project.org/)
2. [RStudio](https://rstudio.com/download)
3. `git`: See [tutorial](http://thecoatlessprofessor.com/tutorials/downloading-and-installing-git/).

### Remote:

1. Log into [Online Analytical Environment](https://rstudio.stat.illinois.edu/rstudio).
2. Rejoice! (Or e-mail me if you lack authorization)

### Verification of Working Install:

Open RStudio, within the console section of RStudio, write:

```r
yn = readline(prompt="Hello, what is your name? ")
```

And respond to it!

Then type:

```r
cat("Hello ", yn,"! I am R.", sep = "")
```

(Screenshot required)

Please create an RMarkdown document at this stage.

## (1 Point) Exercise 1: Where am I?

For this exercise, we will test to see if you have visited and read the [syllabus page](http://stat385.thecoatlessprofessor.com/syllabus/). Please answer the
questions in numerical list form in the RMarkdown document.

1. Who is the instructor for the class?
1. Where is the instructor's office and what are his office hours?
1. Is it appropriate to e-mail the instructor with: "Group project question"? If not, provide a correction.
1. When and where does the class meet?
1. How many exams are there and when do they occur?
1. How much is each component of the group project? Will everyone in the group
   receive the same grade? 

## (2 Points) Exercise 2: To GitHub and Beyond

For this exercise, we will create an account on GitHub and clone our first repository!

1. Create a [GitHub Account](https://github.com/join) with your `@illinois.edu`
   e-mail address.
    - If you can, try to name your account: `firstnamelastname` or 
      `firstname-lastname`. Or, use an anonymous nickname or callsign: (e.g. `coatless`).
1. Fill in your [GitHub Profile](https://github.com/settings/profile) with a picture and short bio.
1. Request an [educational discount](https://education.github.com/) to obtain private repositories.
1. Clone the GitHub repository that has been setup with your `netid` in the 
   [`stat385uiuc`](github.com/stat385uiuc) organization. Please note, this
   repository is private. Only yourself and the instructor can view it.
   If you have yet to e-mail the instructor with your GitHub username, you will
   _not_ have access to your repository!
    - You will need to clone the repository into an empty directory
      (without the present RMarkdown document and images captured so far).
1. Once you've cloned the repository, move all documents into the folder `hw1`. 
1. Please include in your `Rmd` file links to:
    - Your GitHub Profile
    - Your repository
1. Commit the changes with a message e.g. "init commit"
1. Push the changes onto GitHub!

## (2 Points) Exercise 3: ["Start of Something Good"](https://www.youtube.com/watch?v=WKsyxZWQ_g0)

The goal behind this exercise is to get you familiar with using 
RStudio's `git` tab and project workflow.

1. Create an RStudio Project with an existing directory 
1. Commit the `.Rproj` file with a unique commit message.
1. Push the commit to GitHub.

## (10 Points) Exercise 4: I'mma `bash` you!

Within this section, the bash skills and how to navigate from within a
command line interface will be emphasized. 

1. Open shell and create a folder under `hw1` called `analysis/data`.
2. Change directory into the `analysis` directory.
3. If we add a file called `data.txt` to the `analysis/data` folder, what is 
   the appropriate absolute path and relative path to the `data.txt`?
4. Run the command `$RANDOM` three times. Compare the output to three runs of `$((1 + RANDOM % 10))`. (Psst, what might you need to write before `$RANDOM` to have it display in the shell?)
    - How does it differ?
    - Does there appear to be a range of values?
    - What are the similarities? 
5. Using your answer regarding the path modify the `<path_to_file>` in the
   following piece of code and then run it.
    - What do you think the piece of code does?

```bash
for i in {1..100}; do
    echo "$((1 + RANDOM % 10))" >> "<path_to_file>/data.txt"
done
```

6. View the first `5` observations how do they differ from the last `5` observations?
7. Write a quick `README.md` file in the `stat385uiuc/netid` directory indicating
   this repository is meant to store your homework. 
    - Provide a link to the HW1 exercise `Rmd`. 
8. Commit the files and push them onto GitHub.
9. Make a copy of the `data.txt` file called `data_raw.txt`.
    - Before moving on, check that the file has been created successfully by
    listing the files in the directory.
10. Delete the file `data.txt` as it is now redundant. Commit the change and push it.
11. Create a branch for the `git` repo call it `mean-feature`. Switch over to the branch.
12. Create a new directory called `scripts` and write the `arith_mean.sh` script as follows:

```bash
#!/usr/bin/env bash

# Computes the arithmetic mean
#1 Path to file containing numeric values one per line
arith_mean() {

  # Section 1
  sum=0                     
  fname=$1                  
  count=0                   

  # Section 2
  while read line
  do
    sum=$((sum+line))      
    count=$((count+1))
  done < "$fname"

  # Section 3
  if [ "$count" != 0 ]; then
    mu=$((sum/count))
    echo "Sum = $sum, Count = $count, Mean = $mu"
  else
    echo "Please supply a file with more than 1 line of numerical input."
  fi
  
}

arith_mean $1             # Function call
```

13. Describe each section of `arith_mean.sh` script.
14. Change the file permissions so that the `arith_mean.sh` file can be executed. 
    Then run the file with:

```bash
./arith_mean.sh <path_to_file>/data_raw.txt
```

15. How does the mean obtained by this function compare to the mean of the Uniform Distribution? 
   - You might need to look at [the Wikipedia entry for a
     continuous uniform distribution](https://en.wikipedia.org/wiki/Uniform_distribution_(continuous)).
16. Commit the file to the branch. Switch to the `master` branch and use

```bash
git merge mean-feature
```

17. Push to GitHub.
18. On _GitHub_, edit the `README.md` so that the last line indicates the results
    obtained by running the `arith_mean.sh` script. Commit the results.
19. Locally, modify the `README.md` file at the _exact_ same point and indicate
    that this adventure is almost done. Commit the results.
20. Pull the repository from GitHub.
    - **Note, that we now have a merge conflict!**
21. Solve the merge conflict issue by keeping _both_ the remote and local commits
    as well as making a small modification to say I just solved my first merge
    conflict!
22. Change directory back to your home directory without using the `~`.

## (3 Points) Exercise 5: Gotta Catch'em All!

Within this excerise, we will play with `numeric`, `character`, and `logical`
vectors in R. 

1. Construct the following five numeric vectors `a`, `b`, `d`, `e`, and `y` 
   each with a length of `25` under the following conditions:
    - `a`: All values are `0`.
    - `b`: The first 25 square numbers, starting from `1.` (So `1`, `4`, `9`, etc.)
    - `d`: 25 evenly spaced numbers starting from `0` and going to `1`. 
         * Note: It may help to read the documentation for `seq()` via `?seq`.
    - `e`: The *natural* log, e.g. $\ln ()$, of the integers from `1` to `25`.
         * **Note:** You may want to read the help documentation for `log()` via `?log` 
    - `y`: The result of running the following code, after creating the other four vectors:


```r
set.seed(1337)                  # Replace with your favorite number
y  = 2 * a + b / 4 + 8 * d - 3 * e + rnorm(25, 0 , 1)
```
2. Modify the vector `a` so that all of its entries are `42`.
    - Rerun **without the seed** the `y` computation step.
    - Rerun **with** the seed the `y` computation step.
    - What is the difference between the two? (Outside the set seed)
3. Construct the following two `character` vectors `f` and `g` under the following conditions:
    - `f`: Contains the entire alphabet in lowercase.
    - `g`: The concatenation of vectors `f` and `b` (from 1.)
    - Comment on how the entries of `b` have changed.
4. Create a `logical` vector based on whether the results of `y` are greater than `10`.
    - Using the `logical` vector, create a sum indicating how many elements are greater than `10`.
    - *Psst:* This is what is called an [indicator or dummy variable](https://en.wikipedia.org/wiki/Dummy_variable_(statistics)) and it is used in regression as well as [indexing problems](http://www.cookbook-r.com/Basics/Indexing_into_a_data_structure/#indexing-with-a-boolean-vector).

## (2 Points) Exercise 6: Alternating Current

Within this exercise, you will explore vector recycling and vectorized computation. 

Calculate each element given by the following:

1. ${\left( { - 1} \right)^{2*n + 1} }$ from $n = 1$ to $n = 100$
1. ${\left( { - 1} \right)^{2*n} }$ from $n = 1$ to $n = 100$

1. What is the pattern associated with these values?
    - Please use either inline `$ math $` or display `$$ math block $$` to write your response. For math specific symbols, see [LaTeX/Mathematics](https://en.wikibooks.org/wiki/LaTeX/Mathematics). Generally, `$ a^2 + b^2 = c^2 $` gives $a^2 + b^2 = c^2$, which is inline, and `$$a^2 + b^2 = c^2$$` gives $$ a^2 + b^2 = c^2 $$, which is a display block.

Compute the summation of:

1. $$ \sum\limits_{n = 2}^{100} {\frac{ {\cos \left( {n\pi } \right)} }{ {\sqrt n } } }$$
1. $$ \sum\limits_{n = 2}^{100} {\frac{ { { {\left( { - 1} \right)}^{n + 1} } } }{n} } $$
1. $$ \sum\limits_{n = 1}^{100} {\frac{ { { {\left( { - 1} \right)}^{2n} }n} }{ { {n^2} + 5} } } $$


## (5 Points) Exercise 7: Fizz, Buzz, or FizzBuzz

The idea behind this exercise is to introduce you to a common interview problem
posed to programmers. The question was devised to filter out programming
candidates who have difficulty with foundamental computing theory. 
As a result as to how popular this question is, there are _many_ solutions 
available on the web. Having said this, you should _avoid_ looking at them and
instead work on the problem yourself. The programming exercises will only grow
in complexity from here.

- Job Prompt:

> Write a program that prints the numbers from 1 to 100. But for multiples of 
> three print "Fizz" instead of the number and for the multiples of five print 
> "Buzz". For numbers which are multiples of both three and five print
> "FizzBuzz".


