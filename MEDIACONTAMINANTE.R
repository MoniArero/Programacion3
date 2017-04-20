
mediacontaminante <- function(directorio, contaminante, id= 1:322){
    setwd(directorio)
    informacion<- numeric()
    datos <- numeric()
    for(n in  id){
        j <- read.csv(paste(formatC(n, width = 3, flag= "0")
                            ,".csv", sep=""),header =TRUE)
        
        if (contaminante == "nitrate"){
            informacion <- c(informacion, j$nitrate)
            promedio <- mean(informacion, na.rm = TRUE)
            
        } else if (contaminante== "sulfate"){
           datos <- c(datos, j$sulfate) 
           promedio <- mean(datos, na.rm = TRUE)
        }

        
    }
    
    promedio   
}
mediacontaminante("~/GitHub/programacion3/specdata", "nitrate", 1:322)

