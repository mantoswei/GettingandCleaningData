##The first function, makeVector creates a special "Matrix", which is really a list cotaining
##a function to 
##1,get the value of the matrix 
##2, get the value of the matrix 
##3, set the value of the inversion 
##4,get the value of the inversion


makeCacheMatrix <- function(x = matrix()) {
  m<-NULL
  setM<-function(y){
    x<<-y
    m<<-NULL
  }
  get<-function()x
  setinverse<-function(solve) m<<-solve
  getinverse<-function()m
  list(set=set, get=get, setinverse=setinverse, getinverse=getinverse)
  
  
}
## The following calculates the mean of the special"Matrix" created with
## the above function.
## It first checks to see if the inversion has already been calculated. If so, 
## it get the inversion from the cahce and skips the computation.
## Otherwise, it calculates the inversion of the matrix and sets the value 
## of the inversion in the cache via the setinverse function.
cacheSolve <- function(x, ...) {
  m<-x$getinverse()
  if(!is.null(m)){
    message("getting cached data")
    return(m)
  }
  data<- x$get()
  m<-solve(data,...)
  x$setinverse(m)
  m
}
## Return a matrix that is the inverse of 'x'
