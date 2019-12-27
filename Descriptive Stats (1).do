tab sex
tab sex [aweight=perwt]

tab fertyr
mvdecode fertyr, mv(0)
tab fertyr, missing
tab fertyr [aweight=perwt]

gen fertyr_recode=.
replace fertyr_recode=0 if(fertyr==1)
replace fertyr_recode=1 if(fertyr==2)
replace fertyr_recode=9 if(missing(fertyr))
mvdecode fertyr_recode, mv(9)
tab fertyr_recode
tab fertyr_recode [aweight=perwt]

sum fertyr_recode [aweight=perwt]

by statefip, sort: sum fertyr_recode [aweight=perwt]
