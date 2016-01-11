## Exploratory Data Analysis
## Week 1 Project
## Plot 1 of 4
## Brent Poliquin
## 1/10/16

## Read Data from Raw File

dat <- read.table(file="./data/household_power_consumption.txt",
                  header=T,
                  sep=";",
                  stringsAsFactors = FALSE)

## Filter the data to date range 2007-02-01 to 2007-02-02 (YYYY-MM-DD)
## Date values are stored [D]D/[M]M/YYYY

filt_dat <- dat[(dat$Date == '1/2/2007' | dat$Date == '2/2/2007') , ]

## Visualize Histogram within RStudio

hist(as.numeric(filt_dat$Global_active_power), 
     col = "red", 
     main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)",
     xlim = c(0, 6),
     ylim = c(0, 1200))

## create Histogram and Export to PNG (480 x 480)

png(filename = "plot1.png", width = 480, height = 480)
hist(as.numeric(filt_dat$Global_active_power), 
     col = "red", 
     main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)",
     xlim = c(0, 6),
     ylim = c(0, 1200))
dev.off()
