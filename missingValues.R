
#mean steps per interval
stepsInterval <- aggregate(activity$steps, list(interval = activity$interval), mean, na.rm=TRUE)
names(stepsInterval) = c('interval', 'steps')
## Total rows with missing values
totalMissing <- sum(is.na(activity$steps))

#Percentage that are missing
meanMissing <- mean(is.na(activity$steps))

#Make new df with NA steps replaced with mean for that interval
missing <- subset(activity,is.na(steps),select=c(date,interval))

#Merge with DF containing average step per interval
missing <- merge(missing, stepsInterval, by="interval")

cleanedActivity <- subset(activity,!is.na(steps))
filledActivity <- merge(cleanedActivity, missing, by=c('date','interval','steps'), all.x=TRUE, all.y=TRUE)

#Make hist of total steps taken each day
filledTotalSteps = aggregate(filledActivity$steps, list(Date = filledActivity$date), sum, na.rm=TRUE)

par(mar=c(5,5,5,5))
plot(filledTotalSteps$Date, filledTotalSteps$x, type="h", xlab="", ylab="Steps", main="Total Steps Per Day, NAs Estimated")

#Mean/Median steps per day to be used in markdown text
filledMeanSteps <- mean(filledTotalSteps$x)
filledMedianSteps <- median(filledTotalSteps$x)
diffMean <- ((filledMeanSteps-meanSteps)/meanSteps) * 100
diffMedian <- ((filledMedianSteps-medianSteps)/medianSteps)*100


