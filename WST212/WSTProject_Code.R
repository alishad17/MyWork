# WST 212 - Group Assignment

# Name & Surname: 
# 1. Nawailah Tarmohamed
# 2. Alisha Dockrat
# 3. Ammaar Docrat
# 4. Xander Jacobs
# 5. Hanifa Moosa

# Student number:
# 1. u21437972
# 2. u21429040
# 3. u21534358
# 4. u20431008
# 5. u20519967

# Packages

library(sqldf)
library (RH2)
library(readr)
library (RJDBC)
library(rJava)
library(stringr)
library(ggplot2)
library(dplyr)
library(tidyr)
library(scales)

CreditCard <- read_csv('creditcard.csv')


#Part 1

#Question 1 
#Exploring the structure of the dataset

class(CreditCard)
dim(CreditCard) 
names(CreditCard)
str(CreditCard)
summary(CreditCard)
head(CreditCard)

#Question 2
Fraud_data <- subset(CreditCard, Class == 1)

NonFraud_data <-  subset(CreditCard, Class == 0)

scientific_to_decimal <- function(x) {
  format(x, scientific = FALSE)
}

ggplot() +
  geom_density(data = Fraud_data, aes(x = Amount), fill = "salmon", alpha = 0.7, color="salmon") +
  geom_density(data = NonFraud_data, aes(x = Amount), fill = "powderblue", alpha = 0.7, color="powderblue") +
  labs(x = "Transaction Amount", 
       y = "Density", 
       title = "Distribution of Fraudulent and Nonfraudulent Transaction Amounts") +
  scale_x_log10(labels = scientific_to_decimal) +  
  theme_classic()

#This graph shows the amount of non fraud verse fraud transactions using a density plot.
#In this graph we can see that the data with the highest density is non-fraudulent, however the 
#highest transactions comes from fraudulent data. There is also quite a large overlap indicating
#that alot of the same amounts consist of fraudulent and Non-fraudulent data.
#I used the color salmon to indicate fraudulent data and the color powderblue to indicate non-fraudulent data
#I also created a function for the x axis labels to display the amounts with more readable figures.


#Question 3
sample_size <- 1000 

sample_data <- CreditCard %>%
  group_by(Class) %>%
  sample_n(sample_size, replace = TRUE)

summary_data <- sample_data %>%
  group_by(Class) %>%
  summarize(Total_Amount = sum(Amount))

ggplot(data = summary_data) +
  geom_bar(aes(x = factor(Class), y = Total_Amount, fill = factor(Class)),
           stat = "identity", position = "dodge") +
  labs(x = "Class", y = "Total Amount",
       title = "Bar Plot of Total Transaction Amount by Class (Sampled Data)") +
  scale_fill_manual(values = c("springgreen1", "royalblue2"), labels = c("Non-Fraud", "Fraud")) +
  theme_classic() +
  scale_y_continuous(labels = comma)

#In this graph I took a sample of the total data as the graphs were coming to large, from the sample we can see that the
#total number of fraud cases are much higher then the non fraud ones.
#1000 values are randomly selected every time you run the code, each time the amount of fraudulent cases are higher

#Question 4
ggplot(data = CreditCard, aes(x = Time, y = ..count..)) +
  geom_line(stat = "bin", binwidth = 1000, fill = "maroon1") +
  
  geom_point(data = CreditCard[CreditCard$Class == 0, ], aes(x = Time, y = 0),
             shape = 21, size = 3, fill = "lightseagreen") +
  
  geom_point(data = CreditCard[CreditCard$Class == 1, ], aes(x = Time, y = 0),
             shape = 21, size = 3, fill = "tomato1") +
  labs(x = "Time", y = "Transaction Count",
       title = "Transaction Count Over Time") +
  
  scale_fill_manual(values = c("lightseagreen", "tomato1"), labels = c("Non-Fraud", "Fraud")) +
  theme_classic() 

#Part B

CreditCard$Class <- as.factor(CreditCard$Class)

set.seed(123)

split <- round(nrow(CreditCard)*0.70)

ti <- sample(1:nrow(CreditCard), split, replace = FALSE)

traindata <- CreditCard[ti, ]

testdata <- CreditCard[-ti, ]

lm_model <- glm(Class ~ ., family = "binomial", data = traindata)
summary(lm_model)

prob <- predict(lm_model, newdata = testdata, type = "response")

sorted <- ifelse(prob > 0.5,1,0)

lm_prediction <- as.factor(sorted)

lm_CM <- confusionMatrix(data = lm_prediction, reference = testdata$Class, positive = '1')

lm_precision <- lm_CM[["byClass"]][["Precision"]]

lm_recall <- lm_CM[["byClass"]][["Recall"]]

lm_tp <- lm_CM$table[2, 2]

lm_fp <- lm_CM$table[1, 2]

lm_tpr <- lm_tp/ (lm_tp + lm_fp)

lm_fpr <- lm_fp / (lm_tp + lm_fp)

#Part B

#using package e1071

set.seed(123)

nb_model <- naiveBayes(Class ~ ., data = traindata)

nb_prediction <- predict(nb_model, newdata = testdata)

nb_CM <- confusionMatrix(data = nb_prediction, reference = testdata$Class, positive = '1')

nb_precision <- nb_CM[["byClass"]][["Precision"]]

nb_recall <- nb_CM[["byClass"]][["Recall"]]

nb_tp <- nb_CM$table[2, 2]

nb_fp <- nb_CM$table[1, 2]

nb_tpr <- nb_tp/ (nb_tp + nb_fp)

nb_fpr <- nb_fp / (nb_tp + nb_fp)

#Part D

#using package rpart

set.seed(123)

tree_model <- rpart(Class ~. , data = traindata)

tree_predictions <- predict(tree_model, testdata, type = "class")

tree_actualues <- testdata$Class

tree_accuracy <- sum(tree_predictions == tree_actualues) / length(tree_actualues)



tree_confusion_mat <- confusionMatrix(tree_predictions, tree_actualues)

tree_tp <- tree_confusion_mat$table[2, 2]  # True positive

tree_fp <- tree_confusion_mat$table[1, 2]  # False positive

tree_fn <- tree_confusion_mat$table[2, 1]  # False negative

tree_precision <- tree_tp / (tree_tp + tree_fp)
tree_recall <- tree_tp / (tree_tp + tree_fn)


#using package rpart.plot
#decision tree plot
rpart.plot(tree_model)

# Part E
library(pROC)

roc_lm=pROC::roc(testdata$Class,prob)

roc_nb=pROC::roc(testdata$Class, nb_prob[,2])

roc_dtree=pROC::roc(testdata$Class, tree_prob[,2])

auc_lm=pROC::auc(roc_lm)

auc_nb=pROC::auc(roc_nb)

auc_tree=pROC::auc(roc_dtree)

performance_measures=data.frame(
Model=c("Logistic Regression", "Naive Bayes", "Decision Tree"),
Precision=c(lm_precision, nb_precision, tree_precision),
Recall=c(lm_recall, nb_recall, tree_recall),
AUC=c(auc_lm, auc_nb, auc_tree)
)


print(performance_measures)

plot(roc_lm,col="blue",lwd = 2)

lines(roc_nb,col="red",lwd = 2)

lines(roc_dtree,col="green",lwd = 2)

legend("bottomright",legend=c("Logistic Regression","Naive Bayes","Decision Tree"),col=c("blue","red","green"),lty=1,lwd=2,bty="n")


  