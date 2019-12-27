mvdecode aeffort ahopeless anervous arestless asad aworthless, mv(6,8)
mvdecode phq2, mv(96,98)

****** Constructing Mental Health Scale *****
gen mentalhealthscale=aeffort + ahopeless + anervous + arestless + asad + aworthless
sum mentalhealthscale, detail
alpha aeffort ahopeless anervous arestless asad aworthless


***** ANOVA on Mental Health Scale by gender and marital status *****
anova mentalhealthscale female
tab female, sum(mentalhealthscale)

anova mentalhealthscale married
tab married, sum(mentalhealthscale)

***** ANOVA on Health Care Expenditure by gender, marital status and health status *****
anova exptot female
tab female, sum(exptot)

anova exptot married
tab married, sum(exptot)

anova exptot health
tab health, sum(exptot)


***** Multiple regression on Mental Health Scale *****
regress mentalhealthscale female married south west midwest bachelorplus


***** Creating Dummy variable on Stability in health care ****

gen usualmedcare=0
replace usualmedcare=1 if(usualpl==2)
label variable usualmedcare "Has a usual place for Medical Care"
tab usualmedcare

logistic usualmedcare female married south west midwest bachelorplus

gen smoker=.
replace smoker=0 if(smokenow==1)
replace smoker=1 if(smokenow==2)
tab smoker

logistic usualmedcare female married south west midwest bachelorplus smoker

*** Interaction between region (south) and smoker ***
gen southsmoker=0
replace southsmoker=1 if(south==1 & smoker==1)

logistic usualmedcare female married south west midwest bachelorplus smoker southsmoker
