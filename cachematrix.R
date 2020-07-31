## Put comments here that give an overall description of what your
## functions do
  ## My function intends to calculate the matrix
  ## of the data. Then, it gets the inverse matrix
  ## that you calculate before.

## Write a short comment describing this function
  ## The function "makeCacheMatrix" get and set the data,
  ## then it obtains the matrix using the "variable$get()" 
  ## and you can see the matrix with "variable$set(matrix(data, rows,
  ## collumns))". The function stored in the variables 
  ## "set_inverse" and "get_inverse" can give us the inverse matrix.
  ## But, for this you will nedd to load the function "cache solve".
  ## See the comments about "cacheSolve".

makeCacheMatrix <- function(x=numeric()) {
  i <- NULL
  set <- function(y) {
    x <<- y
    i <<- NULL
  }
  get <- function() x
  set_inverse <- function(inverse) i <<- inverse
  get_inverse <- function() i
  list(set = set, get = get,
       set_inverse = set_inverse,
       get_inverse = get_inverse)
}

## Write a short comment describing this function
  ## For you get the inverse matrix with data you load in
  ## "makeCacheMatrix", you would load the function "variable$get_inverse()"
  ## ("variable" is a example). But, you don't have the inverse matrix yet.
  ## You need to load this function "cacheSolve". This functon gives 
  ## the inverse matrix obtained in "makeCacheMatrix". It will obtain with 
  ## "solve()". When you load this function "cacheSolve", you get the inverse
  ## matrix calling "variable$get_inverse()".


cacheSolve <- function(x, ...) {
  ## Return a matrix that is the inverse of 'x'
  i <- x$get_inverse()
  if(!is.null(i)) {
    message("obtendo dados do cache")
    return(i)
  }
  mat_oficial <- x$get()
  i <- solve(mat_oficial, ...)
  x$set_inverse(i)
  i
}

  ## Now, you have the inverse matrix using both functions and calling
  ## "cacheSolve(variable)". Congratulations! 
  ##
  ## OBS.: The word "variable" in the comments, It's just a example. 
  ## Presuppose, you stored the "makeCacheVector" in a variable. 