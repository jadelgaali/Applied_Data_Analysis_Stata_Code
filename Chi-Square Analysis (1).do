*** Chi-Square Example ***

tab smokenow
mvdecode smokenow unmtndmc, mv(0, 7, 8, 9)

tab hiprivate


tab smokenow hiprivate, col chi2

tab smokenow unmtndmc, col chi2

mvdecode educ, mv(0, 996, 997, 998, 999)
tab educ
gen educ_recode=.
replace educ_recode=1 if(educ<=300)
replace educ_recode=2 if(educ>=301 & educ<=403)
replace educ_recode=3 if(educ==500)
replace educ_recode=4 if(educ>=600)
label define edu_cats 1 "Up to 12th Grade No Diploma" 2 "HS Diploma/GED/Some College/AA" 3 "Bachelor's degree (BA,AB,BS,BBA)" 4 "Advanced Degree"
label values educ_recode edu_cats
tab educ_recode

tab smokenow educ_recode, col chi2
