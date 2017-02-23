# Clase de 16/02/2017
x <- 1
print(x)
x
msg <- "Hola"
msg
X <- #esta expresión está inclompleta
  

x <- 1:20
x

a <- 1
b <- 1L

#Creación de vectores

#Con la funcion vector
mi_vector <- ("integer",5)

#Con la función c
x1 <- c(0.5,0.6)
x2 <- c(TRUE,FALSE)
x3 <- c(T,F)
x4 <- c("a","b","c")
x5 <- 9:29
x6 <- c(2+1i, 3-5i, 3.14+1.186i)
y <- c(1.7,"a")
y1 <- c(TRUE,2)
y2 <- c("a",TRUE)

z <- 0:6
q <-c(3.14,4.76,2.14,9.9)

#Con lista
w<- list(1,"a",TRUE,1+4i)
w
p<- list(1,"a",TRUE,1+4i,1:100)
p

#Con la funcion Matrix m
m <- matrix(nrow = 2,ncol = 3)
m
dim(m)
attributes(m)
n <- matrix(1:6, nrow = 2, ncol = 3, byrow = TRUE)
n

ñ <- 1:10
ñ
dim(ñ) <- c(2,5)
ñ

ñ <- 1:10
ñ
dim(ñ) <- c(5,2)
ñ

a <- 1:3
b <- 10:12
cbind(a,b)

rbind(a,b)

x <- c(1,2,NA,10,3,NaN)
is.na(x)
is.nan(x)


x <-data.frame(foo=1:4, bar=c(T,T,F,T))
x
nrow(x)
ncol(x)

x <- 1:3
names(x)
names(x) <- c("foo","bar","biz")
names(x)

y <- 1:6
y
dim(y) <- c(2,3)
y


x <- list(a=1, b=2, c=3)
x

t <- list(1,2,3)
t

m <- matrix(1:4,2,2)
m
dimnames(m)
dimnames(m)<-list(c("a","b"),c("c","d"))
m




