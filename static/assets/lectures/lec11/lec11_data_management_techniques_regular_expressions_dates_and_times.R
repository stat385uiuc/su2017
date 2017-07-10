## ----setup, include=FALSE------------------------------------------------
knitr::opts_chunk$set(echo = TRUE, cache = TRUE)

## ----eval = FALSE, engine='asis'-----------------------------------------
## |- Project
##    |- data-raw/
##       |- data.csv
##       |- clean_data.R
##    |- data
##       |- cleaned_data.rda
##    |- analysis
##       |- analysis_script.R
##    |- project_file.Rproj

## ----os_independent_load, eval = FALSE-----------------------------------
## # Example of an independent OS environment
## os_name = Sys.info()[['sysname']]
## if(os_name =="Windows"){
##   fp = file.path("F:/BoxSync/stat385/lectures")
## }else if(os_name =="Darwin"){ #OS X
##   fp = file.path("~/BoxSync/stat385/lectures")
## }else{ #Linux
##   stop("I'm a penguin.")
## }
## 
## script_path = file.path(fp, "lec8")

## ----load_packs, eval = FALSE--------------------------------------------
## # Any package that is required by the script
## # below is given here
## inst_pkgs = load_pkgs =  c("MASS","faraway","Hmsic",
##                            "randomForest","rpart")
## 
## # Check to see if the packages are already installed
## inst_pkgs = inst_pkgs[!(inst_pkgs %in%
##                           installed.packages()[,"Package"])]
## 
## # Installs any missing package
## if(length(inst_pkgs)) install.packages(inst_pkgs)
## 
## # Dynamically load required packages
## pkgs_loaded = lapply(load_pkgs, require, character.only=T)

## ----load_multiple_datasets, eval = FALSE--------------------------------
## # Obtain a list of all files within active directory
## # with extension .csv
## filenames = list.files(pattern="*.csv")
## 
## dsAll = data.frame()
## for (i in 1:length(filenames)) {
##   # Assign each file to its filename
##   assign(filenames[i],
##          read.csv(filenames[i], stringsAsFactors=FALSE))
##   # Note: The stringsAsFactors = FALSE condition
##   # prevents r from building levels into each variable.
## 
##   # Quick bind (bad implementation)
##   dsAll = rbind(dsAll, filenames[i])
## }

## ---- eval = FALSE-------------------------------------------------------
## 1002 w springfield ave
## 315 s state st
## 508 e soughton st
## ....

## ----house_mod, eval = FALSE---------------------------------------------
## #Find the row value
## k = which(houses$St_Address == tolower("3909 Aberdeen Dr"))
## #Update row value traits
## houses$Bedrooms[k] = "3 beds"
## houses$Bathrooms[k] = "2 baths"
## houses$lot[k] = "3040 sqft"
## houses$lastsoldifavailable[k] = "May 2011 for $135,000"

## ----clean_please, eval = FALSE------------------------------------------
## # Removes any of the St_Addresses in the rejection list
## houses = houses[!(houses$St_Address %in% reject),]
## # Removes any duplicates
## houses = unique(houses)
## # Drop column range starting at heattype to floorcover
## # heattype, zillowdays, cooling, parking, basement,
## # fireplace, floorcover.
## start_loc = match("heattype",names(houses))
## end_loc = match("floorcover",names(houses))
## houses = houses[,-(start_loc:end_loc)]
## # Removes variable headers in dataset
## houses = houses[-which(houses$lastsoldifavailable
##                        =="lastsoldifavailable"),]

## ----data_reshape--------------------------------------------------------
experiment = read.table(header=TRUE, text='
 subject sex control a b
       S1   F     4.2  4.1  2.2
       S2   M     5.9  7.2  6.8
       S3   M     9.1  9.8  10.2
       S5   F     2.1  23.5  5.2
')

experiment

## ----data_reshape_wide---------------------------------------------------
experiment

## ----data_reshape_long, echo = FALSE-------------------------------------
library(tidyr)
(data_long = gather(experiment, condition, measurement, control:b))

## ----data_reshape_long_wide----------------------------------------------
library(tidyr)
(data_wide =  spread(data_long, condition, measurement))

## ----data_reshape_long_v2------------------------------------------------
library(tidyr)
(data_long = gather(experiment, 
                    condition, measurement, control:b))

## ------------------------------------------------------------------------
locs = c('Chicago, IL', 'San Francisco, CA', 'Springfield, IL',
         'Detroit, MI', 'Urbana, IL', 'Tampa, FL')

grep('IL', locs)               # Obtain the Indices
grep('IL', locs, value = TRUE) # Obtain the Names

grepl('IL', locs)              # Obtain logical response

## ------------------------------------------------------------------------
regexpr('IL', locs)  # Obtain the first instance in a word
gregexpr('IL', locs) # Obtain all instances in a word

## ------------------------------------------------------------------------
sub('a', "", locs)  # Remove first instance
gsub('a', "", locs) # Remove all instances

## ----extract_format, eval = FALSE----------------------------------------
## # Create a temporary variable with strings in lower case
## address = tolower(as.character(houses$House_Address))
## # Regex: The . means any character
## # Regex: The * uses greedy evaluation [repeats]
## street = gsub(" ,.*", "", address)
## houses$St_Address = street
## # Replace city name with 0 or 1.
## city = gsub(".*, champaign, .*", "0", address)
## city = gsub(".*, urbana, .*", "1", city)
## houses$City = as.numeric(city) # Make numeric
## # Extract the zip code
## zip = gsub(".* , .*, il ", "", address)
## houses$ZipCode = as.numeric(zip)
## # Delete old House_Address
## houses$House_Address = NULL

## ------------------------------------------------------------------------
Sys.Date()             # Returns only Date

Sys.time()             # Returns Date + Time

as.numeric(Sys.time()) # Seconds from UNIX Epoch

## ----bad_time, eval = FALSE----------------------------------------------
## # Bad Time Differencing:
## 
## time1 = "2016-06-28 10:25:44 CDT" # UNIX Time Stamp
## time2 = "2016-06-28 15:25:44 CDT" # UNIX Time Stamp
## time2 - time1
## ## Error in time2 - time1 : non-numeric argument to binary operator

## ----good_time-----------------------------------------------------------
time1 = as.POSIXct("2016-06-28 10:25:44")
time2 = as.POSIXct("2016-06-28 15:25:44") # +5 Hours
time2 - time1

## ----format_table_date, echo = FALSE-------------------------------------
d = Sys.time()

a_f = format(d,"%a")
A_f = format(d,"%A")

b_f = format(d,"%b")
B_f = format(d,"%B")


m_f = format(d,"%m")
d_f = format(d,"%d")
e_f = format(d,"%e")

y_f = format(d,"%y")
Y_f = format(d,"%Y")


## ------------------------------------------------------------------------
(yyyy_mm_dd = as.POSIXct("2016-06-28",
                         format = "%Y-%m-%e"))

(dd_mm_yy = as.POSIXct("28/06/16",
                       format = "%e/%m/%y"))

(mon_dd_yyyy = as.POSIXct("Jun 28, 2016",
                         format = "%b %e, %Y"))

## ----format_table_time, echo = FALSE-------------------------------------
d = Sys.time()

S_f = format(d,"%S")
M_f = format(d,"%M")
H_f = format(d,"%H")
I_f = format(d,"%I")

p_f = format(d,"%p")

z_f = format(d,"%z")
Z_f = format(d,"%Z")


## ----time_nonstandard----------------------------------------------------
(h_m = as.POSIXct("11:38",
                         format = "%H:%M"))

(h_am = as.POSIXct("11 AM",
                       format = "%I %p"))

(h_m_s_z = as.POSIXct("11:38:22", # Chop off the TZ 
                         format = "%H:%M:%S",
                         tz = "America/New_York"))

## ----consider_posixct----------------------------------------------------
# POSIXct output
(origin = as.POSIXct("1970-01-01 00:00:00",
                    format ="%Y-%m-%d %H:%M:%S",
                    tz = "UTC"))

as.numeric(origin)     # At epoch

as.numeric(Sys.time()) # Right now

## ----consider_posixlt----------------------------------------------------
# POSIXlt output
posixlt = as.POSIXlt(Sys.time(),
                    format ="%Y-%m-%d %H:%M:%S",
                    tz = "America/Chicago")

# Convert to POISXct
posixct = as.POSIXct(posixlt)
posixct

## ----consider_posixlt_list-----------------------------------------------
posixlt$sec   # Seconds 0-61
posixlt$min   # Minutes 0-59
posixlt$hour  # Hour 0-23
posixlt$mday  # Day of the Month 1-31
posixlt$mon   # Months after the first of the year 0-11
posixlt$year  # Years since 1900.

## ----example_lubridate, message=FALSE------------------------------------
library(lubridate)
ymd("20160628")
interval(mdy("06-28-2016"), dmy("29/06/2016"))

