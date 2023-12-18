# Histogram
library(RColorBrewer)
data(VADeaths)
par(mfrow=c(2,3))
hist(VADeaths,breaks=10, col=brewer.pal(3,"Set3"),main="Set3 3 colors")
hist(VADeaths,breaks=3 ,col=brewer.pal(3,"Set2"),main="Set2 3 colors")
hist(VADeaths,breaks=7, col=brewer.pal(3,"Set1"),main="Set1 3 colors")
hist(VADeaths,,breaks= 2, col=brewer.pal(8,"Set3"),main="Set3 8 colors")
hist(VADeaths,col=brewer.pal(8,"Greys"),main="Greys 8 colors")
hist(VADeaths,col=brewer.pal(8,"Greens"),main="Greens 8 colors")

# Line Chart
data(AirPassengers)
plot(AirPassengers,type="l") #Simple Line
Plot

# Box plot
data(iris)
par(mfrow=c(2,2))
boxplot(iris$Sepal.Length,col="red")
boxplot(iris$Sepal.Length~iris$Species,col="red")
boxplot(iris$Sepal.Length~iris$Species,col=heat.colors(3))
boxplot(iris$Sepal.Length~iris$Species,col=topo.colors(3))
boxplot(iris$Petal.Length~iris$Species) #Creating Box Plot between two
variable

# Scatter Plot 
plot(x=iris$Petal.Length) #Simple Scatter Plot
plot(x=iris$Petal.Length,y=iris$Species) #Multivariate Scatter Plot

# Heat Map
# simulate a dataset of 10 points x<
rnorm(10,mean=rep(1:5,each=2),sd=0.7) y<
rnorm(10,mean=rep(c(1,9),each=5),sd=0.1) dataFrame<
data.frame(x=x,y=y) set.seed(143)
dataMatrix< as.matrix(dataFrame)[sample(1:10),] # convert to class 'matrix', then shuffle the rows of the matrix
heatmap(dataMatrix) # visualize hierarchical clustering via a heatmap

# Correlogram
#data("mtcars")
corr_matrix <
cor(mtcars) # with circles
corrplot(corr_matrix)
# with numbers and lower
corrplot(corr_matrix,method = 'number',type = "lower")

# Area Chart
data("airquality") #dataset
used airquality %>%
group_by(Day) %>%
summarise(mean_wind = mean(Wind)) %>%
ggplot() + 
geom_area(aes(x = Day, y = mean_wind)) +
labs(title = "Area Chart of Average Wind per Day",
subtitle = "using airquality data", y = "Mean Wind")

