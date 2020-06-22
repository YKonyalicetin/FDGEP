********************************************************************************
***PLOTTING INTERACTIONS BETWEEN MEAN INCOME GROWTH AND FD MEASURES*************
**********Here we plot marginal effect for Z (FD)**********************
version 14.2


log using "C:\Users\Yusuf Konyalicetin\Desktop\plotting_interactions.log", replace

*Setting Working Directory

cd "C:\Users\Yusuf Konyalicetin\Dropbox\Thesis\Data"

*Loading in my Data
use "C:\Users\Yusuf Konyalicetin\Dropbox\Thesis\Data\Stata_Thesis_Data_w_FD.dta", clear

*Encoding and setting data to panel
xtset Country_Code period

*Manipulating FD variable by creating logs


***************************************************************************************************************

*set obs 10000

*regression model (4) with FD
reg dlnPov_190 dlnMI dlnGini lnFD c.dlnMI#c.lnFD, robust

*Check marginal effects
*margins, dydx(lnFD) at((min) dlnMI) at((p25) dlnMI) at((p50) dlnMI) at((p75) dlnMI) at((max) dlnMI)

*Grabbing elements of estimated coefficient vector b abd variance-covariance matrix V
matrix b=e(b)
matrix V=e(V)

*Grabbing coefficients of interest .27944483 (b3) and -2.646007 (b4); see matrix with command "matrix list e(b)"
scalar b3=b[1,3]
scalar b4=b[1,4]

*Grabbing estimated variances for b3 (.03665563) and b4 (1.1438238); display with "matrix list e(V)"
scalar varb3=V[3,3]
scalar varb4=V[4,4]

*Grabbing covariance for b3 and b4
scalar covb3b4=V[3,4]

*Creating and listing scalars equal to the coefficients, variances and covariance
scalar list b3 b4 varb3 varb4 covb3b4

********************Calculating Data that is necessary for top marginal plot**********************************

*Generating variable MVZ that takes on all values of dlnMI (-1 to  1) at each increment of 0.01
generate MVZ=((_n-100)/100)

*Maybe this is the reason why he put observations to 10000. However, here the last value is set where observations are bigger then 441
replace  MVZ=. if _n>225

*Calculating Marginal Effect of FD on Poverty Reduction for the desired values of modifying variable dlnMI
gen conbx=b3+b4*MVZ if _n<225

*Calculating Standard Error for marginal effect of Mean Income Growth on Poverty Reduction for desired values of modifying variable logFD
gen consx=sqrt(varb3+varb4*(MVZ^2)+2*covb3b4*MVZ) if _n<225

*Creating two tailed Confidence Intervals at 95%

gen ax=1.96*consx

gen upperx=conbx+ax

gen lowerx=conbx-ax

*For the rug-plot, first number has to be determined by trial and error

gen where=-5

gen pipe = "|"

egen tag_dlnMI = tag(dlnMI)

*Creating horizontal line at 0 on vertical axis

gen yline=0

*Creating plot
graph twoway hist dlnMI, width(0.05) percent color(gs14) yaxis(2) 						///
		||	 scatter where dlnMI if tag_dlnMI,											///
			 plotr(m(b 4)) ms(none) mlabcolor(gs5) mlabel(pipe) mlabpos(6) legend(off)	///
		||   line conbx   MVZ, clpattern(solid) clwidth(medium) clcolor(black) yaxis(1)	///
        ||   line upperx  MVZ, clpattern(dash) clwidth(thin) clcolor(black)				///
        ||   line lowerx  MVZ, clpattern(dash) clwidth(thin) clcolor(black)				///
        ||   line yline  MVZ,  clwidth(thin) clcolor(black) clpattern(solid)			///
	    ||   ,																			///
             xlabel(-0.9 -0.7 -0.5 -0.3 -0.1 0.1 0.3 0.5 0.7 .9, nogrid labsize(2))								///
		     ylabel(-4 -2 0 2 4, axis(1) nogrid labsize(2))				///
		     ylabel(0 5 10 15, axis(2) nogrid labsize(2))					///
	         yscale(noline alt)															///
		     yscale(noline alt axis(2))													///
             xscale(noline)																///
             legend(off)																///
             xtitle("Mean Income Growth", size(2.5)  )										///
             ytitle("Percentage of Observations"  , axis(2) size(2.5))					///
			 ytitle("Marginal Effect of FD index", axis(1) size(2.5))    ///
             xsca(titlegap(2))															///
             ysca(titlegap(2))															///
			 scheme(s2mono) graphregion(fcolor(white) ilcolor(white) lcolor(white))
	 
log close
