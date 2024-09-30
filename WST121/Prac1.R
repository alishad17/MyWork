# Name & Surname: Alisha Dockrat
# Student number: 21429040

# Do not include the worked example code in this script.

# Load data into environment
data("airquality")

# Part 1

Q1 <- names(airquality)

Q2 <- subset(airquality,Month==7)

Q3 <- mean(airquality$Wind)

Q4 <- sd(airquality$Wind)

#qqnorm(airquality$Wind, main="Normal Q-Q plot of Wind Speeds")
#qqline(airquality$Wind)


# Part 2
# The following code creates a simulated sample of size 72 from a Normal distribution with mean, mu=4.5, and standard deviation, sigma=1.2.
# The seed value ensures that you get the same sample every time you run the code.
# The rnorm function generates the sample.
set.seed(123)
Q6 <- rnorm(72,4.5, 1.2)

Q7 <- mean(Q6)

Q8 <- var(Q6)
Q8

Q9a <- 71

Q9b <- ((Q9a)*(Q8))/1.2^2


