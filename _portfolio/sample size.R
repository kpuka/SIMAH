
# Linear regression sample size

b <- 2
sd_out <- 20
sd_pred <- 2
alpha <- 0.05
power <- 0.90
corr <- .3
attrition <- 0

  
round(((((qnorm(1-alpha/2) + qnorm(power))^2)*(sd_out)^2)/((((b*sd_pred)^2)*(1-(corr)))))/(1-attrition),0)

paste0(n, " participants are required to achieve ", power*100, "% power to detect a smallest clinically meaningful effect of ", b, ". This assumes the standard deviation of the variable of interest is ", sd_pred, " the multiple correlation is ", corr, "and the standard deviation of the outcome is ", sd_out, ". This calculation was performed assuming a false positive rate of ", alpha, ". To account for ", attrition*100,   "% attrition, ", n, " samples should be collected.")







# Logistic regression sample size

OR <- 1.2
sd_pred <- 1
prob_out <-0.10
alpha <- 0.05
power <- 0.80
corr <- 0
attrition <- 0.1

round((((qnorm(1-alpha/2) + qnorm(power))^2) / ((((log(OR))*sd_pred)^2)*(prob_out*(1-prob_out))*(1-corr)))/(1-attrition),0)



paste0(n, " participants are required to achieve ", power*100, "% power to detect a smallest clinically meaningful odds ratio of ", OR, ". This assumes the standard deviation of the variable of interest is ", sd_pred, " the multiple correlation is ", corr, "and the marginal probability of the outcome is ", prob_out, ". This calculation was performed assuming a false positive rate of ", alpha, ". To account for ", attrition*100,   "% attrition, ", n, " samples should be collected.")






# Cox regression sample size

HR <- 2
sd_pred <- 0.50
prob_out2 <-0.6
alpha <- 0.05
power <- 0.80
corr <- 0
attrition <- 0.0

round((((qnorm(1-alpha/2) + qnorm(power))^2) / ((((log(HR))*sd_pred)^2)*(prob_out2)*(1-corr)))/(1-attrition),0)



freq <-0.5

sqrt(freq*(1 - freq))


# Poisson regression sample size

RR <- 2
sd_pred <- 0.50
dispr <-0.6
alpha <- 0.05
power <- 0.80
corr <- 0
attrition <- 0.0

round((((qnorm(1-alpha/2) + qnorm(power))^2) / ((((log(HR))*sd_pred)^2)*(dispr)*(1-corr)))/(1-attrition),0)



