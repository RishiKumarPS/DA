x <- c(100,98,99,100,100)
labels <- c("Physics","Chemistry","Maths","FOC","CAD")
pie(x,labels)



votes <- c(54,42,10)
labels <- c("Party A","party B", "Party C")
pie(votes,labels,main="Distribution of Votes")

data <- read.csv("C:/Users/ksaiv/Downloads/stud_dataset - Sheet1.csv")
nrow(data)
male <- 0
female <- 0
sum1_male <- 0
sum2_male <- 0
sum1_female <- 0
sum2_female <- 0
data[1,1]
for(i in 1:nrow(data)){
  if(data[i,4] == "M"){
    male = male + 1
    sum1_male = sum1_male + data[i,2]
    sum2_male = sum2_male + data[i,3]
  }else{
    female = female + 1
    sum1_female = sum1_female + data[i,2]
    sum2_female = sum2_female + data[i,3]
  }
}
par(mfrow=c(1,2)) 
pie(x<-c((sum1_male/male),(sum1_female/female)),labels<-c("Male","Females"),main="Avg male and female marks in subject 1")
pie(x<-c((sum2_male/male),(sum2_female/female)),labels<-c("Male","Females"),main="Avg male and female marks in subject 2")