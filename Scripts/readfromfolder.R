##### install necessary packages #####
#install.packages("readxl")
#install.packages("tidyverse")

##### import libraries #####
library(readxl)
library(tidyverse)

### list the files from the location of where you want to read from
filenames <- c(list.files("Data/", pattern = "*.tif", full.names = 'True'))
#filenames

##### initialize lists
dsmlst <- list_along()
dtmlst <- list_along()

##### for loop
for (i in filenames) {
  n = nchar(i)
  if substr(i, n-7, n) == "DSM.tif" {
    list.append(dsmlst, i)
  } else if substr(i, n-7, n) == "DTM.tif" {
    list.append(dtmlst, i)
  }
}
dsmlst
dtmlst
