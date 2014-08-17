
#mean steps per interval
stepsInterval <- aggregate(activity$steps, list(interval = activity$interval), mean, na.rm=TRUE)

par(mar=c(5,5,5,5))
plot(stepsInterval$interval, stepsInterval$x, type="l", xlab="5 minute Interval", ylab="Avg Steps", main="Mean Steps Per Interval")

## Field to be used in markdown text
maxInterval <- stepsInterval[stepsInterval$x == max(stepsInterval$x),1]
