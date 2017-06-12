---
title: Syllabus
---

# STAT 385: Statistics Programming Methods

#### *University of Illinois at Urbana-Champaign*

#### *Summer 2017*

# Location and Time

- **Location:** Siebel 1105
- **Time:** Monday, Tuesday, and Thursday, 3:00 PM - 4:50 PM

# Course Websites

* **Materials:** <http://stat385.thecoatlessprofessor.com/su2017> 
 (Source: <http://github.com/coatless/stat385uiuc/su2017>)
* **Discussion Forum:** <http://github.com/stat385uiuc/su2017-disc> (Invite required!)
* **Analytical Environment:** <https://rstudio.stat.illinois.edu/>

# Course Staff

### Instructor

- **Name:** James Balamuta
- **Email:** [See e-mail policy](#email-policy)
- **Office:** 122 Illini Hall
- **Office Hours:** Monday and Tuesday 11:00 AM - 12:00 PM CDT

# Course Description

The world is rapidly evolving to rely on data driven decisions. These decisions
come from the work a statistician or data scientist presents in his or her
reports. In order to present an analysis, the analyst needs to be able to
leverage computing resources through programming to unearth patterns and models
that exist within data sets. As a result, statisticians and data scientists must
be savvy to programming methods that are useful to the wide variety of analysis
that they will be expected to perform.

For the focus of the course, fundamental programming techniques and
considerations will be introduced. Students will learn one of the leading
statistical programing languages in depth and will be well positioned to easily
learn others based on general principles. With this in mind, the course provides
a framework for writing statistical algorithms through the creation of functions
and object oriented programming. Students will also create dynamic reports that
encapsulate their code.

# Course Objectives

After completing the course, students should be able to:

- Analyze and discuss the meaning behind lines of code;
- Construct implementations of a statistical algorithm within a statistical 
  computing environment;
- Explain fundamental computing theory as it applies within the domain of
  Statistics.
 
# Course Content

Tentative subjects include:

- **Paradigms:** R, C++ (using Rcpp), OpenMP, bash, git, regex;
- **Reproducible Research:** `knitr`, `rmarkdown`, and `packrat`;
- **Computing Theory:** Control and scoping logic, big O, data structures,
                  application program interfaces (APIs), 
                  and object-oriented programming;
- **Algorithms:** Simple Linear Regression (SLR), Multiple Linear Regression (MLR),
                  Analysis of Variance (ANOVA), and Probability Integral Transform;
- **R packages:** Construction of R-packages using `devtools`, `roxygen2`, 
                  `profvis`, and `testthat`;
- **Visualizations:** Exploratory Data Analysis with Base R and `ggplot2`.

# Textbooks

Please note that these textbooks are available online. If you would like a paper
copy, you are more than welcome to obtain one. I will be referencing the
electronic versions.

I will heavily reference the following texts:

- **Required:** [Advanced R Programming](http://adv-r.had.co.nz/) Hadley Wickham
- **Required:** [R for Data Science](http://r4ds.had.co.nz/) Garrett Grolemund and Hadley Wickham
- **Required:** [The R Inferno](http://www.burns-stat.com/pages/Tutor/R_inferno.pdf) Patrick Burns

The following textbooks are *helpful*, but not necessary to succeed in the course:

- **Supplemental:** [Introduction to Scientific Programming and Simulation Using R](http://www.ms.unimelb.edu.au/~odj/Teaching/MAST30025/spuRs_reformatted_part1.pdf) Owen Jones, Robert Maillardet, and Andrew Robinson
- **Supplemental:** [An introduction to R](https://cran.r-project.org/doc/manuals/R-intro.pdf) Jeffrey Dean and Sanjay Ghemawat
- **Supplemental:** [The Art of R Programming](http://vufind.carli.illinois.edu/vf-uiu/Record/uiu_6955421) Norman Matloff
- **Supplemental:** [R Packages](http://r-pkgs.had.co.nz/) Hadley Wickham
- **Supplemental:** [ggplot2: Elegant Graphics for Data Analysis [2nd Edition - GitHub Only]](https://github.com/hadley/ggplot2-book) Hadley Wickham

# Prerequisites

Prior to taking this course, one should have acquired the following knowledge:

* [STAT 200: Statistical Analysis](http://catalog.illinois.edu/courses-of-instruction/stat/)
* Ability to collaborate in a group project
    * Listen, provide _constructive_ dialog, contribute work
* Motivation

**Note:** If you have taken a higher-level course, e.g. STAT 400 or STAT 425, 
this satisfies the STAT 200 requirement.

# Email Policy {#email-policy}

Before you start writing an e-mail to me please make sure your question is **not**:

1. Already answered in the course syllabus. 
   - The course syllabus serves as the guiding document for the course and I'm
     unlikely to shift from it.
1. About the contents of homework.
   - It is better to ask the question during the start of class, office hours,
     or on the discussion forum so that all students have access to the answer.

If the question is more of a technical issue, have you tried to **Google** the
error verbatim (e.g. copy and paste it into Google)? Many error messages
that you will encounter have likely been solved by others. Try to seek out 
pre-existing solution prior to querying me as it will allow you to gain
the highly sought after technical problem-solving capabilities.
     
With these cases addressed, please ensure the course emails meets the following
criteria:

1. The e-mail must be sent from an `@illinois.edu` account.
1. The start of the subject line must contain the tag `[STAT 385]` 
1. The tag must be followed by a space and a helpful description of the contents
   of the email. e.g.
   - "[STAT 385] I cannot compile `Rcpp` code on macOS" vs. "[STAT 385] Help! Code doesn't work..."

Failure to adhere to this policy will either result in:

1. An automated message as a reminder of this policy; 
1. **The email is ignored.**

| Role	        | Name             |	Email                  |
|:-------------:|:----------------:|:-----------------------:|
| Instructor	  | James Balamuta   |	balamut2@illinois.edu  |

# Bug Bounty Program

> "To err is human, but to really foul things up you need a computer." 
>
> --- **Paul R. Ehrlich**

James is a *human*. As a result, he will sometimes introduce *bugs* as he types 
into a computer. Though, he will try his very best to minimize the amount of
*bugs* in the course material.  If he does create a *bug*, please let him know.
Depending on the severity, you will be compensated with:

* Severe: Unintentionally, part of the code is fundamentally flawed.
    * Fix and/or patch is *required*.
    * **Reward:** Bug Hall of Fame and 1 E.C. point
* Medium: Logical flaws that occur during class.
    * Must explain the flaw and a potential solution
    * **Reward:** Large candy bar of your choice
* Trivial: Typos and Grammar
    * Minor nuisances that if corrected via a pull request will be appreciated. 
    * **Reward:** For every 20 typos and grammar bits a large candy bar of your choice

As an added plus, there are many good discussions that come about due to mistakes...

# Attendence

You are expected to attend all lectures. Failure to do so will have a direct 
effect on your course grade due to **five** class participation points being
deducted on each absence. Please note, every student is eligible to miss *two* 
class periods without needing to provide a reason. Any known or potential 
extracurricular conflicts should be discussed in person with the instructor 
during the first week of classes, or as soon as they arise. Please be proactive.

# Homework

There will be **five** homework assignments, each worth **25** points. None of 
the homeworks will be dropped. Instead, you will have **two** late due date 
**extensions** that will extend the original due date by *24 hours*.

# Exam

There is **one** midterm exam that is worth **150** points, which accounts for
**30** % of the overall course grade. The midterm will have an in-class portion
as well as a take-home portion that will be due within 24-48 hours after the
start of the exam. The take-home portion of the exam may not be discussed with
your classmates.

# Group Project

During the semester, students are expected to work on a capstone project within
a group. The capstone project is meant to either showcase a newly implemented 
statistical algorithms OR extend existing functions in other packages. The group
size should be **between 2 to 3 students**. There are four different graded
phases of the group project: 

- **Proposal**
- **Progress Update**
- **Project Presentation**
- **Final Project Report**

Each phases is worth **43.75** points making the overall project grade **175** points.

For each phase of the project, the group must provide an addendum page that 
lists each group member and specifies how much that group member contributed to
that stage of the project out of `100%`. At the end, students will be asked to
perform *individual* peer evaluations of group members that may influence the
grades of students who do not contribute equally to the group project.
**As a results, students should view project grades as being tentative.**

Furthermore, please make sure the following is present on each phase of 
the group project:

- Name of the Group
- Group Member Names and NetIDs
- Project Title
- Phase of the Project

The group project phases must be submitted through e-mail to balamut2 [at] illinois
[dot] edu. You are required to **attach** to the e-mail the report alongside
any supplementary files. All reports must be in PDF file format and saved as 
`group_yourGroupNumber_projectphase.pdf`. Thus, if you are in Group 1 and working
on the **Proposal**, then the file would be saved as: `group_1_proposal.pdf`

## Proposal

The project proposal should be **at least 3 pages long but less than 5 pages**. 
Within the group project proposal, students should have the following sections:

- **Introduction**
- **Related Work**
- **Method**
- **Feasibility**
- **Conclusion**
- **References**

Expectations regarding the contents of each section is outlined next. Make sure
to answer each question fully within the given section. 

### Introduction

The **introduction** section provides a preview of the project's focus.
Within this section, provide an overview on the selected topic for the consumption
of a manager. In essence, the manager must be able to understand _what_ the
project is and _why_ they should support the endeavor. You are allowed to make
the assumption that the manager is knowledgeable in _base R_ concepts. Make sure
to answer the following questions:

* What problem or topic are you addressing?
* Why is it interesting or important? In particular, what evidence supports this conclusion? 
   - Cite papers or reputable sources that back up this claim. (You may want to find material using [Google Scholar](https://scholar.google.com/).)
* Where did the problem or topic come from?
* What is your idea for addressing the problem or topic? 
* How does your idea match with the course’s focus on statistical programming? 

### Related Work

The **Related Work** section must provide an overview of pre-existing solutions.
In essence, please credit those who enabled you to consider embarking on this 
project, or as Issac Newton in [a letter to Robert Hooke on 15 February 1676](http://www.newtonproject.ox.ac.uk/view/texts/normalized/OTHE00101) more
aptly put it:

> If I have seen further it is by standing on the shoulders of Giants.

Address the following questions:

* What other ideas have been attempted?
* Why is your team's idea original compared to prior work?

### Method

The **Methods** section should contain the overall details of the project
including any preliminary work. In particular, the implementation details 
behind the approach should be explained at length here. The more details you
can provide, the better feedback your group can receive. As a result, 
the section serves as a roadmap of what features are going to be developed and
any external dependencies that are required. To satisfy this section, provide
detailed responses for the following:

* What is your general plan for realizing the idea? 
* Provide sketches of:
  - Visualizations
  - Function flows
  - Properties of classes
* What have you done or learned so far for the project? 

### Feasibility

The **Feasibility** section is meant to act as a way to reflect upon the proposal.
Generally speaking, there will be four weeks of heavy development time afforded
to the group. Building a detailed ecosystem or heavily scripting in a different
language will likely not lead your team to success. Hence, please provide
a project management overview of *who* on your team will be doing *what* and *when*
by answering:

* Is this project able to be completed before the end of the semester?
* What steps must occur to complete the project before the end of the semester?
* What is the work plan to accomplish the necessary tasks before the end of the
  semester?
  - Specify who is doing what and when. Consider making a [Gantt chart](https://en.wikipedia.org/wiki/Gantt_chart).

### References

The **References** section acts as a bibliography for all papers referenced
in the **Introduction**, **Related Works**, and **Method** sections. The
references should be formated in Chicago author-date format, which is the
default for RMarkdown.

* Provide a list (5+) of papers or items you have read to write this proposal. 
* Please list all _R_ packages or software referenced.

To acquire software citation information, _R_ has a built-in command
that creates a BibTex and in-line text citation. To generate the citation
of an installed _R_ package, type:

```r
# In R
citation(package="pkg_name")
```

## Progress Report

The project progress report should describe the present status of the project.
Specifically, please address:

1. How is the project progressing?
2. What has been accomplished thus far?
3. What have you learned? 
4. What issues have arisen?

Please **avoid** including code snippets. However, clear functional output is
okay.

The score for the progress report is based on how much work has been completed
since the project proposal was initially submitted.

## Presentations

There will be 15 minutes during class that is allocated to the presentation of
your project.  Please focus on the outcomes of the project. The score is based
solely on how well the project outcomes and methods used are conveyed. There
should be no more than 12 slides (not including references) in the presentation.

## Final Report

Please prepare the final report using the following outline: 

1.	Introduction
2.	Related Work
3.	Method
4.	Results
5.	Discussion
6.	Conclusion
7.	References

Reports will be graded based upon project outcomes, the execution of methods
described, and writing quality.

# Software

The course will use and present the **R** statistical computing language as well
as different parts of C++ through [Rcpp](http://gallery.rcpp.org/). The 
integrated developer environment that we will use to explore *R* is
[RStudio IDE](https://www.rstudio.com/products/rstudio/) made by
[RStudio Inc](https://www.rstudio.com). You are free to use any language you
choose, but the course staff will only be able to provide support for **R**. 
If you would like to use another statistical computing environment, please alert
the instructor ASAP to discuss feasibility.


# Course Grades

| Type             | Points Per     | Total Points |
|------------------|----------------|--------------|
| Participation    | 50             | 50           |
| Homework         | 5 x 25         | 125          |
| Exam             | 200            | 150          |
| Group Project    | 4 x 43.75      | 175          |
| **Course Total** |                | **500**      |


# Grading Scale

| A+  | A   | A-  | B+  | B   | B-  | C+  | C   | C-  | D+  | D   | D-  |
|-----|-----|-----|-----|-----|-----|-----|-----|-----|-----|-----|-----|
| TBD | 96% | 92% | 90% | 86% | 83% | 80% | 76% | 73% | 70% | 66% | 63% |

Grades are not curved or adjusted. This is not to dishearten students, but to 
let them know that their grade is based on individual effort and not on
comparative effort.

# Academic Integrity

The official University of Illinois policy related to academic integrity can be
found in Article 1, Part 4 of the Student Code. [Section 1-402 in particular 
outlines behavior which is considered an infraction of academic integrity.](http://studentcode.illinois.edu/article1_part4_1-402.html) 
These sections of the Student Code will be upheld in the STAT 385 classroom.
Any violations will be dealt with in a swift, fair and strict manner. 

You may discuss methods for completing the homework assignments with other
students, but the execution of these methods and the preparation of the document
must be done independently. Sufficient evidence of sharing results, 
collaborating on written assignments, or simply relying on internet resources
will result in a score of 0 for the assignment and you will lose your right to
have any late submissions. There can be no discussion with other students or
collaboration of any kind on the take-home exams.

To ensure that you do not violate the academic integrity policies, all code and
solutions should be prepared yourself. All code should be typed yourself, **not**
copy and pasted. (Except for code provided in class or in the textbook.)


# Changes

The instructor reserves the right to make any changes he considers academically
advisable. Such changes, if any, will be announced in class. Please note that it
is your responsibility to attend the class and keep track of the proceedings.

Also, if changes are made... 

<iframe width="420" height="315" src="https://www.youtube.com/embed/WpE_xMRiCLE" frameborder="0"></iframe>