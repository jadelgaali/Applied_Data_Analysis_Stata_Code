 *** Smoking Behavior ***
  
tab cigever
 
mvdecode CIG30USE, mv(85,91,93,94,97,98)
tab CIG30USE

tab sexage

anova CIG30USE sexage
by sexage, sort: sum CIG30USE

anova CIG30USE HEALTH2
by HEALTH2, sort: sum CIG30USE
tab HEALTH2, sum(CIG30USE)

mvdecode cadrlast, mv(985, 991, 993, 994, 997, 998)
anova cadrlast sexage
tab sexage, sum(cadrlast)
