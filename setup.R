library(shiny)
library(rvest)

# source modules
path <- "src/"
if (interactive() & sum(grepl("kWest",getwd()))==0)
  setwd("kWest")

#Source the scripts in src folder
#Includes the PWA dependencies
sapply(list.files(
  path,
  include.dirs = F,
  pattern = '.R',
  ignore.case = T
),
function(f) {
  source(paste0(path, f), .GlobalEnv)
})

#Remaining libraries to load
library(shinyMobile)
library(shinyWidgets)
library(tidyverse)
library(jsonlite)

#Load the UI modules
path<-"ui/"
sapply(list.files(
  path,
  include.dirs = F,
  pattern = '.R',
  ignore.case = T
),
function(f) {
  source(paste0(path, f), .GlobalEnv)
})

