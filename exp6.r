library(MASS)
library(rpart)

# Display the first few rows of the 'birthwt' dataset
head(birthwt)

# Create a histogram of the 'bwt' variable
hist(birthwt$bwt)

# Display the frequency table of the 'low' variable
table(birthwt$low)

# Convert selected columns to factor variables
cols <- c('low', 'race', 'smoke', 'ht', 'ui')
birthwt[cols] <- lapply(birthwt[cols], as.factor)

# Set the seed for reproducibility
set.seed(1)

# Create a training set with 75% of the data
train <- sample(1:nrow(birthwt), 0.75 * nrow(birthwt))

# Fit a classification tree model
birthwtTree <- rpart(low ~ . - bwt, data = birthwt[train, ], method ='class') 

# Plot the classification tree
plot(birthwtTree)

# Add text to the plot
text(birthwtTree, pretty = 0)

# Display a summary of the classification tree
summary(birthwtTree)

# Make predictions on the test set
birthwtPred <- predict(birthwtTree, birthwt[-train, ], type = 'class')

# Display a confusion table
table(birthwtPred, birthwt[-train, ]$low)
