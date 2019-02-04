install.packages(c("lubridate","GGally","ggplot2","hydroGOF","mvtnorm"))
install.packages("car")
install.packages("pbkrtest")

## Initialization and Data Reads
library(lubridate)
library(GGally)
library(ggplot2)
library(hydroGOF)
library(mvtnorm)
library(car)


getwd()
setwd("C:\\Users\\Radhika\\Desktop\\CS Syllabus\\Data science Project\\")
getwd()
kchd <- read.csv("kc_house_data.csv")
head(kchd)
str(kchd)
# Changing date to yyyymmdd format
kchd$date = substr(kchd$date, 1, 8)
head(kchd)
str(kchd)
# Converting it to numeric as we can only use numeric values for corrleation
kchd$date = as.numeric(as.character(kchd$date))
#-------------------------------------------------
# Check for NA and missing values
# is.na return a vector with value T for missing values.
numberOfNA = length(which(is.na(kchd) == T))
if(numberOfNA > 0)
{
  cat('Number of missing values: ', numberOfNA)
  cat('\nRemoving missing values...')
  kchd = kchd[complete.cases(kchd), ]
}
numberOfNA
#-------------------------------------------------
# Removing columns id as we do not need it
kchd$id = NULL
#--------------------------------------------------

## Checking Relationship between price, bedrooms, bathrooms, sqft_living and sqft lot
#plot1<-ggpairs(data=kchd_Training, columns=3:7,
#               mapping = aes(color = "dark green"),
#               axisLabels="show")
#plot1
#--------------------------------------------------
# we need to plot the correlation between the variables. Once we get how strong the pairs are associated we can ignore the variables
# which have least effect on the price. For this we will use ggcorr to get the correlation plot.
# Finding correlation
# Correlation is a statistical measure that suggests the level of linear dependence between two variables
# that occur in pair. 
# Its value is between -1 to +1
# Above 0 is positive correlation i.e. X is directly proportional to Y.
# Below 0 is negative correlation i.e. X is inversly proportional to Y.
# Value close to 0 suggests weak relation.

# Picking up some of the features that are highly correlated with price
# Correlation between price and sqft_living is (0.7)
# Correlation between price and grade is (0.67)
# Correlation between price and sqft_above is (0.61)
# Correlation between price and sqft_living15 is (0.59)
# Correlation between price and bathrooms is (0.53)

# Now, let us evaluate the correlation of the below features with each others for multicolinearity.
# We would do this later by calculating VIF
# Correlation between sqft_living and sqft_above is (0.88)
# Correlation between sqft_living and sqft_living15 is (0.76)
# Correlation between sqft_living and grade is (0.76)
# Correlation between sqft living and bathrooms is (0.75)
# We would keep grade as of now as it is a category.

# Following have weak relation with price and we would remove them.
# date, sqft_lot, yr_built, long, sqft_lot15
# We would delete lat as well even though it has correlation of 0.31
# because, 0.31 is not that significant. It is a category.
# If we would convert it to factor, there would be way too many levels 
# and would make computation very expensive.

# Another reason to remove variable is to avoid overfitting.


ggcorr(kchd,label=TRUE,label_alpha = TRUE,label_round = 2,label_size = 3,label_color = "black",hjust =1,size = 3)

# If we look at the price and its correlation with other variables we can see that:
# Correlation between price and sqft_living is (0.7)
# Correlation between price and grade is (0.67)
# Correlation between price and sqft_above is (0.61)
# Correlation between price and sqft_living15 is (0.59)
# Correlation between price and bathrooms is (0.53)

# This represent positive and strong correlation with price.
# Now we need to check Multicolinearity  of the above factors with other atributes.
# Correlation between sqft_living and sqft_above is (0.88)
# Correlation between sqft_living and sqft_living15 is (0.76)
# Correlation between sqft_living and grade is (0.76)
# Correlation between sqft living and bathrooms is (0.75)
# Correlation between grade and sqft_above is (0.76)
# Correlation between grade and sqft_living15 is (0.71)
# Correlation between sqft_above and sqft_living15 is (0.73)
# Correlation between bathrooms and floors is (0.5)
# Correlation between bathrooms and grade is (0.66)
# Correlation between bathrooms and sqft_above is (0.69)
# Correlation between bathrooms and yr_built is (0.51)
# Correlation between bathrooms and sqft_living15 is (0.57)

# Check VIF for sqft_living and sqft_above. Their correlation was 0.88
model = lm(formula = price ~ sqft_living + sqft_above,
           data = kchd)
summary(model)
vif(model)
# vif is close to 4 and correlation of sqft_living with price is better.
# So we would remove sqft_above.

# Check VIF for sqft_living and sqft_living15. Their correlation was 0.76
model = lm(formula = price ~ sqft_living + sqft_living15,
           data = kchd)
summary(model)
vif(model)

# Check VIF for sqft_living and grade. Their correlation was 0.76
model = lm(formula = price ~ sqft_living + grade,
           data = kchd)
summary(model)
vif(model)

# Check VIF for sqft_living and bathrooms. Their correlation was 0.75
model = lm(formula = price ~ sqft_living + bathrooms,
           data = kchd)
summary(model)
vif(model)

# Check VIF for grade and sqft_living15. Their correlation was 0.71
model = lm(formula = price ~ grade + sqft_living15,
           data = kchd)
summary(model)
vif(model)

# Check VIF for bathrooms and floors. Their correlation was 0.5
model = lm(formula = price ~ bathrooms + floors,
           data = kchd)
summary(model)
vif(model)

# Check VIF for bathrooms and grade. Their correlation was 0.66
model = lm(formula = price ~ bathrooms + grade,
           data = kchd)
summary(model)
vif(model)

# Check VIF for bathrooms and yr_built. Their correlation was 0.51
model = lm(formula = price ~ bathrooms + yr_built,
           data = kchd)
summary(model)
vif(model)

# Check VIF for bathrooms and sqft_living15. Their correlation was 0.57
model = lm(formula = price ~ bathrooms + sqft_living15,
           data = kchd)
summary(model)
vif(model)

# From the above correlation with price and VIF we will ignore the least contributing attriute:
# date,sqft_lot,sqft_lot15,long,sqft_above,yr_built, zip_code.
# We are ignoring lat also as this is a county and latitude spread is not too big to be significant.
# Based on correlation value condition should also be ignored but any purchaser would consider
# house condition an important factor while purchasing.

# setting the above attributes to null

kchd$date = NULL
kchd$sqft_lot = NULL
kchd$floors= NULL
kchd$waterfront = NULL
kchd$condition = NULL
kchd$yr_built = NULL
kchd$yr_renovated = NULL
kchd$lat = NULL
kchd$long = NULL
kchd$zipcode = NULL
kchd$sqft_above = NULL
kchd$sqft_lot15 = NULL

# Lets see the distribution of price.
hist(kchd$price)

#Histogram of price is skewed. Lets make it uniform.
kchd$price = log(kchd$price)

hist(kchd$price)

str(kchd)
summary(kchd)

# --------------------------------------------
# we will do some data corrections now.
# check max values for all attributes from summary and print their data.
print(subset(kchd, kchd$price == 7700000))
print(subset(kchd, kchd$bedrooms == 33))
kchd = kchd[kchd$bedrooms < 33, ]
table(kchd$bedrooms)
print(subset(kchd, kchd$bedrooms == 10)) 
print(subset(kchd, kchd$bathrooms == 8))
print(subset(kchd, kchd$sqft_living == 13540))
print(subset(kchd, kchd$floors == 3.5))
print(subset(kchd, kchd$waterfront == 1))
print(subset(kchd, kchd$grade == 13))
print(subset(kchd, kchd$condition == 5))

# Rest data seems reasonable.

# Splitting the Data Set 
#ratio = sample(1:nrow(kchd), size = 0.20*nrow(kchd))
#kchd_Test = kchd[ratio,] #Test dataset 20% of total
#kchd_Training = kchd[-ratio,] #Train dataset 80% of total
#head(kchd_Training)
#str(kchd_Training)

# we will train with different models to see the performance
install.packages("caret")
install.packages("tidyselect")

library(caret)

kchd1 <- kchd
target <- kchd$price
kchd1$price = NULL

# training models reference:
# Model	Model_type	Tuning_parameters
# mod_glm	generalized linear	None
# mod_glmnet	regularized generalized linear	alpha, lambda
# mod_tree	random forest	mtry
# mod_elastic	regularlized lasso ridge	fraction, lambda
# mod_leap_back	linear regression with backward selection	nvmax
# mod_reg_rf	regularized random forest	mtry, coefReg
# mod_svm	SVM with linear kernel	cost
# mod_gbm	stochastic gradient boosting	n.trees, interaction.depth, shrinkage, n.minobsinnode
# mod_bnet	bayesian neural networks	neurons

flds <- createFolds(y = target, k = 8)
# Set up custom trainControl
my_contrl <- trainControl(
  verboseIter = TRUE,
  savePredictions = TRUE,
  index = flds
)

data_cols <- ncol(kchd1)
glmnet_grid <- expand.grid(alpha = 0:1, lambda = seq(0.0001, 1, length = 20))
rrf_grid <- expand.grid(coefReg = seq(0.5, 0.9, 0.1), mtry = seq(round(data_cols/6), round(data_cols/2), 2 )  )
enet_grid <- expand.grid(lambda = seq(0, 0.1, 0.02), fraction = seq(0.05, 1, 0.19))

model1 <- train(x = kchd1, y = target, method = "glm", trControl = my_contrl, 
                preProcess = c("center", "scale"))
model2 <- train(x = kchd1, y = target, tuneGrid = glmnet_grid, method = "glmnet", 
                trControl = my_contrl)
model3 <- train(x = kchd1, y = target, method = "ranger", trControl = my_contrl)
model4 <- train(x = kchd1, y = target, tuneGrid = enet_grid, method = "enet", 
                trControl = my_contrl)
model5 <- train(x = kchd1, y = target, method = "leapBackward", trControl = my_contrl, 
                preProcess = c("center", "scale"))
model6 <- train(x = kchd1, y = target, tuneGrid = rrf_grid, method = "RRFglobal", 
                trControl = my_contrl)
model7 <- train(x = kchd1, y = target, method = "svmLinear2", trControl = my_contrl, 
                preProcess = c("center", "scale"))
model8 <- train(x = kchd1, y = target, method = "gbm", trControl = my_contrl)
model9 <- train(x = kchd1, y = target, method = "brnn", trControl = my_contrl)

model_list <- list(mod_glm = model1, mod_glmnet = model2, mod_tree = model3, 
                   mod_elastic = model4, mod_leap_back = model5, mod_reg_rf = model6, mod_svm = model7, 
                   mod_gbm = model8, mod_bnet = model9)

mod_resamples <- resamples(model_list)
print(summary(mod_resamples))

dotplot(mod_resamples, metric = "Rsquared")

dotplot(mod_resamples, metric = "RMSE")
# more work needs to be done to reduce RMSE on random forest model and neural network



