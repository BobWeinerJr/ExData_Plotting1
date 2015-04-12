
plot2 <- function(pd, create_device = TRUE) {
  
  if (create_device) {
    png(file = 'Plot2.png',
        width = 480,
        height = 480,
        units = 'px'
    )
  }
  
  plot(pd$data$Global_active_power,
       main = '',
       xlab = '',
       ylab = 'Global Active Power (kilowatts)',
       xaxt = 'n',
       type = 'l'
  )
  
  axis(1, at = pd$xPoints, label = pd$xLabels)
  
  if (create_device) {
    dev.off()
  }
  
}