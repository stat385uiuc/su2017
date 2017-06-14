---
title: "Welcome to STAT 385 @ UIUC"
author: "James Balamuta"
date: 2017-06-12T01:13:14-05:00
categories: ["announcements"]
tags: ["course"]
from_Rmd: yes
---



# Welcome

Welcome to STAT 385: Statistics Programming Methods at UIUC. The following will
serve as our course website. Please excuse the dust as it becomes sea worthy. 

# Course Information

**Location:** [Siebel 1105](http://ada.fs.illinois.edu/0563Plan1.gif)

**Time:** Monday, Tuesday, and Thursday, 3:00 PM - 4:50 PM


![plot of chunk siebel_map](/figures/post/2017-06-12-welcome-to-stat385/siebel_map-1.png)

Generated using: 


```r
# Load ggplot2 mapping extension
library("ggmap")

# Capture Image from Google Maps
siebel_map = get_map(location = c(lon = -88.224735, lat = 40.1138), 
  color = "color", source = "google", maptype = "satellite", 
  zoom = 17)

# Classroom location
pt = data.frame(lat = 40.11408, lon = -88.225279)

# Map away
ggmap(siebel_map) + geom_point(data = pt, aes(x = lon, y = lat), 
  color = "red", size = 5, alpha = 0.5) + xlab("Longitude") + 
  ylab("Latitude") + ggtitle("Siebel Center")
```
