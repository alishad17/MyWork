# Name & Surname: Alisha Dockrat
# Student number:u21429040

# Do not include the worked example code in this script.

# Part 1 - Questions 1-8

set.seed(25)
Q1 <- rnorm(35,4.5,1.2)

xbar <- mean(Q1)
norm2 <- qnorm(0.03)
norm2
Q2_low <- xbar + norm2*(1.2/sqrt(35))
Q2_low
Q2_up <- xbar - norm2*(1.2/sqrt(35))

(2*norm2*(1.2/0.15))^2
Q3 <- 906


data(discoveries)
#Q4 <- boxplot(discoveries,horizontal=TRUE)

xbar5 <- mean(discoveries)
sd5 <- sd(discoveries)
norm5 <- qnorm(0.015)
norm5
n5 <- length(discoveries)
n5
Q5_low <- xbar5 + norm5*(sd5/sqrt(n5))
Q5_low
Q5_up <- xbar5 - norm5*(sd5/sqrt(n5))

ind <- discoveries >= 4
freq <- sum(ind)
Q6 <- freq/n5
Q6

norm7 <- qnorm(0.055)
Q7_low <- Q6 + norm7*sqrt(Q6*(1-Q6)/n5)
Q7_up <-  Q6 - norm7*sqrt(Q6*(1-Q6)/n5)

#prep8 <- ((2*(norm7^2)*Q6*(1-Q6))-((norm7^2)*(0.038^2))+sqrt(4*(norm7^4)*Q6*(1-Q6)*(Q6*(1-Q6))+(0.038^2)*(norm7^4)))/0.038^2
#(4*(norm7^2)*(Q6)*(1-Q6))/(0.038^2)
Q8 <- 1565



# Part 2 - Questions 9-13

data(trees)
trees

summary(trees)


t10 <- qt(0.045,30)
t10

qqnorm(trees$Height)

xbar10 <- mean(trees$Height)
sd10 <- sd(trees$Height)
Q10_low <- xbar10 + t10*(sd10/sqrt(31))
Q10_up <- xbar10 - t10*(sd10/sqrt(31))

Q11_low <- xbar10 + t10*sd10*sqrt(1+1/31)
Q11_up <- xbar10 - t10*sd10*sqrt(1+1/31)

Q12 <- read.csv("Practical 3.csv")


#46

var13 <- var(Q12$x)
dist1 <- qchisq(0.02,46,lower.tail = FALSE)
dist2 <- qchisq((1-0.02),46,lower.tail = FALSE)
Q13_low <- sqrt(46*(var13)/dist1)
Q13_up <- sqrt(46*(var13)/dist2)




