# WST 212 - Test 1

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

Employee <- read_csv('Employee.csv')
Person <- read_csv("Person.csv")
Sales_Detail <- read_csv("Sales_Detail.csv")
Sales_Order <- read_csv("Sales_Order.csv")

#-------------------------------------------------------------------

################################################################################

# Answer the questions below:


# Question 1


q1 <- as.factor(Employee$OrganizationLevel)



################################################################################


# Question 2 

cool <- function(x,y,z){
  f <- (4*x*z) - (x/2) + (y**((22+z)/3))
  return(f)
}

q2 <- cool(2,1,3)


################################################################################

# Question 3 

q3 <- sqldf("Select
            BusinessID,
            JobTitle,
            LoginID
            FROM Employee
            WHERE JobTitle LIKE 'Design Engineer'
            ORDER BY BusinessID")




################################################################################

# Question 4 


q4 <- sqldf("SELECT 
            NationalIDNumber,
            JobTitle,
            VacationHours,
            SickLeaveHours
            FROM Employee
            WHERE JobTitle LIKE '%Supervisor%'")



################################################################################

# Question 5 


q5 <- sqldf("SELECT
            JobTitle,
            OrganizationLevel,
            Count (*) as count_emp
            FROM Employee
            GROUP BY JobTitle, OrganizationLevel
            Order by Count (*) DESC")



################################################################################

# Question 6 

Sales_Order$OrderDate <- as.Date(Sales_Order$OrderDate, format = "%d-%m-%y")

q6 <- sqldf("SELECT
            year(OrderDate) as Order_Year,
            sum(TotalDue) as Total
            FROM Sales_Order
            GROUP BY year(OrderDate)
            ORDER BY year(OrderDate) DESC")


################################################################################

# Question 7 

q7 <- sqldf("SELECT 
            SalesOrderID,
            sum(LineTotal) as Order_Total
            FROM Sales_Detail
            Group by SalesOrderID
            HAVING Order_Total >= 2000")




################################################################################

# Question 8 


q8a <- sqldf("SELECT 
             p.LastName,
             p.FirstName,
             e.BirthDate,
             e.JobTitle
             FROM Person AS p 
             INNER JOIN Employee AS e
             ON p.BusinessID = e.BusinessID
             ORDER BY p.LastName")


q8b <- sqldf("SELECT 
             e.BusinessID,
             e.BirthDate,
             e.JobTitle
             FROM Employee AS e
             LEFT JOIN Person as p
             ON p.BusinessID = e.BusinessID
             WHERE p.FirstName IS NULL")


