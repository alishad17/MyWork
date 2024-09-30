# Name & Surname: Alisha Dockrat
# Student number: u

# Do not include the worked example code in this script.
# Comment out the View function (if you use it) as it may cause errors in the autograder

# Part 1 - Questions 1-3

Q1 <- read.csv("Titanic.csv")
Q1a <- summary(Q1)

Q2_n <- sum(Q1$Passenger.class == 2, na.rm = TRUE)
Q2_mean <- mean(Q1[Q1$Passenger.class == 2, 'Fare'])
Q2_sd <- sd(Q1[Q1$Passenger.class == 2, 'Fare'])

t2 <- qt(0.025,Q2_n-1)
Q2_low <- Q2_mean + t2*(Q2_sd/sqrt(Q2_n))
Q2_up <- Q2_mean - t2*(Q2_sd/sqrt(Q2_n))

#qqnorm(Q1[Q1$Passenger.class == 2, 'Fare'], main = "Normal Plot of 2nd Class Passenger Fare")

Q3_Type1 <- 0.05
Q3_crit <- qt(0.975,Q2_n-1)

Q3_ht <- t.test(Q1[Q1$Passenger.class == 2, 'Fare'], mu = 30,alternative = "two.sided")
Q3_ts <- Q3_ht$statistic
Q3_pval <- Q3_ht$p.value

# Part 2 - Questions 4-7

Q4 <- seq(64, 74.95, by=0.05)

crit <- qnorm(0.99)
sigma <- 9
n <- 25
se <- sigma/sqrt(n)

Q5 <- NULL
for(i in 1:length(Q4)){
  Q5[i] <- 1- pnorm(-crit + ((75-Q4[i])/se))
}
Q5

Q6 <- cbind(Q4,Q5)
Q6

#plot(Q4)

# Part 3 - Questions 8-11

ind <- Q1$Sex == 'male'
freq <- sum(ind)
N8 <- NROW(Q1$Sex)
Q8 <- freq/N8

po <- 0.5
rows<- nrow(Q1)
phat <- Q8
n9 <- rows
p9 <- qnorm(1-po)

Q9_ts <- (phat-po)/sqrt((po*(1-po))/n9)
Q9_pval <- 1-pnorm(Q9_ts)

#Q10

Q10 <- 1 - pnorm((0.583-po)/sqrt((0.583*(1-0.583))/Q2_n))
