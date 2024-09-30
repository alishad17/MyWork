# Name & Surname: Alisha Dockrat
# Student number: u21429040

# Do not include the worked example code in this script.

# Part 1 - Distributions

Q1a <- pnorm  (49,42,5, lower.tail = TRUE)

Q1b <- pnorm(27,42,5, lower.tail = FALSE)

(Q1c <- qnorm(0.66,42,5))

Q2a <- pchisq(13,7,ncp = 0,lower.tail = TRUE)

Q2b <- pchisq(5,7,ncp = 0,lower.tail = FALSE)

Q2c <- qchisq(0.2,7,ncp = 0)

Q3a <- pt(1.2,19,lower.tail = TRUE)

Q3b <- pt(-2.3,19,lower.tail = FALSE)

Q3c <- qt(0.33,19)

Q4a <- pf(6.3,5,9,lower.tail = TRUE)

Q4b <- pf(5.2,5,9,lower.tail= FALSE)

Q4c <- qf(0.45,5,9)




# Part 2 - Sampling distributions and point estimation

Q5 <- read.csv("Practical 2.csv",sep=",")

Q6 <- rowMeans(Q5)
Q6

Q7 <- rowSums(Q5)

Q8 <- sd(Q6)

Q9 <- 8.708696

