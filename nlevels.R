for (j in names(urbantest)){
if ({ is.factor (urbantest[ ,which(names(urbantest) == j)) 
     &
     (nlevels(urbantest[ ,which(names(urbantest) == j)]) == 1 })
         {print j}}
         


         nlevels(urbantest[ ,which(names(urbantest) == "address")])