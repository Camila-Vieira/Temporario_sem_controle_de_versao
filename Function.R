add2 <- function(x, y) {
        x + y
}

add2(3, 5) ## A função add pega os dois números e os adiciona juntos


## Vai pegar um vetor numérico e vai pegar o subconjunto maior que dez e me devolver
above10 <- function(a) {
           use <- a > 10
           x[use]
}

above <- function(a, n = 10) {
         use <- a > n
         a[use]
}
above <- function(a, n) {
         use <- a > n
         a[use]
}

a <- 1: 20  ## Criar um vetor
above(a)
above(a, 12)


## Calcula a média de um data frame
columnmean <- function(y) {
         nc <- ncol(y)
         means <- numeric(nc)
         for(i in 1:nc) {
                means[i] <- mean(y[, i])
         }
         means
         
columnmean(airquality) ## Vai aparecer NA, a função abaixo é para remover NA

columnmean <- function(y, removeNA = TRUE) {
  nc <- ncol(y)
  means <- numeric(nc)
  for(i in 1:nc) {
    means[i] <- mean(y[, i], na.rm = removeNA)
  }
  means
  
columnmean(airquality)
columnmean(airquality, FALSE)  ### Para aparecer os NA
