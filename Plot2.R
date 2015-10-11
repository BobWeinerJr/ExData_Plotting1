
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

plot2 <- function(create_device = TRUE) {
  pd = readData()
    
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