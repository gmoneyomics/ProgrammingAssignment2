## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

# my functions create a special "matrix" object that can cache its inverse and then cachesolve should retrieve the inverse from the cache

# first make a matrix tha can cache its inverse
# make input x a matrix 
# change all m to s for  solve, replace all mean function with solve function

makeCacheMatrix <- function(x = matrix(sample(1:50,2),4,4)) {
  s <- NULL
  set <- function(y) {
    x <<- y
    s <<- NULL
  }
  get <- function() x
  setmean <- function(solve) s <<- solve
  getmean <- function() s
  list(set = set, get = get,
       setsolve = setsolve,
       getsolve = getsolve)
}

# then retrieve the inverse from the cache if  it is  there
# also change mean to solve and m to s
cachemean <- function(x, ...) {
  m <- x$getsolve()
  if(!is.null(s)) {
    message("get inverse matrix")
    return(s)
  }
  data <- x$get()
  s <- solve(data, ...)
  x$setsolve(s)
  s
}
