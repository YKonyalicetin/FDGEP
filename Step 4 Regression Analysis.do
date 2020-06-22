clear all
cd "C:\Users\Yusuf Konyalicetin\Desktop\Thesis Folder"

use "C:\Users\Yusuf Konyalicetin\Desktop\Thesis Folder\Stata_Thesis_Data_w_FD.dta", clear

********Panel structure
xtset Country_Code period


*****Multiplying FD with 100 to lift it to the percentage scale of other variables in dataset
*****Also generating log of FD
replace FD = FD*100
generate lnFD = ln(FD)

*Regression Anaylsis

*1. Pooled OLS
*2. Fixed Effects
*3. Onestep System GMM
*4. Twostep System GMM
*5. Twostep System GMM for omitted Periods


*************************************************************
*******************1. Pooled OLS*****************************
*************************************************************
{
**************************$1.90******************************************************
reg dlnPov_190 dlnMI, robust

reg dlnPov_190 dlnMI dlnGini, robust

reg dlnPov_190 dlnMI dlnGini lnFD, robust

reg dlnPov_190 dlnMI dlnGini lnFD c.dlnMI#c.lnFD, robust
margins, dydx(dlnMI) at((mean) lnFD) at((p25) lnFD) at((p50) lnFD) at((p75) lnFD) at((max) lnFD)

reg dlnPov_190 dlnMI dlnGini log_zy_190 L.lnGini c.dlnMI#c.log_zy_190 c.dlnMI#c.L.lnGini, robust

reg dlnPov_190 dlnMI lnFD log_zy_190 L.lnGini c.dlnMI#c.lnFD dlnGini c.dlnMI#c.log_zy_190 c.dlnMI#c.L.lnGini, robust
margins, dydx(dlnMI) at((mean) lnFD) at((p25) lnFD) at((p50) lnFD) at((p75) lnFD) at((max) lnFD)

reg dlnPov_190 dlnMI dlnGini lnPC, robust

reg dlnPov_190 dlnMI dlnGini lnPC c.dlnMI#c.lnPC, robust
margins, dydx(dlnMI) at((mean) lnPC) at((p25) lnPC) at((p50) lnPC) at((p75) lnPC) at((max) lnPC)

reg dlnPov_190 dlnMI dlnGini lnPC log_zy_190 L.lnGini c.dlnMI#c.lnPC c.dlnMI#c.log_zy_190 c.dlnMI#c.L.lnGini, robust
margins, dydx(dlnMI) at((mean) lnPC) at((p25) lnPC) at((p50) lnPC) at((p75) lnPC) at((max) lnPC)
**************************$3.20******************************************************
reg dlnPov_320 dlnMI, robust

reg dlnPov_320 dlnMI dlnGini, robust

reg dlnPov_320 dlnMI dlnGini lnFD, robust

reg dlnPov_320 dlnMI dlnGini lnFD c.dlnMI#c.lnFD, robust
margins, dydx(dlnMI) at((mean) lnFD) at((p25) lnFD) at((p50) lnFD) at((p75) lnFD) at((max) lnFD)

reg dlnPov_320 dlnMI dlnGini log_zy_320 L.lnGini c.dlnMI#c.log_zy_320 c.dlnMI#c.L.lnGini, robust

reg dlnPov_320 dlnMI dlnGini lnFD log_zy_320 L.lnGini c.dlnMI#c.lnFD c.dlnMI#c.log_zy_320 c.dlnMI#c.L.lnGini, robust
margins, dydx(dlnMI) at((mean) lnFD) at((p25) lnFD) at((p50) lnFD) at((p75) lnFD) at((max) lnFD)

reg dlnPov_320 dlnMI dlnGini lnPC, robust

reg dlnPov_320 dlnMI dlnGini lnPC c.dlnMI#c.lnPC, robust
margins, dydx(dlnMI) at((mean) lnPC) at((p25) lnPC) at((p50) lnPC) at((p75) lnPC) at((max) lnPC)

reg dlnPov_320 dlnMI dlnGini lnPC log_zy_320 L.lnGini c.dlnMI#c.lnPC c.dlnMI#c.log_zy_320 c.dlnMI#c.L.lnGini, robust
margins, dydx(dlnMI) at((mean) lnPC) at((p25) lnPC) at((p50) lnPC) at((p75) lnPC) at((max) lnPC)

**************************$5.50******************************************************
reg dlnPov_550 dlnMI, robust

reg dlnPov_550 dlnMI dlnGini, robust

reg dlnPov_550 dlnMI dlnGini lnFD, robust

reg dlnPov_550 dlnMI dlnGini lnFD c.dlnMI#c.lnFD, robust
margins, dydx(dlnMI) at((mean) lnFD) at((p25) lnFD) at((p50) lnFD) at((p75) lnFD) at((max) lnFD)

reg dlnPov_550 dlnMI dlnGini log_zy_550 L.lnGini c.dlnMI#c.log_zy_550 c.dlnMI#c.L.lnGini, robust

reg dlnPov_550 dlnMI lnFD dlnGini log_zy_550 L.lnGini c.dlnMI#c.lnFD c.dlnMI#c.log_zy_550 c.dlnMI#c.L.lnGini, robust
margins, dydx(dlnMI) at((mean) lnFD) at((p25) lnFD) at((p50) lnFD) at((p75) lnFD) at((max) lnFD)

reg dlnPov_550 dlnMI dlnGini lnPC, robust

reg dlnPov_550 dlnMI dlnGini lnPC c.dlnMI#c.lnPC, robust
margins, dydx(dlnMI) at((mean) lnPC) at((p25) lnPC) at((p50) lnPC) at((p75) lnPC) at((max) lnPC)

reg dlnPov_550 dlnMI dlnGini lnPC log_zy_550 L.lnGini c.dlnMI#c.lnPC c.dlnMI#c.log_zy_550 c.dlnMI#c.L.lnGini, robust
margins, dydx(dlnMI) at((mean) lnPC) at((p25) lnPC) at((p50) lnPC) at((p75) lnPC) at((max) lnPC)

}










*************************************************************
******************2. Fixed Effects*****************************
*************************************************************
{
************************$1.90*************************************************************

xtreg dlnPov_190 dlnMI, fe robust

xtreg dlnPov_190 dlnMI dlnGini, fe robust

xtreg dlnPov_190 dlnMI dlnGini lnFD, fe robust

xtreg dlnPov_190 dlnMI dlnGini lnFD c.dlnMI#c.lnFD, fe robust
margins, dydx(dlnMI) at((mean) lnFD) at((p25) lnFD) at((p50) lnFD) at((p75) lnFD) at((max) lnFD)

xtreg dlnPov_190 dlnMI dlnGini log_zy_190 L.lnGini c.dlnMI#c.log_zy_190 c.dlnMI#c.L.lnGini, fe robust

xtreg dlnPov_190 dlnMI dlnGini lnFD log_zy_190 L.lnGini c.dlnMI#c.lnFD c.dlnMI#c.log_zy_190 c.dlnMI#c.L.lnGini, fe robust
margins, dydx(dlnMI) at((mean) lnFD) at((p25) lnFD) at((p50) lnFD) at((p75) lnFD) at((max) lnFD)

xtreg dlnPov_190 dlnMI dlnGini lnPC, fe robust

xtreg dlnPov_190 dlnMI dlnGini lnPC c.dlnMI#c.lnPC, fe robust
margins, dydx(dlnMI) at((mean) lnPC) at((p25) lnPC) at((p50) lnPC) at((p75) lnPC) at((max) lnPC)

xtreg dlnPov_190 dlnMI dlnGini lnPC log_zy_190 L.lnGini c.dlnMI#c.lnPC c.dlnMI#c.log_zy_190 c.dlnMI#c.L.lnGini, fe robust
margins, dydx(dlnMI) at((mean) lnPC) at((p25) lnPC) at((p50) lnPC) at((p75) lnPC) at((max) lnPC)


*********************************************************************************************************
*********************************************$3.20*******************************************************

xtreg dlnPov_320 dlnMI, fe robust

xtreg dlnPov_320 dlnMI dlnGini, fe robust

xtreg dlnPov_320 dlnMI dlnGini lnFD, fe robust

xtreg dlnPov_320 dlnMI dlnGini lnFD c.dlnMI#c.lnFD, fe robust
margins, dydx(dlnMI) at((mean) lnFD) at((p25) lnFD) at((p50) lnFD) at((p75) lnFD) at((max) lnFD)

xtreg dlnPov_320 dlnMI dlnGini log_zy_320 L.lnGini c.dlnMI#c.log_zy_320 c.dlnMI#c.L.lnGini, fe robust

xtreg dlnPov_320 dlnMI dlnGini lnFD log_zy_320 L.lnGini c.dlnMI#c.lnFD c.dlnMI#c.log_zy_320 c.dlnMI#c.L.lnGini, fe robust
margins, dydx(dlnMI) at((mean) lnFD) at((p25) lnFD) at((p50) lnFD) at((p75) lnFD) at((max) lnFD)

xtreg dlnPov_320 dlnMI dlnGini lnPC, fe robust

xtreg dlnPov_320 dlnMI dlnGini lnPC c.dlnMI#c.lnPC, fe robust
margins, dydx(dlnMI) at((mean) lnPC) at((p25) lnPC) at((p50) lnPC) at((p75) lnPC) at((max) lnPC)

xtreg dlnPov_320 dlnMI dlnGini lnPC log_zy_320 L.lnGini c.dlnMI#c.lnPC c.dlnMI#c.log_zy_320 c.dlnMI#c.L.lnGini, fe robust
margins, dydx(dlnMI) at((mean) lnPC) at((p25) lnPC) at((p50) lnPC) at((p75) lnPC) at((max) lnPC)

******************************************************************************************************
********************************************$5.50*****************************************************

xtreg dlnPov_550 dlnMI, fe robust

xtreg dlnPov_550 dlnMI dlnGini, fe robust

xtreg dlnPov_550 dlnMI dlnGini lnFD, fe robust

xtreg dlnPov_550 dlnMI dlnGini lnFD c.dlnMI#c.lnFD, fe robust
margins, dydx(dlnMI) at((mean) lnFD) at((p25) lnFD) at((p50) lnFD) at((p75) lnFD) at((max) lnFD)

xtreg dlnPov_550 dlnMI dlnGini log_zy_550 L.lnGini c.dlnMI#c.log_zy_550 c.dlnMI#c.L.lnGini, fe robust

xtreg dlnPov_550 dlnMI dlnGini lnFD log_zy_550 L.lnGini c.dlnMI#c.lnFD c.dlnMI#c.log_zy_550 c.dlnMI#c.L.lnGini, fe robust
margins, dydx(dlnMI) at((mean) lnFD) at((p25) lnFD) at((p50) lnFD) at((p75) lnFD) at((max) lnFD)

xtreg dlnPov_550 dlnMI dlnGini lnPC, fe robust

xtreg dlnPov_550 dlnMI dlnGini lnPC c.dlnMI#c.lnPC, fe robust
margins, dydx(dlnMI) at((mean) lnPC) at((p25) lnPC) at((p50) lnPC) at((p75) lnPC) at((max) lnPC)

xtreg dlnPov_550 dlnMI dlnGini lnPC log_zy_550 L.lnGini c.dlnMI#c.lnPC c.dlnMI#c.log_zy_550 c.dlnMI#c.L.lnGini, fe robust
margins, dydx(dlnMI) at((mean) lnPC) at((p25) lnPC) at((p50) lnPC) at((p75) lnPC) at((max) lnPC)
}


*************************************************************
******************3. Onestep GMM*****************************
*************************************************************
{
*$1.90 Regressions

xtabond2 dlnPov_190 dlnMI, gmm(L.lnMI, lag(1 2)) iv(pop_growth) small robust 

xtabond2 dlnPov_190 dlnMI dlnGini, gmm(L.(lnMI lnGini), lag(1 2)) iv(pop_growth) small robust

xtabond2 dlnPov_190 dlnMI dlnGini lnFD, gmm(L.(lnMI lnGini lnFD), lag(1 2)) iv(pop_growth) small robust

xtabond2 dlnPov_190 dlnMI dlnGini c.dlnMI##c.lnFD, gmm(L.(lnMI lnGini lnFD), lag(1 2)) iv(pop_growth) small robust
margins, dydx(dlnMI) at((mean) lnFD) at((p25) lnFD) at((p50) lnFD) at((p75) lnFD) at((max) lnFD)

xtabond2 dlnPov_190 dlnMI dlnGini c.dlnMI##c.log_zy_190 c.dlnMI##c.L.lnGini, gmm(L.(lnMI lnGini), lag(1 2)) iv(pop_growth) small robust

xtabond2 dlnPov_190 dlnMI c.dlnMI##c.lnFD dlnGini c.dlnMI##c.log_zy_190 c.dlnMI##c.L.lnGini, gmm(L.(lnMI lnGini lnFD), lag(1 2)) iv(pop_growth) small robust
margins, dydx(dlnMI) at((mean) lnFD) at((p25) lnFD) at((p50) lnFD) at((p75) lnFD) at((max) lnFD)

xtabond2 dlnPov_190 dlnMI dlnGini lnPC, gmm(L.(lnMI lnGini lnPC), lag(1 2)) iv(pop_growth) small robust

xtabond2 dlnPov_190 dlnMI dlnGini c.dlnMI##c.lnPC, gmm(L.(lnMI lnGini lnPC), lag(1 2)) iv(pop_growth) small robust
margins, dydx(dlnMI) at((mean) lnPC) at((p25) lnPC) at((p50) lnPC) at((p75) lnPC) at((max) lnPC)

xtabond2 dlnPov_190 dlnMI c.dlnMI##c.lnPC dlnGini c.dlnMI##c.log_zy_190 c.dlnMI##c.L.lnGini, gmm(L.(lnMI lnGini lnPC), lag(1 2)) iv(pop_growth) small robust
margins, dydx(dlnMI) at((mean) lnPC) at((p25) lnPC) at((p50) lnPC) at((p75) lnPC) at((max) lnPC)

*$3.20 Regressions

xtabond2 dlnPov_320 dlnMI, gmm(L.lnMI, lag(1 2)) iv(pop_growth) small robust

xtabond2 dlnPov_320 dlnMI dlnGini, gmm(L.(lnMI lnGini), lag(1 2)) iv(pop_growth) small robust

xtabond2 dlnPov_320 dlnMI dlnGini lnFD, gmm(L.(lnMI lnGini lnFD), lag(1 2)) iv(pop_growth) small robust

xtabond2 dlnPov_320 dlnMI dlnGini c.dlnMI##c.lnFD, gmm(L.(lnMI lnGini lnFD), lag(1 2)) iv(pop_growth) small robust
margins, dydx(dlnMI) at((mean) lnFD) at((p25) lnFD) at((p50) lnFD) at((p75) lnFD) at((max) lnFD)

xtabond2 dlnPov_320 dlnMI dlnGini c.dlnMI##c.log_zy_320 c.dlnMI##c.L.lnGini, gmm(L.(lnMI lnGini), lag(1 2)) iv(pop_growth) small robust

xtabond2 dlnPov_320 dlnMI c.dlnMI##c.lnFD dlnGini c.dlnMI##c.log_zy_320 c.dlnMI##c.L.lnGini, gmm(L.(lnMI lnGini lnFD), lag(1 2)) iv(pop_growth) small robust
margins, dydx(dlnMI) at((mean) lnFD) at((p25) lnFD) at((p50) lnFD) at((p75) lnFD) at((max) lnFD)

xtabond2 dlnPov_320 dlnMI dlnGini lnPC, gmm(L.(lnMI lnGini lnPC), lag(1 2)) iv(pop_growth) small robust

xtabond2 dlnPov_320 dlnMI dlnGini c.dlnMI##c.lnPC, gmm(L.(lnMI lnGini lnPC), lag(1 2)) iv(pop_growth) small robust
margins, dydx(dlnMI) at((mean) lnPC) at((p25) lnPC) at((p50) lnPC) at((p75) lnPC) at((max) lnPC)

xtabond2 dlnPov_320 dlnMI c.dlnMI##c.lnPC dlnGini c.dlnMI##c.log_zy_320 c.dlnMI##c.L.lnGini, gmm(L.(lnMI lnGini lnPC), lag(1 2)) iv(pop_growth) small robust
margins, dydx(dlnMI) at((mean) lnPC) at((p25) lnPC) at((p50) lnPC) at((p75) lnPC) at((max) lnPC)

*$5.50 Regressions

xtabond2 dlnPov_550 dlnMI, gmm(L.lnMI, lag(1 2)) iv(pop_growth) small robust

xtabond2 dlnPov_550 dlnMI dlnGini, gmm(L.(lnMI lnGini), lag(1 2)) iv(pop_growth) small robust

xtabond2 dlnPov_550 dlnMI dlnGini lnFD, gmm(L.(lnMI lnGini lnFD), lag(1 2)) iv(pop_growth) small robust

xtabond2 dlnPov_550 dlnMI dlnGini c.dlnMI##c.lnFD, gmm(L.(lnMI lnGini lnFD), lag(1 2)) iv(pop_growth) small robust
margins, dydx(dlnMI) at((mean) lnFD) at((p25) lnFD) at((p50) lnFD) at((p75) lnFD) at((max) lnFD)

xtabond2 dlnPov_550 dlnMI dlnGini c.dlnMI##c.log_zy_550 c.dlnMI##c.L.lnGini, gmm(L.(lnMI lnGini), lag(1 2)) iv(pop_growth) small robust

xtabond2 dlnPov_550 dlnMI c.dlnMI##c.lnFD dlnGini c.dlnMI##c.log_zy_550 c.dlnMI##c.L.lnGini, gmm(L.(lnMI lnGini lnFD), lag(1 2)) iv(pop_growth) small robust
margins, dydx(dlnMI) at((mean) lnFD) at((p25) lnFD) at((p50) lnFD) at((p75) lnFD) at((max) lnFD)

xtabond2 dlnPov_550 dlnMI dlnGini lnPC, gmm(L.(lnMI lnGini lnPC), lag(1 2)) iv(pop_growth) small robust

xtabond2 dlnPov_550 dlnMI dlnGini c.dlnMI##c.lnPC, gmm(L.(lnMI lnGini lnPC), lag(1 2)) iv(pop_growth) small robust
margins, dydx(dlnMI) at((mean) lnPC) at((p25) lnPC) at((p50) lnPC) at((p75) lnPC) at((max) lnPC)

xtabond2 dlnPov_550 dlnMI c.dlnMI##c.lnPC dlnGini c.dlnMI##c.log_zy_550 c.dlnMI##c.L.lnGini, gmm(L.(lnMI lnGini lnPC), lag(1 2)) iv(pop_growth) small robust
margins, dydx(dlnMI) at((mean) lnPC) at((p25) lnPC) at((p50) lnPC) at((p75) lnPC) at((max) lnPC)
}


*************************************************************
******************4. Twostep GMM*****************************
*************************************************************
{
*$1.90 Regressions
*GMM1a
xtabond2 dlnPov_190 dlnMI, gmm(L.lnMI, lag(1 2)) iv(pop_growth) small robust twostep

xtabond2 dlnPov_190 dlnMI dlnGini, gmm(L.(lnMI lnGini), lag(1 2)) iv(pop_growth) small robust twostep

xtabond2 dlnPov_190 dlnMI dlnGini lnFD, gmm(L.(lnMI lnGini lnFD), lag(1 2)) iv(pop_growth) small robust twostep

xtabond2 dlnPov_190 dlnMI dlnGini c.dlnMI##c.lnFD, gmm(L.(lnMI lnGini lnFD), lag(1 2)) iv(pop_growth) small robust twostep
margins, dydx(dlnMI) at((mean) lnFD) at((p25) lnFD) at((p50) lnFD) at((p75) lnFD) at((max) lnFD)

xtabond2 dlnPov_190 dlnMI dlnGini c.dlnMI##c.log_zy_190 c.dlnMI##c.L.lnGini, gmm(L.(lnMI lnGini), lag(1 2)) iv(pop_growth) small robust twostep

xtabond2 dlnPov_190 dlnMI c.dlnMI##c.lnFD dlnGini c.dlnMI##c.log_zy_190 c.dlnMI##c.L.lnGini, gmm(L.(lnMI lnGini lnFD), lag(1 2)) iv(pop_growth) small robust twostep
margins, dydx(dlnMI) at((mean) lnFD) at((p25) lnFD) at((p50) lnFD) at((p75) lnFD) at((max) lnFD)

xtabond2 dlnPov_190 dlnMI dlnGini lnPC, gmm(L.(lnMI lnGini lnPC), lag(1 2)) iv(pop_growth) small robust twostep

xtabond2 dlnPov_190 dlnMI dlnGini c.dlnMI##c.lnPC, gmm(L.(lnMI lnGini lnPC), lag(1 2)) iv(pop_growth) small robust twostep
margins, dydx(dlnMI) at((mean) lnPC) at((p25) lnPC) at((p50) lnPC) at((p75) lnPC) at((max) lnPC)

xtabond2 dlnPov_190 dlnMI c.dlnMI##c.lnPC dlnGini c.dlnMI##c.log_zy_190 c.dlnMI##c.L.lnGini, gmm(L.(lnMI lnGini lnPC), lag(1 2)) iv(pop_growth) small robust twostep
margins, dydx(dlnMI) at((mean) lnPC) at((p25) lnPC) at((p50) lnPC) at((p75) lnPC) at((max) lnPC)

*$3.20 Regressions

xtabond2 dlnPov_320 dlnMI, gmm(L.lnMI, lag(1 2)) iv(pop_growth) small robust twostep

xtabond2 dlnPov_320 dlnMI dlnGini, gmm(L.(lnMI lnGini), lag(1 2)) iv(pop_growth) small robust twostep

xtabond2 dlnPov_320 dlnMI dlnGini lnFD, gmm(L.(lnMI lnGini lnFD), lag(1 2)) iv(pop_growth) small robust twostep

xtabond2 dlnPov_320 dlnMI dlnGini c.dlnMI##c.lnFD, gmm(L.(lnMI lnGini lnFD), lag(1 2)) iv(pop_growth) small robust twostep
margins, dydx(dlnMI) at((mean) lnFD) at((p25) lnFD) at((p50) lnFD) at((p75) lnFD) at((max) lnFD)

xtabond2 dlnPov_320 dlnMI dlnGini c.dlnMI##c.log_zy_320 c.dlnMI##c.L.lnGini, gmm(L.(lnMI lnGini), lag(1 2)) iv(pop_growth) small robust twostep

xtabond2 dlnPov_320 dlnMI c.dlnMI##c.lnFD dlnGini c.dlnMI##c.log_zy_320 c.dlnMI##c.L.lnGini, gmm(L.(lnMI lnGini lnFD), lag(1 2)) iv(pop_growth) small robust twostep
margins, dydx(dlnMI) at((mean) lnFD) at((p25) lnFD) at((p50) lnFD) at((p75) lnFD) at((max) lnFD)

xtabond2 dlnPov_320 dlnMI dlnGini lnPC, gmm(L.(lnMI lnGini lnPC), lag(1 2)) iv(pop_growth) small robust twostep

xtabond2 dlnPov_320 dlnMI dlnGini c.dlnMI##c.lnPC, gmm(L.(lnMI lnGini lnPC), lag(1 2)) iv(pop_growth) small robust twostep
margins, dydx(dlnMI) at((mean) lnPC) at((p25) lnPC) at((p50) lnPC) at((p75) lnPC) at((max) lnPC)

xtabond2 dlnPov_320 dlnMI c.dlnMI##c.lnPC dlnGini c.dlnMI##c.log_zy_320 c.dlnMI##c.L.lnGini, gmm(L.(lnMI lnGini lnPC), lag(1 2)) iv(pop_growth) small robust twostep
margins, dydx(dlnMI) at((mean) lnPC) at((p25) lnPC) at((p50) lnPC) at((p75) lnPC) at((max) lnPC)

*$5.50 Regressions

xtabond2 dlnPov_550 dlnMI, gmm(L.lnMI, lag(1 2)) iv(pop_growth) small robust twostep

xtabond2 dlnPov_550 dlnMI dlnGini, gmm(L.(lnMI lnGini), lag(1 2)) iv(pop_growth) small robust twostep

xtabond2 dlnPov_550 dlnMI dlnGini lnFD, gmm(L.(lnMI lnGini lnFD), lag(1 2)) iv(pop_growth) small robust twostep

xtabond2 dlnPov_550 dlnMI dlnGini c.dlnMI##c.lnFD, gmm(L.(lnMI lnGini lnFD), lag(1 2)) iv(pop_growth) small robust twostep
margins, dydx(dlnMI) at((mean) lnFD) at((p25) lnFD) at((p50) lnFD) at((p75) lnFD) at((max) lnFD)

xtabond2 dlnPov_550 dlnMI dlnGini c.dlnMI##c.log_zy_550 c.dlnMI##c.L.lnGini, gmm(L.(lnMI lnGini), lag(1 2)) iv(pop_growth) small robust twostep

xtabond2 dlnPov_550 dlnMI c.dlnMI##c.lnFD dlnGini c.dlnMI##c.log_zy_550 c.dlnMI##c.L.lnGini, gmm(L.(lnMI lnGini lnFD), lag(1 2)) iv(pop_growth) small robust twostep
margins, dydx(dlnMI) at((mean) lnFD) at((p25) lnFD) at((p50) lnFD) at((p75) lnFD) at((max) lnFD)

xtabond2 dlnPov_550 dlnMI dlnGini lnPC, gmm(L.(lnMI lnGini lnPC), lag(1 2)) iv(pop_growth) small robust twostep

xtabond2 dlnPov_550 dlnMI dlnGini c.dlnMI##c.lnPC, gmm(L.(lnMI lnGini lnPC), lag(1 2)) iv(pop_growth) small robust twostep
margins, dydx(dlnMI) at((mean) lnPC) at((p25) lnPC) at((p50) lnPC) at((p75) lnPC) at((max) lnPC)

xtabond2 dlnPov_550 dlnMI c.dlnMI##c.lnPC dlnGini c.dlnMI##c.log_zy_550 c.dlnMI##c.L.lnGini, gmm(L.(lnMI lnGini lnPC), lag(1 2)) iv(pop_growth) small robust twostep
margins, dydx(dlnMI) at((mean) lnPC) at((p25) lnPC) at((p50) lnPC) at((p75) lnPC) at((max) lnPC)


}

*************************************************************
******************4. Twostep GMM for omitted Periods*********
*************************************************************
{
*************************Exluding Period 7**************************************
*$1.90 Regressions
xtabond2 dlnPov_190 dlnMI if period!=7, gmm(L.lnMI, lag(1 2)) iv(pop_growth) small robust twostep

xtabond2 dlnPov_190 dlnMI dlnGini if period!=7, gmm(L.(lnMI lnGini), lag(1 2)) iv(pop_growth) small robust twostep

xtabond2 dlnPov_190 dlnMI dlnGini lnFD if period!=7, gmm(L.(lnMI lnGini lnFD), lag(1 2)) iv(pop_growth) small robust twostep

xtabond2 dlnPov_190 dlnMI dlnGini c.dlnMI##c.lnFD if period!=7, gmm(L.(lnMI lnGini lnFD), lag(1 2)) iv(pop_growth) small robust twostep
margins, dydx(dlnMI) at((mean) lnFD) at((p25) lnFD) at((p50) lnFD) at((p75) lnFD) at((max) lnFD)

xtabond2 dlnPov_190 dlnMI dlnGini c.dlnMI##c.log_zy_190 c.dlnMI##c.L.lnGini if period!=7, gmm(L.(lnMI lnGini), lag(1 2)) iv(pop_growth) small robust twostep

xtabond2 dlnPov_190 dlnMI dlnGini c.dlnMI##c.lnFD c.dlnMI##c.log_zy_190 c.dlnMI##c.L.lnGini if period!=7, gmm(L.(lnMI lnGini lnFD), lag(1 2)) iv(pop_growth) small robust twostep
margins, dydx(dlnMI) at((mean) lnFD) at((p25) lnFD) at((p50) lnFD) at((p75) lnFD) at((max) lnFD)

xtabond2 dlnPov_190 dlnMI dlnGini lnPC if period!=7, gmm(L.(lnMI lnGini lnPC), lag(1 2)) iv(pop_growth) small robust twostep

xtabond2 dlnPov_190 dlnMI dlnGini c.dlnMI##c.lnPC if period!=7, gmm(L.(lnMI lnGini lnPC), lag(1 2)) iv(pop_growth) small robust twostep
margins, dydx(dlnMI) at((mean) lnPC) at((p25) lnPC) at((p50) lnPC) at((p75) lnPC) at((max) lnPC)

xtabond2 dlnPov_190 dlnMI dlnGini c.dlnMI##c.lnPC c.dlnMI##c.log_zy_190 c.dlnMI##c.L.lnGini if period!=7, gmm(L.(lnMI lnGini lnPC), lag(1 2)) iv(pop_growth) small robust twostep
margins, dydx(dlnMI) at((mean) lnPC) at((p25) lnPC) at((p50) lnPC) at((p75) lnPC) at((max) lnPC)

*$3.20 Regressions

xtabond2 dlnPov_320 dlnMI if period!=7, gmm(L.lnMI, lag(1 2)) iv(pop_growth) small robust twostep

xtabond2 dlnPov_320 dlnMI dlnGini if period!=7, gmm(L.(lnMI lnGini), lag(1 2)) iv(pop_growth) small robust twostep

xtabond2 dlnPov_320 dlnMI dlnGini lnFD if period!=7, gmm(L.(lnMI lnGini lnFD), lag(1 2)) iv(pop_growth) small robust twostep

xtabond2 dlnPov_320 dlnMI dlnGini c.dlnMI##c.lnFD if period!=7, gmm(L.(lnMI lnGini lnFD), lag(1 2)) iv(pop_growth) small robust twostep
margins, dydx(dlnMI) at((mean) lnFD) at((p25) lnFD) at((p50) lnFD) at((p75) lnFD) at((max) lnFD)

xtabond2 dlnPov_320 dlnMI dlnGini c.dlnMI##c.log_zy_320 c.dlnMI##c.L.lnGini if period!=7, gmm(L.(lnMI lnGini), lag(1 2)) iv(pop_growth) small robust twostep

xtabond2 dlnPov_320 dlnMI c.dlnMI##c.lnFD dlnGini c.dlnMI##c.log_zy_320 c.dlnMI##c.L.lnGini if period!=7, gmm(L.(lnMI lnGini lnFD), lag(1 2)) iv(pop_growth) small robust twostep
margins, dydx(dlnMI) at((mean) lnFD) at((p25) lnFD) at((p50) lnFD) at((p75) lnFD) at((max) lnFD)

xtabond2 dlnPov_320 dlnMI dlnGini lnPC if period!=7, gmm(L.(lnMI lnGini lnPC), lag(1 2)) iv(pop_growth) small robust twostep

xtabond2 dlnPov_320 dlnMI dlnGini c.dlnMI##c.lnPC if period!=7, gmm(L.(lnMI lnGini lnPC), lag(1 2)) iv(pop_growth) small robust twostep
margins, dydx(dlnMI) at((mean) lnPC) at((p25) lnPC) at((p50) lnPC) at((p75) lnPC) at((max) lnPC)

xtabond2 dlnPov_320 dlnMI c.dlnMI##c.lnPC dlnGini c.dlnMI##c.log_zy_320 c.dlnMI##c.L.lnGini if period!=7, gmm(L.(lnMI lnGini lnPC), lag(1 2)) iv(pop_growth) small robust twostep
margins, dydx(dlnMI) at((mean) lnPC) at((p25) lnPC) at((p50) lnPC) at((p75) lnPC) at((max) lnPC)

*$5.50 Regressions

xtabond2 dlnPov_550 dlnMI if period!=7, gmm(L.lnMI, lag(1 2)) iv(pop_growth) small robust twostep

xtabond2 dlnPov_550 dlnMI dlnGini if period!=7, gmm(L.(lnMI lnGini), lag(1 2)) iv(pop_growth) small robust twostep

xtabond2 dlnPov_550 dlnMI dlnGini lnFD if period!=7, gmm(L.(lnMI lnGini lnFD), lag(1 2)) iv(pop_growth) small robust twostep

xtabond2 dlnPov_550 dlnMI dlnGini c.dlnMI##c.lnFD if period!=7, gmm(L.(lnMI lnGini lnFD), lag(1 2)) iv(pop_growth) small robust twostep
margins, dydx(dlnMI) at((mean) lnFD) at((p25) lnFD) at((p50) lnFD) at((p75) lnFD) at((max) lnFD)

xtabond2 dlnPov_550 dlnMI dlnGini c.dlnMI##c.log_zy_550 c.dlnMI##c.L.lnGini if period!=7, gmm(L.(lnMI lnGini), lag(1 2)) iv(pop_growth) small robust twostep

xtabond2 dlnPov_550 dlnMI c.dlnMI##c.lnFD dlnGini c.dlnMI##c.log_zy_550 c.dlnMI##c.L.lnGini if period!=7, gmm(L.(lnMI lnGini lnFD), lag(1 2)) iv(pop_growth) small robust twostep
margins, dydx(dlnMI) at((mean) lnFD) at((p25) lnFD) at((p50) lnFD) at((p75) lnFD) at((max) lnFD)

xtabond2 dlnPov_550 dlnMI dlnGini lnPC if period!=7, gmm(L.(lnMI lnGini lnPC), lag(1 2)) iv(pop_growth) small robust twostep

xtabond2 dlnPov_550 dlnMI dlnGini c.dlnMI##c.lnPC if period!=7, gmm(L.(lnMI lnGini lnPC), lag(1 2)) iv(pop_growth) small robust twostep
margins, dydx(dlnMI) at((mean) lnPC) at((p25) lnPC) at((p50) lnPC) at((p75) lnPC) at((max) lnPC)

xtabond2 dlnPov_550 dlnMI c.dlnMI##c.lnPC dlnGini c.dlnMI##c.log_zy_550 c.dlnMI##c.L.lnGini if period!=7, gmm(L.(lnMI lnGini lnPC), lag(1 2)) iv(pop_growth) small robust twostep
margins, dydx(dlnMI) at((mean) lnPC) at((p25) lnPC) at((p50) lnPC) at((p75) lnPC) at((max) lnPC)




***************************************Excluding Period 6 and 7***********************************************************************************
*$1.90 Regressions

xtabond2 dlnPov_190 dlnMI if period!=6 & period!=7, gmm(L.lnMI, lag(1 2)) iv(pop_growth) small robust twostep

xtabond2 dlnPov_190 dlnMI dlnGini if period!=6 & period!=7, gmm(L.(lnMI lnGini), lag(1 2)) iv(pop_growth) small robust twostep

xtabond2 dlnPov_190 dlnMI dlnGini lnFD if period!=6 & period!=7, gmm(L.(lnMI lnGini lnFD), lag(1 2)) iv(pop_growth) small robust twostep

xtabond2 dlnPov_190 dlnMI dlnGini c.dlnMI##c.lnFD if period!=6 & period!=7, gmm(L.(lnMI lnGini lnFD), lag(1 2)) iv(pop_growth) small robust twostep
margins, dydx(dlnMI) at((mean) lnFD) at((p25) lnFD) at((p50) lnFD) at((p75) lnFD) at((max) lnFD)

xtabond2 dlnPov_190 dlnMI dlnGini c.dlnMI##c.log_zy_190 c.dlnMI##c.L.lnGini if period!=6 & period!=7, gmm(L.(lnMI lnGini), lag(1 2)) iv(pop_growth) small robust twostep

xtabond2 dlnPov_190 dlnMI c.dlnMI##c.lnFD dlnGini c.dlnMI##c.log_zy_190 c.dlnMI##c.L.lnGini if period!=6 & period!=7, gmm(L.(lnMI lnGini lnFD), lag(1 2)) iv(pop_growth) small robust twostep
margins, dydx(dlnMI) at((mean) lnFD) at((p25) lnFD) at((p50) lnFD) at((p75) lnFD) at((max) lnFD)

xtabond2 dlnPov_190 dlnMI dlnGini lnPC if period!=6 & period!=7, gmm(L.(lnMI lnGini lnPC), lag(1 2)) iv(pop_growth) small robust twostep

xtabond2 dlnPov_190 dlnMI dlnGini c.dlnMI##c.lnPC if period!=6 & period!=7, gmm(L.(lnMI lnGini lnPC), lag(1 2)) iv(pop_growth) small robust twostep
margins, dydx(dlnMI) at((mean) lnPC) at((p25) lnPC) at((p50) lnPC) at((p75) lnPC) at((max) lnPC)

xtabond2 dlnPov_190 dlnMI c.dlnMI##c.lnPC dlnGini c.dlnMI##c.log_zy_190 c.dlnMI##c.L.lnGini if period!=6 & period!=7, gmm(L.(lnMI lnGini lnPC), lag(1 2)) iv(pop_growth) small robust twostep
margins, dydx(dlnMI) at((mean) lnPC) at((p25) lnPC) at((p50) lnPC) at((p75) lnPC) at((max) lnPC)

*$3.20 Regressions

*GMM3a
xtabond2 dlnPov_320 dlnMI if period!=6 & period!=7, gmm(L.lnMI, lag(1 2)) iv(pop_growth) small robust twostep

xtabond2 dlnPov_320 dlnMI dlnGini if period!=6 & period!=7, gmm(L.(lnMI lnGini), lag(1 2)) iv(pop_growth) small robust twostep

xtabond2 dlnPov_320 dlnMI dlnGini lnFD if period!=6 & period!=7, gmm(L.(lnMI lnGini lnFD), lag(1 2)) iv(pop_growth) small robust twostep

xtabond2 dlnPov_320 dlnMI dlnGini c.dlnMI##c.lnFD if period!=6 & period!=7, gmm(L.(lnMI lnGini lnFD), lag(1 2)) iv(pop_growth) small robust twostep
margins, dydx(dlnMI) at((mean) lnFD) at((p25) lnFD) at((p50) lnFD) at((p75) lnFD) at((max) lnFD)

xtabond2 dlnPov_320 dlnMI dlnGini c.dlnMI##c.log_zy_320 c.dlnMI##c.L.lnGini if period!=6 & period!=7, gmm(L.(lnMI lnGini), lag(1 2)) iv(pop_growth) small robust twostep

xtabond2 dlnPov_320 dlnMI c.dlnMI##c.lnFD dlnGini c.dlnMI##c.log_zy_320 c.dlnMI##c.L.lnGini if period!=6 & period!=7, gmm(L.(lnMI lnGini lnFD), lag(1 2)) iv(pop_growth) small robust twostep
margins, dydx(dlnMI) at((mean) lnFD) at((p25) lnFD) at((p50) lnFD) at((p75) lnFD) at((max) lnFD)

xtabond2 dlnPov_320 dlnMI dlnGini lnPC if period!=6 & period!=7, gmm(L.(lnMI lnGini lnPC), lag(1 2)) iv(pop_growth) small robust twostep

xtabond2 dlnPov_320 dlnMI dlnGini c.dlnMI##c.lnPC if period!=6 & period!=7, gmm(L.(lnMI lnGini lnPC), lag(1 2)) iv(pop_growth) small robust twostep
margins, dydx(dlnMI) at((mean) lnPC) at((p25) lnPC) at((p50) lnPC) at((p75) lnPC) at((max) lnPC)

xtabond2 dlnPov_320 dlnMI c.dlnMI##c.lnPC dlnGini c.dlnMI##c.log_zy_320 c.dlnMI##c.L.lnGini if period!=6 & period!=7, gmm(L.(lnMI lnGini lnPC), lag(1 2)) iv(pop_growth) small robust twostep
margins, dydx(dlnMI) at((mean) lnPC) at((p25) lnPC) at((p50) lnPC) at((p75) lnPC) at((max) lnPC)

*5.50 Regressions

xtabond2 dlnPov_550 dlnMI if period!=6 & period!=7, gmm(L.lnMI, lag(1 2)) iv(pop_growth) small robust twostep

xtabond2 dlnPov_550 dlnMI dlnGini if period!=6 & period!=7, gmm(L.(lnMI lnGini), lag(1 2)) iv(pop_growth) small robust twostep

xtabond2 dlnPov_550 dlnMI dlnGini lnFD if period!=6 & period!=7, gmm(L.(lnMI lnGini lnFD), lag(1 2)) iv(pop_growth) small robust twostep

xtabond2 dlnPov_550 dlnMI dlnGini c.dlnMI##c.lnFD if period!=6 & period!=7, gmm(L.(lnMI lnGini lnFD), lag(1 2)) iv(pop_growth) small robust twostep
margins, dydx(dlnMI) at((mean) lnFD) at((p25) lnFD) at((p50) lnFD) at((p75) lnFD) at((max) lnFD)

xtabond2 dlnPov_550 dlnMI dlnGini c.dlnMI##c.log_zy_550 c.dlnMI##c.L.lnGini if period!=6 & period!=7, gmm(L.(lnMI lnGini), lag(1 2)) iv(pop_growth) small robust twostep

xtabond2 dlnPov_550 dlnMI c.dlnMI##c.lnFD dlnGini c.dlnMI##c.log_zy_550 c.dlnMI##c.L.lnGini if period!=6 & period!=7, gmm(L.(lnMI lnGini lnFD), lag(1 2)) iv(pop_growth) small robust twostep
margins, dydx(dlnMI) at((mean) lnFD) at((p25) lnFD) at((p50) lnFD) at((p75) lnFD) at((max) lnFD)

xtabond2 dlnPov_550 dlnMI dlnGini lnPC if period!=6 & period!=7, gmm(L.(lnMI lnGini lnPC), lag(1 2)) iv(pop_growth) small robust twostep

xtabond2 dlnPov_550 dlnMI dlnGini c.dlnMI##c.lnPC if period!=6 & period!=7, gmm(L.(lnMI lnGini lnPC), lag(1 2)) iv(pop_growth) small robust twostep
margins, dydx(dlnMI) at((mean) lnPC) at((p25) lnPC) at((p50) lnPC) at((p75) lnPC) at((max) lnPC)

xtabond2 dlnPov_550 dlnMI c.dlnMI##c.lnPC dlnGini c.dlnMI##c.log_zy_550 c.dlnMI##c.L.lnGini if period!=6 & period!=7, gmm(L.(lnMI lnGini lnPC), lag(1 2)) iv(pop_growth) small robust twostep
margins, dydx(dlnMI) at((mean) lnPC) at((p25) lnPC) at((p50) lnPC) at((p75) lnPC) at((max) lnPC)









}




