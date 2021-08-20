
# Linear regression sample size

b <- .1
sd_out <- 1
sd_pred <- 1
alpha <- 0.05
power <- 0.80
corr <- .3
attrition <- 0

  
n <- round(((((qnorm(1-alpha/2) + qnorm(power))^2)*sd_out)/(((b*sd_pred)^2)*(1-(corr^2))))/(1-attrition),0)
n


paste0(n, " participants are required to achieve ", power*100, "% power to detect a smallest clinically meaningful effect of ", b, ". This assumes the standard deviation of the variable of interest is ", sd_pred, " the multiple correlation is ", corr, "and the standard deviation of the outcome is ", sd_out, ". This calculation was performed assuming a false positive rate of ", alpha, ". To account for ", attrition*100,   "% attrition, ", n, " samples should be collected.")


# NOTE LINEAR REG CODE IS NOT WORKING


# Logistic regression sample size

OR <- 1.2
sd_pred <- 1
prob_out <-0.10
alpha <- 0.05
power <- 0.80
corr <- 0
attrition <- 0.1

n <- round((((qnorm(1-alpha/2) + qnorm(power))^2) / ((((log(OR))*sd_pred)^2)*(prob_out*(1-prob_out))*(1-corr)))/(1-attrition),0)
n


paste0(n, " participants are required to achieve ", power*100, "% power to detect a smallest clinically meaningful odds ratio of ", OR, ". This assumes the standard deviation of the variable of interest is ", sd_pred, " the multiple correlation is ", corr, "and the marginal probability of the outcome is ", prob_out, ". This calculation was performed assuming a false positive rate of ", alpha, ". To account for ", attrition*100,   "% attrition, ", n, " samples should be collected.")
