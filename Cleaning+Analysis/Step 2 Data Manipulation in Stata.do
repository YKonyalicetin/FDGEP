*********************************************************************************
*********************************************************************************
**Data set 5YrAvg_Data.csv that was created in R will be further manipulated in Stata
**Growth Rates calculation (differenced log) are preferred from Stata************

clear all

cd "C:\Users\Yusuf Konyalicetin\Dropbox\Thesis\Data"

import delimited "C:\Users\Yusuf Konyalicetin\Dropbox\Thesis\Data\5YrAvg_Data.csv"

**Stata imported some of the variables as stings
**This will be taken care of in the following lines
destring pov_190, generate(Pov_190) force float
destring pov_320, generate(Pov_320) force float
destring pov_550, generate(Pov_550) force float
destring gini, generate(Gini) force float
destring private_credit, generate(Private_Credit) force float
destring gdppc, generate(GDPpc) force float

**Will also drop logs, differenced logs etc. calculated by R

drop pov_190 pov_320 pov_550 gini private_credit
drop pov_190_ip pov_320_ip pov_550_ip gini_ip
drop log_pov_190 log_pov_320 log_pov_550 log_gini
drop dlog_pov_190 dlog_pov_320 dlog_pov_550 dlog_mean_inc dlog_gini dlog_private_credit
drop log_private_credit log_mean_inc gdppc

*Stata should know about panel structure
encode code, generate(Country_Code)
xtset Country_Code period

*Interpolation by Stata preferred
bysort Country_Code: ipolate Pov_190 period, g(Pov_190_IPO)
gen Pov_190_org=Pov_190
replace Pov_190 = Pov_190_IPO
drop Pov_190_IPO

bysort Country_Code: ipolate Pov_320 period, g(Pov_320_IPO)
gen Pov_320_org = Pov_320
replace Pov_320 = Pov_320_IPO
drop Pov_320_IPO

bysort Country_Code: ipolate Pov_550 period, g(Pov_550_IPO)
gen Pov_550_org = Pov_550
replace Pov_550 = Pov_550_IPO
drop Pov_550_IPO

bysort Country_Code: ipolate Gini period, g(Gini_IPO)
gen Gini_org = Gini
replace Gini = Gini_IPO
drop Gini_IPO

bysort Country_Code: ipolate Private_Credit period, g(Private_Credit_IPO)
gen Private_Credit_org = Private_Credit
replace Private_Credit = Private_Credit_IPO
drop Private_Credit_IPO

*Logarithmized Variables
generate lnPov_190 = ln(Pov_190)
generate lnPov_320 = ln(Pov_320)
generate lnPov_550 = ln(Pov_550)
generate lnGini = ln(Gini)
generate lnPC = ln(Private_Credit)
generate lnMI = ln(mean_inc)
generate lnGDPpc = ln(GDPpc)

*Creating differenced variables
generate dlnPov_190 = D.lnPov_190
generate dlnPov_320 = D.lnPov_320
generate dlnPov_550 = D.lnPov_550
generate dlnGini = D.lnGini
generate dlnPC = D.lnPC
generate dlnMI = D.lnMI
generate dlnGDPpc = D.lnGDPpc

*Export the Dataset
save "C:\Users\Yusuf Konyalicetin\Desktop\Thesis Folder\Stata_Thesis_Data.dta", replace

