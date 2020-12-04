
  
library(tidyverse)
library(janitor)
library(assertr)

# Read the data into R
# Change the names of the variables to follow our naming standards.

meteorite_landings <- read_csv("data/meteorite_landings.csv") 

  # Include assertive programming to make sure that:
    # The data has the variable names we expect (“id”, “name”, “mass (g)”, “fall”, “year”, “GeoLocation”). - PASSED
      
    meteorite_landings %>% 
      verify(identical(names(meteorite_landings), c("id", "name", "mass (g)", "fall", "year", "GeoLocation")))
        
# janitor::clean_names()
   
  meteorite_landings <- meteorite_landings %>% clean_names()

# Split in column GeoLocation into latitude and longitude, the new latitude and longitude columns should be numeric.

  # getting rid off parentheses in column geo_location 

    meteorite_landings_no_parentheses <- meteorite_landings %>% 
      mutate(geo_location = str_sub(geo_location, 2, -2))

# splitting geo_location column into two

    meteorite_landings_sep <- meteorite_landings_no_parentheses %>% 
      separate(geo_location, c("latitude", "longitude"), sep = ",") %>% 
      mutate(latitude = as.numeric(latitude),
             longitude = as.numeric(longitude))
    
  # Include assertive programming to make sure that:  
    # Latitude and longitude are valid values. (Latitude between -90 and 90, longitude between -180 and 180).
      #We get an error, there is an observation with longitude > 180, but we get rid of this row in last step anyway
    
    meteorite_landings_sep %>% 
      verify(latitude > -90 & latitude < 90) %>% 
      verify(longitude > -180 & longitude < 180)
    

# Replace any missing values in latitude and longitude with zeros.

  # is there any missing values

      meteorite_landings_sep %>% 
        summarise(across(.fns = ~ sum(is.na(.x))))

meteorite_landings_sep_no_NA <- meteorite_landings_sep %>% 
  mutate(latitude = coalesce(latitude, 0),
         longitude = coalesce(longitude, 0))

  # check there is no missing values in columns latitude and longitude

      meteorite_landings_sep_no_NA %>% 
        summarise(across(.fns = ~ sum(is.na(.x))))

# Remove meteorites less than 1000g in weight from the data
# Order the data by the year of discovery.

meteorite_landings_clean_data <- meteorite_landings_sep_no_NA %>% 
  filter(mass_g > 1000) %>% 
  arrange(year)

write_csv(meteorite_landings_clean_data, "meteorite_landings_clean_data.csv", path = "data/meteorite_landings_clean_data.csv")
