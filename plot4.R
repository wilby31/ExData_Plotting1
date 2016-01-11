## Exploratory Data Analysis
## Week 1 Project
## Plot 4 of 4
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

## Concatenate Date and Time

filt_dat$datetime <- as.POSIXct(paste(filt_dat$Date, filt_dat$Time), format="%d/%m/%Y %H:%M:%S")

## Set up the 2x2 grid with par()
par(mfrow = c(2,2))

## Visualize Top Left Quadrant
plot(filt_dat$datetime,
     as.numeric(filt_dat$Global_active_power),
     type = "l",
     xlab = "",
     ylab = "Global Active Power")

## Visualize Top Right Quadrant
plot(filt_dat$datetime,
     as.numeric(filt_dat$Voltage),
     type = "l",
     xlab = "",
     ylab = "Voltage")


## Visualize Bottom Left Quadrant
plot(filt_dat$datetime,
     as.numeric(filt_dat$Sub_metering_1),
     type = "l",
     col = "black",
     xlab = "",
     ylab = "Energy sub metering"
     )
lines(filt_dat$datetime,
      as.numeric(filt_dat$Sub_metering_2),
      col = "red"
      )
lines(filt_dat$datetime,
      as.numeric(filt_dat$Sub_metering_3),
      col = "blue"
      )
legend(x = "topright",
       c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lty = c(1, 1),
       lwd = c(2.5, 2.5),
       col = c("black", "red", "blue"),
       cex = 0.5
       )
        
## Visualize Bottom Right Quadrant
plot(filt_dat$datetime,
     as.numeric(filt_dat$Global_reactive_power),
     type = "l",
     xlab = "",
     ylab = "Global_Reactive_Power")


## create Plot and Export to PNG (480 x 480)

png(filename = "plot4.png", width = 480, height = 480)

par(mfrow = c(2,2))

plot(filt_dat$datetime,
     as.numeric(filt_dat$Global_active_power),
     type = "l",
     xlab = "",
     ylab = "Global Active Power")

plot(filt_dat$datetime,
     as.numeric(filt_dat$Voltage),
     type = "l",
     xlab = "",
     ylab = "Voltage")

plot(filt_dat$datetime,
     as.numeric(filt_dat$Sub_metering_1),
     type = "l",
     col = "black",
     xlab = "",
     ylab = "Energy sub metering"
)
lines(filt_dat$datetime,
      as.numeric(filt_dat$Sub_metering_2),
      col = "red"
)
lines(filt_dat$datetime,
      as.numeric(filt_dat$Sub_metering_3),
      col = "blue"
)
legend(x = "topright",
       c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lty = c(1, 1),
       lwd = c(2.5, 2.5),
       col = c("black", "red", "blue"),
       cex = 0.5
)

plot(filt_dat$datetime,
     as.numeric(filt_dat$Global_reactive_power),
     type = "l",
     xlab = "",
     ylab = "Global_Reactive_Power")

dev.off()
