rankingcompleto <- function(resultado, num = "mejor"){
  setwd("~/GitHub/Programacion3/Calidad_de_hospitales")
  datos <- read.csv("outcome-of-care-measures.csv")
  y<- levels(datos$State)
  
  if(resultado == "ataque"){
     x <-11
  }  else if( resultado == "falla") {
    x <- 17
  }  else if(resultado == "neumonia"){
    x <- 23
  }  else if (!resultado %in%  resultado==F){
    stop("resultado invalido")
  }

  datos[, x] <- suppressWarnings(as.numeric(levels(datos[, x])[datos[, x]]))
  datos[, 2] <- as.character(datos[, 2])
  mejor <- vector() 
  Edo <- y
  for(i in 1:length(Edo)) {
      est <- grep(Edo[i], datos$State)
      estado <- datos[est, ]
      ord <- order(estado[, x], estado[, 2], na.last = NA)
      orden <- estado[ord, ]
    
      if(num == "mejor"){
          nom <- or[1, 2]
      } else if(num == "peor"){
          nom <- orden[nrow(orden), 2]
      }else{
          nom <- orden[num, 2]
      }
      info <-  c(nom, Edo[i])
      mejor <- append(mejor,info)
  }
  matriz <- matrix(mejor, length(Edo), 2, byrow = TRUE)
  mejor <- as.data.frame(matriz)
  colnames(mejor) <- c("Hospital", "Estado")
  rownames(mejor) <- Edo
  mejor
}

 head(rankingcompleto("ataque", 20), 10)
 