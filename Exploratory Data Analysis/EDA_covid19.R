library(data.table)
library(funModeling)
library(Hmisc)
library(tidyr)
library(dplyr)
library(ggplot2)

df <- read.csv('/Users/montikachaikittiporn/Downloads/owid-covid-data.csv')

View(df)

##########################
#1. Checking missing values
##########################
#Total rows and colums
nrow(df)
ncol(df)

#Basic profiling
df_status(df)

#Profiling categorical var.
freq(df)

#Profiling numerical var.
plot_num(df)
View(profiling_num(df[,c('male_smokers','female_smokers')]))

##########################
#2. Select data that we interest
##########################
th <- subset(df, location == 'Thailand')
th <- th[,c("iso_code", "date", "total_vaccinations","people_vaccinated_per_hundred","people_vaccinated_per_hundred")]
th1 <- na.omit(th)
th1

##########################
#3. Visualization
##########################
g1 <- ggplot(data=th1, aes(x=date, y=people_vaccinated_per_hundred, group=1)) +
  geom_line( color="#69b3a2", size=2, alpha=0.9, linetype=2) +
  ggtitle("% of vaccinated people in Thailand")
g1
