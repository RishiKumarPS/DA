dt<-read.csv("q1.csv")

#Remove numbers and special characters
dt$stud.name <- gsub('[^a-zA-Z ]+', '', dt$stud.name)

#Remove excess whitespaces
dt$stud.name <- gsub("\\s+", " ", trimws(dt$stud.name))

#Remove NA
dt$cgpa <- replace(dt$cgpa, is.na(dt$cgpa) ,11.0)

#Handle Impossible characters like "-,%"
dt$cgpa <- gsub("-|%", "", dt$cgpa)
dt$cgpa <- as.numeric(dt$cgpa)

#Handle Impossible values
dt$cgpa <- replace(dt$cgpa, dt$cgpa<0.0 | dt$cgpa>10.0, NA)
dt$cgpa[is.na(dt$cgpa)] <- mean(dt$cgpa, na.rm=  T)

#Capitalise each name
dt$stud.name <- gsub("(^|[[:space:]])([[:alpha:]])", "\\1\\U\\2", dt$stud.name, perl = TRUE)

print(dt)