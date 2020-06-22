library(tidyverse) #for datacleaning
library(naniar) #get a better overview on missing values
library(zoo)
library(countrycode) #deal properly with country codes
library(readxl) #read in excel files

setwd("C:/Users/Yusuf Konyalicetin/Desktop/Thesis Folder")


####Creating Poverty Headcount Measure 1.90 a day################################################
Pov_Hc_1.90 <- read.csv("Poverty_Hc_1.90.csv", stringsAsFactors = FALSE)

#Renaming Cols
names(Pov_Hc_1.90[, 5:64])

Year_Vector <-c(1960:2019)

colnames(Pov_Hc_1.90)[5:64] <- Year_Vector
colnames(Pov_Hc_1.90)

#Collapsing Year Cols
Pov_Hc_1.90 <- Pov_Hc_1.90 %>% gather(Year, Pov_1.90, 5:64)

#Removing unnecessary Cols

Pov_Hc_1.90$Indicator.Name <- NULL
Pov_Hc_1.90$Indicator.Code <- NULL

#########################################################################

####Creating Pov_Hc_3.20################################################
Pov_Hc_3.20 <- read.csv("Poverty_Hc_3.20.csv", stringsAsFactors = FALSE)

#Renaming Cols
colnames(Pov_Hc_3.20)[5:64] <- Year_Vector
colnames(Pov_Hc_3.20)

#Collapsing Year Cols
Pov_Hc_3.20 <- Pov_Hc_3.20 %>% gather(Year, Pov_3.20, 5:64)

#Removing unnecessary Cols

Pov_Hc_3.20$Indicator.Name <- NULL
Pov_Hc_3.20$Indicator.Code <- NULL
Pov_Hc_3.20$Country.Name <- NULL

########################################################################

####Creating Pov_Hc_5.50################################################
Pov_Hc_5.50 <- read.csv("Poverty_Hc_5.50.csv", stringsAsFactors = FALSE)

#Renaming Cols
colnames(Pov_Hc_5.50)[5:64] <- Year_Vector

#Collapsing Year Cols
Pov_Hc_5.50 <- Pov_Hc_5.50 %>% gather(Year, Pov_5.50, 5:64)

#Removing unnecessary Cols

Pov_Hc_5.50$Indicator.Name <- NULL
Pov_Hc_5.50$Indicator.Code <- NULL
Pov_Hc_5.50$ï..Country.Name <- NULL


########################################################################

####Creating GDP_Pc################################################
GDP_Pc <- read.csv("GDP_pc_constantUS.csv" , stringsAsFactors = FALSE)

#Renaming Cols
colnames(GDP_Pc)[5:64] <- Year_Vector

#Collapsing Year Cols
GDP_Pc <- GDP_Pc %>% gather(Year, GDP_Pc, 5:64)

#Removing unnecessary Cols

GDP_Pc$Indicator.Name <- NULL
GDP_Pc$Indicator.Code <- NULL
GDP_Pc$Country.Name <- NULL

########################################################################

####Creating Expenses################################################
Expenses <- read.csv("Expenses.csv" , stringsAsFactors = FALSE)

#Renaming Cols
colnames(Expenses)[5:64] <- Year_Vector

#Collapsing Year Cols
Expenses <- Expenses %>% gather(Year, Expenses, 5:64)

#Removing unnecessary Cols

Expenses$Indicator.Name <- NULL
Expenses$Indicator.Code <- NULL
Expenses$ï..Country.Name <- NULL

########################################################################

####Creating Inflation################################################
Inflation <- read.csv("Inflation.csv" , stringsAsFactors = FALSE)

#Renaming Cols
colnames(Inflation)[6:65]
colnames(Inflation)[6:65] <- Year_Vector

#Collapsing Year Cols
Inflation <- Inflation %>% gather(Year, Inflation, 6:65)

#Removing unnecessary Cols

Inflation$Indicator.Name <- NULL
Inflation$Indicator.Code <- NULL
Inflation$ï..Country.Name <- NULL

########################################################################

####Creating Gini################################################
Gini <- read.csv("Gini.csv" , stringsAsFactors = FALSE)

#Renaming Cols
colnames(Gini)[5:64] <- Year_Vector

#Collapsing Year Cols
Gini <- Gini %>% gather(Year, Gini, 5:64)

#Removing unnecessary Cols

Gini$Indicator.Name <- NULL
Gini$Indicator.Code <- NULL
Gini$Country.Name <- NULL

########################################################################

####Creating Private Credit#######################################

#Financial Development Data

Private_Credit <- read_xlsx("GlobalFinancialDevelopmentDatabaseJune2017.xlsx", sheet = "Data - May 2017")

Private_Credit[, -c(1:7, 59)] <- NULL

#names(Private_Credit)

names(Private_Credit) <- c("Country.Code",
                           "ISO2",
                           "IMF code",
                           "Country.Name",
                           "Region",
                           "Income Group",
                           "Year",
                           "Private_Credit")

#Removing unnecessary cols
Private_Credit$ISO2 <- NULL
Private_Credit$`IMF code` <- NULL
Private_Credit$Country.Name <- NULL


#Transforming to Character to ease merging
#str(Private_Credit)
Private_Credit$Year <- as.character(Private_Credit$Year)

########################################################################

####Creating Exports################################################
Exports <- read.csv("Exports.csv" , stringsAsFactors = FALSE)

#Renaming Cols
colnames(Exports)[5:64] <- Year_Vector

#Collapsing Year Cols
Exports <- Exports %>% gather(Year, Exports, 5:64)

#Removing unnecessary Cols

Exports$Indicator.Name <- NULL
Exports$Indicator.Code <- NULL
Exports$Country.Name <- NULL

#########################################################################

####Creating Imports################################################
Imports <- read.csv("Imports.csv" , stringsAsFactors = FALSE)

#Renaming Cols
colnames(Imports)[5:64] <- Year_Vector

#Collapsing Year Cols
Imports <- Imports %>% gather(Year, Imports, 5:64)

#Removing unnecessary Cols

Imports$Indicator.Name <- NULL
Imports$Indicator.Code <- NULL
Imports$Country.Name <- NULL

########################################################################

####Creating Schooling################################################
Schooling <- read.csv("Schooling.csv" , stringsAsFactors = FALSE)

#Renaming Cols
colnames(Schooling)[5:64] <- Year_Vector

#Collapsing Year Cols
Schooling <- Schooling %>% gather(Year, Schooling, 5:64)

#Removing unnecessary Cols

Schooling$Indicator.Name <- NULL
Schooling$Indicator.Code <- NULL
Schooling$Country.Name <- NULL

########################################################################

####Creating Pop_Growth################################################
Pop_Growth <- read.csv("Population Growth.csv" , stringsAsFactors = FALSE)

#Renaming Cols
colnames(Pop_Growth)[5:64] <- Year_Vector

#Collapsing Year Cols
Pop_Growth <- Pop_Growth %>% gather(Year, Pop_Growth, 5:64)

#Removing unnecessary Cols

Pop_Growth$Indicator.Name <- NULL
Pop_Growth$Indicator.Code <- NULL
Pop_Growth$ï..Country.Name <- NULL

########################################################################

####Creating Gov_Cons################################################
Gov_Cons <- read.csv("Government Final Consumption Expenditure Data.csv", stringsAsFactors = FALSE)

#Renaming Cols
colnames(Gov_Cons)[5:64] <- Year_Vector

#Collapsing Year Cols
Gov_Cons <- Gov_Cons %>% gather(Year, Gov_Cons, 5:64)

#Removing unnecessary Cols

Gov_Cons$Indicator.Name <- NULL
Gov_Cons$Indicator.Code <- NULL
Gov_Cons$Country.Name <- NULL

########################################################################

####Creating Bank_Acc#######################################

#Financial Development Data

Bank_Acc <- read_xlsx("GlobalFinancialDevelopmentDatabaseJune2017.xlsx", sheet = "Data - May 2017")

#names(Bank_Acc) #GFDD.AI.01

Bank_Acc[, -c(1:7, 8)] <- NULL

names(Bank_Acc) <- c("Country.Code",
                     "ISO2",
                     "IMF code",
                     "Country.Name",
                     "Region",
                     "Income Group",
                     "Year",
                     "Bank_Acc")

#Removing cols
Bank_Acc$ISO2 <- NULL
Bank_Acc$`IMF code` <- NULL
Bank_Acc$Country.Name <- NULL
Bank_Acc$`Income Group` <- NULL
Bank_Acc$Region <- NULL


#str(Bank_Acc)

Bank_Acc$Year <- as.character(Bank_Acc$Year)

########################################################################

####Creating Bank_Branch#######################################

#Financial Development Data

Bank_Branch <- read_xlsx("GlobalFinancialDevelopmentDatabaseJune2017.xlsx", sheet = "Data - May 2017")

#names(Bank_Branch) #GFDD.AI.02

Bank_Branch[, -c(1:7, 9)] <- NULL

names(Bank_Branch) <- c("Country.Code",
                        "ISO2",
                        "IMF code",
                        "Country.Name",
                        "Region",
                        "Income Group",
                        "Year",
                        "Bank_Branch")

#Removing cols
Bank_Branch$ISO2 <- NULL
Bank_Branch$`IMF code` <- NULL
Bank_Branch$Country.Name <- NULL
Bank_Branch$`Income Group` <- NULL
Bank_Branch$Region <- NULL

str(Bank_Branch)

Bank_Branch$Year <- as.character(Bank_Branch$Year)

####Creating ATM#######################################

#Financial Development Data

ATM <- read_xlsx("GlobalFinancialDevelopmentDatabaseJune2017.xlsx", sheet = "Data - May 2017")

#names(ATM) #GFDD.AI.25

ATM[, -c(1:7, 32)] <- NULL

names(ATM) <- c("Country.Code",
                "ISO2",
                "IMF code",
                "Country.Name",
                "Region",
                "Income Group",
                "Year",
                "ATM")

#Removing cols
ATM$ISO2 <- NULL
ATM$`IMF code` <- NULL
ATM$Country.Name <- NULL
ATM$`Income Group` <- NULL
ATM$Region <- NULL

#str(ATM)

ATM$Year <- as.character(ATM$Year)

#########################################################################

####Creating Mean_Inc################################################
PovCal <- read.csv("PovCalNet.csv", stringsAsFactors = FALSE)

#PovCal_Mean_Inc <- select(PovCal, CountryCode, RequestYear, Mean)
#names(PovCal_Mean_Inc) <- c("Country.Code", "Year", "Mean_Inc")

PovCal_Mean_Inc <- select(PovCal, CountryName, CountryCode, RequestYear, Mean, CoverageType)

names(PovCal_Mean_Inc) <- c("CountryName", "Country.Code", "Year", "Mean_Inc", "CoverageType")

PovCal_Mean_Inc_2 <- unite(PovCal_Mean_Inc, "Country", CountryName, CoverageType, sep = " ")

PovCal_Mean_Inc_3 <- PovCal_Mean_Inc_2[!PovCal_Mean_Inc_2$Country == "China R",]
PovCal_Mean_Inc_3 <- PovCal_Mean_Inc_3[!PovCal_Mean_Inc_3$Country == "China U",]
PovCal_Mean_Inc_3 <- PovCal_Mean_Inc_3[!PovCal_Mean_Inc_3$Country == "India R",]
PovCal_Mean_Inc_3 <- PovCal_Mean_Inc_3[!PovCal_Mean_Inc_3$Country == "India U",]
PovCal_Mean_Inc_3 <- PovCal_Mean_Inc_3[!PovCal_Mean_Inc_3$Country == "Indonesia R",]
PovCal_Mean_Inc_3 <- PovCal_Mean_Inc_3[!PovCal_Mean_Inc_3$Country == "Indonesia U",]
PovCal_Mean_Inc_3$Country <- NULL

PovCal_Mean_Inc_3$Year <- as.character(PovCal_Mean_Inc_3$Year)

str(PovCal_Mean_Inc_3)
########################################################
########################################################
#####Merging all Data##################################

Unclean_Data <- left_join(Pov_Hc_1.90, Pov_Hc_3.20, by = c("Country.Code", "Year"))
Unclean_Data <- left_join(Unclean_Data, Pov_Hc_5.50, by = c("Country.Code", "Year"))
Unclean_Data <- left_join(Unclean_Data, GDP_Pc, by = c("Country.Code", "Year"))
Unclean_Data <- left_join(Unclean_Data, Private_Credit, by = c("Country.Code", "Year"))
Unclean_Data <- left_join(Unclean_Data, Gov_Cons, by = c("Country.Code", "Year"))
Unclean_Data <- left_join(Unclean_Data, Expenses, by = c("Country.Code", "Year"))
Unclean_Data <- left_join(Unclean_Data, Inflation, by = c("Country.Code", "Year"))
Unclean_Data <- left_join(Unclean_Data, Gini, by = c("Country.Code", "Year"))
Unclean_Data <- left_join(Unclean_Data, Exports, by = c("Country.Code", "Year"))
Unclean_Data <- left_join(Unclean_Data, Imports, by = c("Country.Code", "Year"))
Unclean_Data <- left_join(Unclean_Data, Pop_Growth, by = c("Country.Code", "Year"))
Unclean_Data <- left_join(Unclean_Data, Schooling, by = c("Country.Code", "Year"))
Unclean_Data <- left_join(Unclean_Data, ATM, by = c("Country.Code", "Year"))
Unclean_Data <- left_join(Unclean_Data, Bank_Acc, by = c("Country.Code", "Year"))
Unclean_Data <- left_join(Unclean_Data, Bank_Branch, by = c("Country.Code", "Year"))
Unclean_Data <- left_join(Unclean_Data, PovCal_Mean_Inc_3, by = c("Country.Code", "Year"))


#########################################################
######Restructuring the Data#############################

colnames(Unclean_Data) <- c("Country", "Code", "Year", "Pov_1.90", "Pov_3.20", "Pov_5.50", "GDP_Pc",
                            "Region", "Income_Group", "Private_Credit", "Gov_Cons", "Expenses", 
                            "Inflation", "Gini", "Exports", "Imports", "Pop_Growth", "Schooling", 
                            "ATM", "Bank_Acc", "Bank_Branch", "Mean_Inc")

col_order <- c("Country", "Year", "Code", "Region", "Income_Group", "Pov_1.90", "Pov_3.20", "Pov_5.50", "GDP_Pc",
               "Private_Credit", "Mean_Inc", "Gov_Cons", "Expenses", "Inflation", "Gini", "Exports", "Imports", "Pop_Growth",
               "Schooling", "ATM", "Bank_Acc", "Bank_Branch")

Unclean_Data <- Unclean_Data[, col_order]

write.csv(Unclean_Data, "Unclean_Data.csv")

###########################################################################################################################
##########################Construction of the first Dataset which includes a lot of unused variables ends here###########
###########################################################################################################################

###########################################################################################################################
##############Now a first version of the FiveYear Average Data is created which will later be revised in Stata#############

Data <- read.csv("Unclean_Data.csv")

Data$X <- NULL

Data$Country <- as.character(Data$Country)

#Remove meaningless aggregations for countries, small islands etc.
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

#Exclude High Income Countries
Data <- Data[Data$Income_Group != "High income",]

#Get rid of all NA rows
Data <- Data[-which(apply(Data,1,function(x)all(is.na(x)))),]

Data <- Data[Data$Year >= 1980,]

#Only observation until 2015
Data <- Data[Data$Year <= 2015,]

#approximate all 0s with 0.001
Data$Pov_1.90[Data$Pov_1.90 == 0] <- 0.001
Data$Pov_3.20[Data$Pov_3.20 == 0] <- 0.001

#only include countries with more than 5 observations for Pov_1.90, Pov_3.20, Gini, Mean_Inc, Private_Credit

###########Pov_1.90#####################
Pov_1.90 <- Data[complete.cases(Data$Pov_1.90),]
n_Pov_1.90 <- Pov_1.90 %>%
  group_by(Country) %>%
  summarise(n())

#only include countries with 5 or more observations
n_Pov_1.90 <- n_Pov_1.90[n_Pov_1.90$`n()` >= 5,]

###########Pov_3.20#####################
Pov_3.20 <- Data[complete.cases(Data$Pov_3.20),]
n_Pov_3.20 <- Pov_3.20 %>%
  group_by(Country) %>%
  summarise(n())

#only include countries with 5 or more observations
n_Pov_3.20 <- n_Pov_3.20[n_Pov_3.20$`n()` >= 5,]

###########Gini#####################
Gini <- Data[complete.cases(Data$Gini),]
n_Gini <- Gini %>%
  group_by(Country) %>%
  summarise(n())

#only include countries with 5 or more observations
n_Gini <- n_Gini[n_Gini$`n()` >= 5,]

###########Mean_Inc#####################
Mean_Inc <- Data[complete.cases(Data$Mean_Inc),]
n_Mean_Inc <- Mean_Inc %>%
  group_by(Country) %>%
  summarise(n()) #safe, every country has 5 or more observations

###########Private_Credit#####################
Private_Credit <- Data[complete.cases(Data$Private_Credit),]
n_Private_Credit <- Private_Credit %>%
  group_by(Country) %>%
  summarise(n()) #safe

###Find all common countries from n_Pov_1.90, n_Pov_3.20 and n_Gini
FiveOrMore <- intersect(intersect(n_Pov_3.20$Country, n_Pov_1.90$Country), n_Gini$Country) #64 countries included

###Data needs to be subset to include only countries in FiveOrMore

Data <- Data[Data$Country %in% FiveOrMore,]

Test2 <- unique(Data$Country)

identical(sort(Test2), sort(FiveOrMore))

##Calculate (Z/Y), the inverse level of development
##Need to bring daily poverty lines on a monthly scale
Data <- Data %>%
  mutate(Line_1.90 = 1.90 * 365 / 12) %>%
  mutate(Line_3.20 = 3.20 * 365 / 12) %>%
  mutate(Line_5.50 = 5.50 * 365 / 12) %>% #log ratio of Poverty Lines to Mean Income
  mutate(log_ZY_1.90 = log(Line_1.90/Mean_Inc)) %>%
  mutate(log_ZY_3.20 = log(Line_3.20/Mean_Inc)) %>%
  mutate(log_ZY_5.50 = log(Line_5.50/Mean_Inc))

#################Calculating 5 year averages#####################################

Level_5 <- cut(Data$Year, seq(1980, 2015, by = 5), right = F)

#Pov_1.90
FiveYrAvgs_Pov_1.90 <- aggregate(Data$Pov_1.90, list(Data$Country, Level_5), mean, na.action = NULL, na.rm = TRUE)
Test_Five <- is.nan(FiveYrAvgs_Pov_1.90$x)
length(Test_Five[Test_Five == "FALSE"]) #316 observations

names(FiveYrAvgs_Pov_1.90) <- c("Country", "Period", "Pov_1.90")

#Pov_3.20
FiveYrAvgs_Pov_3.20 <- aggregate(Data$Pov_3.20, list(Data$Country, Level_5), mean, na.action = NULL, na.rm = TRUE)

names(FiveYrAvgs_Pov_3.20) <- c("Country", "Period", "Pov_3.20")

#Pov_5.50
FiveYrAvgs_Pov_5.50 <- aggregate(Data$Pov_5.50, list(Data$Country, Level_5), mean, na.action = NULL, na.rm = TRUE)

names(FiveYrAvgs_Pov_5.50) <- c("Country", "Period", "Pov_5.50")

#Mean_Inc
FiveYrAvgs_Mean_Inc <- aggregate(Data$Mean_Inc, list(Data$Country, Level_5), mean, na.action = NULL, na.rm = TRUE)

names(FiveYrAvgs_Mean_Inc) <- c("Country", "Period", "Mean_Inc")

#Gini
FiveYrAvgs_Gini <- aggregate(Data$Gini, list(Data$Country, Level_5), mean, na.action = NULL, na.rm = TRUE)

names(FiveYrAvgs_Gini) <- c("Country", "Period", "Gini")

#Private_Credit
FiveYrAvgs_Private_Credit <- aggregate(Data$Private_Credit, list(Data$Country, Level_5), mean, na.action = NULL, na.rm = TRUE)

names(FiveYrAvgs_Private_Credit) <- c("Country", "Period", "Private_Credit")

#Pop_Growth
FiveYrAvgs_Pop_Growth <- aggregate(Data$Pop_Growth, list(Data$Country, Level_5), mean, na.action = NULL, na.rm = TRUE)

names(FiveYrAvgs_Pop_Growth) <- c("Country", "Period", "Pop_Growth")

#GDPpc
FiveYrAvgs_GDPpc <- aggregate(Data$GDP_Pc, list(Data$Country, Level_5), mean, na.action = NULL, na.rm = TRUE)

names(FiveYrAvgs_GDPpc) <- c("Country", "Period", "GDPpc")

#(Z/Y)s
#1.90
FiveYrAvgs_log_ZY_1.90 <- aggregate(Data$log_ZY_1.90, list(Data$Country, Level_5), mean, na.action = NULL, na.rm = TRUE)

names(FiveYrAvgs_log_ZY_1.90) <- c("Country", "Period", "log_ZY_1.90")

#3.20
FiveYrAvgs_log_ZY_3.20 <- aggregate(Data$log_ZY_3.20, list(Data$Country, Level_5), mean, na.action = NULL, na.rm = TRUE)

names(FiveYrAvgs_log_ZY_3.20) <- c("Country", "Period", "log_ZY_3.20")

#5.50
FiveYrAvgs_log_ZY_5.50 <- aggregate(Data$log_ZY_5.50, list(Data$Country, Level_5), mean, na.action = NULL, na.rm = TRUE)

names(FiveYrAvgs_log_ZY_5.50) <- c("Country", "Period", "log_ZY_5.50")

##################merging datasets###########################
Avg_Data <- left_join(FiveYrAvgs_Pov_1.90, FiveYrAvgs_Pov_3.20, by = c("Country", "Period"))
Avg_Data <- Avg_Data %>% left_join(FiveYrAvgs_Pov_5.50, by = c("Country", "Period"))
Avg_Data <- Avg_Data %>% left_join(FiveYrAvgs_Gini, by = c("Country", "Period"))
Avg_Data <- Avg_Data %>% left_join(FiveYrAvgs_Mean_Inc, by = c("Country", "Period"))
Avg_Data <- Avg_Data %>% left_join(FiveYrAvgs_Private_Credit, by = c("Country", "Period"))
Avg_Data <- Avg_Data %>% left_join(FiveYrAvgs_Pop_Growth, by = c("Country", "Period"))
Avg_Data <- Avg_Data %>% left_join(FiveYrAvgs_GDPpc, by = c("Country", "Period"))
Avg_Data <- Avg_Data %>% left_join(FiveYrAvgs_log_ZY_1.90, by = c("Country", "Period"))
Avg_Data <- Avg_Data %>% left_join(FiveYrAvgs_log_ZY_3.20, by = c("Country", "Period"))
Avg_Data <- Avg_Data %>% left_join(FiveYrAvgs_log_ZY_5.50, by = c("Country", "Period"))

Avg_Data <- Avg_Data[order(Avg_Data$Country, Avg_Data$Period),]

#changing time span into Period 1-7 in order to prevent possible problems
Avg_Data$Time_Span <- Avg_Data$Period

Avg_Data$Time_Span <- plyr::revalue(Avg_Data$Time_Span, c("[1980,1985)" = 1 ,"[1985,1990)" = 2, "[1990,1995)" = 3,
                              "[1995,2000)" = 4, "[2000,2005)" = 5, "[2005,2010)" = 6,
                              "[2010,2015)" = 7))

#Adding country codes, Income group, region
Info_Frame <- Data %>% select(Country, Code, Region, Income_Group)
Info_Frame$Country <- as.character(Info_Frame$Country)
Info_Frame$Code <- as.character(Info_Frame$Code)
Info_Frame$Region <- as.character(Info_Frame$Region)
Info_Frame$Income_Group <- as.character(Info_Frame$Income_Group)

Info_Frame <- Info_Frame[1:64,]

Avg_Data <- inner_join(Avg_Data, Info_Frame, by = "Country")


#Interpolating missing observations that are between two existing ones for Pov_1.90, Pov_3.20, Pov_5.50 and Gini
Avg_Data <- Avg_Data %>%
  group_by(Country) %>%
  arrange(Country, Period) %>%
  mutate(time=seq(1,n())) %>%
  mutate(Pov_1.90_IP=approx(time, Pov_1.90, time)$y) %>%
  mutate(Pov_3.20_IP=approx(time, Pov_3.20, time)$y) %>%
  mutate(Pov_5.50_IP=approx(time, Pov_5.50, time)$y) %>%
  mutate(Gini_IP=approx(time, Gini, time)$y) %>%
  select(-time)

#Calculating logs, dlogs, Poverty Lines
Avg_Data <- Avg_Data %>%
  mutate(log_Pov_1.90 = log(Pov_1.90_IP)) %>% #logs
  mutate(log_Pov_3.20 = log(Pov_3.20_IP)) %>%
  mutate(log_Pov_5.50 = log(Pov_5.50_IP)) %>%
  mutate(log_Gini = log(Gini_IP)) %>%
  mutate(log_Private_Credit = log(Private_Credit)) %>%
  mutate(log_Mean_Inc = log(Mean_Inc)) %>% 
  mutate(dlog_Pov_1.90 = (log_Pov_1.90 - lag(log_Pov_1.90, default = first(log_Pov_1.90)))/5) %>% #dlogs
  mutate(dlog_Pov_3.20 = (log_Pov_3.20 - lag(log_Pov_3.20, default = first(log_Pov_3.20)))/5) %>%
  mutate(dlog_Pov_5.50 = (log_Pov_5.50 - lag(log_Pov_5.50, default = first(log_Pov_5.50)))/5) %>%
  mutate(dlog_Gini = (log_Gini - lag(log_Gini, default = first(log_Gini)))/5) %>%
  mutate(dlog_Private_Credit = (log_Private_Credit - lag(log_Private_Credit, default = first(log_Private_Credit)))/5) %>%
  mutate(dlog_Mean_Inc = (log_Mean_Inc - lag(log_Mean_Inc, default = first(log_Mean_Inc)))/5)

#Replacing all 0s with NA
Avg_Data[Avg_Data == 0] <- NA

#renaming cols Time_Span and Period
names(Avg_Data) <- c("Country", "Time_Span", "Pov_1.90", "Pov_3.20", "Pov_5.50",
                     "Gini", "Mean_Inc", "Private_Credit", "Pop_Growth", "GDPpc", "log_ZY_1.90", 
                     "log_ZY_3.20", "log_ZY_5.50", "Period", "Code",
                     "Region", "Income_Group", "Pov_1.90_IP", "Pov_3.20_IP",
                     "Pov_5.50_IP", "Gini_IP", "log_Pov_1.90", "log_Pov_3.20",
                     "log_Pov_5.50", "log_Gini", "log_Private_Credit", "log_Mean_Inc",
                     "dlog_Pov_1.90", "dlog_Pov_3.20", "dlog_Pov_5.50", "dlog_Gini",
                     "dlog_Private_Credit", "dlog_Mean_Inc")

#reordering cols
col_order <- c("Code", "Period", "Country", "Time_Span", "Pov_1.90", "Pov_3.20", "Pov_5.50",
               "Gini", "Mean_Inc", "Private_Credit", "Pop_Growth", "GDPpc",
               "Region", "Income_Group", "Pov_1.90_IP", "Pov_3.20_IP",
               "Pov_5.50_IP", "Gini_IP", "log_Pov_1.90", "log_Pov_3.20",
               "log_Pov_5.50", "log_Gini", "log_Private_Credit", "log_Mean_Inc",
               "dlog_Pov_1.90", "dlog_Pov_3.20", "dlog_Pov_5.50", "dlog_Gini",
               "dlog_Private_Credit", "dlog_Mean_Inc", "log_ZY_1.90", "log_ZY_3.20", "log_ZY_5.50")

Avg_Data <- Avg_Data[, col_order]

#############Export the 5 year averaged Dataset which will then be further revised in Stata
write.csv(Avg_Data, "5YrAvg_Data.csv")


