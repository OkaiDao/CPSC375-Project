
> Jonathan Dao

> Mahmoud Khafagy

> Richard Stanley

<ol type="1">
    <li>Data preparation/wrangling
        <ol type="a">
            <li>
                <a href="https://github.com/OkaiDao/CPSC375-Project/blob/61aec58a7f5bbd5fa49506d0ae84a62a432e8dcd/P1%20CPSC375.R#L5">
                    reading the data files using read_csv()
                </a>
            </li>
            <li>
                <a href="https://github.com/OkaiDao/CPSC375-Project/blob/61aec58a7f5bbd5fa49506d0ae84a62a432e8dcd/P1%20CPSC375.R#L10">
                    Removing unneeded rows (e.g., countries like Brazil and India report Province_State-level data that is not needed as we are studying only country-level rates) and columns.
                </a>
            </li>
            <li>
                <a href="url">
                    tidying tables, as needed. For example, the vaccinations data is not tidy.
                </a>
            </li>
            <li>
                <a href="url">
                    Calculate the vaccination rate: vaccinations/population
                </a>
            </li>
            <li>
                <a href="url">
                    Since the most important factor affecting vaccination rate is the number of days since vaccination began (vaccination rate always increases), calculate a variable that is: number of days since first non-zero vaccination number. This variable will be important for modeling.
                </a>
            </li>
            <li>
                <a href="url">
                    Discard data that is not needed. For example, only the GDP of the most recent year is necessary.
                </a>
            </li>
            <li>
                <a href="url">
                    You can ignore sex-related differences in demographics in this project, so add the male/female population numbers together (already done in HW #4)
                </a>
            </li>
            <li>
                <a href="url">
                    Merge all tables (Hint: Join using the 3-letter ISO code for a country)
                </a>
            </li>
        </ol>
    </li>
    <li> Linear modeling the Covid vaccination rate </li>
    <a href="url">
            Make a list of all predictor variables that are available. The challenge is to identify which combination of these predictors will give the best predictive model. You should also try transforming some of the variables (e.g., transforming population counts to proportion of total population). Run linear regression with at least 5 different combinations of predictor variables. 
            Note: each day becomes one data point, i.e., the vaccination rate is calculated for each day for each country. The number of vaccinations should not be used as an independent variable as this is essentially what you are predicting.
    </a>
</ol>

## Report :

