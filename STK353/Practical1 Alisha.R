#################################################################
# Practical 1
# Name and surname: Alisha Dockrat
# Student number: u21429040
#################################################################

#________________________________________________________________________
# Load the ggplot package and run the "maze_generation.R"
# R script using the "source" function in line 21 of this script. 
#
# Note: 
#
# To avoid error messages when running the lines of code already
# provided on this script, create one folder with the "maze_generation.R" 
# and "Maze_strategies.csv" files. Set this folder as your working 
# directory. 
#
# DO NOT IMPORT ANY OTHER PACKAGES
#_________________________________________________________________
 
  source("maze_generation.R") 
  library(ggplot2)

# Import data set for Question 3

  strategies <- read.csv("Maze_strategies.csv")


# Question 1 (a)

  Maze <- generateMaze(20, 20, 123)
  
  #n=20, m=20, seed = 123 as specified in instructions

# Question 1 (b)
  
  start_index <- 100
  
  #Index number taken from the list generated;

  
# Question 2 (a)
  
  #Define all start and end points
  start_r <- 1
  start_c <- 20
  end_r <- 20
  end_c <- 1
  
  #Orientation function given in lecture notes
  orientation <- function(cell, direction){ 
    if(direction == "up"){      
    forward  <- cell$up
    backward <- cell$down
    left     <- cell$left
    right    <- cell$right
    
  } else if(direction == "right")
  {
    forward  <- cell$right
    backward <- cell$left 
    left     <- cell$up
    right    <- cell$down
    
  } else if(direction == "down"){
    
    forward  <- cell$down 
    backward <- cell$up  
    left     <- cell$right 
    right    <- cell$left
    
  }else if(direction == "left"){
    
    forward  <- cell$left  
    backward <- cell$right   
    left     <- cell$down 
    right    <- cell$up
    
  }
    return(list(forward = forward, left = left, right = right))
  }
    
  #rotation function given in lecture notes
    rotate90cw <- function(direction){
      if(direction == "up"){
        redirect <- "right"
      }else if(direction == "right"){
        redirect <- "down"
      }else if(direction == "down"){
        redirect <- "left"
      }else if(direction == "left"){
        redirect <- "up"
      }
      return(redirect)
    }
    
    #rotation function given in lecture notes;
    rotate90ccw <- function(direction){
      if(direction == "up"){
        redirect <- "left"
      }else if(direction == "right"){
        redirect <- "up"
      }else if(direction == "down"){
        redirect <- "right"
      }else if(direction == "left"){
        redirect <- "down"
      }
      return(redirect)
    }
    
    #define current positions;
    current_d <- "left"
    current_r <- start_r
    current_c <- start_c
    solver_right <- integer() #create vector to store index values;
    
    while(TRUE){ #being loop to check position and move
      
      index <- ((current_r -1) * 20) + current_c #Define index calculation from row and column number
      
      if (current_c == end_c && current_r == end_r){ #check to see if end is reached
        print ("Goal Reached!")
        break #end loop when end is reached
      }
      
      if (!(current_r == start_r && current_c == start_c) && !(current_r == end_r && current_c == end_c)){
        solver_right <- c(solver_right, as.integer(index)) #store relevant index numbers in vector
      }
      
      current_cell <- Maze[[index]] #define current cell in terms of index
      current_position <- orientation(current_cell, current_d) #define current position
      
      if (current_position$right == TRUE) { #check if there is a right wall 
        if (current_position$forward == FALSE) { #check if there is a forward wall
          if (current_d == "up") { #move appropriately
            current_r <- current_r + 1
          } else if (current_d == "down") {
            current_r <- current_r - 1
          } else if (current_d == "left") {
            current_c <- current_c - 1
          } else if (current_d == "right") {
            current_c <- current_c + 1
          }
        } else {
          current_d <- rotate90ccw(current_d)
        }
        
      } else {
        current_d <- rotate90cw(current_d)
        
        if (current_d == "up") {
          current_r <- current_r + 1
        } else if (current_d == "down") {
          current_r <- current_r - 1
        } else if (current_d == "left") {
          current_c <- current_c - 1
        } else if (current_d == "right") {
          current_c <- current_c + 1
        }
      }
    }
    
    
  
# Question 2 (b) 
    
    current_d <- "left" #exact same as previous question, accounting for left-hand rule
    current_r <- start_r
    current_c <- start_c
    solver_left <- integer()
    
    while(TRUE){
      
      index <- ((current_r -1) * 20) + current_c
      print(index)
      
      if (current_c == end_c && current_r == end_r){
        print ("Goal Reached!")
        break
      }
      
      if (!(current_r == start_r && current_c == start_c) && !(current_r == end_r && current_c == end_c)){
        solver_left <- c(solver_left, as.integer(index))
      }
      
      current_cell <- Maze[[index]]
      current_position <- orientation(current_cell, current_d)
      
      if (current_position$left == TRUE) {
        if (current_position$forward == FALSE) {
          if (current_d == "up") {
            current_r <- current_r + 1
          } else if (current_d == "down") {
            current_r <- current_r - 1
          } else if (current_d == "left") {
            current_c <- current_c - 1
          } else if (current_d == "right") {
            current_c <- current_c + 1
          }
        } else {
          current_d <- rotate90cw(current_d)
        }
        
      } else {
        current_d <- rotate90ccw(current_d)
        
        if (current_d == "up") {
          current_r <- current_r + 1
        } else if (current_d == "down") {
          current_r <- current_r - 1
        } else if (current_d == "left") {
          current_c <- current_c - 1
        } else if (current_d == "right") {
          current_c <- current_c + 1
        }
      }
    }

  f1 <- c(1,2,3)
  f2 <- list(a=list(b = 4, c= (5,6)))
  f3 <- 7
  
  


  
# Question 3 (a)
    
firstArgument <- strategies
secondArgument <- 2
thirdArgument <- mean

apply(firstArgument, secondArgument, thirdArgument)

data 
%>%

 stack() %>%
 rename(“x” = 1, “y” = 2) %>%
 
ggplot(aes(x = 
y
, 
fill = x
)) 
+


geom_density
 (aes(
after_stat(density)
, alpha = 0.2), position = “identity”)+
  geom_density(aes(
mapping = aes
))+
  labs(
x = "Number of cells traversed"
,
       fill = “Maze solver algorithm”,
       title = “Distribution of the number of cells
\n
 traveresed for 3 maze solver strategies”) +
  guides(alpha = “none”, colour = “none”) +
  theme_bw()+
  theme(plot.title = element_text(
hjust = 0.5
))


# Question 3 (b)

q3b_plot <- ggplot(data = strategies,
                   aes(x = Right.hand.rule, after_stat(density))) +
  geom_histogram(fill = "lightblue", colour = "black") + 
  geom_density() +
  labs (x = "Number of cells traversed",
        title = "Distribution of the number of cells traversed\n to solve 1000 randomly generated 20x20 mazes (right-hand rule)") +
  theme(plot.title = element_text(hjust = 0.5))

  
# Question 3 (c)

all_numbers <- stack(strategies[, c("Right.hand.rule", "Left.hand.rule", "Tremaux.s.algorithm")])
stackdata <- as.data.frame(all_numbers)
names(stackdata) <- c("Number_traversed", "Strategy")



# Question 3 (d)

q3d_plot <- ggplot(data = stackdata,
                   aes(x = Number_traversed, y = Strategy)) +
              geom_boxplot(aes(fill = Strategy)) +
              labs(x = "Number of cells traversed",
                   y = "Maze solver strategy",
                   title = "Distribution of the number of cells traversed\n to solve 1000 randomly generated 20x20 mazes") +
              theme(plot.title = element_text(hjust = 0.5))

print(q3d_plot)

    
  