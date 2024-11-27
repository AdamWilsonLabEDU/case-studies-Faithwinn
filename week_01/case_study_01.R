data("iris")
petal <- iris$Petal.Length 

mean(petal)

hist(petal, col = 'blue', border = 'white', xlab = 'Petal length', ylab = 'Frequency',main = 'Petal Length Distribution')
abline(v = mean(petal), col='red', lwd = 2)

#Using ggplot2 
#install.packages("ggplot2")
#install.packages("readr")
#install.packages("dplyr")
library(ggplot2)
library(readr)
library(dplyr)

data("iris")

ggplot(data = iris, mapping = aes(x = Petal.Length)) + geom_histogram(color = 'white', fill = 'blue') + geom_vline(aes(xintercept = mean_petal), data = iris, color = "red", linewidth = 2)

mean_petal <- mean(iris$Petal.Length)
mean_petal

