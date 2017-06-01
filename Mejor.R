mejor <- function(estado, resultado){
    setwd("~/GitHub/Programacion3/Calidad_de_hospitales")
    datos <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
    y<- unique(datos$State)
    #res <- factor(c("ataque", "falla", "neumonia"))
    if (!estado %in% y ){
        stop("estado invalido")
        
    } 
    if(resultado == "ataque"){
        x <-11
    }  else if( resultado == "falla") {
        x <- 17
    }  else if(resultado == "neumonia"){
        x <- 23
    }  else if (!resultado %in%  resultado==F){
        stop("resultado invalido")
    }
    
    
    Edo <- datos[datos$State == estado,]
    info <- Edo[, c(2, x)]
    cal <- suppressWarnings(as.numeric(info[,2]))
    orden <- order(cal, na.last = NA)
    info2 <- info[orden, ]
    mej<-info2[which.min(info2[, 2]), 1]
    mej
    
} 
