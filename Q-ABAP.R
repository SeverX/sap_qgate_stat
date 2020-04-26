library(dplyr)
library(mosaic)
library(ggmosaic)
library(VIM)
library(ggmap)
library(DT)
library(lubridate)
library(xlsx)
library(mosaic)
library(plotrix)

priorities <- function(atc){
  #priority <- table(atc$Contact.Person, atc$Priority)
  mosaicplot(atc$Contact.Person~atc$Priority, 
             main = "Priorities / Owner", 
             xlab = "Owner",
             ylab = "Priority",
             color = "skyblue2",
             #dir = c("h", "v"),
             border = "chocolate"
             #shade = TRUE
  )
}

owner_error_details <- function(atc){
  par(mfrow = c(3,3))
  persons = as.vector(unique(atc$Contact.Person)) 
  for(person in persons){
    print(bargraph(~ Check.Title, main = person, data = filter(atc, atc$Contact.Person == as.character(person))))
  }
}

package_error_details <- function(atc){
  par(mfrow = c(3,3))
  packages = as.vector(unique(atc$Package)) 
  for(package in packages){
    print(bargraph(~ Check.Title, main = package, data = filter(atc, atc$Package == package)))
  }
}

atc <- read.xlsx('ATC.xlsx', sheetName = "Sheet1")
aggr(atc)

#Owner
bargraph( ~ Contact.Person, data = atc)
bargraph( ~ Check.Title, data = atc)
priorities(atc)
histogram(~ Check.Title | Contact.Person, data = atc)
owner_error_details(atc)

#Packages
bargraph( ~ Check.Title | Package, data = atc)
#package_error_details(atc)
