library(lattice)

getDayType <- function(date) {
  
  dayName = weekdays(date)
  if (dayName != 'Saturday' && dayName != 'Sunday') {
    'weekday'
  }
  else {
    'weekend'
  }
}


filledActivity$day.type <- sapply(filledActivity$date, getDayType)
filledActivity$day.type <- as.factor(filledActivity$day.type)


days <- aggregate(filledActivity$steps,list(filledActivity$interval,filledActivity$day.type), mean)
names(days) <- c('interval','day.type','steps')

xyplot(steps  ~ interval | day.type, data=weekday,  type='l', layout=c(1,2))

