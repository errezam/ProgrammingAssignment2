## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

makeCacheMatrix <- function(x = matrix()) {

  
  esta <- function() x
  inve <- NULL
  guarda <- function(solve) inve <<- solve
  busca <- function() inve
  list(esta = esta, guarda = guarda, busca = busca)
}

## Write a short comment describing this function

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
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
