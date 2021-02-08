## IRIS DATA SET Prediction

library(dplyr)
library(randomForest)
data = iris
attach(data)


## Lets have a look at the data
#glimpse(data)

#Lets Build a Random forest model
iris_rf = randomForest(Species ~ Sepal.Length + Sepal.Width 
                       + Petal.Length +Petal.Width,
                       data = data, ntree = 100)


## Make a prediction function
NewPredictions <- function(model, newdata){
  new.predictions <- predict(object = model, newdata = newdata)
  return(new.predictions)
  
}

modellist <- vector(mode = 'list')
# Save fitted model here.
modellist$modelobject <- iris_rf
modellist$NewPredictions <- NewPredictions
saveRDS(object = modellist , file = 'irismodel.rds')


