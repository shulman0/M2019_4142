###install.packages("gapminder")
library(gapminder)
summary (gapminder)
#ggplot(gapminder, aes (x=gdpPercap, y = lifeExp)) +
#         geom_point()

df <- gapminder

ggplot (gapminder, aes  (x=gdpPercap, 
                         y = lifeExp,
                         color = continent,
                         size= pop)) +
         geom_point()+
#  facet_grid (vars(year))
       facet_wrap (vars(year))+
#        theme_classic() 
        scale_x_log10()

###Final formule of graphic
ggplot (gapminder, aes  (x=gdpPercap, 
                         y = lifeExp,
                         color = continent,
                         size= pop
                         )) +
        geom_point()+
        facet_wrap (vars(year))+
        scale_x_log10()+

###Adding readable title
        labs(x = "per capita GPD (gross domestic product)", y = "Life expectancy at birth", 
        title = "The dependency of life expectancy from GDP", 
        color = "Continent", size = "Total population")


####добавить еще графиков (другие типы)
str(gapminder)
###Adding one more graphic

ggplot(gapminder, aes(x = continent, y = pop)) +
        geom_boxplot(color = "darkblue",
                     fill = "lightblue") +
        geom_jitter(width = 0.1,
                    alpha = 0.5,
                    color = "red") +
        scale_y_log10() +
        theme_classic()


ggplot(gapminder [1:100, ], aes(x= year , y= lifeExp)) + 
        geom_point(color = "#AA4371", size = 2, fill= "pink", shape = 19) +
        geom_smooth(method='lm', color = "darkred") +
        theme_classic() +
        scale_y_log10() +
        ggtitle("Dependancy lifeExp from the year")

ggplot(gapminder[1:100, ], aes(x= year, 
                              y = lifeExp, 
                              color = country)) +
        geom_point(alpha = 0.7) +
        facet_grid(. ~ continent) +
        theme_classic() 
