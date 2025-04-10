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

1. Breiman L. Random forests. Machine learning. 2001;45:5–32.
2. Ishwaran H, Kogalur UB, Blackstone EH, Lauer MS. Random survival forests. Ann Appl Statist. 2008;2:841–60.
3. Breiman L. Bagging predictors. Machine learning. 1996;24:123–40.
4. Ueda N, Nakano R. Generalization error of ensemble estimators. In: Proceedings of international conference on neural networks (ICNN’96). IEEE; 1996. p. 90–5.
5. Ishwaran H, Lu M, Kogalur UB. randomForestSRC: Installing randomForestSRC vignette. 2021. http://randomforestsrc.org/articles/installation.html.
6. Ishwaran H, Lu M. Standard errors and confidence intervals for variable importance in random forest regression, classification, and survival. Statistics in medicine. 2019;38:558–82.
7. Ishwaran H, Lu M, Kogalur UB. randomForestSRC: Variable importance (VIMP) with subsampling inference vignette. 2021. http://randomforestsrc.org/articles/vimp.html.
8. Greenwald M, Khanna S. Space-efficient online computation of quantile summaries. ACM SIGMOD Record. 2001;30:58–66.
9. Mantero A, Ishwaran H. Unsupervised random forests. Statistical Analysis and Data Mining: The ASA Data Science Journal. 2021;14:144–67.
10. Breiman L. Manual on setting up, using, and understanding random forests v3. 1. Statistics Department University of California Berkeley, CA, USA. 2002;1.
11. O’Brien R, Ishwaran H. A random forests quantile classifier for class imbalanced data. Pattern recognition. 2019;90:232–49.
12. Lu M, Liao X. Telehealth utilization in u.s. Medicare beneficiaries aged 65 years and older during the COVID-19 pandemic. BMC Public Health. 2023;23:368–82. doi:10.1186/s12889-023-15263-0.
13. Ishwaran H, Tang F, Lu M, Kogalur UB. randomForestSRC: Multivariate splitting rule vignette. 2021. http://randomforestsrc.org/articles/mvsplit.html.
14. Ishwaran H, Mantero A, Lu M, Kogalur UB. randomForestSRC: sidClustering vignette. 2021. http://randomforestsrc.org/articles/sidClustering.html.
15. Ishwaran H, Lu M, Kogalur UB. randomForestSRC: AUC splitting for multiclass problems vignette. 2022. http://randomforestsrc.org/articles/aucsplit.html.
16. Geurts P, Ernst D, Wehenkel L. Extremely randomized trees. Machine learning. 2006;63:3–42.
17. Ishwaran H. The effect of splitting on random forests. Machine learning. 2015;99:75–118.
18. Ishwaran H, Lauer MS, Blackstone EH, Lu M, Kogalur UB. randomForestSRC: Random survival forests vignette. 2021. http://randomforestsrc.org/articles/survival.html.
19. Ishwaran H, Gerds TA, Lau BM, Lu M, Kogalur UB. randomForestSRC: Competing risks vignette. 2021. http://randomforestsrc.org/articles/competing.html.
20. Ishwaran H, Gerds TA, Kogalur UB, Moore RD, Gange SJ, Lau BM. Random survival forests for competing risks. Biostatistics. 2014;15:757–73.
21. Ishwaran H, Lu M, Kogalur UB. randomForestSRC: Forest weights, in-bag (IB) and out-of-bag (OOB) ensembles vignette. 2021. http://randomforestsrc.org/articles/forestWgt.html.
22. Ishwaran H, O’Brien R, Lu M, Kogalur UB. randomForestSRC: Random forests quantile classifier (RFQ) vignette. 2021. http://randomforestsrc.org/articles/imbalance.html.
