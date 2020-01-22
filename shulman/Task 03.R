df <- iris
str (df)
list(df [order(df$cyl), ])

loop <- function(x){
      l <- list(x) ###Если делать не лист, а таблицу, то он выводит криво и дважды(
     if (is.numeric(x)) {
      means <- mean(x)
      l <- append(l, means)
    } else if (is.factor(x)) {
      freq <- table(x)
      l <- append(l, freq)
  }
    return (l) 
}


a <- function(data, r_s, c_s){
  d <- data[r_s,c_s, drop=F]
  lapply(d, loop)
}
  
a(df, 1:13, 3:5)

ibs_to_kg <- function (x) {
  round (x*1000*0.454, 2)
}


lapply(df$wt, ibs_to_kg)
unlist (lapply(df$wt, ibs_to_kg))

m <- matrix (lapply(df$wt, ibs_to_kg))

df1 <- transform(df,
                 wt_kilo = m)
print (df1)