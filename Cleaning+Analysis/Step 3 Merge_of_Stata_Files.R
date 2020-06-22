library(readstata13)
library(tidyverse)

setwd("C:/Users/Yusuf Konyalicetin/Desktop/Thesis Folder")

IMF <- read.dta13("FD_Data.dta")
Data <- read.dta13("Stata_Thesis_Data.dta")

IMF$code <- as.factor(IMF$code)

Data2 <- inner_join(x = Data, y = IMF, c("period", "code"))

save.dta13(data = Data2, file = "Stata_Thesis_Data_w_FD.dta")
