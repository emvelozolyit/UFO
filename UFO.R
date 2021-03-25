# Question 1
# New Project created called UFO
# Read UFO dataset into a new data frame called ufo_data
# Empty space replaced with NA
ufo_data <- read.csv("ufo.csv", na = "")

# Question 2
# Show the structure of the UFO data frame
str(ufo_data)
# Show the first 15 rows of data within the data frame
head(ufo_data, 15)
# Count the number of rows within the UFO data frame to
# confirm there are 89071 rows in it
nrow(ufo_data)

# Question 3 
# Convert the datetime variable to a date variable 
# It is currently mm/dd/yyyy
converted_date <- as.Date(ufo_data$datetime, "%m/%d/%Y")
converted_date

# Question 4
# Update the UFO data frame with the new date structure
ufo_data$datetime <- converted_date
# Prove the data structure has now changed by displaying
# the new structure of the UFO data frame
str(ufo_data)

# Question 5 
# Using the names() function, display the names of the UFO
# data frame 
names(ufo_data)
# Modify and update the variable names
names(ufo_data)[6] <- "DurationSeconds"
names(ufo_data)[7] <- "DurationHrsMins"
names(ufo_data)[9] <- "DatePosted"
names(ufo_data)

# Question 6 
# Recode the 'latitude' variable so it's a numerical variable
ufo_data$latitude <- as.numeric(ufo_data$latitude)
# Show the structure of the data frame
str(ufo_data)

# Question 7
# Install and use the mice package to show missing
# variables in the UFO data frame 
install.packages("mice")
library(mice)
md.pattern(ufo_data)
# Use the plot to answer two questions:
# 1. How many records have no missing data content?
# Answer: 1
# 2. How many variables have all data variables missing?
# Answer: 1
# Save missing variable plot into working directory
# Call the file missingvars.png

#Question 8
# Sort the UFO data frame by shape and then by city.
attach(ufo_data)
sorted_data <- ufo_data[order(shape, city), ]
sorted_data
# Extract only the columns datetime, city, country, and
# shape and store content into a data frame called sorted_ufo_data
include_list <- names(sorted_data) %in% c("datetime", "city", "country", "shape")
sorted_ufo_data <- sorted_data[(include_list)]
# Display the first 15 rows of data in this new data frame
head(sorted_ufo_data, 15)

# Question 9
# Find all entries in the UFO data frame where the country
# equals "gb" and the shape variable equals "disk"
# Store the contents in a data frame called ufo_gb_disk
attach(ufo_data)
ufo_gb_disk <- subset(ufo_data, country == "gb" & shape == "disk")
ufo_gb_disk

# Question 10
# Save newly modified UFO data frame as modified_ufo.csv
# Save your ufo_gb_disk data frame as ufo_gb.csv and the 
# sorted_ufo_data as sorted_ufo.csv
# Save all three files into the working directory 
write.csv(ufo_data, file = 'modified_ufo.csv')
write.csv(ufo_gb_disk, file = "ufo_gb.csv")
write.csv(sorted_ufo_data, file = "sorted_ufo.csv")

# Finally, sync script file as well as modified_ufo.csv, ufo_gb.csv, 
# sorted_ufo_data and missing vars.png file to remote GitHub repo.