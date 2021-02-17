dataset=read.csv("q6.csv")
dataset
age<- readline(prompt="Enter your age:")
age<- as.integer(age)
loan<- readline(prompt="Enter the loan amount:")
loan<- as.integer(loan)
age
loan
distance=vector()
length(distance)=nrow(dataset)
for(i in 1:nrow(dataset)){
  distance[i]=sqrt(((age-dataset[i,1])^2)+((loan-dataset[i,2])^2))
}
distance
min(distance)
neighbour<-which.min(distance)
neighbour
print(paste("the customer with age: ", age,"who applied for loan amount:",loan,"may pay the loan recommended by our system using nearest
            neighbors method is",dataset[neighbour,3]))

#Library function

#summary of data
str(dataset)
#split into train and test
dataset_train<-dataset[1:7,]
dataset_test<-dataset[8:11,]

#training and testing labels
dataset_train_labels<-dataset[1:7,3]
dataset_test_labels<-dataset[8:11,3]
#installing package class
#install.packages("class")
#creating model

dataset_test_pred<- knn(train = dataset_train,test=dataset_test,cl=dataset_train_labels, k = 21)
dataset_test_pred

