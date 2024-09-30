# Name & Surname: Alisha Dockrat
# Student number: u21429040

# Do not include the worked example code in this script.
# Comment out the View function (if you use it) as it may cause errors in the autograder
# Do not set your working directory in this script as it will definitely cause errors in the autograder

# Part 1 - Questions 1-2

#Ho: Xf - Xm = 0
#Ha: Xf - Xm < 0

titanic_data <- read.csv("Titanic.csv")
summary(Titanic)

Female <- subset(titanic_data,titanic_data$Sex == "female" )
Male <- subset(titanic_data,titanic_data$Sex == "male")

ages_F <- Female$Age
ages_M <- Male$Age

boxplot(ages_F, ages_M, names=c("Female","Male"), xlab="Ages",ylab="Gender",main = "Age Distribution of Females and Males on Titanic",horizontal=TRUE)

n_F <- nrow(Female)
n_M <- nrow(Male)

xbar_F <- mean(ages_F)
xbar_M <- mean(ages_M)

sd_F <- sd(ages_F)
sd_M <- sd(ages_M)

Q1_ts <- (xbar_F-xbar_M)/sqrt(((sd_F^2)/n_F)+((sd_M^2)/n_M))
Q1_pval <- pnorm(Q1_ts)

#p value not less than alpha, do not reject

#Question 2

#Ho: Xf - Xm = 0
#Ha: Xf - Xm != 0

bf_data <- read.csv("Body_Fat_Percentage.csv")
summary(bf_data)

f <- subset(bf_data,bf_data$Sex == 'female')
m <- subset(bf_data,bf_data$Sex == 'male')

bf_F <- f$Body_Fat_Percentage
bf_M <- m$Body_Fat_Percentage

ttest2 <- t.test(x=bf_F, y=bf_M,alternative = "two.sided", mu=0, paired=FALSE,var.equal = TRUE, conf.level = 0.90)
Q2_ts <- ttest2$statistic


Q2_df <- ttest2$parameter
Q2_crit <- qt(0.95,Q2_df)

#Null hypothesis rejected

# Part 2 - Questions 3-5

chol_data <- read.csv("Cholesterol.csv")
chol_data

corn <- chol_data$CORNFLK
bran <- chol_data$OATBRAN
diffmean <- mean(bran-corn)
diffsd <- sd(bran-corn)
diff <- bran - corn

pairtest3 <- t.test(x =bran, y=corn, paired=TRUE,alternative = "less", conf.level = 0.95)
Q3_ci <- pairtest3$conf.int

#Ho : p1 - p2 = 0
#Ha: p1 - p2 != 0


ptest4 <- prop.test(x= c(1328,1507), n= c(10269,10267),alternative="two.sided",conf.level=0.90,correct=FALSE)
Q4_pval <- ptest4$p.value

#p value less than alpha, reject


vtest5 <- var.test(x= bf_F, y=bf_M,ratio=1,alternative="two.sided",conf.level=0.99)
 Q5_pval <- vtest5$p.value
 #Do not reject
 
Q5_ci <- vtest5$conf.int
#1 is in interval, Ho not rejected

#Ho: var1 - var2 = 0
#Ha: var1 - var2 != 0

#