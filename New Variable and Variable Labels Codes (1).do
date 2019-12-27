sum height, detail
mvdecode height, mv(0,95,96,97,98,99)

sum weight, detail

*** Sexual Orientation ***
mvdecode sexorien, mv(5,7,8)
mvdecode sexorien, mv(0,5,7,8)
tab sexorien


**** Health ****
tab health
mvdecode health, mv(0,7,8,9)

*** Martial status ***
mvdecode marstat marst, mv(0,99)

tab marstat marst
tab marstat, missing

gen marstat_single=.
replace marstat_single=1 if(marstat==10)
replace marstat_single=0 if(marstat!=10)
replace marstat_single=9 if(marstat==0 | marstat==99 | marstat==.)
mvdecode marstat_single, mv(9)
tab marstat_single



**** This recode collapes multiple categories of Married into one ****

gen marstat_v2=.
replace marstat_v2=1 if(marst==10 | marst==11 | marst==12 | marst==13)
replace marstat_v2=2 if(marst==20)
replace marstat_v2=3 if(marst==30)
replace marstat_v2=4 if(marst==40)
replace marstat_v2=5 if(marst==50)
tab marstat_v2

label define maritallabels 1 "Married" 2 "Widowed" 3 "Divorced" 4 "Separated" 5 "Never Married"
label values marstat_v2 maritallabels

label variable marstat_v2 "Marial Status with Married Categories Collapsed"

**** Chi-Square Examples ***

tab health marstat_v2, col chi

tab health

tab health sex, col

tab health sex, col chi


