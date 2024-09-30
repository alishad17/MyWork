# Name & Surname: Alisha Dockrat
# Student number: u21429040

# Comment out the View function (if you use it) as it may cause errors in the autograder
# Do not set your working directory in this script as it will definitely cause errors in the autograder
# If the autograder fails to execute, it means that YOUR code is producing an error. 
# Clear your Global Environment and rerun your code line by line

fifa <- read.csv("Fifa19.csv")

set.seed(58)
Q1_sample <- rt(75,7)
Q1_min <- min(Q1_sample)

Q2_prob <- pchisq(1.542,7,ncp=0,lower.tail = TRUE)
Q2_perc <- qchisq(0.18,7,ncp=0)

Q4_names <- names(fifa)

Q5_sd <- sd(fifa$Weight..kg.)

Q6 <- qqnorm(fifa$Weight..kg., main = "Normal Probability Plot of Fifa Player's Weights (kg)", ylab = "Sample Quantiles - Weight (kg)")
qqline(fifa$Weight..kg.)

Q7_Spanish <- subset(fifa, fifa$Nationality == "Spain")

ind <- Q7_Spanish$Preferred.Foot == "Left"
freq <- sum(ind)
n <- NROW(Q7_Spanish$Preferred.Foot)
Q7_phat <- freq/n

Q8_German <- subset(fifa, fifa$Nationality == "Germany")

S <- Q7_Spanish$Weight..kg.
G <- Q8_German$Weight..kg.

ttest9 <- t.test(x=S,y=G,alternative = "two.sided",mu=0,paired=FALSE,var.equal = FALSE,conf.level = 0.99)
Q9_df <- ttest9$parameter
Q9_pval <- ttest9$p.value




