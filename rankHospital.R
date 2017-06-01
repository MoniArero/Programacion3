rankhospital <- function(estado, resultado, num ="mejor"){
    setwd("~/GitHub/Programacion3/Calidad_de_hospitales")
    datos <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
    y<- unique(datos$State)
    
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
    
    MH <- nrow(info2)
    if ( num == "mejor"){
        num <- 1
    } else if (num == "peor"){
        num <- MH  
    } else if (num > MH){
        stop("NA")
    }
    rs <- info2[,2]==info2[num,2]
    rt<- info2[rs,]
    rf <- rt[order(rt[ ,1]),]
    mej <- rf[1,1]
    mej
}

