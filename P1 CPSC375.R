library(tidyverse)
#Loading Data
covid <- read_csv("https://raw.githubusercontent.com/govex/COVID-19/master/data_tables/vaccine_data/global_data/time_series_covid19_vaccine_doses_admin_global.csv")
gdp <- read_csv("https://gist.githubusercontent.com/audstanley/689e9ac0b43eae27437c7ac6b568fad0/raw/32aed5fb4c5f8b94660a58f0d267ed33c9eda2a3/data.csv")
demographics <- read_csv("https://gist.githubusercontent.com/audstanley/cb889da3782148d2437c371063788859/raw/0999a8e94df39ed5954743e2556f589b2481b86d/demographics.csv")


#Converting Covid Data set into Tidy Data
covid <- covid %>% pivot_longer(c(-UID, -iso2, -iso3, -code3, -FIPS, -Admin2,
                                  -Province_State, -Country_Region, -Lat, -Long_, -Combined_Key, -Population), 
                                names_to = "date", values_to = "cases", values_drop_na = TRUE)

#Filtering Data from the data set
#Covid
covid <- covid %>% filter(is.na(Province_State))
covid <- covid %>% subset(select=c(iso3, Country_Region, Population, date, cases))

#Demographics
dtidy <- demographics %>% pivot_wider(names_from = "Series Code", values_from = c(YR2015, "Series Name"))
dtidy <- dtidy %>% mutate(SP.POP.65UP.IN=YR2015_SP.POP.65UP.FE.IN+YR2015_SP.POP.65UP.MA.IN, 
                          SP.POP.80UP.IN = YR2015_SP.POP.80UP.MA + YR2015_SP.POP.80UP.FE, 
                          SP.POP.1564.IN = YR2015_SP.POP.1564.MA.IN + YR2015_SP.POP.1564.FE.IN, 
                          SP.POP.0014.IN = YR2015_SP.POP.0014.MA.IN + YR2015_SP.POP.0014.FE.IN, 
                          SP.DYN.AMRT = YR2015_SP.DYN.AMRT.MA + YR2015_SP.DYN.AMRT.FE, 
                          SP.POP.TOTL = YR2015_SP.POP.TOTL.MA.IN + YR2015_SP.POP.TOTL.MA.IN)

#gdp


view(dtidy)
view(covid)
view(gdp)

view(demographics)
