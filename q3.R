dt<-read.csv("C:/Users/ksaiv/Downloads/rstudio-export/q3.csv")
dt

#Remove numbers and special characters
dt$dept.name <- gsub('[^a-zA-Z ]+', '', dt$dept.name)
dt
#Handle Impossible characters like letters in no_of_staff
dt$staff.count <- gsub("[^0-9]+", "", dt$staff.count)
dt$staff.count <- replace(dt$staff.count,"",NA)
dt$staff.count <- as.numeric(dt$staff.count)

#If NA fill with average
dt$staff.count[is.na(dt$staff.count)] <- mean(dt$staff.count, na.rm=  T)
#Remove excess whitespaces
dt$dept.name <- gsub("\\s+", " ", trimws(dt$dept.name))
dt

#Outlier removal
Q1 <- quantile(dt$pub.count, .25)
Q3 <- quantile(dt$pub.count, .75)
IQR <- IQR(dt$pub.count)
dt <- subset(dt, pub.count > (Q1 - 1.5*IQR) & dt$pub.count < (Q3 + 1.5*IQR))


#Capitalise each name
dt$dept.name <- gsub("(^|[[:space:]])([[:alpha:]])", "\\1\\U\\2", dt$dept.name, perl = TRUE)

print(dt)