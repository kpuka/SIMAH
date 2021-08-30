---
title: 'Regressions 1: Linear Regression'
permalink: /resources/linear_reg/
excerpt_separator: <!--more-->
toc: true
comments: true
tags:
  - methods
---

Introduction to linear regression, interpretation of results, assumptions, and the selection of variables.
<!--more-->

# Introduction 
Linear regression is a method of describing the relationship between a continuous outcome variable (Y) and one or more 'predictor' variable(s) (X) that can be binary, categorical, or continuous. Other forms of regression are used when the outcome is binary (logistic regression), categorical (multinomial regression), ordinal (ordinal regression), count data (Poisson regression), or time-to-event data (Cox Models).


# How is it Calculated, and What Do Those Numbers Mean?

The figure below shows a scatter plot of two continuous variables (X and Y). We can describe the relationship between X and Y by drawing a straight line through the data points. The data points represent the **observed** values, whereas the line represents the **predicted** values. The  line drawn is as close as possible to the data points, specifically, the distance between data points and the line is minimized. This distance is called  "error" or a "residual". 

<br/><img src='/images/posts/regressions/linear/linear1.JPG'>  <br/>


The line may be described by the equation: 

$$ Y = (intercept)+(slope)(X) = β_0 + (β_1)(X) $$

The intercept (β<sub>0</sub>) is the estimated Y when X = 0.

The slope (β<sub>1</sub>) is the estimated change in Y for a **one-unit** increase in X.

With this equation, we can estimate the value of Y for any given value of X.

The value of β<sub>0</sub> and β<sub>1</sub> are calculated and of main interest when conducting a regression. The null-hypothesis is that the regression coefficients (i.e., β<sub>0</sub> and β<sub>1</sub>) equal to 0, that is, the p-values associated with β<sub>0</sub> and β<sub>1</sub> indicate whether they are different from 0. If the line has a slope of zero (i.e., a flat horizontal line; β<sub>1</sub> = 0), X and Y are not associated; the expected value of Y will be the same regardless of the value of X.


When there are two predictors (X<sub>1</sub> and X<sub>2</sub>), the regression equation becomes:

$$ Y = β_0 + (β_1)(X_1) + (β_2)(X_2) $$



β<sub>0</sub> is the estimate of Y when X<sub>1</sub>=0 ***and*** X<sub>2</sub>=0.

β<sub>1</sub> = expected change in Y for a one unit increase in X<sub>1</sub> *and all other variables (e.g. X<sub>2</sub>) stay the same*.

β<sub>2</sub> = expected change in Y for a one unit increase in X<sub>2</sub> *and all other variables (e.g. X<sub>1</sub>) stay the same*.

β values represent the independent effect of the predictor on the outcome 'controlling for', 'adjusted for', or 'holding constant' *all* other variables. 


This model can be expanded to include many predictors: 

$$ Y = β_0 + (β_1)(X_1) + (β_2)(X_2) + (β_3)(X_3) +... + (β_n)(X_n)$$


# Assumptions
1.  **Linearity** – relationship between the outcome (Y) and the covariates (X) is linear
2.  **Independence** – observations/participants are independent  of each other
3.  **Normality** – the residuals (not the outcome) are normally distributed
4.  **Homogeneity of variance** – the residuals have a constant variance across the levels of X (that is, the variability around the regression line is constant along the length of the regression line).

Additionally, you should avoid including covariates that are highly correlated in the same regression model (this is because it becomes much harder to identify their independent effects; issue called multicollinearity). Outliers may also be a concern – observations with large residuals.

Note that there are no assumptions about the distribution of the covariates (X). 



