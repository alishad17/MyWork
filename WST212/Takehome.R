# WST 212 - Take-home assessment

# Name & Surname: Alisha Dockrat

# Student number: u21429040


#-------------------------------------------------------------------
# DO NOT make any changes to the following code:

## Load necessary packages:
library(readr)
library(sqldf)
library(RJDBC)
library(RH2)
library(lubridate)
library(rJava)
library(caret)

Employee <- read_csv('Employee.csv')
Person <- read_csv("Person.csv")
Sales_Order <- read_csv("Sales_Order.csv")
train <- read_csv("Pima_Train.csv")
test <- read_csv("Pima_Test.csv")

#-------------------------------------------------------------------


# Answer the questions below:


# Question 1

q1 <- sqldf("SELECT *
            FROM Sales_Order
            WHERE TotalDue > (SELECT
            AVG(TotalDue)
            FROM Sales_Order)
            Order by SalesOrderID")

# Question 2

q2 <- sqldf("SELECT p.FirstName,
            p.LastName,
            e.JobTitle,
            e.OrganizationLevel,
            a.CountTitle
            FROM Person as p
            INNER JOIN Employee as e
            ON p.BusinessID = e.BusinessID
            INNER JOIN (SELECT
            JobTitle, Count(*) AS CountTitle
            FROM Employee
            Group by JobTitle) as a
            ON e.JobTitle = a.JobTitle
            ORDER BY a.CountTitle")
            

## Question 3.1

test$diabetic <- as.factor(test$diabetic)
test$preg <- as.factor(test$preg)
train$diabetic <- as.factor(train$diabetic)
train$preg <- as.factor(train$preg)


## Question 3.2

logistic_model <- glm(diabetic ~ ., family = "binomial", data = train)
summary(logistic_model)
## Question 3.3

probs <- predict(logistic_model, newdata = test, type = "response")

## Question 3.4

pred4 <- ifelse(probs > 0.5, 1, 0)
pred <- as.factor(pred4)

## Question 3.5

CM <- confusionMatrix(data = pred, reference = test$diabetic, positive = '1')

## Question 3.6

specificity <- CM[["byClass"]][["Specificity"]]

## Question 3.7

new_prob <- (exp(-3.59335 + (-0.86015*10) + (0.10337*30)))/(1 + (exp(-3.59335 + (-0.86015*10) + (0.10337*30))))



