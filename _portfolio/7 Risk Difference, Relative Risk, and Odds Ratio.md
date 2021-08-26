---
title: 'Risk Difference, Relative Risk and Odds Ratio'
permalink: /resources/rd_rr_od/
excerpt_separator: <!--more-->
toc: true
comments: true
tags:
  - methods
---

The use and interpretations of risk difference (RD), relative risk (RR) and odds ratio (OR). RD, RR, and OR provide an estimate (with confidence interval) for the relationship between a  binary outcome ("yes" or "no") and other variables.  <!--more-->

# Introduction
The relationship between a binary outcome (e.g. yes vs. no) and other variables may be expressed through risk difference, relative risk and odds ratio. These measures are described below and should always be reported with confidence intervals. 

'Risk' refers to the probability of having a disease or some outcome. Risk difference and relative risk are used to compare the risk among two or more groups.

$$Risk = \frac{number of people with disease/outome}{total number of people}$$



'Odds' refers to the probability that the event of interest occurs to the probability that it does not. For example, the odds that a single throw of a die will produce a six (for example) are 1 to 5, or 1/5. The odds ratio is used to compare the odds among two or more groups.

$$Odds = \frac{umber of people with disease/outome}{umber of people without disease/outome} $$


**Example:**

|         | Disease | No Disease | Total  |
|---------|---------|------------|--------|
| Group A | 141     | 420        | 561    |
| Group B | 928     | 13,525     | 14,453 |
| Total   | 1,063   | 13,945     | 15,522 |


Risk of disease in Group A is 141/561; the odds are 141/420

Risk of disease in Group B is 928/14,453; the odds are 928/13,525


Can compare these groups in several ways (outlined below):


# Risk Difference
Risk Difference (RD) is the difference between risks:

RD = [risk of group A] - [risk of group B] = $$\frac{141}{561} -  \frac{928}{14,453} = 0.187 $$


**Interpretation:** Can convert into a fraction 18.7% = 187/1,000. Patients in Group A had 187 additional cases of disease per 1000 people, compared to patients in Group B. 

Alternatively, can report as **number needed to treat (NNT)**. NNT = 1 / RD = 1 / 0.187 = 5.34.
Need to treat 5.34 persons with treatment received by Group A to prevent 1 case of the disease. 


# Relative Risk
Relative Risk (RR) is the ratio of risks: 

$$RR = \frac{Risk of Group A}{Risk of Group B} = \frac{141/561}{928/14,453} = 3.91 $$

**Interpretation:** The risk of disease is 3.91 times higher in Group A, relative to Group B. 

Alternatively, can indicate that the risk of disease is 291% (i.e. [3.91 - 1.00] x100%) higher in Group A, relative to Group B.

If the RR is less than 1, (for example RR = 0.256), can indicate that the risk of disease in Group A is 74.4% ([1.00 - 0.256] x 100%) lower, relative to group B.

RR of 1.0 indicates no association. If the 95% Confidence Interval (CI) of the RR does not include the value of 1, this indicates that the difference between groups is statistically significant at p<.05. 



# Odds Ratio
Odds Ratio (OR) is the ratio of the odds: 

$$ OR = \frac{Odds of Group A}{Odds of Group B} = \frac{141/420}{928/13,525} = 4.89 $$

**Interpretation**: Similar to RR, but must specify "odds": The *odds* of disease are 4.89 times higher in Group A, relative to Group B. 



# Relative Risk (RR) vs. Odds Ratio (OR)

- The OR will approximate the RR when the prevalence of disease/outcome is low (i.e. <10%). If > 10%, then ORs that are less than 1.0 underestimate the RR, and ORs that are greater than 1.0 overestimate the RR (OR will be more extreme than RR).
- OR is symmetrical, such that the OR of event = 1 / (OR of non-event). RR is not symmetrical. 
- RR can (and should be) calculated from randomized controlled trials, cohort studies, case-cohort studies, or nested case-control studies. RR cannot be calculated from traditional case-control trials, for which ORs should be calculated. The reason is related to how risk and odds are defined; calculation of risk requires the use of "people at risk" as the denominator. In retrospective (traditional case-control) studies, the total number of exposed people is not available, therefore RR cannot be calculated and OR must be used. Case-control studies are not based on the population, the researcher chooses how many controls to include in the study and this will impact RR but not OR (see example below). 


Example: Impact of doubling the control group on the OR and RR.

Scenario 1: 

|            | Case    | Control | Total |
|------------|---------|---------|-------|
| Exposed    | 59      | **122** | 181   |
| Unexposed  | 48      | **190** | 238   |

OR = (59/48) / (122/190) = 1.91
RR = (59/181) / (48/238) = 1.68



Scenario 2 (Control group doubled): 

|            | Case    | Control | Total |
|------------|---------|---------|-------|
| Exposed    | 59      | **244** | 303   |
| Unexposed  | 48      | **380** | 428   |

OR = (59/48) / (244/380) = 1.91
RR = (59/303) / (48/428)= 1.77



Notice that when the size of the control is doubled, the OR remains unchanged, but the RR changes. 





# References and Further readings

Tripepi, G., Jager, K. J., Dekker, F. W., Wanner, C., & Zoccali, C. (2007). Measures of effect: relative risks, odds ratios, risk difference, and 'number needed to treat'. Kidney international, 72(7), 789-791.

Bland, J. M., & Altman, D. G. (2000). The odds ratio. BMJ, 320(7247), 1468.






