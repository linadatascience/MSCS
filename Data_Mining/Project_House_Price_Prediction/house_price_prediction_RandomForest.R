install.packages(c("lubridate","GGally","ggplot2","hydroGOF","mvtnorm"))
install.packages("car")
install.packages("pbkrtest")
install.packages("randomForest")

## Initialization and Data Reads
library(lubridate)
library(GGally)
library(ggplot2)
library(hydroGOF)
library(mvtnorm)
library(car)
library(randomForest)

getwd()
setwd("M:/milina/Registered_Courses_2018_Spring/Data Mining/project/")
getwd()

house_data<-read.csv("kc_house_data.csv", header = TRUE, sep = ",")
head(house_data)
str(house_data)
#check if there are some missing values in the dataset or not
num_na=sum(is.na(house_data))
if(num_na > 0)
{
  cat('Number of missing values: ', num_na)
  cat('\nRemoving missing values...')
  house_data = house_data[complete.cases(house_data), ]
}
#convert date attribute into numberic data type as we can only use numeric values for corrleation
date_tem<-gsub("T[0-9]+$","",house_data$date)
date_tem<-as.Date(date_tem,format = "%Y%m%d")
date_num<-as.numeric(date_tem-min(date_tem))
house_data$date<-date_num

#check if there are duplicated id, if there are, then remove the observations with duplicated id
num_id_dupli=sum(duplicated(house_data$id))
if(num_id_dupli>0){
  house_data<-house_data[order(house_data$id, -house_data$date), ] #sort the dataset by id first,then by date
  house_data<-house_data[!duplicated(house_data$id), ]#this will remove the duplicated record
}
sum(duplicated(house_data$id)) # check if all observations with the duplicated id are removed or not


##here we have converted the yr_renovated to a continous variable named nyrs_since_last_renovation

##This way, we  use the number of years from most recent renovation to today's year (2015).
##if there was no renovation, the value will be 2015, a little arbituary but  much larger than when there was an innotation.
#change the attribute of yr_renovated to attribute nyrs_since_last_renovation
yrs<-house_data$yr_renovated
yrs[yrs==0]<-house_data$yr_built[house_data$yr_renovated==0]

house_data <-data.frame(house_data, nyrs_since_last_renovation=as.numeric(2015-yrs))
house_data$zipcode<-as.factor(house_data$zipcode) ##make zipcode as a  factor variable.

##some highly correlated covariables.  This means that ordinary multiple regession will fail
##to check the marginal significance to the price
par(mfrow=c(1,2), mai=rep(1,4))
y<- house_data$price
plot(density(y), "Price before log10 transform")
y<-log10(datafinal$price)
plot(density(y), "Price after log10 transform")
##This suggests the need to log10 transform theprice, since after transform, the price looks more normally distributed.
house_data$price<-log10(house_data$price) 

ycol<-"price"
xcols<-c('date', 'bedrooms', 'bathrooms', 'sqft_living', 'sqft_lot', 'floors', 'waterfront', 'view',
         'condition', 'grade', 'sqft_above', 'sqft_basement', 'yr_built',
         'nyrs_since_last_renovation', 'zipcode', 'sqft_living15', 'sqft_lot15')
datafinal<-data.frame(price=house_data$price, house_data[, xcols])
write.csv(datafinal, "finaldataset.csv", append = FALSE,col.names = TRUE) ## save preprocessed dataset as final dataset 
##To check the collinearity between the variables
ggcorr(datafinal,label=TRUE,label_alpha = TRUE,label_round = 2,label_size = 3,label_color = "black",hjust =1,size = 3)



##splitting dataset into training dataset, and the left as testing dataset
set.seed(1234)
ids<-sample(2,nrow(datafinal),prob=c(0.70,0.30),replace=TRUE) ###70% samples to build the mode,
train_data<-datafinal[ids==1,]
test_data<-datafinal[ids==2,]
str(train_data)

##now fit the random forest model
model_rf<-randomForest(price ~ .,train_data,mtry=6,importance=TRUE)
summary(model_rf)
importance(model_rf)
varImpPlot(model_rf,type=2)

#predict with random forest model
test_data$pred<-predict(model_rf,test_data)
res<-test_data$pred-test_data$price
rmse<-sqrt(mean(res^2))
rmse

#Plotting the actual and predicted
ggplot(test,aes(x=price,y=pred))+geom_point()+geom_abline(color="blue")

