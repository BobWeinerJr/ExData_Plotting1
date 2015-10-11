
# Must be run from directory containing the data file
readData <- function() {
    
    fileName = 'household_power_consumption.txt'
    start = 66638
    end = 69517
    
    colClasses = c(
        rep('character', 2),
        rep('numeric', 7))
    
    headers = scan(fileName, 
                   what = 'character',
                   sep = ';',
                   nlines = 1)
    
    df = read.table(fileName, 
                    header = F,
                    sep = ';',
                    colClasses = colClasses,
                    col.names = headers,
                    skip = start - 1,
                    nrows = end - start + 1)
    
    df$Date <- as.POSIXct(df$Date, format="%d/%m/%Y")
    
    # metadata for x-axis labels
    days = range(df$Date)
    lastDay = length(days)
    days[lastDay + 1] = days[lastDay] + 60 * 60 * 24
    
    pd = list(
        data = df,
        xPoints = c(1, nrow(df)/2, nrow(df)),
        xLabels = format(days, '%a')
    )
    
}


# plot2.R and plot3.R must be sourced prior to calling plot4()
plot4 <- function() {
  pd = readData()
    
  png(file = 'Plot4.png',
      width = 480,
      height = 480,
      units = 'px'
  )
  
  par(mfrow = c(2,2))

  plot2(create_device = FALSE)
  plot4b(pd)
  plot3(create_device = FALSE)
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
