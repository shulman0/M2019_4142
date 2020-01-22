df <- mtcars 
str (df)
list(df[order(df$cyl), ])

func_mean <- function(data, r_s, c_s){
  d <- data[r_s, c_s, drop=F]
  l <- list(d)
  for (i in 1:length(d)){
    if (is.numeric(d[, i])) {
      means <- mean(d[r_s, i])
      l <- append(l, means)
    } else if (is.factor(d[, i])) {
      freq <- table(d[, i])
      l <- append(l, freq)
  }}
  return (l) 
}

func_mean(iris, 1:13, 3:5)

ibs_to_kg <- function (x) {
  round(x*1000*0.454, 2)
}

con <- numeric()
for (i in 1:nrow(df)){
  con[i] <- ibs_to_kg(df$wt[i])
}

df1 <- transform(df,
                 wt_kilo = con)

print (df1)
