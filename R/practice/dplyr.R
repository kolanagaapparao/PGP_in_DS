###################################################################################
#
# This is to explore, understand and learn the DPLYR package using dataframes.
# In this example, we use mtcars dataset
#
###################################################################################

mtcars    # Data set
head(mtcars)
dim(mtcars)

library("dplyr")   # Use DPLYR package

#####
# summary functions
#####

# Summarize data as requsted in the function call
summarise(mtcars, avg_mpg = mean(mpg), max_mpg=max(mpg), min_mpg=min(mpg))

# Provide counts by grouping the data for the columns mentioned in the function call
count(mtcars, cyl)
count(mtcars, cyl, gear)
count(mtcars, cyl, gear, vs)

#####
# Group Cases
#####

# Group the data by columns
gears <- group_by(mtcars, gear)
summarise(gears, g_mean=mean(mpg))

gears_vs <- group_by(mtcars, gear, vs)
summarise(gears_vs, g_mean=mean(mpg))

# Ungrouping the grouped data frame
x <- ungroup(gears)
x


#####
# EXTRACT CASES
#####

# Extract rows that meet logical criteria
mpg_20 <- filter(mtcars, mpg > 20)
mpg_20


# Remove rows with duplicate values
gears_unique <- distinct(mtcars, gear)
gears_unique

# Select rows by position
slice(mtcars, 10:15)

# Randomly select rows. Use n to select a number of rows and prop to select a fraction of rows.
slice_sample(mtcars, n=5)

# Select rows with the lowest and highest values.
slice_min(mtcars,mpg, prop = 0.25)
slice_max(mtcars, mpg, prop = 0.25)

# Select the first or last rows.
slice_head(mtcars, n=5)

#####
# Arrange cases
#####

# Order rows by values of a column or columns
arrange(mtcars, mpg)
arrange(mtcars, desc(mpg))

# Add rows to the existing table/dataframe
x <- cars
tail(x)
dim(x)

x <- add_row(cars, speed = 1, dist = 1)
tail(x)
dim(x)

#####
# Manipulate Variables - EXTRACT VARIABLES
#####

# Extract column values as a vector 
head(mtcars)

pull(mtcars, mpg) # get mpg column
mtcars$mpg # base-R

pull(mtcars, gear) # get gear column
mtcars$gear  # base-R


# Extract columns as a table
select(mtcars, mpg, gear)

# Move columns to new position
x <- relocate(mtcars, mpg, cyl, .after = last_col())
head(x)


#####
# MANIPULATE MULTIPLE VARIABLES AT ONCE
#####

# Summarise or mutate multiple columns in the same way. usage of "across()"
summarise(mtcars, across(everything(), mean))

# Compute across columns in row-wise data. Usage of "c_across()"
transmute(mtcars, n=sum(c_across(8)))


#####
# MAKE NEW VARIABLES : These apply vectorized functions to columns. Vectorized funs take
# vectors as input and return vectors of the same length as output
#####

# Compute new column(s)
head(mtcars)
x <- mutate(mtcars, gpm = 1/mpg)  # add a "gpm" column at the end
head(x)

# Compute new column(s), drop others. in other words get a column 
# which is computed from the existing columns in the dataframe
y <- transmute(mtcars, gpm = 1/mpg)
head(y)

# Rename columns
head(cars)
x <- rename(cars, distance = dist)
head(x)





















































