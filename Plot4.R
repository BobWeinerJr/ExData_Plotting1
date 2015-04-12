
plot4 <- function(pd) {
  
  png(file = 'Plot4.png',
      width = 480,
      height = 480,
      units = 'px'
  )
  
  par(mfrow = c(2,2))

  plot2(pd, create_device = FALSE)
  plot4b(pd)
  plot3(pd, create_device = FALSE)
  plot4d(pd)
    
  par(mfrow = c(1,1))
  
  dev.off()
}



plot4b <- function(pd) {
  plot(pd$data$Voltage,
       type = 'l',
       xlab = 'datetime',
       ylab = 'Voltage',
       xaxt = 'n')
  
  axis(1, at = pd$xPoints, label = pd$xLabels)
  
}

plot4d <- function(pd) {
  plot(pd$data$Global_reactive_power,
       type = 'l',
       xlab = 'datetime',
       ylab = 'Global_reactive_power',
       xaxt = 'n')
  
  axis(1, at = pd$xPoints, label = pd$xLabels)
  
}
