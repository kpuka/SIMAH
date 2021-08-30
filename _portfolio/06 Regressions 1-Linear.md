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

The figure below shows a scatter plot of two continuous variables (X and Y). We can describe the relationship between X and Y by drawing a straight line through the data points. This line may be described by:

<br/><img src='/images/posts/regressions/linear/linear1.JPG'>  <br/>


- The y-intercept (i.e. the value of Y when X = 0); we call this *??~0~*

- The slope of the line (i.e. how steep or flat the line is); we call this *??~1~*

- The slope is the expected change in Y for a one unit increase in X

o The equation for this line is: Y = (intercept) + (slope)(X),

i.e.** Y = *??~0~* + (*??~1~)(*X)**

§ When conducting a regression, the value of *??~0~* and *??~1~* are calculated


*Figure 2. Illustration of the least-squares approach. Points represent individual observations. Arrows represent deviations of observation from the fitted regression line.*



The p-value associated with regression coefficients (i.e. *??~0~* and *??~1~*) tests whether they are significantly different from 0

- If the line has a slope of zero (i.e. *??~1~* = 0*)*, the expected value of Y will be the same regardless of the value of X; hence X and Y are not associated

- The line drawn was chosen because it was as 'close' as possible to the data points

o i.e. the distance between data points and the line is minimized (Figure 2)

o The deviation from the data point (observed value of Y) to the line (predicted value of Y) is called an 'error' or 'residual'

o Mathematically, the line was drawn using the 'least squares method', which aims to minimize the 'error'

- When there are two predictors (X~1~ and X~2~), the regression equation becomes:

**Y = *??~0~* + (*??~1~)(*X~1~)** + **(*??~2~)(*X~2~)**

*??~0~* = the estimate of Y when X~1~=0 ***and*** X~2~=0

*??~1~ *= expected change in Y for a one unit increase in X~1~ *and all other variables (e.g. X~2~) stay the same*

*??~2~ *= expected change in Y for a one unit increase in X~2~ *and all other variables (e.g. X~1~) stay the same*

- *??*values represent the independent effect of the predictor on the outcome 'controlling for', 'adjusted for', or 'holding constant' *all* other variables

- This model can be expanded to include many predictors: Y = *??*~0~ + *??*~1~X~1~ + *??*~2~X~2~ + *??*~3~X~3~ + ... + *??*~n~X~n~

**Assumptions**

1. The relationship between the outcome (Y) and the predictor (X) is linear (i.e. Y increases/decreases as X increases in a linear (straight-line) fashion)

o A scatter plot such as that in Figure 1 can be used helpful in evaluating this assumption

2. The observations are independent (i.e. data comes from unrelated participants)

3. The errors have a constant variance

i.e. variability around the regression line is constant along the length of the regression line

4. The errors are normally distributed are zero

**Categorical Predictors**

- If the predictor variable is binary (e.g. has 2 categories, such as male vs. female), it is equivalent to a comparison of the means of the two groups (equivalent to a *t*-test)

o If the variable is coded with a 0 and 1 (e.g. 0 = female, 1 = male), then:

*??~0~ *= estimate of Y when X = 0; i.e. the mean of the group coded 0

e.g. if *??~0~ *= 10.0, the mean score of females is 10.0

*??~1~ *= estimated change of Y when there is a 1 unit increase in X; i.e. the difference in the mean outcome of the two groups

e.g. if *??~1~ * = 5.0, then mean score of males is 5.0 points higher than females. Since mean score of females is 10.0, the mean score of males is 15.0.

- If the predictor has more than 2 categories, one of the categories is set as the 'reference' category, and other categories are compared against it, similar to above

o The reference group is usually the largest group or most clinically relevant

**Selection of Variables to Enter in the Model**

- To allow for a comparison of results with other publications, unadjusted (univariable) regression results should be presented (e.g. results from regressions with one outcome and one predictor)

o Multivariable analyses cannot be directly compared if different covariates are included in the model

- When deciding whether to include or to exclude a covariate from the analysis, it will depend on the research question and the design of the study**. Prior knowledge from the scientific literature is seen as the most important rationale for including or excluding covariates from a statistical analysis.**

- The number of predictors included should be limited to the most important; a larger sample size is required when multiple predictors are added to the model.

- Automated variable selection methods (backward/forward selection, etc.) should be avoided (see the resource "*Regression 5: Stepwise Regression*" for more details)

- Statistical significance (e.g. at *p* <.05) in univariable analyses should not be used as a justification for inclusion of the variable in multivariable analyses

- If two predictors are highly correlated, then you cannot include both in the regression analysis as it becomes much harder to identify their independent effects (much larger sample size is required); this issue is termed multicollinearity

**Comparing and Centering Regression Coefficients**

- In general, it is not possible to compare regression coefficients directly, because they describe the effects of a one-unit change in a variable (X), and hence its size depends on the scale used to measure that variable (X)

o Therefore, to compare regression coefficients, they must be on the same scale. If the variables are in different scales, standardized regression coefficients (which range from -1 to +1) can be calculated/used

- You can also express the effect of a change in one unit of predictor X~2~ as the number of units of predictor X~1~ giving the same effect -- this is simply the ratio of the two regression coefficients: *??~2~ */ *??~1~*

e.g. 'one hour of physical activity per week has the same effect as a difference of 2 years of age'

- *??~0~ *is the value of Y when all predictors equal zero; this value may not be meaningful (e.g. estimated running speed when blood pressure is equal to 0 is not a meaningful number)

o A constant may be added to the predictors (X~1~, X~2~, etc.), and this would change the value of *??~0~ *but not the other regression coefficients (*??~1~*, *??~2~*, etc.)

§ If all predictors are centered (that is, subtract the mean of each predictor from the predictor), then the intercept (*??~0~*) provides the estimated value of the outcome (Y) for a hypothetical subject with all predictors at their mean value. *??~0~ *can be interpreted as the estimated Y for the 'average subject'.

o If variables are centered, this should be made clear in the publication

**References and Further Readings**

Werner V. Regression models as a tool in medical research. NY: Taylor & Francis Inc. 2012.