
corr <- function(directorio, horizonte=0){
    setwd(directorio)
    cor <- vector("numeric",0)
    m <- 1
    for (n in 1:332){
        
        j <- read.csv(paste(formatC(n, width = 3, flag ="0")
                            , ".csv",sep=""),header = TRUE )
        data1 <- data.frame(j$sulfate,j$nitrate)
        compl <- data1[complete.cases(data1),] 
        j <- nrow(compl)
        
        if (j>horizonte){
            length(cor) <- length(cor)+1
            cor[m] <- cor(compl[,1],compl[,2])
            m <- m+1
        } 
    }
    cor
}
corr("~/GitHub/Programacion3/specdata", 150)
