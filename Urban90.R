#Try to increase java Heap size(sufficient), by using
options(java.parameters = "-Xmx32g")
library(xlsx)
urban <- read.xlsx2("SumU90.xlsx",sheetIndex=1,colClasses=)

#Try to increase java Heap size(sufficient), by using
#options(java.parameters = "-Xmx32g")
#library(XLConnect)
#urban <- readWorksheetFromFile("SumU90.xlsx", sheet=1)

##Data Munging
tolower(names(urban))
str(urban)
nlevels(urban$ADDRESS)
