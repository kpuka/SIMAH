---
title: 'Clinical Trials 1: Study Design'
date: 2021-08-16
permalink: /posts/rct_design/
excerpt_separator: <!--more-->
toc: true
tags:
  - RCT
---

Introduction to basic concepts of clinical trials and their categorization.

<!--more-->

# Introduction

-   The National Institutes of Health (NIH) defines clinical trials as research studies in which $\geq$1 human participant(s) are prospectively assigned to $\geq$1 intervention(s) to evaluate the effects of the intervention(s) on health-related biomedical or behavioral outcomes.

-   Clinical trials aim to isolate the effect of the treatment on the study outcome and provide results that are free of bias. A number of design features are used to achieve this goal, such as:

    -   Randomization - patients are assigned to a treatment group by random selection.

    -   Allocation concealment - personnel are unable to predict the next group assignment.

    -   Blinding - study personnel and patients are deliberately kept unaware of group assignment.

-   Trials should be ethically designed such that patients are not denied the benefit of standard treatment

-   A detailed study protocol should be created and made publicly available, e.g. at <https://clinicaltrials.gov>

    -   The NIH has developed protocol templates that may assist in considering all aspects of the trial: <https://osp.od.nih.gov/clinical-research/clinical-trials/>

-   The CONSORT guidelines should be followed when reporting results: <http://consort-statement.org>

# Phases of Clinical Trials

Clinical trials involving pharmaceutical products are commonly categorized into four phases:

-   *Phase I* Non-randomized study; test drug in healthy volunteers (15 - 30 volunteers); aim to evaluate the pharmacokinetics/pharmacodynamics of the drug and establish safety and toxicity limits.
-   *Phase II*: Randomized or non-randomized; test drug in patients with the disease (\<100 volunteers); 'proof of principle' stage and aim to evaluate dose-response relationship.
-   *Phase III*: Randomized study; test drug against placebo (100s - 1000s of volunteers). Drug tested in a controlled fashion against a placebo or standard therapy.
-   *Phase IV*: Non-randomized surveillance study; test drug while in the marketplace; important to gather additional safety information from a larger group of patients, over the long-term.

# Trial Design

## Parallel-group trial

Patients randomized to treatment group and followed simultaneously to determine the effect of each treatment 
<br/><img src='/images/posts/rct1-study-design/parallel.jpg'>

## Crossover trial

Patients receive a sequence of different treatments. Each person serves as their own control. There must be a sufficient time gap ('washout period') between different treatment phases.
<img src="/images/posts/rct1-study-design/crossover.jpg"/>

## Factorial trials

E valuate the effect of more than one treatment. Allows assessment of potential interaction among the treatments. 
<img src="/images/posts/rct1-study-design/factorial.jpg"/>

# Superiority, Equivalence, Non-inferiority Trials

-   **Superiority trial**

    -   Aims to show a new treatment is more effective than the comparative treatment

    -   Superiority is not always the aim. New treatments may be desirable even when they do not have a superior treatment effect - e.g. have fewer side effects or are safer, cheaper, or more convenient.

-   **Equivalence trial**

    -   Aim to show there is no difference between treatments - i.e. that the new treatment is not worse (inferior) or better (superior) relative to the comparative treatment.

-   **Non-inferiority trial**

    -   Aim to show that the effect of the new treatment is not clinically worse than the comparative treatment (i.e. not inferior to comparative treatment).

-   Equivalence and non-inferiority trials require that the investigator predefine the difference between two treatments that is considered clinically important (this difference is often labeled $\\Delta\$). The focus is on clinically meaningful differences (an effect that is statistically significant may not be clinically meaningful; e.g. a difference of 2 mm Hg in systolic blood pressure between groups may be statistically significant but is not clinically meaningful).

    -   Two treatments are said to be 'equivalent' when the confidence interval (CI) of the difference score between treatments is within (i.e. does not exceed) the -$\\Delta\$ and +$\\Delta\$.

    -   Non-inferiority trials are one-sided and only evaluate whether the CI exceeds -$\\Delta\$; if the lower bound is above the margin, the new treatment is deemed non-inferior and the trial is a 'success'.

    -   For a review of the methods used to define the non-inferiority margin ($\\Delta\$), see Althunian et al. 2017

        <img src="/images/posts/rct1-study-design/non-inferiority.jpg"/>

# References and Further Readings

- Althunian TA, et al. Methods of defining the non-inferiority margin in randomized, double-blind controlled trials: a systematic review. Trials. 2017;18(1):107. 
- Ewald B. Making sense of equivalence and non-inferiority trials. Australian Prescriber. 2013; 36:170-3. Freedman LM, Furberg DC, DeMets DL. Fundamentals of Clinical Trials 5th Edition; Springer, 2015.
- Head SJ, Kaul S, Bogers AJ, Kappetein AP. Non-inferiority study design: lessons to be learned from cardiovascular trials. European heart journal. 2012 May 7;33(11):1318-24.
