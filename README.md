
> Jonathan Dao

> Mahmoud Khafagy

> Richard Stanley

## Stage 1: with [Draft Report](https://github.com/OkaiDao/CPSC375-Project/tree/main/report) and in [[Pdf]](https://github.com/OkaiDao/CPSC375-Project/tree/main/report/README.pdf)

<ol type="1">
    <li>Data preparation/wrangling
        <ol type="a">
            <li>
                <a href="https://github.com/OkaiDao/CPSC375-Project/blob/90ae3ca84d02feba531e9b11e067c11f8d4a1ef4/P1%20CPSC375.R#L6">
                    reading the data files using read_csv()
                </a>
            </li>
            <li>
                <a href="https://github.com/OkaiDao/CPSC375-Project/blob/90ae3ca84d02feba531e9b11e067c11f8d4a1ef4/P1%20CPSC375.R#L13">
                    Removing unneeded rows (e.g., countries like Brazil and India report Province_State-level data that is not needed as we are studying only country-level rates) and columns.
                </a>
            </li>
            <li>
                <a href="https://github.com/OkaiDao/CPSC375-Project/blob/90ae3ca84d02feba531e9b11e067c11f8d4a1ef4/P1%20CPSC375.R#L48">
                    tidying tables, as needed. For example, the vaccinations data is not tidy.
                </a>
            </li>
            <li>
                <a href="https://github.com/OkaiDao/CPSC375-Project/blob/90ae3ca84d02feba531e9b11e067c11f8d4a1ef4/P1%20CPSC375.R#L48">
                    Calculate the vaccination rate: vaccinations/population
                </a>
            </li>
            <li>
                <a href="https://github.com/OkaiDao/CPSC375-Project/blob/90ae3ca84d02feba531e9b11e067c11f8d4a1ef4/P1%20CPSC375.R#L57">
                    Since the most important factor affecting vaccination rate is the number of days since vaccination began (vaccination rate always increases), calculate a variable that is: number of days since first non-zero vaccination number. This variable will be important for modeling.
                </a>
            </li>
            <li>
                <a href="https://github.com/OkaiDao/CPSC375-Project/blob/90ae3ca84d02feba531e9b11e067c11f8d4a1ef4/P1%20CPSC375.R#L64">
                    Discard data that is not needed. For example, only the GDP of the most recent year is necessary.
                </a>
            </li>
            <li>
                <a href="https://github.com/OkaiDao/CPSC375-Project/blob/90ae3ca84d02feba531e9b11e067c11f8d4a1ef4/P1%20CPSC375.R#L31">
                    You can ignore sex-related differences in demographics in this project, so add the male/female population numbers together (already done in HW #4)
                </a>
            </li>
            <li>
                <a href="https://github.com/OkaiDao/CPSC375-Project/blob/90ae3ca84d02feba531e9b11e067c11f8d4a1ef4/P1%20CPSC375.R#L74">
                    Merge all tables (Hint: Join using the 3-letter ISO code for a country)
                </a>
            </li>
        </ol>
    </li>
    <li> Linear modeling the Covid vaccination rate </li>
    Make a <a href="url"> list </a> of all predictor variables that are available. 
            The challenge is to identify which <a href="https://github.com/OkaiDao/CPSC375-Project/tree/main/finalReport#4b-brief-description-of-how-variables-were-chosen-for-data-modeling"> combination </a> of these predictors will give the best predictive model. 
            You should also try transforming some of the variables (e.g., <a href="https://github.com/OkaiDao/CPSC375-Project/blob/a7415e9e8616988854c4b6b76670f13a726e5bb9/P1%20CPSC375.R#L84">transforming population counts to proportion of total population</a>). Run linear regression with <a href="https://github.com/OkaiDao/CPSC375-Project/tree/main/finalReport#4b-brief-description-of-how-variables-were-chosen-for-data-modeling">at least 5 different combinations of predictor variables.</a>
            Note: each day becomes one data point, i.e., the vaccination rate is calculated for each day for each country. The number of vaccinations should not be used as an independent variable as this is essentially what you are predicting.
    </a>
</ol>

## Stage 2

<ol type="1">
    <li> <a href="https://github.com/OkaiDao/CPSC375-Project/tree/main/finalReport#4a-brief-descriptions-of-the-data-wrangling-steps">Write a short report describing your data wrangling steps and the different combinations of predictor variables you tried, and any variable         transforms. The report should include the following plots: </a>
        <ol type="i">
            <li>
                <a href="https://github.com/OkaiDao/CPSC375-Project/tree/main/finalReport#4d-a-scatterplot-of-most-recent-vaccination-rates-for-different-countries">
                    a scatterplot of only the most recent vaccination rate for every country and the number of days since first vaccination
                </a>
            </li>
            <li>
                <a href="https://github.com/OkaiDao/CPSC375-Project/tree/main/finalReport#4e-a-plot-that-shows-the-r2-values-of-the-different-models">
                    a summary bar graph with the R2 values on the y-axis and a corresponding model name on the x-axis (include all the different models you tried).
                </a>
            </li>
        </ol>
    </li>
    <li> 
        There should be a  <a href="https://github.com/OkaiDao/CPSC375-Project/tree/main/finalReport#4f-a-conclusion--what-does-your-modeling-say-about-vaccination-rates-eg-what-are-the-significant-factors-and-what-are-not">conclusion</a> that describes in words the implication of your most accurate model.
        <a href="url">[A PDF file]</a>
    </li>
    <a href="https://github.com/OkaiDao/CPSC375-Project/blob/main/P1%20CPSC375.R#L1">
            A listing of your R code in one file
    </a>
</ol>