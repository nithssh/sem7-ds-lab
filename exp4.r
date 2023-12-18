dataset = read.csv("data-marketing-budget-12mo.csv", header = T, 
colClasses = c("numeric", "numeric", "numeric"))
head(dataset,5)
# Month	Spend	Sales
#   1	1000	9914
#   2	4000	40487
#   3	5000	54324
#   4	4500	50044
#   5	3000	34719

# Simple Regression
simple.fit = lm(Sales~Spend,data=dataset)
summary(simple.fit)

# Multiple Regression
multi.fit = lm(Sales~Spend+Month, data=dataset)
summary(multi.fit)

# Logistic Regression
dataset <- mtcars [, c("am", "cyl", "hp", "wt")]
head(dataset)
am.fit = glm(formula = am ~ cyl, hp, wt, data = dataset, family = binomial)
summary(am.fit)
