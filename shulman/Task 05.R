library(dplyr)

str(iris)

my_func <-  function(data, r_s, c_s, func){
  df <- data %>% select(c_s) %>% slice(r_s)
  num <- df %>% summarise_if(is.numeric, func)
  freq <- df %>% group_by_if(is.factor) %>% summarise(n())
  ####добавить ch тип
  return(list(df,num,freq))
}
  
my_func(iris,1:13, 3:5, mean)
  
ibs_to_kg <- function(x) {
  round(mean(x*454, 2))
}

###ibs_to_kg(mtcars,1:13,'wt', round (mtcars$wt*1000*0.454, 2))
  
my_func(mtcars,1:13, 'wt', ibs_to_kg)
my_func(iris, 1:10, 5)
