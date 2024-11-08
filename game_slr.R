##################################################
### PROG8435                                    ##
### Clasification model                         ## 
##################################################
#                                               ##
##################################################
# ID: 8982860
#
##################################################
### Basic Set Up                                ##
##################################################

# Clear plots
if(!is.null(dev.list())) dev.off()

# Clear console
cat("\014") 

# Clean workspace
rm(list=ls())

#Set work directory

setwd("C:/Users/RXPCOMPUTER/Source/RProjects/dataanalysisr/")

options(scipen=9)


##################################################
### Remove Packages Installed                   ##
##################################################

##################################################
### Install Libraries                           ##
##################################################

#If the library is not already downloaded, download it

if(!require(lattice)){install.packages("lattice")}
library("lattice")

if(!require(pastecs)){install.packages("pastecs")}
library("pastecs")

# Install and load rpart if necessary
if(!require(rpart)) install.packages("rpart")
library(rpart)

# Install and load rpart.plot if necessary
if(!require(rpart.plot)) install.packages("rpart.plot")
library(rpart.plot)

##################################################
### Read in Data                                ##
##################################################

# Read "comma separated value" files (".csv")
# This also works for txt files.

# Step 1: Load the Data
Games <- read.table("game.csv", header = TRUE, sep = ",")


# Step 2: Data Exploration
str(Games)
head(Games)

Games$Team <- as.factor(Games$Team)
Games$Opponent <-as.factor(Games$Opponent)

summary(Games)

# attach(Games)

# Step 3: Prepare the Data for Modeling

# Remove unnecessary columns for modeling
model_data <- Games[, c("Team_Score", "Opponent_Score", "Team_Win")]

# Set a seed for reproducibility
set.seed(42)

# Split data into training (70%) and test (30%) sets
sample_index <- sample(1:nrow(model_data), 0.7 * nrow(model_data))
train_data <- model_data[sample_index, ]
test_data <- model_data[-sample_index, ]

# We’ll use a decision tree for this classification task.
# Step 4: Build the Classification Model
# Train the decision tree model
model <- rpart(Team_Win ~ ., data = train_data, method = "class")

# View the model structure
print(model)

# Step 5: Visualize the Decision Tree

# Plot the decision tree
rpart.plot(model)

# Step 6: Make Predictions on the Test Data
# Make predictions
predictions <- predict(model, test_data, type = "class")
print(predictions)

# Step 7: Evaluate Model Performance
# Confusion matrix
confusion_matrix <- table(Predicted = predictions, Actual = test_data$Team_Win)
print(confusion_matrix)

# Calculate accuracy
accuracy <- sum(diag(confusion_matrix)) / sum(confusion_matrix)
print(paste("Accuracy:", round(accuracy, 2)))


## Usage of the model

# Step 1: Create New Data for Prediction
# Create a new data frame with the features for the new game
new_game <- data.frame(
  Team_Score = 2,
  Opponent_Score = 0
)


# Step 2: Use the Model to Predict the Outcome
# Predict the outcome for the new game
predicted_outcome <- predict(model, new_game, type = "class")

# Display the prediction
print(predicted_outcome)


