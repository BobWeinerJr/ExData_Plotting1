
plot3 <- function(pd, create_device = TRUE) {
  
  cols = c('Black', 'Red', 'Blue')
  labels = c('Sub_Metering_1', 'Sub_Metering_2', 'Sub_Metering_3')
  
  if (create_device) {
    png(file = 'Plot3.png',
        width = 480,
        height = 480,
        units = 'px'
    )
  }
  
  plot(pd$data$Sub_metering_1,
       type = 'l',
       main = '',
       xlab = '',
       ylab = 'Energy sub metering',
       xaxt = 'n',
       col = cols[1]
  )
  
  lines(pd$data$Sub_metering_2, col = cols[2])
  lines(pd$data$Sub_metering_3, col = cols[3])
  
  axis(1, at = pd$xPoints, label = pd$xLabels)
  
  legend(x = 'topright',
         lwd = 1,
         col = cols,
         legend = labels
  )
  
  if (create_device) {
    dev.off()
  }
  
}