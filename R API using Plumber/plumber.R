library(plumber)
library(randomForest)
#* return the input
#* 
#* @get /patrol

function(messg = ""){
  list(messg = paste0("Hi I am listening '", messg, "'"))
}

## Load the model
modellist = readRDS("irismodel.rds")

## Lets make the predictions

#* @param Sepal.Length
#* @param Sepal.Width
#* @param Petal.Length
#* @param Petal.Width
#* @get /predict
predictions <- function(Sepal.Length, Sepal.Width, Petal.Length, Petal.Width){
  Sepal.Length <- as.numeric(Sepal.Length )
  Sepal.Width <-  as.numeric(Sepal.Width)
  Petal.Length  <- as.numeric(Petal.Length)
  Petal.Width <-  as.numeric(Petal.Width)
  
  X.new <- data.frame(Sepal.Length= Sepal.Length,
                      Sepal.Width = Sepal.Width ,
                      Petal.Length=Petal.Length,
                      Petal.Width = Petal.Width )

  #predict based on input
  
  
  ##predict(iris_rf, new_data= X.new, type ="class")
  y.pred <- modellist$NewPredictions(model = modellist$modelobject, newdata = X.new)
  
  return(y.pred)
  
}


