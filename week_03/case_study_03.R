install.packages("ggplot2")
install.packages("gapminder")
library(ggplot2)
library(gapminder)
library(dplyr)

#use filter to remove "kuwait" from the dataset
View(gapminder)

Gapminder_filtered <- gapminder %>%
  filter(country != "Kuwait")
#check result 
unique(Gapminder_filtered$country)

#Plot 1(the first row of plots)
ggplot(Gapminder_filtered, aes(x = lifeExp, y = gdpPercap, color = continent)) + geom_point(aes(size=pop/100000)) + theme_bw() + 
  scale_y_continuous(trans = "sqrt") + facet_wrap(~year, nrow=1) + labs(x = "Life Expectancy", y = "GDP Per Capital")

#prepare data for the second plot
View(Gapminder_filtered)
gapminder_continet <- Gapminder_filtered %>%
  group_by(continent, year) %>%
  summarize(gdpPercapweighted = weighted.mean(x = gdpPercap, w = pop))
pop = sum(as.numeric(pop))
