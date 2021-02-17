m <- matrix(c(100,98,99,100,100,80,20,30,20,10,94,40,43,10,10,67,50,32,100,60,94,90,100,80,45),nrow = 5,byrow = TRUE)
print(m)
labels <- c("Phy","Chem","Maths","FOC","CAD")
boxplot(m,main = "Marks Obtained",names = labels,xlab = "Sub",ylab="Marks")



votes <- c(54,42,10)
labels <- c("Party A","party B", "Party C")
boxplot(votes,main = "Party Votes distribution",xlab = "Party",ylab="Votes")

data <- read.csv("C:/Users/ksaiv/Downloads/stud_dataset - Sheet1.csv")
nrow(data)
par(mfrow=c(1,2)) 
boxplot(data$Marks.1~data$Gender,names = labels<-c("Male","Females"),main="Avg male and female marks in subject 1",xlab = "Gender",ylab="Marks")
boxplot(data$Marks.2~data$Gender,names = labels<-c("Male","Females"),main="Avg male and female marks in subject 2",xlab = "Gender",ylab="Marks")