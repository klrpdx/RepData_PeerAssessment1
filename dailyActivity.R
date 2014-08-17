
#mean steps per interval
stepsInterval <- aggregate(activity$steps, list(Interval = activity$interval), mean, na.rm=TRUE)

par(mar=c(5,5,5,5))
plot(meanSteps$Interval, meanSteps$x, type="l", xlab="5 minute Interval", ylab="Avg Steps", main="Mean Steps Per Interval")

## Field to be used in markdown text
maxInterval <- meanSteps[meanSteps$x == max(meanSteps$x),1]
