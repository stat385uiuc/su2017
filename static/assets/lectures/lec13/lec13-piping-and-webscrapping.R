## ------------------------------------------------------------------------
---
title: "Piping and Webscrapping"
short-title: "Piping and Webscrapping"
author: "James Balamuta"
short-author: "J Balamuta"
date: '`r format(Sys.Date(), "%B %d, %Y")`'      # Month DD, YYYY (Main Slide)
short-date: '`r format(Sys.Date(), "%m/%d/%Y")`' # MM/DD/YYYY (Lower Right)
institute: "University of Illinois at Urbana-Champaign"
short-institute: "UIUC"
department: "Department of Informatics, Statistics"           # Institute must be defined
license: "CC BY-NC-SA 4.0, 2016 - 2017, James J Balamuta"
section-titles: true                             # Provides slide headings
safe-columns: true                               # Enables special latex macros for columns.
output: 
   uiucthemes::beamer_illinois
---


## ----setup, include=FALSE------------------------------------------------
options(width = 60)
knitr::opts_chunk$set(echo = TRUE, cache = TRUE)

## ---- echo = F, message=F, cache = FALSE---------------------------------
library("magrittr")

## ----pipe_op_rstudio, out.width = "250px", fig.retina = NULL, fig.align='center', cache = TRUE, echo = FALSE----
knitr::include_graphics("img/pipe_op_rstudio.png")

## ----pipe_op, out.width = "250px", fig.retina = NULL, fig.align='center', cache = TRUE, echo = FALSE----
knitr::include_graphics("img/MagrittePipe.jpg")

## ----stepwise_read, eval = FALSE-----------------------------------------
## input_data = read.csv('/path/to/data.csv')
## subset_data = subset(input_data, treatment > 10)
## top_20_data = head(subset_data, 20)

## ----embedded_call, eval = FALSE-----------------------------------------
## top_20_data = head(
##                    subset(
##                           read.csv('/path/to/data.csv'),
##                           treatment > 10),
##                  20)

## ----compressed_r_starbucks, eval = FALSE--------------------------------
## pickup(goto(store(drink("Java Chip Frap"),
##                   loc="Green St.")))

## ----javachip_frap, eval = FALSE-----------------------------------------
## "Java Chip Frap" %>% drink %>%
##   store(loc="Green St.") %>%
##   goto %>%
##   pickup

## ----embedded_call_r, eval = FALSE---------------------------------------
## top_20_data = head(
##                    subset(
##                           read.csv('/path/to/data.csv'),
##                           treatment > 10),
##                  20)

## ----embedded_call_pipe, eval = FALSE------------------------------------
## read.csv('/path/to/data.csv') %>%
##   subset(treatment > 10) %>%
##   head(20) -> top_20_data

## ----smore_bunny_foo_foo, out.width = "200px", fig.retina = NULL, fig.align='center', cache = TRUE, echo = FALSE----
knitr::include_graphics("img/bunny_foo_foo.jpg")

## ----simulated_data------------------------------------------------------
# Set Seed for Reproducibility
set.seed(1123)

# Generate Data
d = data.frame(x=rnorm(10), y = rnorm(10))

## ----pipe_breakage_function, cache = TRUE, eval = FALSE------------------
## myfunc = function(other_param, x)

## ----pipe_breakage, cache = TRUE-----------------------------------------
# Moved `d` to the data argument
d %>% lm(y ~ x, data = .) 

## ----pipe_breakage_subset, cache = TRUE----------------------------------
d %>% .[["y"]]

## ----fig.width=5, fig.height=2.5-----------------------------------------
d %>%
as.matrix %T>%
plot %>% # plot will not return anything
colSums  # as.matrix goes into colSums.

## ----eval = F------------------------------------------------------------
## tail(subset(iris, Petal.Width > mean(Petal.Width)))

## ----pipe_string, eval = F-----------------------------------------------
## a = "stat 385 is evolving"
## b = "My pokemon is evolving faster..."

## <b>some text that I want bold</b>

## <tag attribute="property">content</tag>

## <a href="http://illinois.edu">UIUC Website</a>

## ----chrome_dev, out.width = "300px", fig.retina = NULL, fig.align='center', cache = TRUE, echo = FALSE----
knitr::include_graphics("img/chrome_dev.png")

## ----chrome_dev_webbar, out.width = "400px", fig.retina = NULL, fig.align='center', cache = TRUE, echo = FALSE----
knitr::include_graphics("img/webdev_bar.png")

## ----chrome_dev_selector, out.width = "300px", fig.retina = NULL, fig.align='center', cache = TRUE, echo = FALSE----
knitr::include_graphics("img/get_selector.png")

## #main > article > section > table:nth-child(4) > tbody > tr:nth-child(4) > td:nth-child(2) > h3

## #main > article > section > table:nth-child(4) > tbody > tr > td:nth-child(2) > h3

## ----cache = F, message=FALSE--------------------------------------------
# Load the Package
library("rvest")

## ----phd_directory-------------------------------------------------------
# Grab a copy of the PhD Directory
phds = read_html(
  "https://www.informatics.illinois.edu/people-2/phd-students/")
 
# Retrieve PhD Table Entries
phds %>% 
  # Uses selector given before
  html_nodes("#main > article > section > table:nth-child(4) >
              tbody > tr > td:nth-child(2) > h3") %>%
  html_text() -> phd_names
 
phd_names %>% .[[4]]

## ----netids_phd----------------------------------------------------------
# Get a list of PhD Names
phds %>% 
  # Modify selector
  html_nodes("#main > article > section > table:nth-child(4) >
              tbody > tr > td:nth-child(2) > p > a") %>% 
  # Get the linking information
  html_attr("href") %>% 
  # Find only entries with mailto:
  grep("mailto:", x = ., value = T) %>%
  # Remove everything prior to the directory call
  gsub("mailto:(.*)@.*","\\1", x = .) -> phd_netids
 
phd_netids %>% .[[4]] # Pop the fourth ID

## ----user_session--------------------------------------------------------
# Similar to the `read_html`
coatless = html_session("http://github.com/coatless")

# Notice I'm resaving into `coatless`
coatless %>% 
  follow_link("thecoatlessprofessor") -> coatless

# Go back to GitHub (not saved)
coatless %>% back() 

## ----user_session_v2-----------------------------------------------------
# Go to one of the repositories
coatless  %>% back()  %>% follow_link("@tmsalab")

