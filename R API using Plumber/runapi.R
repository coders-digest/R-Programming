setwd(dir = here::here())
r <- plumb(file = 'plumber.R')
r$run(port = 8000)