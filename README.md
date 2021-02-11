# meteorites_project
week_02/day_5

![](https://github.com/LenkaRo/meteorites_project/blob/master/www/meteorites_dashboard.png)

### The project structure:

#### Data cleaning

* *[cleaning_data.R](https://github.com/LenkaRo/meteorites_project/blob/master/cleaning_data.R)* 

    Clean the input data meteorite_landings.csv. <br>
    Change the names of the variables to follow our naming standards. <br>
    Split in column GeoLocation into latitude and longitude, the new latitude and longitude columns should be numeric. <br>
    Replace any missing values in latitude and longitude with zeros. <br>
    Remove meteorites less than 1000g in weight from the data. <br>
    Order the data by the year of discovery. <br>
    Save cleaned data into new file *meteorite_landing_clean_data.csv*
 
#### Data analysis

* *[meteorites.Rmd](https://github.com/LenkaRo/meteorites_project/blob/master/meteorites.Rmd)* 

    Read the cleaned data *meteorite_landing_clean_data.csv* into R. <br>
    Find the names and years found for the 10 largest meteorites in the data. <br>
    Find the average mass of meteorites that were recorded falling, vs. those which were just found. <br>
    Find the number of meteorites in each year, for every year since 2000. 

#### Shiny app framework

* *[app.R](https://github.com/LenkaRo/meteorites_project/blob/master/app.R)*

    An interactive dashboard. <br>
    Use widgets to filter out meteorites that you would like to see more information about and get their location displayed on a map.

All files are thoroughly commented on what steps have been taken.
