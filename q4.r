setwd("C:/Users/ksaiv/Downloads")
dataset<- read.table('q4.csv',header=TRUE,sep=',')
dataset
nrow(dataset)
x_avg<-(sum(dataset$budget))/nrow(dataset)
y_avg<-(sum(dataset$sales))/nrow(dataset)
func1<-function(x){
  return(x-x_avg)
}
func2<-function(y){
  return(y-y_avg)
}
func3<-function(x){
  return((x-x_avg)*(x-x_avg))
}

col1<- sapply(dataset$budget,func1)

col2<- sapply(dataset$sales,func2)

col3<- col1*col2

numerator<-sum(col3)

col4<-sapply(dataset$budget,func3)

denominator<-sum(col4)

beta1<- numerator/denominator
beta0<- y_avg-(beta1*x_avg)

print("Without using library functions")
print(paste("Beta0=",beta0))
print(paste("Beta1=",beta1))

pred1<-beta0+(beta1*3000)
print(paste("When budget=3000 then sales=",pred1))
pred2<-beta0+(beta1*7000)
print(paste("When budget=7000 then sales=",pred2))
pred3<-beta0+(beta1*8000)
print(paste("When budget=8000 then sales=",pred3))




#Using library functions

linearMod<-lm(sales~budget,data=dataset)
print(linearMod)
modelSummary<-summary(linearMod)
modelCoeffs<-modelSummary$coefficients
modelCoeffs
print("Using predefined functions")
p1 <-  as.data.frame(3000)
colnames(p1) <- "budget"
pred1 <- predict(linearMod,newdata=p1)
print(pred1)
print(paste("When budget=3000 then sales=",pred1))
p2 <-  as.data.frame(7000)
colnames(p2) <- "budget"
pred2 <- predict(linearMod,newdata=p2)
print(paste("When budget=7000 then sales=",pred2))
p3 <-  as.data.frame(8000)
colnames(p3) <- "budget"
pred3 <- predict(linearMod,newdata=p3)
print(paste("When budget=8000 then sales=",pred3))
