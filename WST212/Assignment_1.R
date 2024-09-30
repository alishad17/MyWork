# WST 212 - Assignment 1

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


## Import tables
customer_info <- read_csv("customer_info.csv", show_col_types = FALSE)
customer_purchase_info <- read_csv("customer_purchase_info.csv", show_col_types = FALSE)


#-------------------------------------------------------------------

# Answer the questions below:


## Question 1

q1 <- sqldf("SELECT Customer_ID, Invoice_ID, Product_ID
            FROM customer_purchase_info")

## Question 2

q2 <- sqldf("SELECT Customer_ID, Invoice_ID, Customer_type, Branch, Rating
            FROM customer_purchase_info
            ORDER BY Rating desc")

## Question 3

q3 <- sqldf("SELECT Customer_ID, Invoice_ID, Customer_type, Product_ID, Branch
            FROM customer_purchase_info
            WHERE Payment = 'Credit card'")


## Question 4

customer_purchase_info$Purchase_Date <- as.Date(customer_purchase_info$Purchase_Date, format="%d-%b-%Y")
#uses b instead of m as it is an abbreviated word date

q4 <- sqldf("SELECT * 
            FROM customer_purchase_info
            WHERE Customer_type = 'Member' AND (Purchase_Date BETWEEN '2022-01-05' AND '2022-02-26')
            ORDER BY Customer_ID")


## Question 5

customer_info$Customer_birth <- as.Date(customer_info$Customer_birth, format="%d-%b-%Y")



q5 <- sqldf("SELECT Customer_name, Customer_contact, Customer_birth,
            DATEDIFF(year,Customer_birth,'2023-03-02') AS Current_Age
            FROM customer_info
            WHERE DATEDIFF(year,Customer_birth,'2023-03-02') >= 60
            ORDER BY Customer_name")

customer_info$given_day <- date("2023-03-02")

customer_info$Customer_birth <- as_date(customer_info$Customer_birth, format = '%d-%b-%Y')

q5b <- sqldf("SELECT Customer_name, Customer_contact, Customer_birth,
              floor((given_day - Customer_birth)/365) AS Age
              FROM customer_info
              WHERE floor((today - Customer_birth)/365) >= 60
              ORDER BY Customer_name")



## Question 6

q6 <- sqldf("Select Product_ID, Rating,
            CASE
              WHEN Rating >= 8.5 AND Rating <= 10 THEN 'Excellent'
              WHEN Rating >= 6 AND Rating < 8.5 THEN 'Good'
              WHEN Rating >= 4.5 AND Rating < 6 THEN 'Average'
              WHEN Rating >= 2.5 AND Rating < 4.5 THEN 'Poor'
              WHEN Rating >= 0 AND Rating < 2.5 THEN 'Terrible'
              ELSE '0'
            END AS Feedback
            FROM customer_purchase_info
            ORDER BY Rating desc")


## Question 7

q7 <- sqldf("SELECT Payment,
            COUNT(Payment) AS No_per_method
            FROM customer_purchase_info
            GROUP BY Payment
            HAVING COUNT(Payment) > 315
            ORDER BY Payment DESC")
