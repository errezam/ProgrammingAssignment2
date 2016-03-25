## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

makeCacheMatrix <- function(x = matrix()) {
## This function creates another object with four new functions: 
## set() stores a matrix.
## esta() shows the matrix cached.
## guarda() stores the inverse of the matrix.
## busca() retrieves the inverse of the matrix if cached.
  
  esta <- function() x
  inve <- NULL
  guarda <- function(solve) inve <<- solve
  busca <- function() inve
  list(esta = esta, guarda = guarda, busca = busca)
  
  inve <- NULL
  set <- function(y) {
    esta <<- y
    inve <<- NULL
  }
  esta <- function() esta
  guarda <- function(solve) inve <<- solve
  busca <- function() inve
  list(set = set, esta = esta, guarda = guarda, busca = busca)
}

## Write a short comment describing this function

cacheSolve <- function(x, ...) {
## Check within and object made with makeCacheMatrix if an inverse has been
## calculated if it has, returns the cached inverse matrix. If it hasn't 
## calculates the inverse, stores and returns the result
  
  inve <- x$busca()
  if(!is.null(inve)) {
    message("getting cached data")
    return(inve)
  }
  data <- x$esta()
  inve <- solve(data)
  x$guarda(inve)
  inve
}
