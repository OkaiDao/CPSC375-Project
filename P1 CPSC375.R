library(tidyverse)
covid <- read_csv("https://raw.githubusercontent.com/govex/COVID-19/master/data_tables/vaccine_data/global_data/time_series_covid19_vaccine_doses_admin_global.csv")
API_NY.GDP.MKTP.CD_DS2_en_csv_v2_3011433 <- read.csv("D:/School-Work/BigData/API_NY.GDP.MKTP.CD_DS2_en_csv_v2_3011433.csv", header=FALSE)
gdp <- API_NY.GDP.MKTP.CD_DS2_en_csv_v2_3011433
demographics <- read.csv("D:/School-Work/BigData/demographics.csv", header=FALSE)

covid <- covid %>% pivot_longer(c(-UID, -iso2, -iso3, -code3, -FIPS, -Admin2, -Province_State, -Country_Region, -Lat, -Long_, -Combined_Key, -Population), names_to = "date", values_to = "cases", values_drop_na = TRUE)
#Wanted/Useful Data
covidset = subset(covid, select=c(Country_Region, Population, date, cases))
view(covidset)


