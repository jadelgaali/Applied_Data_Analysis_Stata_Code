mvdecode age, mv(99)
mvdecode adappt adhecr, mv(96,98)
mvdecode marst, mv(0, 99)
mvdecode region, mv(0)
mvdecode health, mv(0,8)
mvdecode usualpl, mv(0,7,8,9)

tab health
sum health, detail


*** Dummy coding gender ***
gen female=.
replace female=0 if(sex==1)
replace female=1 if(sex==2)
tab female

regress health female 

*** Dummy coding Married ***
tab marst, nolabel
gen married=0
replace married=1 if(marst==10)
tab married

regress health female married 

*** Dummy codiing region (reference group = Northeast)
gen south=0
replace south=1 if(region==3)
tab south

gen west=0
replace west=1 if(region==4)
tab west

gen midwest=0
replace midwest=1 if(region==2)
tab midwest

regress health female married south west midwest 

*** Dummy coding college graduate or above ***
gen bachelorplus=0
replace bachelorplus=1 if(educ>=500)
tab bachelorplus

regress health female married south west midwest exptot bachelorplus 

*** Interaction term for Married and Bachelors ***
gen marriedBA=0
replace marriedBA=1 if(married==1 & bachelorplus==1)
tab marriedBA

regress health female married south west midwest exptot bachelorplus marriedBA

*** private health insurance ***
gen privhi=0
replace privhi=1 if(hiprivate==2)
tab privhi

regress health female married south west midwest exptot bachelorplus marriedBA privhi

*** Quality of health care ***
sum adhecr, detail

regress health female married south west midwest exptot bachelorplus marriedBA privhi adhecr

*** Stepwise regression backward selection *****
stepwise, pr(0.01): regress health female married south west midwest exptot bachelorplus marriedBA privhi adhecr

*** Stepwise regression forward selection *****
stepwise, pe(0.01): regress health female married south west midwest exptot bachelorplus marriedBA privhi adhecr


