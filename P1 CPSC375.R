library(tidyverse)
#Loading Data
covid <- read_csv("https://raw.githubusercontent.com/govex/COVID-19/master/data_tables/vaccine_data/global_data/time_series_covid19_vaccine_doses_admin_global.csv")
gdp <- read_csv("https://gist.githubusercontent.com/audstanley/689e9ac0b43eae27437c7ac6b568fad0/raw/32aed5fb4c5f8b94660a58f0d267ed33c9eda2a3/data.csv")
demographics <- read_csv("https://gist.githubusercontent.com/audstanley/cb889da3782148d2437c371063788859/raw/0999a8e94df39ed5954743e2556f589b2481b86d/demographics.csv")

#Converting Covid Data set into Tidy Data
covid <- covid %>% pivot_longer(c(-UID, -iso2, -iso3, -code3, -FIPS, -Admin2, -Province_State, -Country_Region, -Lat, -Long_, -Combined_Key, -Population), names_to = "date", values_to = "shots", values_drop_na = TRUE)

  #Wrangling Data from Covid data set
covid <- covid %>% filter(is.na(Province_State), shots > 0)
covid <- covid %>% mutate(vacRate = shots/Population)            #%>% mutate(date = as.numeric(gsub("-", "", date))) TO REMOVE "-"
covid <- covid %>% subset(select=c(iso3, Country_Region, vacRate, Population, date, shots))

covid2 <- covid %>% group_by(Country_Region) %>% mutate(start_date = min(date))
covid2 <- covid2 %>% mutate((days_since_start= 1 + as.numeric(difftime(date, start_date, units = "days"))))

 #Wrangling Data from GDP data set

gdp <- gdp %>% pivot_longer(c('2020'), names_to = "Year", values_to = "latest")

view(covid)
view(gdp2)
dtidy <- demographics %>% pivot_wider(names_from = "Series Code", values_from = YR2015)
dtidy <- dtidy %>% mutate(SP.POP.65UP.IN=SP.POP.65UP.FE.IN+SP.POP.65UP.MA.IN, SP.POP.80UP.IN = SP.POP.80UP.MA + SP.POP.80UP.FE, SP.POP.1564.IN = SP.POP.1564.MA.IN + SP.POP.1564.FE.IN, SP.POP.0014.IN = SP.POP.0014.MA.IN + SP.POP.0014.FE.IN, SP.DYN.AMRT = SP.DYN.AMRT.MA + SP.DYN.AMRT.FE, SP.POP.TOTL = SP.POP.TOTL.MA.IN + SP.POP.TOTL.MA.IN)
