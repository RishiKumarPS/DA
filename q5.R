func1<-function(x1){
  return(x1-x1_avg)
}
func2<-function(x2){
  return(x2-x2_avg)
}
func3<-function(y){
  return(y-y_avg)
}
func4<-function(x1){
  return((x1-x1_avg)*(x1-x1_avg))
}
func5<-function(x2){
  return((x2-x2_avg)*(x2-x2_avg))
}
func6<-function(x){
  if(x == "newspaper"){
    return (0)
  }else if(x == "radio"){
    return (1)
  }else if(x == "tv"){
    return (2)
  }
  return (3)
}
setwd("C:/Users/ksaiv/Downloads")
dataset<- read.table('q5.csv',header=TRUE,sep=',')
typeof(dataset)
dataset$media <- sapply(dataset$media,func6)
x1_avg<-(sum(dataset$media))/nrow(dataset)
x2_avg<-(sum(dataset$budget))/nrow(dataset)
y_avg<-(sum(dataset$sales))/nrow(dataset)
dataset

num1<- sapply(dataset$media,func1)
num2<-sapply(dataset$budget,func2)
num3<- sapply(dataset$sales,func3)

#finding beta1
num4<- num1*num3
numerator<-sum(num4)
den<-sapply(dataset$media,func4)
denominator<-sum(den)
beta1<- numerator/denominator
beta1

#finding beta2

num5<- num2*num3
numerator<-sum(num5)
den<-sapply(dataset$budget,func5)
denominator<-sum(den)
beta2<- numerator/denominator

#finding beta0

beta0<- y_avg-(beta1*x1_avg)-(beta2*x2_avg)
beta0

print(paste("beta0=",beta0))
print(paste("beta1=",beta1))
print(paste("beta2=",beta2))
pred <- beta0 + 1*beta1 + 200*beta2 

print(paste("When media=radio and budget=200, prediction is",pred))

#using library function for mlr 
model <- lm(sales ~ media+ budget,data=dataset)
print(model)
summary(model)
p <-  as.data.frame(list(1,200))
colnames(p) <- c("media","budget")
pred <- predict(model,newdata=p)
print(paste("When media=radio and budget=200, prediction is",pred))

