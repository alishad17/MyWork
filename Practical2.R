#################################################################
# Practical 2
# Name and surname: Alisha Dockrat
# Student number: u21429040
#################################################################

#________________________________________________________________________
# Load the dplyr package 
# Note: 
#
# To avoid error messages when running the lines of code already
# provided on this script, create one folder with the relevant data 
# files and set this folder as your working 
# directory. 
#
# DO NOT IMPORT ANY OTHER PACKAGES
#_________________________________________________________________


library(dplyr)

audio_features <- read.csv("audio_features.csv")


#_______________________________________________________
# Question 1(a)(i)
#_______________________________________________________

clean1 <- audio_features %>%
  as_tibble() %>%
  mutate(keys = case_when(
    A == 9 ~ 9, A_sharp == 10 ~ 10,
    B == 11 ~ 11,
    C == 0 ~ 0, C_sharp == 1 ~ 1,
    D == 2 ~ 2, D_sharp == 3 ~ 3,
    E == 4 ~ 4,
    F == 5 ~ 5, F_sharp == 6 ~ 6,
    G == 7 ~ 7, G_sharp == 8 ~ 8)) %>%
  select(-A,-A_sharp,-B,-C,-C_sharp,-D,-D_sharp,-E,-F,-F_sharp,-G,-G_sharp)
  
  

#_______________________________________________________
# Question 1(a)(ii)
#_______________________________________________________

clean2 <- distinct(clean1)
  
#_______________________________________________________
# Question 1(a)(iii)
#_______________________________________________________
  
clean3 <- clean2 %>%
  filter(across(everything(),~ !is.na(.)))


#_______________________________________________________
# Question 1(b)
#_______________________________________________________
  
pca_result <- clean3 %>%
  select(popularity, duration_ms, danceability, energy, loudness, speechiness, 
         acousticness, instrumentalness, liveness, valence, tempo) %>%
  prcomp(scale. = TRUE)

stdev <- pca_result$sdev



#_______________________________________________________
# Question 2(a)
#_______________________________________________________
 
F_y <- function(y) {
  ifelse(y < 0, 0, ifelse(y <= sqrt(2), y^2 / 2, 1))
}


 
#_______________________________________________________
# Question 2(b)
#_______________________________________________________
 
Q_u <- function(u) {
  sqrt(u*2)
}



 
#_______________________________________________________
# Question 2(c)
#_______________________________________________________
 

set.seed(96)
pit_sample <- Q_u(runif(10000))

 
#_______________________________________________________
# Question 3(a)
#_______________________________________________________

fx <- function(x){
  
  (400/769) * exp(-0.5*(x^2)*sin(x)^2)*log(x+1)
} 

(M <- optimize(
  f = fx,
  interval = c(0,5),maximum=TRUE)$objective)

n <- 10000
set.seed(85)

u     <- runif(n, max = M)    
xstar <- runif(n, max = 5) 

ar_sample     <- xstar[u < fx(xstar)] 


  
#_______________________________________________________
# Question 3(b)
#_______________________________________________________

set.seed(74)

fy <- function(y){
  
  (400/769) * exp(-0.5*(y^2)*sin(y)^2)*log(y+1)*y
} 


a_y <- 0
b_y <- 5

n_y <- 10000

y_max <- optimise(fy, interval = c(a_y, b_y), maximum = TRUE, tol = 10^-100)$objective


ij_y <- data.frame(i = runif(n_y, a_y, b_y), 
                   j = runif(n_y, 0, y_max))

pts_under_y <- sum(ij_y$j < fy(ij_y$i), na.rm = TRUE )


exp_x <- ((pts_under_y / n_y) * (b_y - a_y) * y_max)





#_______________________________________________________
# Question 3(c)
#_______________________________________________________
   
set.seed(63)
nboot <- 200
xbar_boot <- numeric(nboot)

for (i in 1:nboot) {
  index <- sample(1:length(ar_sample), length(ar_sample), replace = TRUE)
  xbar_boot[i] <- mean(ar_sample[index])
}


#_______________________________________________________
# Question 3(d)
#_______________________________________________________
   
alpha <- 0.05
lower_bound <- alpha / 2
upper_bound <- 1 - alpha / 2

boot_lower <- quantile(xbar_boot, probs = lower_bound)
boot_upper <- quantile(xbar_boot, probs = upper_bound)



