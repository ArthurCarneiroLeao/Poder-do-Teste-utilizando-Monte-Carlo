#--------------Normal-------------------#

r <- 1000                        
mu0 <- 1/2                         
sigma <- 1                        
mu.test <- c(seq(-3.5, 4, .3))     
M <- length(mu.test)              
poder <- numeric(M)               
nobs <- c(20, 40, 50, 100)        
poder_nobs <- matrix(0,length(nobs),M) 
cont <- 1
for(j in nobs) {
  for (i in 1:M) {
    mu <- mu.test[i]
    p_value <- replicate(r, expr = {
      x <- rnorm(j, mu, sigma)
      test_t <- t.test(x, alternative = "greater", mu = mu0)
      test_t$p.value})
    poder[i] <- mean(p_value <= 0.05)
  }
  poder_nobs[cont,] <- power
  cont = cont+1
}

#Gráfico para n diferentes.
x11()
par(mfrow=c(2,2))
plot(mu.test, poder_nobs[1,], type = "l", xlab = bquote(theta), ylab = "Poder", main = "n = 20")
abline(v = mu0, lty = 1)
abline(h = .05, lty = 1)

plot(mu.test, poder_nobs[2,], type = "l", xlab = bquote(theta), ylab = "Poder", main = "n = 40")
abline(v = mu0, lty = 1)
abline(h = .05, lty = 1)

plot(mu.test, poder_nobs[3,], type = "l", xlab = bquote(theta), ylab = "Poder", main = "n = 50")
abline(v = mu0, lty = 1)
abline(h = .05, lty = 1)

plot(mu.test, poder_nobs[4,], type = "l", xlab = bquote(theta), ylab = "Poder", main = "n = 100")
abline(v = mu0, lty = 1)
abline(h = .05, lty = 1)
