
#Step-by-Step Plan
#1. Data Understanding
#We’ll load the dataset and check out its structure. Then, we’ll prepare it for modeling.

#2. Supervised ML Model
#We’ll use Random Forest—a reliable supervised technique for regression problems like predicting G3.

#3. Neutrosophic Integration
#Neutrosophy deals with truth (T), indeterminacy (I), and falsity (F). We’ll integrate it by:

#  Classifying predictions as confident, uncertain, or incorrect based on residuals.

#Assigning neutrosophic values based on prediction error margins.


#########################################################################
#########################################################################
# 1. Load necessary libraries
library(tidyverse)
library(randomForest)
library(caret)
library(neutrostat)
library(ggplot2)

# 2. Load the dataset
data <- read.csv("student-mat.csv", sep=";")

#---------------------------------------------------
# 3. Convert categorical variables if needed

#conocer los nombres de las columnas
cols<-colnames(data)
# Convertir todas las columnas categóricas en factores
data[cols] <- lapply(data[cols], as.factor)
# Verificar la estructura de los datos para confirmar las conversiones
str(data)
# Revisar los niveles de las columnas de factores
sapply(data[cols], levels)
# Revisar el contenido del dataframe para asegurarse de que todo esté correcto
summary(data)
# Revisar missing values
sum(is.na(data))
#---------------------------------------------------


# 4. Split data into training and testing sets
set.seed(123)
ratio<-0.8
n <- nrow(data)
shuffled_df <- data[sample(n), ]
train_indices <- 1:round(ratio * n)
trainData <- shuffled_df[train_indices, ]
test_indices <- (round(ratio * n) + 1):n
testData <- shuffled_df[test_indices, ]

# Ensure G3 is numeric
data$G3 <- as.numeric(data$G3)

# Convert character columns to factors
data <- data %>%
  mutate(across(where(is.character), as.factor))

#-------------------------------------
# 5. Train Random Forest model
rf_model <- randomForest(G3 ~ ., data = trainData, ntree = 100, importance = TRUE)

# 6. Make predictions
predictions <- predict(rf_model, newdata = testData)



# 7. Calculate residuals and absolute errors
real <- as.numeric(levels(testData$G3))[testData$G3]
predicted <- as.numeric(levels(predictions))[predictions]

residuals <- predicted - real   #predictions - testData$G3
abs_errors <- abs(residuals)

# 8. Create a dataframe for plotting errors
plot_data <- data.frame(
  Actual = real,
  Predicted = predicted
)

# Plot
ggplot(plot_data, aes(x = Actual, y = Predicted)) +
  geom_point(color = "blue", alpha = 0.6, size = 2) +
  geom_abline(intercept = 0, slope = 1, color = "red", linetype = "dashed", size = 1) +
  labs(
    title = "Actual vs Predicted G3 Values",
    x = "Actual G3",
    y = "Predicted G3"
  ) +
  theme_minimal() +
  coord_equal()







# 9. Computing Metrics
library(Metrics)
# Mean Absolute Error (MAE)
mae <- mae(real, predicted)
cat("Mean Absolute Error (MAE):", mae, "\n")

# Root Mean Squared Error (RMSE)
rmse_value <- rmse(real, predicted)
cat("Root Mean Squared Error (RMSE):", rmse_value, "\n")

# R-squared (goodness of fit)
r_squared <- 1 - sum((residuals)^2) / sum((real - mean(real))^2)
cat("R-squared:", r_squared, "\n")


# 10. Define Neutrosophic Interpretation
# We'll define:
# - Truth (T): small error (good prediction)
# - Indeterminacy (I): medium error (uncertain)
# - Falsity (F): large error (bad prediction)

compute_neutrosophic_values <- function(error) {
  abs_error <- abs(error)
  if (abs_error <= 1) {
    return(c(T = 0.9, I = 0.1, F = 0.0))
  } else if (abs_error <= 3) {
    return(c(T = 0.5, I = 0.4, F = 0.1))
  } else {
    return(c(T = 0.2, I = 0.3, F = 0.5))
  }
}

# Apply to all residuals
neutrosophic_results <- t(sapply(residuals, compute_neutrosophic_values))
neutrosophic_df <- as.data.frame(neutrosophic_results)

# Combine predictions and neutrosophic values
results <- data.frame(
  Actual = testData$G3,
  Predicted = predictions,
  Error = residuals,
  T = neutrosophic_df$T,
  I = neutrosophic_df$I,
  F = neutrosophic_df$F
)

# View sample
head(results)



# 11. Create a dataframe for plotting with actual, predicted, and indeterminacy (I) values
plot_data <- data.frame(
  Actual = real,
  Predicted = predicted,
  Indeterminacy = neutrosophic_df$I
)

# Generate the plot with points sized by indeterminacy
#...........................................................
#plot_data combines the actual values (real), predicted values (predicted), and indeterminacy values (neutrosophic_df$I) into a single dataframe.
#Plot Customization:
# geom_point: Points are plotted with alpha = 0.6 for transparency, and their size and color are mapped to the indeterminacy values.
# scale_size_continuous: Adjusts the size range of the points (smaller for low indeterminacy, larger for high indeterminacy).
# scale_color_gradient: Uses a gradient from blue (low indeterminacy) to orange (high indeterminacy) to visually distinguish confidence levels.
# geom_abline: Adds a dashed red line for perfect predictions (Predicted = Actual).
ggplot(plot_data, aes(x = Actual, y = Predicted, size = Indeterminacy, color = Indeterminacy)) +
  geom_point(alpha = 0.6) +
  geom_abline(intercept = 0, slope = 1, color = "red", linetype = "dashed", size = 1) +
  scale_size_continuous(range = c(2, 6), name = "Indeterminacy (I)") +
  scale_color_gradient(low = "blue", high = "orange", name = "Indeterminacy (I)") +
  labs(
    title = "Actual vs Predicted G3 Values with Indeterminacy",
    x = "Actual G3",
    y = "Predicted G3"
  ) +
  theme_minimal() +
  coord_equal() +
  theme(
    plot.title = element_text(hjust = 0.5, face = "bold"),
    legend.position = "right"
  )






# 12. Plot error vs neutrosophic values
ggplot(results, aes(x = Error)) +
  geom_point(aes(y = T, color = "Truth")) +
  geom_point(aes(y = I, color = "Indeterminacy")) +
  geom_point(aes(y = F, color = "Falsity")) +
  labs(title = "Neutrosophic Interpretation of Prediction Error", 
       y = "Neutrosophic Values") +
  theme_minimal()



#Summary
#Random Forest predicts G3 based on input features.

#We interpret the confidence of predictions using a neutrosophic scale.

#Output includes Truth (T), Indeterminacy (I), and Falsity (F) values for each prediction.

######################################################
