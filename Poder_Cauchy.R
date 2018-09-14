#--------------Cauchy-------------------#
  
  r <- 1000            
  mu0 <- 1/2       
  mu.test <- c(0.1,0.15,0.2,0.25,0.3,0.4,.5,1,1.5,2,2.5,3,3.5,4,4.5,5)   
  M <- length(mu.test)              
  poder <- numeric(M)               
  nobs <- c(20, 40, 50, 100)        
  poder_nobs <- matrix(0,length(nobs),M)  
  c <- 1
  for(j in nobs) {
    for (i in 1:M) {
      mu <- mu.test[i]
      p_value <- replicate(r, expr = {
        x <- rcauchy(j, mu, 1)
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
