unique(urbantest$b27)
summary(urbantest$b27)

# B03 number of rooms - converting to numeric
urbantest$b03 <- as.numeric(urbantest$b03)
class(urbantest$b03)#OK



bcolumn.pattern <- '^b[0123456789][0123456789]'
bcolumn.index = grep(bcolumn.pattern, names(urbantest))
bcolumn.index


urbantest[,which(names(urbantest)=="b10")]

is.null(urbantest[,45])

for (k in names(urbantest[,bcolumn.index]))
{
  if (is.na(urbantest)  or is.null())
  {
    
  }
}

summary(urbantest$b10)
unique(urbantest$b10)

sum(is.na(urbantest$b10))
sum(is.null(urbantest$b10))
sum(is.nan(urbantest$b10))
nrow(urbantest[ ,! which (urbantest$b10 ==1)])



urbantest[ ,which (names(urbantest) %in% bcolumn.index) ]