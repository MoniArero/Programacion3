setwd("~/Github/Programacion3/UCI HAR Dataset")


pruebaX <- read.table("test/X_test.txt")
pruebaY <- read.table("test/Y_test.txt")
pruebaZ <- read.table("test/subject_test.txt")

trainX <- read.table("train/X_train.txt")
trainY <- read.table("train/Y_train.txt")
trainZ <- read.table("./train/subject_train.txt")

infoX <- rbind(trainX, pruebaX)
infoY <- rbind(trainY, pruebaY)
infoZ <- rbind(trainZ, pruebaZ)

remove(trainX,trainY,trainZ,pruebaX,pruebaY,pruebaZ)

features<- read.table("features.txt")[,2]
colnames(infoX) <- features
medias <- grep('-(mean|std)\\(',features) 
infoX <- subset(infoX,select=medias) 

colnames(infoX) <- gsub("mean", "Mean", colnames(infoX))
colnames(infoX) <- gsub("std", "Std", colnames(infoX))
colnames(infoX) <- gsub("t", "Time", colnames(infoX))
colnames(infoX) <- gsub("f", "Frequency", colnames(infoX))
colnames(infoX) <- gsub("\\(\\)", "", colnames(infoX))
colnames(infoX) <- gsub("-", "", colnames(infoX))
colnames(infoX) <- gsub("BodyBody", "Body", colnames(infoX))
colnames(infoX) <- gsub("^", "MeanOf", colnames(infoX))
colnames(infoX)


act_train <- read.table(paste("train/y_train.txt"))
act_test <- read.table(paste("test/y_test.txt"))
act <- rbind(act_train,act_test)[,1]
labels <- c("WALKING", "WALKING_UPSTAIRS", "WALKING_DOWNSTAIRS",
            "SITTING", "STANDING", "LAYING")

act <- labels[act]
infoX <- cbind(Act = act,infoX)

v_train <- read.table(paste("train/subject_train.txt"))
v_test <- read.table(paste("test/subject_test.txt"))
v <- rbind(v_train,v_test)[,1]
infoX <- cbind(V = v,infoX) 

library(dplyr) 
prom_data_set <- infoX %>% group_by(V,Act) %>% summarise_each(funs(mean))
write.table(prom_data_set,row.name = FALSE,file = "datos_set.txt")    

