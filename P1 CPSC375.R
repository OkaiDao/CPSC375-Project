#Project 1 CPSC 375

library(tidyverse)
library(ggplot2)
library(modelr)

# [1.a START]
  # Loading Data [requirement 1.a]
  covid <- read_csv("https://raw.githubusercontent.com/govex/COVID-19/master/data_tables/vaccine_data/global_data/time_series_covid19_vaccine_doses_admin_global.csv")
  gdp <- read_csv("https://gist.githubusercontent.com/audstanley/689e9ac0b43eae27437c7ac6b568fad0/raw/32aed5fb4c5f8b94660a58f0d267ed33c9eda2a3/data.csv")
  demographics <- read_csv("https://gist.githubusercontent.com/audstanley/cb889da3782148d2437c371063788859/raw/0999a8e94df39ed5954743e2556f589b2481b86d/demographics.csv")
# [1.a END]

# [1.b/g START]
  # Converting Covid Data set into Tidy Data [requirement 1.b]

  # [this is also 1.b tidying]
  covid <- covid %>% pivot_longer(c(-UID, -iso2, -iso3, -code3, -FIPS, -Admin2,
    -Province_State, -Country_Region, -Lat, -Long_, -Combined_Key, -Population), 
    names_to = "date", values_to = "shots", values_drop_na = TRUE)

  # Converting Demographics to Tidy Data
  # Creating male/female population numbers
  dtidy <- demographics %>% pivot_wider(names_from = "Series Code", values_from = YR2015)
  dtidy <- dtidy %>% mutate(SP.POP.65UP.IN=SP.POP.65UP.FE.IN+SP.POP.65UP.MA.IN, 
    SP.POP.80UP.IN = SP.POP.80UP.MA + SP.POP.80UP.FE, 
    SP.POP.1564.IN = SP.POP.1564.MA.IN + SP.POP.1564.FE.IN, 
    SP.POP.0014.IN = SP.POP.0014.MA.IN + SP.POP.0014.FE.IN, 
    SP.DYN.AMRT = SP.DYN.AMRT.MA + SP.DYN.AMRT.FE, 
    SP.POP.TOTL = SP.POP.TOTL.MA.IN + SP.POP.TOTL.MA.IN) %>% 
      select(-contains(".FE")) %>% select(-contains(".MA"))
    # [requirement 1.g ^ this line]

  # [requirement 1.b - not g] There should be two parts to this.
  PartBOne <- dtidy %>% 
    select(c("Country Code", "SP.DYN.LE00.IN")) %>% 
    group_by(`Country Code`) %>% summarise(SP.DYN.LE00.IN=max(SP.DYN.LE00.IN, na.rm = TRUE)) %>% 
    filter(is.finite(SP.DYN.LE00.IN))

  PartBTwo <- dtidy %>%
    select(c("Country Code", "SP.URB.TOTL")) %>% 
    group_by(`Country Code`) %>% summarise(SP.URB.TOTL=max(SP.URB.TOTL, na.rm = TRUE)) %>% 
    filter(is.finite(SP.URB.TOTL))

  # Update dtidy and now we are done with part 1.b
  dtidy <- PartBOne %>% full_join(PartBTwo, by = "Country Code") 
# [1.b/g END]

# [1.c/d START]
  # Filtering Data from the covid data set
  covid <- covid %>% filter(is.na(Province_State))
  covid <- covid %>% subset(select=c(iso3, Country_Region, Population, date, shots))

  # adding vaccination rate
  covid <- covid %>% mutate(vacRate = shots/Population)
# [1.c/d END]

# [1.e START]
  # Creating number of days since first day
  covid <- covid %>% group_by(Country_Region) %>% filter(shots > 0) %>% mutate(start_date = min(date))
  covid <- covid %>% mutate(days_since_start = 1 + ceiling(as.numeric(difftime(date, start_date, units = "days"))))
  covid <- covid %>% subset(select=c(iso3, Country_Region, vacRate, Population, date, shots, days_since_start))
# [1.e END]

# [1.f START]
# Converting GDP to Tidy Data
  gdp <- gdp %>% pivot_longer(c(-"Country Name", -"Country Code", -"Indicator Name", -"Indicator Code"), names_to = "Year", values_to = "GDP", values_drop_na = TRUE)
  gdp <- gdp %>% subset(select = c(`Country Name`, `Country Code`, Year, GDP))
  #Removing all years that are not 2020 in GDP data set
  gdp <- gdp %>% filter(Year == "2020")
# [1.f END]

# [1.g is done earlier]

# [1.h START]
  # Joining Tables
  demoGDP <- gdp %>% full_join(dtidy, by = "Country Code")
  covid_data_full <- covid %>% 
    inner_join(demoGDP, by = c(iso3 = 'Country Code')) %>% 
    subset(select=c(iso3, Country_Region, vacRate, shots, Population, days_since_start, GDP, SP.DYN.LE00.IN, SP.URB.TOTL))
# [1.h END]

# Finally, look at the data.
covid_data_full <- covid_data_full %>% mutate(ShotsPerHundredK=vacRate*100000)
covid_data_full %>% view()

# mutate with vacRate per population total
covid_data_full <- covid_data_full %>% mutate(ShotsPerHundredK=vacRate*100000)

# Report Section
ggplot(data = covid_data_full) + geom_point(mapping=aes(x = days_since_start, y = vacRate, color=iso3))

# Create the linear model
cov_displ <- lm(formula = vacRate ~ days_since_start, data = covid_data_full)

#Scatterplot for latest day 
covid_data_full_latest <- covid_data_full %>% arrange(-days_since_start)%>% group_by(Country_Region) %>% slice(1)
ggplot(data = covid_data_full_latest) + geom_point(mapping=aes(x=days_since_start, y=vacRate))