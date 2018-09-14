#--------------Exponential-------------------#

r <- 1000          
mu0 <- 1/2       
mu.test1 <- c(seq(0.1, 0.5, .05))
mu.test2 <- c(seq(1, 5, .5))
mu.test<-c(mu.test1,mu.test2)     
M <- length(mu.test)              
poder <- numeric(M)               
nobs <- c(20, 40, 50, 100)        
poder_nobs <- matrix(0,length(nobs),M) 
c <- 1
for(j in nobs) {
  for (i in 1:M) {
    mu <- mu.test[i]
    p_value <- replicate(r, expr = {
      x <- rexp(j, 1/mu)
      test_t <- t.test(x, alternative = "greater", mu = mu0)
      test_t$p.value})
    poder[i] <- mean(p_value <= 0.05)
  }
  poder_nobs[c,] <- poder
  c = c+1
}

#Gráficos com n diferentes
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
