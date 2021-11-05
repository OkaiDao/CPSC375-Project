# Final Report

> Jonathan Dao

> Mahmoud Khafagy

> Richard Stanley

## Written Report

### 4.a. Brief descriptions of the data wrangling steps

For data wrangling, we add a mutation for the vaccination rate based on shots given to people per one hundred thousand. Since the vaccination rate is already based on population, later in our modeling, there was no change in the adjusted r-squared value.
While adding shots per hundred thousand doesn't change the model, it is a much better metric to report possible predictions since it would be a metric that people would understand instead of an arbitrary decimal value.

### 4.b. Brief description of how variables were chosen for data modeling


For the data modeling, we used a table to run various linear models, checked each summary, and compared the multiple r-squared values.
Here is that table:

| r<sup>2</sup> | multiple r<sup>2</sup> | Code used |
|------|-------|------------------------|
| 0.5759 | 0.5759 | mod_displ_URB <- lm(data = covid_data_full, vacRate ~ days_since_start + SP.URB.TOTL) |
| 0.01808 | 0.01802 | mod_displ_GDP_URB <- lm(data = covid_data_full, vacRate ~ SP.URB.TOTL + GDP) |
| 0.5979 | 0.5979 | mod_displ_GDP_URB_DST <- lm(data = covid_data_full, vacRate ~ days_since_start + SP.URB.TOTL + GDP) |
| 0.6931 | 0.693 | mod_displ_4 <- lm(data = covid_data_full, vacRate ~ days_since_start + SP.URB.TOTL + GDP + SP.DYN.LE00.IN) |
| 0.6931 | 0.693 | mod_displ_5 <- lm(data = covid_data_full, vacRate ~ days_since_start + SP.URB.TOTL + GDP + SP.DYN.LE00.IN + Population) |
| 0.6931 | 0.693 | mod_displ_6 <- lm(data = covid_data_full, ShotsPerHundredK ~ days_since_start + SP.URB.TOTL + GDP + SP.DYN.LE00.IN + Population) |

The results of these models are used later in this report in a bar graph to compare these values.


### 4.c. Description of any variable transformations

We only made one variable transformation which was vaccination rate * 100,000 which equals the number of shots per one hundred thousand people. 

### 4.d. A scatterplot of most recent vaccination rates for different countries

![scatterplot of most recent vaccination](https://github.com/OkaiDao/CPSC375-Project/raw/main/images/latestCovid.png)

### 4.e. A plot that shows the R2 values of the different models

![A plot that shows the R2 values of the different models](https://github.com/OkaiDao/CPSC375-Project/raw/main/images/bgCovid.png)

### 4.f. A conclusion – what does your modeling say about vaccination rates (e.g., what are the significant factors and what are not)



### 4.g. Clarity of the report
