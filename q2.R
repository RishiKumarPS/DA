dt<-read.csv("q2.csv")

#Remove numbers and special characters
dt$faculty.name <- gsub('[^a-zA-Z ]+', '', dt$faculty.name)

#Remove excess whitespaces
dt$faculty.name <- gsub("\\s+", " ", trimws(dt$faculty.name))

#Remove NA
dt$salary <- replace(dt$salary, is.na(dt$salary) ,0.0)

#Handle Impossible characters like "-,%"
dt$salary <- gsub("[^0-9]+", "", dt$salary)
dt$salary <- as.numeric(dt$salary)

#Outlier removal
Q1 <- quantile(dt$salary, .25)
Q3 <- quantile(dt$salary, .75)
IQR <- IQR(dt$salary)
print(Q1)
print(Q3)
print(dt$salary)
#Handle Impossible values
dt$salary <- replace(dt$salary, dt$salary<0.0 | dt$salary< (Q1 - 1.5*IQR) | dt$salary> (Q3 + 1.5*IQR) , NA)
print(dt$salary)
dt$salary[is.na(dt$salary)] <- mean(dt$salary, na.rm=  T)
print(dt$salary)

#Capitalise each name
dt$faculty.name <- gsub("(^|[[:space:]])([[:alpha:]])", "\\1\\U\\2", dt$faculty.name, perl = TRUE)

print(dt)