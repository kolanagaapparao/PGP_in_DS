#################################################
# Read data into R from the file
#################################################

us_car_df <- read.csv('USA_cars_datasets_1.csv',stringsAsFactors = FALSE)


##############################################################################################
# Extract the month out of the date in the format "Jan" "Feb" etc and create a separate column
##############################################################################################

### This function is to extract  the month from the date & time
getMonth <- function(x) {
  
  dt <- as.POSIXct(x, format ="%m-%d-%Y %H:%M:%OS", tz = "UTC")
  m <- format(dt, "%B")
  
  return (m)

}

### Prepare month column
month <- apply(data.frame(us_car_df$date_time),1,getMonth)

### Adding month column to us_car_df dataframe
us_car_df <- cbind(us_car_df, month)


##############################################################################################
# Extract the time out of it and create a separate column with values 
# " afternoon , morning , evening , night " based on the hour
##############################################################################################

### This function is to extract time from date & time and return part of day
getPartofDay <- function(x){

    morning <- c(0, 12*60*60-1)
    aftrenoon <- c(12*60*60, 18*60*60-1)
    evening <- c(18*60*60, 22*60*60-1)
    night <- c(22*60*60, 24*60*60)
    
    partOfDay <- NA
    
    ### Get time in seconds
    dt <- as.POSIXct(x, format ="%m-%d-%Y %H:%M:%OS", tz = "UTC")
    
    t_s <- as.integer(format(dt, format = "%H"))*60*60 + 
      as.integer(format(dt, format = "%M"))*60 + 
      as.integer(format(dt, format = "%OS"))
    
    
    if (morning[1] < t_s && t_s < morning[2]){ partOfDay <- "Morning"
      
    } else if (aftrenoon[1] < t_s && t_s < aftrenoon[2]){ partOfDay <- "Aftrenoon"
      
    }else if (evening[1] < t_s && t_s < evening[2]){ partOfDay <- "Evening"
      
    }else if(night[1] < t_s && t_s < night[2]){ partOfDay <- "Night"
      
    }
    
    return (partOfDay)

}

### Prepare month column
part_of_day <- apply(data.frame(us_car_df$date_time),1,getPartofDay)

### Adding month column to us_car_df dataframe
us_car_df <- cbind(us_car_df, part_of_day)


##############################################################################################
# Create another data frame with the names of states and abbreviation of the state 
# and join with the original data frame
##############################################################################################

states_input <- read.csv('us_state_codes.csv',stringsAsFactors = FALSE)


state_code_df <- data.frame(state_name = numeric(0), state_code = numeric(0))

for(st in us_car_df$state){
  code <- states_input$Code[match(st, tolower(states_input$State))]
  state_code_df[nrow(state_code_df)+1,] <- list(st, code)
}

### Adding state_name & state_code columns to us_car_df dataframe
us_car_df <- cbind(us_car_df, state_code_df) 


##############################################################################################
# Extract the first name out of the newly created name column
##############################################################################################
getFirstName <- function(x){
  y <- strsplit(x, " ")
  return (y[[1]][length(y[[1]])])
}
  

### Prepare first name column
name_first <- apply(data.frame(us_car_df$name),1,getFirstName)

### Adding month column to us_car_df dataframe
us_car_df <- cbind(us_car_df, first_name = name_first) 


##############################################################################################
# change the value of condition to number of hours left for all the records
##############################################################################################

convertToHours <- function(x){
  
  y <- 0    
  
  if (strsplit(x, " ")[[1]][2] == "days"){
    
    y <- as.integer(strsplit(x, " ")[[1]][1])*24
    
  } else if (strsplit(x, " ")[[1]][2] == "hours") {
    
    y <- as.integer(strsplit(x, " ")[[1]][1])
    
  }
  
  return (paste(y, "hours", "left"))
}


### Prepare first name column
hours_left <- apply(data.frame(us_car_df$condition),1,convertToHours)

### Adding month column to us_car_df dataframe
us_car_df <- cbind(us_car_df, condition_in_hours = hours_left) 


##############################################################################################
# create bins of mileage and separate them into different groups based on the values
#
# bin number = mileage/denom
# denom = (max mileage - min mileage)/number of bins
##############################################################################################

getBinName <- function(x, nb, d_max, d_min){
  
  bin_size <- ceiling((d_max - d_min)/nb)
  x_bin_num <- ceiling(x/bin_size)
  
  if(x_bin_num > nb) x_bin_num <- nb
  
  return (paste("Group", x_bin_num))

}

num_grp = 20

### Prepare first name column
mileage_group <- apply(data.frame(us_car_df$mileage),1,getBinName, num_grp, 
                       max(us_car_df$mileage), min(us_car_df$mileage))

### Adding month column to us_car_df dataframe
us_car_df <- cbind(us_car_df, mileage_group) 


##############################################################################################
# Write the updated dataframe back to a csv file
##############################################################################################

write.csv(us_car_df, file="USA_cars_datasets_Modified.csv")














