
library(tidyverse)
library(Hmisc)
library(AICcmodavg)
library(car)
install.packages("GGally")
library(GGally)
install.packages("rcompanion")
library(rcompanion)
data<-read.csv("uci_student (1).csv")

G3_math<- data$G3.x
G3_por<-data$G3.y

#Normality

qqnorm(G3_math)
qqline(G3_math)
qqnorm(G3_por)
qqline(G3_por)

#transformation
G3_math_trans<-transformTukey(G3_math)
qqnorm(G3_math_trans)
qqline(G3_math_trans)
G3_por_trans<-transformTukey(G3_por)
qqnorm(G3_por_trans)
qqline(G3_por_trans)

#Scatter points to check linear relationship

scatter.smooth(G3_math_trans,G3_por_trans, main = "g3 grades for math VS G3 grades for Port")


#correlation coefficient
cor.test(G3_math_trans, G3_por_trans)

# Linear regression
G3_grades_expect<-lm(G3_math_trans~G3_por_trans)
summary(G3_grades_expect)

# check assumptions

# We checked linearity previously

# independence: Plot residuals vs fitted values
plot(G3_grades_expect$fitted.values, residuals(G3_grades_expect), main = "Residuals vs Fitted Values", xlab = "Fitted Values", ylab = "Residuals")

#Homoscedasticity
#The spread of residuals is roughly constant across all values of x

qqnorm(residuals(G3_grades_expect))

qqline(residuals(G3_grades_expect), col="Blue")






