library(tidyverse)
#Loading Data
covid <- read_csv("https://raw.githubusercontent.com/govex/COVID-19/master/data_tables/vaccine_data/global_data/time_series_covid19_vaccine_doses_admin_global.csv")
gdp <- read_csv("https://gist.githubusercontent.com/audstanley/689e9ac0b43eae27437c7ac6b568fad0/raw/32aed5fb4c5f8b94660a58f0d267ed33c9eda2a3/data.csv")
demographics <- read_csv("https://gist.githubusercontent.com/audstanley/cb889da3782148d2437c371063788859/raw/0999a8e94df39ed5954743e2556f589b2481b86d/demographics.csv")

#Converting Covid Data set into Tidy Data
covid <- covid %>% pivot_longer(c(-UID, -iso2, -iso3, -code3, -FIPS, -Admin2,
                                  -Province_State, -Country_Region, -Lat, -Long_, -Combined_Key, -Population), 
                                names_to = "date", values_to = "shots", values_drop_na = TRUE)

#Converting Demographics to Tidy Data
#Creating male/female population numbers
#dtidy <- demographics %>% pivot_wider(names_from = "Series Code", values_from = c(YR2015, "Series Name"))
#dtidy <- dtidy %>% mutate(SP.POP.65UP.IN=YR2015_SP.POP.65UP.FE.IN+YR2015_SP.POP.65UP.MA.IN, 
#                          SP.POP.80UP.IN = YR2015_SP.POP.80UP.MA + YR2015_SP.POP.80UP.FE, 
#                          SP.POP.1564.IN = YR2015_SP.POP.1564.MA.IN + YR2015_SP.POP.1564.FE.IN, 
#                          SP.POP.0014.IN = YR2015_SP.POP.0014.MA.IN + YR2015_SP.POP.0014.FE.IN, 
#                          SP.DYN.AMRT = YR2015_SP.DYN.AMRT.MA + YR2015_SP.DYN.AMRT.FE, 
#                          SP.POP.TOTL = YR2015_SP.POP.TOTL.MA.IN + YR2015_SP.POP.TOTL.MA.IN)

dtidy <- demographics %>% pivot_wider(names_from = "Series Code", values_from = YR2015)
dtidy <- dtidy %>% mutate(SP.POP.65UP.IN=SP.POP.65UP.FE.IN+SP.POP.65UP.MA.IN, 
                          SP.POP.80UP.IN = SP.POP.80UP.MA + SP.POP.80UP.FE, 
                          SP.POP.1564.IN = SP.POP.1564.MA.IN + SP.POP.1564.FE.IN, 
                          SP.POP.0014.IN = SP.POP.0014.MA.IN + SP.POP.0014.FE.IN, 
                          SP.DYN.AMRT = SP.DYN.AMRT.MA + SP.DYN.AMRT.FE, 
                          SP.POP.TOTL = SP.POP.TOTL.MA.IN + SP.POP.TOTL.MA.IN)

#Creating male/female population numbers
#Note this version is directly 
#dtidy <- dtidy %>% mutate(SP.POP.80UP=SP.POP.80UP.FE+SP.POP.80UP.MA) %>% 
#  mutate(SP.POP.1564.IN=SP.POP.1564.MA.IN+SP.POP.1564.FE.IN) %>% 
#  mutate(SP.POP.0014.IN=SP.POP.0014.MA.IN+SP.POP.0014.FE.IN) %>% 
#  mutate(SP.DYN.AMRT=SP.DYN.AMRT.MA+SP.DYN.AMRT.FE) %>% 
#  mutate(SP.POP.TOTL.IN=SP.POP.TOTL.FE.IN+SP.POP.TOTL.MA.IN) %>% 
#  mutate(SP.POP.65UP.IN=SP.POP.65UP.FE.IN+SP.POP.65UP.MA.IN) %>% 
#  select(-contains(".FE")) %>% select(-contains(".MA"))

#Converting GDP to Tidy Data
gdp <- gdp %>% pivot_longer(c(-"Country Name", -"Country Code", -"Indicator Name", -"Indicator Code"), names_to = "Year", values_to = "Value", values_drop_na = TRUE)

#Removing all years that are not 2020 in GDP data set
gdp <- gdp %>% filter(Year == "2020")

#Filtering Data from the data set
#Covid
covid <- covid %>% filter(is.na(Province_State))
covid <- covid %>% subset(select=c(iso3, Country_Region, Population, date, shots))

#adding vaccination rate
covid <- covid %>% mutate(vac_rate = shots/Population)

#Creating number of days since first day
covid2 <- covid %>% group_by(Country_Region) %>% summarise(num_days = n())
covid2 <- covid2 %>% mutate(num_of_days = num_days)
covid2 <- covid2 %>% subset(select=c(num_of_days))

#Wrangling Data from GDP data set
#covid <- covid %>% filter(is.na(Province_State), shots > 0)
#covid <- covid %>% mutate(vacRate = shots/Population)

view(covid)
view(gdp)
view(dtidy)
