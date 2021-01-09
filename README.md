# meteorites_project
week_02/day_5

Project contains: 

  1. R Project (meteorites_project.Rproj)
  
    To hold following 3 files, Data folder and directory structure
    

  2. R script (cleaning_data.R) 
  
    Clean the input data meteorite_landings.csv.
    Change the names of the variables to follow our naming standards.
    Split in column GeoLocation into latitude and longitude, the new latitude and longitude columns should be numeric.
    Replace any missing values in latitude and longitude with zeros.
    Remove meteorites less than 1000g in weight from the data.
    Order the data by the year of discovery.
    Save cleaned data into new file meteorite_landing_clean_data.csv
    

  3. R Notebook (meteorites.Rmd) 
  
    Read the cleaned data into R.
    Find the names and years found for the 10 largest meteorites in the data.
    Find the average mass of meteorites that were recorded falling, vs. those which were just found.
    Find the number of meteorites in each year, for every year since 2000. 
    
    
  4. Shiny App (app.R)

  	 An interactive shiny dashboard.
  	 Use widgets to filter out meteorites that you would like to see more information about and get their location displayed on a map!
  	    
  
  5. Data
  
    meteorite_landing.csv
    meteorite_landing_clean_data.csv
    
  
  6. R Notebook in HTML (meteorites.html)
  
  
  7. R Notebook in HTML - shorter version with printed findings (meteorites.nb.html)
