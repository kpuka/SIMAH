---
title: 'Sample Size Calculator'
permalink: /resources/sample_size_calculator/
excerpt_separator: <!--more-->
toc: true
comments: true
tags:
  - study design
---
<!--more-->
# Introduction 

Sample size calculations form an important part of the study design, but the formula and implementation of sample size calculations can be complex and intimidating. The sample size calculator below was designed guide researchers through the process of calculating a sample size using a simple to use and informative interface. 

The sample size calculator is based on the formula described by Vittinghoff et al. (2012), Regression methods in biostatistics: Linear, logistic, survival, and repeated measures models. Springer. <https://doi.org/10.1007/978-1-4614-1353-0>

# Sample Size Calculator
<iframe height="950" width="100%" frameborder="no" src="https://kpuka.shinyapps.io/samplesize/"> </iframe>



# Examples 
The examples below are based on the examples described by [Vittinghoff et al. (2012)](https://doi.org/10.1007/978-1-4614-1353-0)

**Example 1: Continuous Outcome**
We plan on conducting a randomized trial with equal allocation to treatment and placebo to assess the effect of a new lipid-lowering agent on LDL levels. From pilot data, the standard deviation for LDL is expected to be 38 mg/dL, and we hypothesize that the treatment will lower average LDL levels about 40 mg/dL. Because this is a clinical trial, it is unlikely that we will need to adjust for covariates. The sample size must provide 80% power in a two-sided test with $\alpha$ of 5%. 

- *Type of outcome variable:* Continuous
- *Type of independent variable:* Binary
- *Minimum detectable effect:* 40
- *Standard deviation of the outcome:* 38
- *Proportion of participants in group of interest:* 0.5
- *Multiple correction:* 0
- *False positive rate:* 0.05
- *Statistical power:* 0.80
- *Anticipated attrition rate:* 0

**Total sample size required: 28**



 
