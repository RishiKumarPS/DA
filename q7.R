#with predef function
setwd("C:/Users/91930/Desktop/DA Tutorial")
faculty<- read.table('q7.csv',header=TRUE,sep=',')
head(faculty)
linearMod<-lm(no_public~exp_yrs,data=faculty)
print(linearMod)
modelSummary<-summary(linearMod)
modelCoeffs<-modelSummary$coefficients
modelCoeffs
p1 <-  as.data.frame(12)
colnames(p1) <- "exp_yrs"
pred1 <- predict(linearMod,newdata=p1)
print(pred1)

#without predef function
x_avg<-(sum(faculty$exp_yrs))/nrow(faculty)
y_avg<-(sum(faculty$no_public))/nrow(faculty)
func1<-function(x){
  return(x-x_avg)
}
func2<-function(y){
  return(y-y_avg)
}
func3<-function(x){
  return((x-x_avg)*(x-x_avg))
}

col1<- sapply(faculty$exp_yrs,func1)

col2<- sapply(faculty$no_public,func2)

col3<- col1*col2

numerator<-sum(col3)

col4<-sapply(faculty$exp_yrs,func3)

denominator<-sum(col4)

beta1<- numerator/denominator
beta0<- y_avg-(beta1*x_avg)

print("Without using library functions")
print(paste("Beta0=",beta0))
print(paste("Beta1=",beta1))

pred1<-beta0+(beta1*12)
print(paste("For 12 years publications are ",pred1))