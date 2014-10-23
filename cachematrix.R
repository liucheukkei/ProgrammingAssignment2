## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

makeCacheMatrix <- function(x = matrix()) {

	## initiate the variable inverse as NULL
	inverse <- NULL

	## reset the matrix variable 'x' with the 'y' and reset inverse in cache to NULL
	set <- function(y) {
		x <<- y
		inverse <<- NULL
	}

	## for retrieving the matrix only
	get <- function() x

	## save the inverse in cache. Inverse matrix has to be provided though
	setinverse <- function(inv) inverse <<- inv

	## return the inverse in cache
	getinverse <- function() inverse
	list(set=set, get=get,
		setinverser=setinverse,
		getinverse=getinverse)

}


## Write a short comment describing this function

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'

	## Check if the inverse is in the cache. If so, return it.

	inverse <- x$getinverse()
	if(!is.null(inverse)) {
		message("getting cached data")
		return(inverse)
	}

	## if the inverse can't be found in the cache, then execute the code below
	## this section calculate the inverse and cache it using function within makeCacheMatrix

	inverse <- solve( x$get() )
	x$setinverse(inverse)
	inverse

}
