
#Make hist of total steps taken each day
totalSteps = aggregate(activity$steps, list(Date = activity$date), sum, na.rm=TRUE)

par(mar=c(5,5,5,5))
plot(totalSteps$Date, totalSteps$x, type="h", xlab="", ylab="Steps", main="Total Steps Per Day")

#Mean/Median steps per day to be used in markdown text
meanSteps <- mean(totalSteps$x)
medianSteps <- median(totalSteps$x)