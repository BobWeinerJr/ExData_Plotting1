
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

runAll <- function() {
  
  pd = readData()
  
  plot1(pd)
  plot2(pd)
  plot3(pd)
  plot4(pd)
  
}
