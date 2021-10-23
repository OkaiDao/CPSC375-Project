library(tidyverse)
#Loading Data
covid <- read_csv("https://raw.githubusercontent.com/govex/COVID-19/master/data_tables/vaccine_data/global_data/time_series_covid19_vaccine_doses_admin_global.csv")
gdp <- read.csv("D:/School-Work/BigData/API_NY.GDP.MKTP.CD_DS2_en_csv_v2_3011433.csv", header=FALSE)
demographics <- read.csv("D:/School-Work/BigData/demographics.csv", header=FALSE)

#Converting Covid Data set into Tidy Data
covid <- covid %>% pivot_longer(c(-UID, -iso2, -iso3, -code3, -FIPS, -Admin2, -Province_State, -Country_Region, -Lat, -Long_, -Combined_Key, -Population), names_to = "date", values_to = "cases", values_drop_na = TRUE)
gdp <- gdp %>%

#Filtering Data from the data set
covid <- covid %>% filter(is.na(Province_State))
covid <- covid %>% subset(select=c(iso3, Country_Region, Population, date, cases))

view(covid)
view(gdp)
dtidy <- demographics %>% pivot_wider(names_from = "Series Code", values_from = c(YR2015, "Series Name"))
dtidy <- dtidy %>% mutate(SP.POP.65UP.IN=YR2015_SP.POP.65UP.FE.IN+YR2015_SP.POP.65UP.MA.IN, SP.POP.80UP.IN = YR2015_SP.POP.80UP.MA + YR2015_SP.POP.80UP.FE, SP.POP.1564.IN = YR2015_SP.POP.1564.MA.IN + YR2015_SP.POP.1564.FE.IN, SP.POP.0014.IN = YR2015_SP.POP.0014.MA.IN + YR2015_SP.POP.0014.FE.IN, SP.DYN.AMRT = YR2015_SP.DYN.AMRT.MA + YR2015_SP.DYN.AMRT.FE, SP.POP.TOTL = YR2015_SP.POP.TOTL.MA.IN + YR2015_SP.POP.TOTL.MA.IN)
