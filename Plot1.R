

plot1 <- function (pd) {
  
  png(file = 'Plot1.png',
      width = 480,
      height = 480,
      units = 'px'
  )
  
  hist(pd$data$Global_active_power,
       main = 'Global Active Power',
       xlab = 'Global Active Power (kilowatts)',
       col = 'Red'
       )

  dev.off()
}