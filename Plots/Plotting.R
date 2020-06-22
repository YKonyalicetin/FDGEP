#Plotting#

setwd("C:/Users/Yusuf Konyalicetin/Dropbox/Thesis/Data")

library(ggplot2)
library(plm)
library(tidyverse)
library(naniar)
library(zoo)
library(countrycode)
library(readstata13)

Data <- read.csv("Unclean_Data.csv")

Data$X <- NULL

Data$Country <- as.character(Data$Country)

#Remove meaningless aggregations for countries
Data <- Data[Data$Country!= "East Asia & Pacific",]
Data <- Data[Data$Country!= "Europe & Central Asia",]                                    
Data <- Data[Data$Country!= "Fragile and conflict affected situations",]
Data <- Data[Data$Country!= "High income",]
Data <- Data[Data$Country!= "IDA total",]
Data <- Data[Data$Country!= "Latin America & Caribbean",]
Data <- Data[Data$Country!= "Low & middle income",]
Data <- Data[Data$Country!= "Low income",]
Data <- Data[Data$Country!= "Lower middle income",]
Data <- Data[Data$Country!= "Middle East & North Africa",]
Data <- Data[Data$Country!= "South Asia",]
Data <- Data[Data$Country!= "Sub-Saharan Africa",]
Data <- Data[Data$Country!= "Upper middle income",]
Data <- Data[Data$Country!= "World",]
Data <- Data[Data$Country!= "Arab World",]
Data <- Data[Data$Country!= "Central Europe and the Baltics",]
Data <- Data[Data$Country!= "Aruba",]
Data <- Data[Data$Country!="American Samoa",]
Data <- Data[Data$Country!="Channel Islands",]
Data <- Data[Data$Country!="Caribbean small states",]
Data <- Data[Data$Country!="Curacao",]
Data <- Data[Data$Country!="Cayman Islands",]
Data <- Data[Data$Country!="Early-demographic dividend",]
Data <- Data[Data$Country!="Europe & Central Asia (excluding high income)",]
Data <- Data[Data$Country!="East Asia & Pacific (excluding high income)",]
Data <- Data[Data$Country!="European Union",]
Data <- Data[Data$Country!="Euro area",]
Data <- Data[Data$Country!="Faroe Islands",]
Data <- Data[Data$Country!="Heavily indebted poor countries (HIPC)",]
Data <- Data[Data$Country!="Guam",]
Data <- Data[Data$Country!="IDA & IBRD total",]
Data <- Data[Data$Country!="IBRD only",]
Data <- Data[Data$Country!="IDA only",]
Data <- Data[Data$Country!="IDA blend",]
Data <- Data[Data$Country!="Isle of Man",]
Data <- Data[Data$Country!="Not classified",]
Data <- Data[Data$Country!="Latin America & Caribbean (excluding high income)",]
Data <- Data[Data$Country!="Least developed countries: UN classification",]
Data <- Data[Data$Country!="Late-demographic dividend",]
Data <- Data[Data$Country!="St. Martin (French part)",]
Data <- Data[Data$Country!="Middle income",]
Data <- Data[Data$Country!="Middle East & North Africa (excluding high income)",]
Data <- Data[Data$Country!="Northern Mariana Islands",]
Data <- Data[Data$Country!="North America",]
Data <- Data[Data$Country!="New Caledonia",]
Data <- Data[Data$Country!="OECD members",]
Data <- Data[Data$Country!="Other small states",]
Data <- Data[Data$Country!="Pre-demographic dividend",]
Data <- Data[Data$Country!="Post-demographic dividend",]
Data <- Data[Data$Country!="Pacific island small states",]
Data <- Data[Data$Country!="Sub-Saharan Africa (excluding high income)",]
Data <- Data[Data$Country!="Small states",]
Data <- Data[Data$Country!="East Asia & Pacific (IDA & IBRD countries)",]
Data <- Data[Data$Country!="Latin America & the Caribbean (IDA & IBRD countries)",]
Data <- Data[Data$Country!="Middle East & North Africa (IDA & IBRD countries)",]
Data <- Data[Data$Country!="Sub-Saharan Africa (IDA & IBRD countries)",]
Data <- Data[Data$Country!="Virgin Islands (U.S.)",]
Data <- Data[Data$Country!="British Virgin Islands",]
Data <- Data[Data$Country!="Europe & Central Asia (IDA & IBRD countries)",]
Data <- Data[Data$Country!="South Asia (IDA & IBRD)",]
Data <- Data[Data$Country!="Sint Maarten (Dutch part)",]
Data <- Data[Data$Country!="French Polynesia",]

#Only Data from 1980 until 2015
Data <- Data[Data$Year >= 1980,]
Data <- Data[Data$Year <= 2015,]

#IMF Data Merge
IMF <- read.dta13("IMF_FD_Database (STATA).dta")
IMF$country <- NULL
IMF$ifs <- NULL
IMF$imf_region <- NULL
IMF$imf_income <- NULL

Data <- left_join(x = Data, y = IMF, by = c("Year" = "year", "Code" = "code"))

#Averaging Data for plotting

Data <- pdata.frame(Data, index = c("Code", "Year"))
Data$Year <- as.character(Data$Year)
Data$Year <- as.numeric(Data$Year)

#Percentage of 190

Avg <- Data %>%
  select(Country, Code, Region, Income_Group, Pov_1.90) %>%
  group_by(Country, Code, Region, Income_Group) %>%
  summarise(Pov190 = mean(Pov_1.90, na.rm = T))

#Percentage of 320
Avg_320 <- Data %>%
  group_by(Code) %>%
  summarise(Pov320 = mean(Pov_3.20, na.rm = T))

#Percentage of 550
Avg_550 <- Data %>%
  group_by(Code) %>%
  summarise(Pov550 = mean(Pov_5.50, na.rm = T))

#Private Credit
Avg_PC <- Data %>%
  group_by(Code) %>%
  summarise(PC = mean(Private_Credit, na.rm = T))

#Gini
Avg_G <- Data %>%
  group_by(Code) %>%
  summarise(G = mean(Gini, na.rm = T))

#FD IMF measure
Avg_FD <- Data %>%
  group_by(Code) %>%
  summarise(FD = mean(FD, na.rm = T))

Avg <- left_join(x = Avg, y = Avg_320, by = "Code")
Avg <- left_join(x = Avg, y = Avg_550, by = "Code")
Avg <- left_join(x = Avg, y = Avg_PC, by = "Code")
Avg <- left_join(x = Avg, y = Avg_G, by = "Code")
Avg <- left_join(x = Avg, y = Avg_FD, by = "Code")

Avg$FD <- Avg$FD*100

####Changing Some Missing Values for Region, Income Group etc####

#Andorra
Avg[Avg$Code == "AND",]$Region <- "Europe & Central Asia"
Avg[Avg$Code == "AND",]$Income_Group <- "High income"

#Congo Dem Rep
Avg[Avg$Code == "COD",]$Region <- "Sub-Saharan Africa"
Avg[Avg$Code == "COD",]$Income_Group <- "Low income"

#Kosovo
Avg[Avg$Code == "XKX",]$Region <- "Europe & Central Asia"
Avg[Avg$Code == "XKX",]$Income_Group <- "Upper middle income"

#Romania
Avg[Avg$Code == "ROU",]$Region <- "Europe & Central Asia"
Avg[Avg$Code == "ROU",]$Income_Group <- "Upper middle income"

#Timor-Leste
Avg[Avg$Code == "TLS",]$Region <- "East Asia & Pacific"
Avg[Avg$Code == "TLS",]$Income_Group <- "Lower middle income"

#West Bank and Gaza
Avg[Avg$Code == "PSE",]$Region <- "Middle East & North Africa"
Avg[Avg$Code == "PSE",]$Income_Group <- "Lower middle income"

#Removing all NAs and NANs
Avg <- Avg[complete.cases(Avg),]
Avg <- as.data.frame(Avg)

#Removing 0s for log

Avg <- Avg[Avg$Pov190 != 0,]

########################################Plots for FD#############################

#####################Plotting log(Pov190) on log(FD)#############################
ggplot(data = Avg, aes(x = log(FD), y = log(Pov190), label = Code, colour = Region)) + geom_smooth(method = "lm",
colour = "red", se = F) + geom_text(aes(label=Code), na.rm = T, check_overlap = T, hjust=0,vjust=0, colour = "darkblue",) +
annotate(geom = "text", x=3, y=6, label = "italic(R) ^ 2 == 0.4684", parse = T) + 
annotate(geom = "text", x = 3, y = 6.5, label = "lnP[USD1.90] == 7.4069 - 1.9376*lnFD", parse = T) +
theme_classic() + xlab("Financial Development Index (log)") + ylab("Poverty Headcount Ratio at USD 1.90 (log)") +
theme(axis.title.x = element_text(face = "bold"), axis.title.y = element_text(face = "bold"))+
expand_limits(y = 6, x = 4.5)

ggplot(data = Avg, aes(x = log(FD), y = log(Pov190), label = Code, colour = Region)) + geom_smooth(method = "lm",
colour = "red", se = F) + geom_point(colour = "darkblue")+
  annotate(geom = "text", x=3, y=6, label = "italic(R) ^ 2 == 0.4684", parse = T) + 
  annotate(geom = "text", x = 3, y = 6.5, label = "lnP[USD1.90] == 7.4069 - 1.9376*lnFD", parse = T) +
  theme_classic() + xlab("Financial Development Index (log)") + ylab("Poverty Headcount Ratio at USD 1.90 (log)") +
  theme(axis.title.x = element_text(face = "bold"), axis.title.y = element_text(face = "bold"))


cor(Avg$Pov190, Avg$FD)

#Obtaining R2 from regressing log(FD) on log(Pov190)

reg1a <- lm(log(Pov190) ~ log(FD), data = Avg)
summary(reg1a)
#Coloured by Region
#ggplot(data = Avg, aes(x = log(FD), y = log(Pov190), label = Code, colour = Region)) + geom_point() +
#geom_smooth(method = "lm", colour = "red", se = F) + scale_colour_discrete(drop=TRUE, limits = levels(Avg$Region))


#####################Plotting log(Pov320) on log(FD)#############################
ggplot(data = Avg, aes(x = log(FD), y = log(Pov320), label = Code, colour = Region)) + geom_smooth(method = "lm",
  colour = "red", se = F) + geom_text(aes(label=Code), na.rm = T, check_overlap = T, hjust=0,vjust=0, colour = "darkblue") +
  annotate(geom = "text", x=3, y=6, label = "italic(R) ^ 2 == 0.5194", parse = T) + 
  annotate(geom = "text", x = 3, y = 6.5, label = "lnP[USD3.20] == 8.0740 - 1.8731*lnFD", parse = T) +
  theme_classic() + xlab("Financial Development Index (log)") + ylab("Poverty Headcount Ratio at USD 3.20 (log)") +
  theme(axis.title.x = element_text(face = "bold"), axis.title.y = element_text(face = "bold")) +
  expand_limits(y = 6, x = 4.5)

ggplot(data = Avg, aes(x = log(FD), y = log(Pov320), label = Code, colour = Region)) + geom_smooth(method = "lm",
  colour = "red", se = F) + geom_point(colour = "darkblue") +
  annotate(geom = "text", x=3, y=6, label = "italic(R) ^ 2 == 0.5194", parse = T) + 
  annotate(geom = "text", x = 3, y = 6.5, label = "lnP[USD3.20] == 8.0740 - 1.8731*lnFD", parse = T) +
  theme_classic() + xlab("Financial Development Index (log)") + ylab("Poverty Headcount Ratio at USD 3.20 (log)") +
  theme(axis.title.x = element_text(face = "bold"), axis.title.y = element_text(face = "bold"))

reg2a <- lm(log(Pov320) ~ log(FD), data = Avg)
summary(reg2a)

#####################Plotting log(Pov550) on log(FD)##############################
ggplot(data = Avg, aes(x = log(FD), y = log(Pov550), label = Code, colour = Region)) + geom_smooth(method = "lm",
colour = "red", se = F) + geom_text(aes(label=Code), na.rm = T, check_overlap = T, hjust=0,vjust=0, colour = "darkblue") +
  annotate(geom = "text", x=3, y=6, label = "italic(R) ^ 2 == 0.5335", parse = T) + 
  annotate(geom = "text", x = 3, y = 6.5, label = "lnP[USD5.50] == 8.1744 - 1.6879*lnFD", parse = T) +
  theme_classic() + xlab("Financial Development Index (log)") + ylab("Poverty Headcount Ratio at USD 5.50 (log)") +
  theme(axis.title.x = element_text(face = "bold"), axis.title.y = element_text(face = "bold")) +
  expand_limits(y = 4, x = 4.5)

ggplot(data = Avg, aes(x = log(FD), y = log(Pov550), label = Code, colour = Region)) + geom_smooth(method = "lm",
 colour = "red", se = F) + geom_point(colour = "darkblue") +
  annotate(geom = "text", x=3, y=6, label = "italic(R) ^ 2 == 0.5335", parse = T) + 
  annotate(geom = "text", x = 3, y = 6.5, label = "lnP[USD5.50] == 8.1744 - 1.6879*lnFD", parse = T) +
  theme_classic() + xlab("Financial Development Index (log)") + ylab("Poverty Headcount Ratio at USD 5.50 (log)") +
  theme(axis.title.x = element_text(face = "bold"), axis.title.y = element_text(face = "bold"))


reg3a <- lm(log(Pov550) ~ log(FD), data = Avg)
summary(reg3a)

###########################################################################################################################
#Calculating log differences for poverty (Poverty Reduction Rates)
dlogPov190 <- Data %>%
  select(Country, Code, Pov_1.90) %>%
  drop_na() %>%
  group_by(Code) %>%
  mutate(dlogPov190 = log(Pov_1.90) - lag(log(Pov_1.90))) %>%
  group_by(Code) %>%
  summarise(dlogPov190 = mean(dlogPov190, na.rm = T))

#Joining
Avg <- left_join(x = Avg, y = dlogPov190, by = "Code")

#Plotting dlogPov190 on FD
#ggplot(data = Avg, aes(x = FD, y = dlogPov190, label = Code)) + geom_point(size = 1) + geom_smooth(method = "lm", colour = "red") +
#  geom_text(aes(label=Code), na.rm = T, check_overlap = T, hjust=0,vjust=0, colour = "darkblue")

###########################################Plots for Private Credit#######################################################
#####################Plotting log(Pov190) on log(PC)#############################
ggplot(data = Avg, aes(x = log(PC), y = log(Pov190), label = Code, colour = Region)) + geom_smooth(method = "lm",
colour = "red", se = F) + geom_text(aes(label=Code), na.rm = T, check_overlap = T, hjust=0,vjust=0, colour = "darkblue") +
  annotate(geom = "text", x=3, y=6, label = "italic(R) ^ 2 == 0.4451", parse = T) + 
  annotate(geom = "text", x = 3, y = 6.5, label = "lnP[USD1.90] == 7.0074 - 1.6099*lnPC", parse = T) +
  theme_classic() + xlab("Private Credit to GDP (log)") + ylab("Poverty Headcount Ratio at USD 1.90 (log)") +
  theme(axis.title.x = element_text(face = "bold"), axis.title.y = element_text(face = "bold")) +
  expand_limits(y = 4, x = 5.5)

ggplot(data = Avg, aes(x = log(PC), y = log(Pov190), label = Code, colour = Region)) + geom_smooth(method = "lm",
colour = "red", se = F) + geom_point(colour = "darkblue") +
  annotate(geom = "text", x=3, y=6, label = "italic(R) ^ 2 == 0.4451", parse = T) + 
  annotate(geom = "text", x = 3, y = 6.5, label = "lnP[USD1.90] == 7.0074 - 1.6099*lnPC", parse = T) +
  theme_classic() + xlab("Private Credit to GDP (log)") + ylab("Poverty Headcount Ratio at USD 1.90 (log)") +
  theme(axis.title.x = element_text(face = "bold"), axis.title.y = element_text(face = "bold"))

reg1b <- lm(log(Pov190) ~ log(PC), data = Avg)
summary(reg1b)

#####################Plotting log(Pov320) on log(PC)#############################
ggplot(data = Avg, aes(x = log(PC), y = log(Pov320), label = Code, colour = Region)) + geom_smooth(method = "lm",
colour = "red", se = F) + geom_text(aes(label=Code), na.rm = T, check_overlap = T, hjust=0,vjust=0, colour = "darkblue") +
annotate(geom = "text", x=3, y=6, label = "italic(R) ^ 2 == 0.476", parse = T) + 
annotate(geom = "text", x = 3, y = 6.5, label = "lnP[USD3.20] == 7.5967 - 1.5285*lnPC", parse = T) +
theme_classic() + xlab("Private Credit to GDP (log)") + ylab("Poverty Headcount Ratio at USD 3.20 (log)") +
theme(axis.title.x = element_text(face = "bold"), axis.title.y = element_text(face = "bold")) +
expand_limits(y = 4, x = 5)

ggplot(data = Avg, aes(x = log(PC), y = log(Pov320), label = Code, colour = Region)) + geom_smooth(method = "lm",
colour = "red", se = F) + geom_point(colour = "darkblue") +
  annotate(geom = "text", x=3, y=6, label = "italic(R) ^ 2 == 0.476", parse = T) + 
  annotate(geom = "text", x = 3, y = 6.5, label = "lnP[USD3.20] == 7.5967 - 1.5285*lnPC", parse = T) +
  theme_classic() + xlab("Private Credit to GDP (log)") + ylab("Poverty Headcount Ratio at USD 3.20 (log)") +
  theme(axis.title.x = element_text(face = "bold"), axis.title.y = element_text(face = "bold"))

reg2b <- lm(log(Pov320) ~ log(PC), data = Avg)
summary(reg2b)

#####################Plotting log(Pov550) on log(PC)#############################
ggplot(data = Avg, aes(x = log(PC), y = log(Pov550), label = Code, colour = Region)) + geom_smooth(method = "lm",
colour = "red", se = F) + geom_text(aes(label=Code), na.rm = T, check_overlap = T, hjust=0,vjust=0, colour = "darkblue") +
annotate(geom = "text", x=3, y=6, label = "italic(R) ^ 2 == 0.4651", parse = T) + 
  annotate(geom = "text", x = 3, y = 6.5, label = "lnP[USD5.50] == 7.6328 - 1.3432 *lnPC", parse = T) +
  theme_classic() + xlab("Private Credit to GDP (log)") + ylab("Poverty Headcount Ratio at USD 5.50 (log)") +
  theme(axis.title.x = element_text(face = "bold"), axis.title.y = element_text(face = "bold")) +
  expand_limits(y = 4, x = 5)

ggplot(data = Avg, aes(x = log(PC), y = log(Pov550), label = Code, colour = Region)) + geom_smooth(method = "lm",
 colour = "red", se = F) + geom_point(colour = "darkblue") +
  annotate(geom = "text", x=3, y=6, label = "italic(R) ^ 2 == 0.4651", parse = T) + 
  annotate(geom = "text", x = 3, y = 6.5, label = "lnP[USD5.50] == 7.6328 - 1.3432 *lnPC", parse = T) +
  theme_classic() + xlab("Private Credit to GDP (log)") + ylab("Poverty Headcount Ratio at USD 5.50 (log)") +
  theme(axis.title.x = element_text(face = "bold"), axis.title.y = element_text(face = "bold"))

reg3b <- lm(log(Pov550) ~ log(PC), data = Avg)
summary(reg3b)
