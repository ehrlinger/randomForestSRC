randomForestSRC - Fast Unified Random Forests for Survival, Regression, and Classification (RF-SRC)
========================================================
<!-- badges: start -->

[![cranlogs](http://cranlogs.r-pkg.org/badges/randomForestSRC)](http://cranlogs.r-pkg.org/badges/randomForestSRC)
[![CRAN_Status_Badge](http://www.r-pkg.org/badges/version/randomForestSRC)](https://cran.r-project.org/package=randomForestSRC)

[![active](http://www.repostatus.org/badges/latest/active.svg)](http://www.repostatus.org/badges/latest/active.svg)

[![R-CMD-check](https://github.com/ehrlinger/randomForestSRC/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/ehrlinger/randomForestSRC/actions/workflows/R-CMD-check.yaml)
[![Codecov test coverage](https://codecov.io/gh/ehrlinger/ggRandomForests/graph/badge.svg)](https://app.codecov.io/gh/ehrlinger/ggRandomForests)

<!-- badges: end -->

R-software for random forests regression, classification, survival analysis, competing risks, multivariate, unsupervised, quantile regression, and class imbalanced q-classification. Extreme random forests and randomized splitting. Suite of imputation methods for missing data. Fast random forests using subsampling. Confidence regions and standard errors for variable importance. New improved holdout importance. Case-specific importance. Minimal depth variable importance. Visualize trees on your Safari or Google Chrome browser. Anonymous random forests for data privacy. New Mahalanobis splitting rule for correlated real-valued outcomes in multivariate regression settings.

## Documentation

https://www.randomforestsrc.org/ 

https://ishwaran.org/

## Installation

The production release is available on CRAN at 
```{r}
install.packages("randomForestSRC") 
```

Install the development version into your R environment using the `devtools` package:
```{r}
install.packages("devtools") # If you don't have it.

# Requires randomForestSRC dependency.
devtools::install_github("kogalur/randomForestSRC")
```
## References

Lu M., Ishwaran H. Model-independent variable selection via the rule-based variable priority [arXiv:2409.09003 ](https://arxiv.org/abs/2409.09003) **[stat.ML]**
