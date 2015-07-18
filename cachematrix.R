## coursera.org :: R Programming :: Assignment # 2
## by ihtiihti
## Git: https://github.com/ihtiihti/ProgrammingAssignment2
##
## A set of functions those cache inverted matrix in memory thus minimise calculations
##  every time when inverted matrix value is needed.

## Make Cached Matrix
##  The function creates a special vector that stores:
##      * matrix
##      * cached inverted matrix
##  The special vector has the following functions:
##      * set -- set a new matrix
##      * setinverted -- store inverted matrix into the cache
##      * get -- get matrix
##      * getinverted -- get inverted matrix from the cache
# # Examples how to use:
##  (1) create a new special vector with default matrix (0 rows, 0 columns)
##      mx <- makeCacheMatrix()
##  (2) create a new special vector with matrix (2 rows, 2 columns)
##      mx <- makeCacheMatrix(matrix(c(1, -3, 4, 11), 2, 2))
makeCacheMatrix <- function(x = matrix()) {
    # Cache where an inverted matrix is stored.
    #   By default, the cache is empty.
    cache <- NULL

    # Set a new matrix and clear cached data
    set <- function(x) {
        x <<- x
        cache <<- NULL
    }

    # Get matrix value
    get <- function() {
        x
    }

    # Set a new inverted matrix into the cache
    setinverted <- function(inverted) {
        memory <<- inverted
    }

    # Get inverted matrix value from the cache.
    getinverted <- function() {
        cache
    }

    ## Return a instance of the special vector (interface)
    list(
        set = set,
        get = get,
        setinverted = setinverted,
        getinverted = getinverted
    )
}


## Cache Inverted Matrix
##  The function utilises of the interface of the special vector
##      created by `makeCacheMatrix' function.
##  If the special vector has already a cached inverted matrix then the function returns
##      the data stored in the cache, in other case, the function calculates inverted
##      matrix, stores it into the cache and returns obtained value.
##  Ellipses data are propagated into `solve' function that calculates
##      inverted matrix value.
##  Examples how to use:
##      cacheSolve(v)
##        provided that v — is the vector created by `makeCacheMatrix’ function
cacheSolve <- function(x, ...) {
    cache <- x$getinverted()
    if(!is.null(cache)) {
        message("getting cached data")
        return(cache)
    }
    data <- x$get()
    cache <- solve(data, ...)
    x$setinverted(cache)
    cache
}
