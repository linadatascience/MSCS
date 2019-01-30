setwd("C:/Users/milin/Registered_Courses_2017_Spring/intro_to_Data_Science/project_data/")
#pdf("allfigs.pdf", width=15, height=8.5)
##data process
dat<-read.csv("kc_house_data.csv")


dates<-gsub("T[0-9]+$","", dat$date)
dates<-as.Date(dates, format="%Y%m%d")
daten<-as.numeric(dates-min(dates))

dat<-data.frame(dat, daten=daten)
dat<-dat[order(dat$id, -dat$daten), ] ##sort dat by ids first, then by daten

##The dat id has duplicated
ids <- dat[,1]
##remove records with duplicated ids, only the most recent one retained.
dat<-dat[!duplicated(dat$id), ]  ###this will remove the duplicated record,

yrs<-dat$yr_renovated
yrs[yrs==0]<-dat$yr_built[dat$yr_renovated==0]

dat <-data.frame(dat, nyrs_since_last_renovation=as.numeric(2015-yrs))
##here we have converted the yr_renovated to a continous variable named nyrs_since_last_renovation
##This way, we  use the number of years from most recent renovation to today's year (2015).
##if there was no renovation, the value will be 2015, a little arbituary but  much larger than when there was an innotation.



ycol<-"price"
xcols<-c('bedrooms', 'bathrooms', 'sqft_living', 'sqft_lot', 'floors', 'waterfront', 'view',
 'condition', 'grade', 'sqft_above', 'sqft_basement', 'yr_built',
 'nyrs_since_last_renovation', 'zipcode', 'sqft_living15', 'sqft_lot15','daten')
 
datfinal<-data.frame(price=dat$price, dat[, xcols])
for(i in 1:ncol(datfinal)) datfinal[, i]<-as.numeric(datfinal[,i])
datfinal$zipcode<-as.factor(datfinal$zipcode)       ##make zipcode as a  factor variable.

##Toc heck the data set just generated see
#  str(datfinal)
#'data.frame':   21436 obs. of  17 variables:
# $ price                     : num  280000 647500 400000 235000 402500 ...
# $ bedrooms                  : num  6 4 3 3 4 4 5 4 3 4 ...
# $ bathrooms                 : num  3 1.75 1 1 2 2.75 1.5 2.5 1 2 ...
# $ sqft_living               : num  2400 2060 1460 1430 1650 2220 1990 2540 1340 1980 ...
# $ sqft_lot                  : num  9373 26036 43000 7599 3504 ...
# $ floors                    : num  2 1 1 1.5 1 1 1 2 1.5 1.5 ...
# $ waterfront                : num  0 0 0 0 0 0 0 0 0 0 ...
# $ view                      : num  0 0 0 0 0 0 0 0 0 0 ...
# $ condition                 : num  3 4 3 4 3 5 3 3 4 2 ...
# $ grade                     : num  7 8 7 6 7 7 7 9 5 6 ...
# $ sqft_above                : num  2400 1160 1460 1010 760 1170 1990 2540 1340 1980 ...
# $ sqft_basement             : num  0 900 0 420 890 1050 0 0 0 0 ...
# $ yr_built                  : num  1991 1947 1952 1930 1951 ...
# $ nyrs_since_last_renovation: num  2017 2017 2017 2017 4 ...
# $ zipcode                   : Factor w/ 70 levels "98001","98002",..: 2 64 64 65 60 60 67 47 21 31 ...
# $ sqft_living15             : num  2060 2590 2250 1290 1480 1540 1860 2360 1340 1360 ...
# $ sqft_lot15                : num  7316 21891 20023 10320 3504 ...
#
##To check the collinearity between the variables
pairs(datfinal[, xcols])
pairs(datfinal[, xcols[1:4]])
 ##some highly correlated covariables.  This means that ordinary multiple regession will fail
##to check the marginal significance to the price
par(mfrow=c(1,2), mai=rep(1,4))
y<- datfinal$price
plot(density(y), "Price before log10 transform")
y<-log10(datfinal$price)
plot(density(y), "Price after log10 transform")
##This suggests the need to log10 transform theprice, since after transform, the price looks more normally distributed.

##marginal analysis for each x variables.
par(mfrow=c(3,3), mai=rep(0.5,4), mgp=c(1.4,0.5,0), cex=1)
for(i in 1:length(xcols)){
   x<-datfinal[, xcols[i]]
   if(is.numeric(x)&length(unique(x))>10){
     plot(x, y, col=2, cex=1.5,xlab=xcols[i], ylab="log10price")
     abline(lm(y~x), col=3, lwd=2)
     title(paste("cor=", signif(cor(x,y),3), sep=""))
   }else{
     x<-as.factor(x)
     b<-boxplot(y~x, col=2, xlab=xcols[i], ylab="log10price")
     stripchart(y ~ x, vertical = TRUE, pch=1, add = TRUE)    ##add points to boxplot..
   }
}



##now fit a LASSO model. Unlike ordinary model, lasso model allows to input the variable as many as you like
##and allows collinearity variables as well. The model will automatically find a most concise model to keep by seting the coefficeint of non-important one s as 0.

train_ids<-sample(1:nrow(datfinal), round(nrow(datfinal)*0.7)) ###70% samples to build the mode,
test_ids <-setdiff(1:nrow(datfinal), train_ids)

dattrain<-datfinal[train_ids, ]
dattest<-datfinal[test_ids, ]

###########################################################
##model on the train set.
library(glmnet) ##alpha=1 lasso model  alpha=0, ridge regression.
y    <-  log10(datfinal$price)
modx    <-  model.matrix(~., datfinal[, -1])[, -1] ##no intercept term in modx
##To get cross validated parameter lambda in the LASSO model needed for regression.
cvs  =  cv.glmnet(x=modx[train_ids, ],y=y[train_ids],  alpha=1)
lam<- cvs$lambda.1se  ##To get the best lambda value
#lam 0.0002873867

fits<-glmnet(x=modx[train_ids, ],y=y[train_ids],  alpha=1, lambda=lam)


predtrain<- predict(fits, newx=modx[train_ids, ], type="response")
predtest<-predict(fits, newx=modx[test_ids, ], type="response")

##plot for the true y value and predicted values.
par(mfrow=c(1,2), mai=rep(1,4))
plot(y[train_ids], predtrain, xlab="True price in log10",
 ylab="Predicted price in log10", main=paste("train set, n=", length(train_ids), sep=""))
lm1<-lm(predtrain~y[train_ids])
abline(lm(predtrain~y[train_ids]), col=2, lwd=2)
legend("topleft", legend=paste("R2=",signif(summary(lm1)$r.squared,2)))
plot(y[test_ids], predtest, xlab="True price in log10",
  ylab="Predicted price in log10", main= paste("Test set, n=",length(test_ids),sep=""))
abline( lm(predtest~y[test_ids]), col=2, lwd=2)
lm2<-lm(predtest~y[test_ids])
legend("topleft", legend=paste("R2=",signif(summary(lm2)$r.squared,2)))

#dev.off()

###to display the non-zero coefficents.
coefs = sort(coef(fits,s=lam)[-1,1])
keptTerms<-names(coefs)[coefs!=0]
coefs<-coefs[keptTerms]
out<-data.frame(coefs)
write.csv(out, file="coefs.output.csv")

#








