# testthat for gg_rfsrc function
context("rfsrc tests")

test_that("rfsrc classifications",{
  ##------------------------------------------------------------
  ## Survival analysis
  ##------------------------------------------------------------
  
  ## veteran data
  ## randomized trial of two treatment regimens for lung cancer
  data(veteran, package = "randomForestSRC")
  v.obj <- rfsrc(Surv(time, status) ~ ., data = veteran, ntree = 100)
  
  # print and plot the grow object
  print(v.obj)
  plot(v.obj)
  
  # plot survival curves for first 10 individuals: direct way
  matplot(v.obj$time.interest, 100 * t(v.obj$survival[1:10, ]),
          xlab = "Time", ylab = "Survival", type = "l", lty = 1)
  
  # plot survival curves for first 10 individuals
  # indirect way: using plot.survival (also generates hazard plots)
  plot.survival(v.obj, subset = 1:10, haz.model = "ggamma")
  
  
  ## Primary biliary cirrhosis (PBC) of the liver
  
  data(pbc, package = "randomForestSRC")
  pbc.obj <- rfsrc(Surv(days, status) ~ ., pbc, nsplit = 10)
  print(pbc.obj)
  
  
  ##------------------------------------------------------------
  ## Example of imputation in survival analysis
  ##------------------------------------------------------------
  
  data(pbc, package = "randomForestSRC")
  pbc.obj2 <- rfsrc(Surv(days, status) ~ ., pbc,
                    nsplit = 10, na.action = "na.impute")
  
  
  # here's a nice wrapper to combine original data + imputed data
  combine.impute <- function(object) {
    impData <- cbind(object$yvar, object$xvar)
    if (!is.null(object$imputed.indv)) {
      impData[object$imputed.indv, ] <- object$imputed.data
    }
    impData
  }
  
  # combine original data + imputed data
  pbc.imp.data <- combine.impute(pbc.obj2)
  
  # same as above but we iterate the missing data algorithm
  pbc.obj3 <- rfsrc(Surv(days, status) ~ ., pbc, nsplit=10,
                    na.action = "na.impute", nimpute = 3)
  pbc.iterate.imp.data <- combine.impute(pbc.obj3)
  
  # fast way to impute the data (no inference is done)
  # see impute.rfsc for more details
  pbc.fast.imp.data <- impute.rfsrc(data = pbc, nsplit = 10, nimpute = 5)
#   
#   ##------------------------------------------------------------
#   ## Compare RF-SRC to Cox regression
#   ## Illustrates C-index and Brier score measures of performance
#   ## assumes "pec" and "survival" libraries are loaded
#   ##------------------------------------------------------------
#   
#   if (library("survival", logical.return = TRUE)
#       & library("pec", logical.return = TRUE) 
#       & library("prodlim", logical.return = TRUE)
#       & library("Hmisc", logical.return = TRUE) )
#   {
#     ##prediction function required for pec
#     predictSurvProb.rfsrc <- function(object, newdata, times, ...){
#       ptemp <- predict(object,newdata=newdata,...)$survival
#       pos <- sindex(jump.times = object$time.interest, eval.times = times)
#       p <- cbind(1,ptemp)[, pos + 1]
#       if (NROW(p) != NROW(newdata) || NCOL(p) != length(times))
#         stop("Prediction failed")
#       p
#     }
#     
#     ## data, formula specifications
#     data(pbc, package = "randomForestSRC")
#     pbc.na <- na.omit(pbc)  ##remove NA's
#     surv.f <- as.formula(Surv(days, status) ~ .)
#     pec.f <- as.formula(Hist(days,status) ~ 1)
#     
#     ## run cox/rfsrc models
#     ## for illustration we use a small number of trees
#     cox.obj <- coxph(surv.f, data = pbc.na)
#     rfsrc.obj <- rfsrc(surv.f, pbc.na, nsplit = 10, ntree = 150)
#     
#     ## compute bootstrap cross-validation estimate of expected Brier score
#     ## see Mogensen, Ishwaran and Gerds (2012) Journal of Statistical Software
#     set.seed(17743)
#     prederror.pbc <- pec(list(cox.obj,rfsrc.obj), data = pbc.na, formula = pec.f,
#                          splitMethod = "bootcv", B = 50)
#     print(prederror.pbc)
#     plot(prederror.pbc)
#     
#     ## compute out-of-bag C-index for cox regression and compare to rfsrc
#     rfsrc.obj <- rfsrc(surv.f, pbc.na, nsplit = 10)
#     cat("out-of-bag Cox Analysis ...", "\n")
#     cox.err <- sapply(1:100, function(b) {
#       if (b%%10 == 0) cat("cox bootstrap:", b, "\n")
#       train <- sample(1:nrow(pbc.na), nrow(pbc.na), replace = TRUE)
#       cox.obj <- tryCatch({coxph(surv.f, pbc.na[train, ])}, error=function(ex){NULL})
#       if (is.list(cox.obj)) {
#         rcorr.cens(predict(cox.obj, pbc.na[-train, ]),
#                    Surv(pbc.na$days[-train],
#                         pbc.na$status[-train]))[1]
#       } else NA
#     })
#     cat("\n\tOOB error rates\n\n")
#     cat("\tRSF            : ", rfsrc.obj$err.rate[rfsrc.obj$ntree], "\n")
#     cat("\tCox regression : ", mean(cox.err, na.rm = TRUE), "\n")
#   }
#   
#   ##------------------------------------------------------------
#   ## Competing risks
#   ##------------------------------------------------------------
#   
#   ## WIHS analysis
#   ## cumulative incidence function (CIF) for HAART and AIDS stratified by IDU
#   
#   data(wihs, package = "randomForestSRC")
#   wihs.obj <- rfsrc(Surv(time, status) ~ ., wihs, nsplit = 3, ntree = 100)
#   plot.competing.risk(wihs.obj)
#   cif <- wihs.obj$cif
#   Time <- wihs.obj$time.interest
#   idu <- wihs$idu
#   cif.haart <- cbind(apply(cif[,,1][idu == 0,], 2, mean), apply(cif[,,1][idu == 1,], 2, mean))
#   cif.aids  <- cbind(apply(cif[,,2][idu == 0,], 2, mean), apply(cif[,,2][idu == 1,], 2, mean))
#   matplot(Time, cbind(cif.haart, cif.aids), type = "l",
#           lty = c(1,2,1,2), col = c(4, 4, 2, 2), lwd = 3,
#           ylab = "Cumulative Incidence")
#   legend("topleft",
#          legend = c("HAART (Non-IDU)", "HAART (IDU)", "AIDS (Non-IDU)", "AIDS (IDU)"),
#          lty = c(1,2,1,2), col = c(4, 4, 2, 2), lwd = 3, cex = 1.5)
#   
#   
#   ## illustrates the various splitting rules
#   ## illustrates event specific and non-event specific variable selection
#   if (library("survival", logical.return = TRUE)) {
#     
#     ## use the pbc data from the survival package
#     ## events are transplant (1) and death (2)
#     data(pbc, package = "survival")
#     pbc$id <- NULL
#     
#     ## modified Gray's weighted log-rank splitting
#     pbc.cr <- rfsrc(Surv(time, status) ~ ., pbc, nsplit = 10)
#     
#     ## log-rank event-one specific splitting
#     pbc.log1 <- rfsrc(Surv(time, status) ~ ., pbc, nsplit = 10,
#                       splitrule = "logrank", cause = c(1,0))
#     
#     ## log-rank event-two specific splitting
#     pbc.log2 <- rfsrc(Surv(time, status) ~ ., pbc, nsplit = 10,
#                       splitrule = "logrank", cause = c(0,1))
#     
#     ## extract VIMP from the log-rank forests: event-specific
#     ## extract minimal depth from the Gray log-rank forest: non-event specific
#     var.perf <- data.frame(md = max.subtree(pbc.cr)$order[, 1],
#                            vimp1 = pbc.log1$importance[,1],
#                            vimp2 = pbc.log2$importance[,2])
#     print(var.perf[order(var.perf$md), ])
#     
#   }
#   
  
  
  ## ------------------------------------------------------------
  ## Regression analysis
  ## ------------------------------------------------------------
  
  ## New York air quality measurements
  airq.obj <- rfsrc(Ozone ~ ., data = airquality, na.action = "na.impute")
  
  # partial plot of variables (see plot.variable for more details)
  plot.variable(airq.obj, partial = TRUE, smooth.lines = TRUE)
  
  ## motor trend cars
  mtcars.obj <- rfsrc(mpg ~ ., data = mtcars)
  
  # minimal depth variable selection via max.subtree
  md.obj <- max.subtree(mtcars.obj)
  cat("top variables:\n")
  print(md.obj$topvars)
  
  # equivalent way to select variables
  # see var.select for more details
  vs.obj <- var.select(object = mtcars.obj)
  
  
  ## ------------------------------------------------------------
  ## Classification analysis
  ## ------------------------------------------------------------
  
  ## Edgar Anderson's iris data
  iris.obj <- rfsrc(Species ~., data = iris)
  
  ## Wisconsin prognostic breast cancer data
  data(breast, package = "randomForestSRC")
  breast.obj <- rfsrc(status ~ ., data = breast, nsplit = 10)
  plot(breast.obj)
  
})