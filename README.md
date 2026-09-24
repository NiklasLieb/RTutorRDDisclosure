This package constitutes an interactive R problem set based on the RTutor package (https://github.com/skranz/RTutor). 

The problem set replicates and explains the empirical analysis of Baruffaldi, Simeth, and Wehrheim (2024), "Asymmetric Information and R&D Disclosure: Evidence from Scientific Publications", Management Science 70(2), 1052--1069. Using brokerage house mergers and closures as shocks to analyst coverage, it asks whether research-intensive firms respond to rising information asymmetry by publishing more scientific articles. It was written as a bachelor's thesis at Ulm University.

The paper is available at https://doi.org/10.1287/mnsc.2023.4721.

## 1. Installation

RTutor and this package is hosted on Github. To install everything, run the following code in your R console.
```s
install.packages("RTutor",repos = c("https://skranz-repo.github.io/drat/",getOption("repos")))

if (!require(devtools))
  install.packages("devtools")

devtools::install_github("NiklasLieb/RTutorRDDisclosure")
```

## 2. Show and work on the problem set
To start the problem set first create a working directory in which files like the data sets and your solution will be stored. Then adapt and run the following code.
```s
library(RTutorRDDisclosure)

# Adapt your working directory to an existing folder
setwd("C:/problemsets/RTutorRDDisclosure")
# Adapt your user name
run.ps(user.name="Jon Doe", package="RTutorRDDisclosure",
       auto.save.code=TRUE, clear.user=FALSE)
```
If everything works fine, a browser window should open, in which you can start exploring the problem set.
