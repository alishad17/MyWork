# WST 212 - Assignment 2

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
customer_purchase_ctc <- read_csv("customer_purchase_ctc.csv", show_col_types = FALSE)
customer_purchase_info <- read_csv("customer_purchase_info.csv", show_col_types = FALSE)
employee_purchase_info <- read_csv("employee_purchase_info.csv", show_col_types = FALSE)
product_description <- read_csv("product_description.csv", show_col_types = FALSE)
product_sales <- read_csv("product_sales.csv", show_col_types = FALSE)

#---------------------------------------------------s----------------

# Answer the questions below:


## Question 1

q1 <- sqldf("SELECT
            e.employee_id,
            c.Customer_name,
            c.Customer_contact,
            e.address,
            c.Gender,
            c.Customer_birth
            FROM employee_purchase_info AS e
            LEFT JOIN customer_info AS c
            ON e.Customer_id = c.Customer_ID")


## Question 2

q2 <- sqldf("SELECT
            i.Customer_ID,
            i.Invoice_ID,
            s.Total,
            s.cogs,
            (s.Total - s.cogs) AS Profit
            FROM customer_purchase_info AS i
            INNER JOIN product_sales AS s
            ON i.Invoice_ID = s.Invoice_ID
            WHERE (s.Total - s.cogs) >= 20
            ORDER BY Profit asc")


## Question 3a

q3a <- sqldf("SELECT
             i.Customer_ID,
             i.Invoice_ID,
             SUM(t.Unit_Price*t.Quantity + t.Tax) AS Customer_Total
             FROM customer_purchase_info AS i
             INNER JOIN customer_purchase_ctc AS t
             ON i.Invoice_ID = t.Invoice_ID
             GROUP BY i.Customer_ID
             ORDER BY Customer_Total desc")


## Question 3b

q3b <- sqldf("SELECT
             i.Branch,
             i.Product_ID,
             d.Product_line,
             SUM(t.Unit_Price*t.Quantity + t.Tax) AS Total
             FROM customer_purchase_info as i
             INNER JOIN product_description as d
             ON i.Product_ID = d.Product_ID
             INNER JOIN customer_purchase_ctc as t
             ON d.Product_ID = t.Product_ID
             GROUP BY i.Branch, d.Product_line
             ORDER BY i.Branch, i.Product_ID")


