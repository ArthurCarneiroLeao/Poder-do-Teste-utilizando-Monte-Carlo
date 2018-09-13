#--------------LogNormal-------------------#

r <- 1000            
mu0 <- 1/2        
mu.test <- c(7/2, 3, 5/2, 2, 3/2, 1, 1/2, 1/3, 1/4, 1/5, 1/6, 1/7)  
M <- length(mu.test)              
power <- numeric(M)               
nobs <- c(20, 40, 50, 100)        
power_nobs <- matrix(0,length(nobs),M)  
c <- 1
for(j in nobs) {
  for (i in 1:M) {
    mu <- mu.test[i]
    p_value <- replicate(r, expr = {
      x <- rlnorm(j,  (log(mu)) - 1/2, 1)
      test_t <- t.test(x, alternative = "greater", mu = mu0)
      test_t$p.value})
    power[i] <- mean(p_value <= 0.05)
  }
  power_nobs[c,] <- power
  c = c+1
}

#Gráficos com n diferentes
x11()
par(mfrow=c(2,2))
plot(mu.test, power_nobs[1,], type = "l", xlab = bquote(theta), ylab = "Poder", main = "n = 20")
abline(v = mu0, lty = 1)
abline(h = .05, lty = 1)

plot(mu.test, power_nobs[2,], type = "l", xlab = bquote(theta), ylab = "Poder", main = "n = 40")
abline(v = mu0, lty = 1)
abline(h = .05, lty = 1)

plot(mu.test, power_nobs[3,], type = "l", xlab = bquote(theta), ylab = "Poder", main = "n = 50")
abline(v = mu0, lty = 1)
abline(h = .05, lty = 1)

plot(mu.test, power_nobs[4,], type = "l", xlab = bquote(theta), ylab = "Poder", main = "n = 100")
abline(v = mu0, lty = 1)
abline(h = .05, lty = 1)
