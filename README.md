# Does Financial Development have an impact on Growth Elasticity of Poverty?

## Introduction
This repository contains the statistical analysis to my master thesis. The analysis examines whether poverty reduction is more successful with higher levels of financial development.

## Tools
Data cleaning has been mostly achieved through R's tidyverse package. Subsequent Data Cleaning was implemented in Stata.
Regarding statistical analyses Stata proved to be a much more useful tool due to its high specialization on economics. Data visualization was implemented both in R (ggplot2) and Stata.

## Data

The sample involves low- and middle-income countries and excludes those countries that are classified as high-income. This is done in order to ensure comparability and exclude outliers (high-income countries have lower poverty headcount ratios). Another reason for this strategy is that high-income economies tend to have higher developed and more diversified financial sectors where commonly used proxies such as private-sector credit are unable to provide full apprehension. The dataset comprises 63 countries for the period of 1980-2015. Growth rates are computed as logarithmic differences divided by the number of years. The estimations for the main analysis contain between 270 and 268 observations.

Links to data sources:

[PovcalNet](http://iresearch.worldbank.org/PovcalNet/povOnDemand.aspx)

[Worldbank Data](https://data.worldbank.org/)

[Global Finacial Development Database](https://www.worldbank.org/en/publication/gfdr/data/global-financial-development-database)

[IMF's Financial Development Index](http://data.imf.org/?sk=F8032E80-B36C-43B1-AC26-493C5B1CD33B)

## Methodology
Three distinct poverty lines at USD 1.90, USD 3.20 and USD 5.50 and two different measures for financial development are observed in order to achieve this objective. An unbalanced panel data set is constructed for the period of 1980-2015 comprising 63 low- and middle-income countries. Estimation techniques include pooled OLS, fixed effects estimation and system-Generalized Method of Moments (GMM).

## Results
The results suggest that, on average, marginal effects of mean income growth on poverty reduction rise in absolute values with higher levels of financial development. This outcome is robust throughout different poverty lines and estimation techniques. Additionally, the analysis finds a growing marginal effect of mean income growth on poverty reduction with higher degrees of financial development over time. This analysis therefore concludes that financial sector development constitutes a key factor for the goal of poverty reduction.

![alt text](https://github.com/YKonyalicetin/MasterThesis/tree/master/Graphs/190_PC.png "Logo Title Text 1")
![Plot1](https://github.com/YKonyalicetin/MasterThesis/tree/master/Graphs/Graph1.pdf "Logo Title Text 1")

