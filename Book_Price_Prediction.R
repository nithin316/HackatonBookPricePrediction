# import data file
library(readxl)
Data_Train <- read_excel("C:/Users/hp/Desktop/Hackaton_Book_Price_Prediction/Data_Train.xlsx")
#View(Data_Train)

# Initial assessment
str(Data_Train)
dim(Data_Train)
summary(Data_Train)

#checking for null values
library(naniar)
vis_miss(Data_Train)
colSums(is.na(Data_Train))

typeof(Data_Train)
Data_Train<-data.frame(Data_Train)

M1<-lm(Price ~ Title + Author + Edition + Reviews + Ratings +Synopsis + Genre + BookCategory, data = Data_Train)
summary(M1)

Data_Test <- read_excel("C:/Users/hp/Desktop/Hackaton_Book_Price_Prediction/Data_Test.xlsx")
Data_Test=as.data.frame(Data_Test, stringsAsFactors = TRUE)
str(Data_Test)
typeof(Data_Test)
Data_Test$Sale_Price<-predict(M1,Data_Test)
write.csv(Data_Test,"F:/Data Science/Week4/Property_Price_Test_updated.csv")


