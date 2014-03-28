str(urban)
na.test(urban)
na.test <-  function (x) {
  w <- sapply(x, function(x)all(is.na(x)))
  if (any(w)) {
    stop(paste("All NA in columns", paste(which(w), collapse=", ")))
  }
}

#---------------------------------------------------
nan.test <-  function (x) {
  w <- sapply(x, function(x)all(is.nan(x)))
  if (any(w)) {
    stop(paste("All NAN in columns", paste(which(w), collapse=", ")))
  }
}

nan.test(urban)
#-----------------------------------------------------
inf.test <-  function (x) {
  w <- sapply(x, function(x)all(is.infinite(x)))
  if (any(w)) {
    stop(paste("All NAN in columns", paste(which(w), collapse=", ")))
  }
}
inf.test(urban)
#------------------------------------------------------
sum(with(urban, urban == Inf))

is.finite(c(1,NA,-Inf,NaN))
is.infinite(c(1,NA,-Inf,NaN))


