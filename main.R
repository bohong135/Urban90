# Loading Data and Packages
source("Loading data and packages.R") 

#-----------------------------------------
# Data Munging

source("adding new variables.R")
source("A columns.R")
source("B columns.R")
source("C columns.R")
source("D columns.R")
source("nlevels.R")

#-----------------------------------------
# writing clean data
write.xlsx2(urban, "clean.xlsx",sheetName="Sheet1",col.names=TRUE, row.names=TRUE)

#-----------------------------------------
#Exploratory Data Analysis
source("randomForest.R")



