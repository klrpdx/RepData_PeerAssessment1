## Load the activity data
activity <- read.csv("activity.csv", header = TRUE)

## steps and intervals are ints, which we want, but date is a factor.
str(activity)

## Change date values into actual date types
activity$date <- as.Date(activity$date, format="%Y-%m-%d")

str(activity)



