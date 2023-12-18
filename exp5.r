library(e1071)

# Plot the entire Iris dataset
plot(iris)
iris

# Plot Sepal dimensions colored by Species
plot(iris$Sepal.Length, iris$Sepal.width, col=iris$Species)

# Plot Petal dimensions colored by Species
plot(iris$Petal.Length, iris$Petal.width, col=iris$Species)

# Randomly sample 100 rows for training, assign the rest to test
s <- sample(150, 100)
col <- c("Petal.Length", "Petal.Width", "Species")
iris_train <- iris[s, col]
iris_test <- iris[-s, col]

# Fit a linear SVM model on the training data
svmfit <- svm(Species ~ ., data = iris_train, kernel = "linear", cost = 0.1, scale = FALSE)
print(svmfit)

# Plot SVM decision boundaries on the training data
plot(svmfit, iris_train[, col])

# Tune the SVM model by searching for the best cost parameter
tuned <- tune(svm, Species ~ ., data = iris_train, kernel = "linear", ranges = list(cost=c(0.001, 0.01, 0.1, 0.1, 10, 100)))
summary(tuned)

# Generate predictions on the test set
p <- predict(svmfit, iris_test[, col], type="class")

# Plot the predicted class labels
plot(p)

# Create a confusion table and calculate accuracy
table(p, iris_test[, 3])
mean(p == iris_test[, 3])
