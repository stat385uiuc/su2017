## @knitr loadpackages
#Any package that is required by the script below is given here
inst_pkgs = load_pkgs =  c("xtable","ggplot2", "gridExtra","devtools")
#Check to see if the packages are already installed
inst_pkgs = inst_pkgs[!(inst_pkgs %in%
                          installed.packages()[,"Package"])]
#Installs any missing package
if(length(inst_pkgs)) install.packages(inst_pkgs)

#Dynamically load required packages
pkgs_loaded = lapply(load_pkgs, require, character.only=T)

## @knitr lie_with_stats
dex = mtcars
dex$cyl = factor(dex$cyl)
levels(dex$cyl) = c("Breakfast","Lunch","Dinner")
g = ggplot(data = dex, aes( x = cyl) ) + geom_bar() +
           labs(x = "Meal Time",
                y = "Count",
                title = "Count vs. Meal Time")  +
  theme_bw() +
  theme(plot.title = element_text(hjust = 0.5))

g2 = g + coord_cartesian(ylim = c(7,14))

grid.arrange(g2, g, ncol=2)
