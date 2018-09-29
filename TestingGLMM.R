library(glmmADMB)  
i = 7
#for (i in 1:10)
#{
#filename = paste(c("Processed_Train_Student", i), collapse = "")
#filename = paste(filename, "_1.csv", sep = "")
filename = "Processed_Train_Student15_1.csv"
mydata = read.csv(filename)
#fit <- glmmadmb(mydata$Sleep.Duration..hrs. ~ 
fit <- glmmadmb(mydata$Restless.Duration..min. ~ 
                  mydata$Acitivty.State.0..min. +
                  mydata$Activity.State.1..min. + 
                  mydata$Activity.State.2..min. +
                  mydata$Activity.State.3..min. + 
                  mydata$Calories.Burned.State.0 +
                  mydata$Calories.Burned.State.1 + 
                  mydata$Calories.Burned.State.2 +
                  mydata$Calories.Burned.State.3 +
                  mydata$Screen.Usage..min. + 
                  mydata$Nap.Data..hrs. +
                  mydata$isSaturday + 
                  mydata$isFriday + 
                  mydata$isThursday +
                  mydata$isWednesday +
                  mydata$isTuesday + 
                  mydata$isMonday +
                #  mydata$isWeekend +
                  mydata$isRegular + 
                #  mydata$isReadingDay + 
               #   mydata$isReadingDay +
                  mydata$Mean.Temperature +
                  mydata$Median.Temperature +
                  mydata$Daily.Audio.Usage..min. +
                  mydata$Audio.Usage.30.min.before.Sleep..min. + 
                  mydata$Screen.Usage.30.Min.Before.Sleep..min. +
                  mydata$Audio.and.Screen.30.Min.Before.Sleep.Interaction +
                  mydata$Previous.Night.Sleep.Duration..hrs.,
                 # mydata$Min.to.Fall.Asleep,
                 # mydata$Audio.Usage.in.Bed..min. +
                 # mydata$Screen.Usage.in.Bed..min., 
                  family = 'gaussian')
summary(fit)



#filename2 = paste(c("Processed_Validate_", i), collapse = "")
#filename2 = paste(filename2, ".csv", sep = "")
filename2 = "Processed_Validate_Student15_1.csv"
myValidateData = read.csv(filename2)
predictedValue = 0
predictedValueArray = vector()
for (k in 1:length(myValidateData$Row.))
{
  sleepPrediction = (fit$b["(Intercept)"] +
                        (fit$b["mydata$Acitivty.State.0..min."] * myValidateData$Acitivty.State.0..min.[k]) +
                        (fit$b["mydata$Activity.State.1..min."] * myValidateData$Activity.State.1..min.[k] ) +
                        (fit$b["mydata$Activity.State.2..min."] * myValidateData$Activity.State.2..min.[k] ) +
                        (fit$b["mydata$Activity.State.3..min."] * myValidateData$Activity.State.3..min.[k] ) +
                        (fit$b["mydata$Calories.Burned.State.0"] * myValidateData$Calories.Burned.State.0[k] ) +
                        (fit$b["mydata$Calories.Burned.State.1"] * myValidateData$Calories.Burned.State.1[k] ) +
                        (fit$b["mydata$Calories.Burned.State.2"] * myValidateData$Calories.Burned.State.2[k] ) +
                        (fit$b["mydata$Calories.Burned.State.3"] * myValidateData$Calories.Burned.State.3[k] ) +
                        (fit$b["mydata$Screen.Usage..min."] * myValidateData$Screen.Usage..min.[k] ) +
                        (fit$b["mydata$Nap.Data..hrs."] * myValidateData$Nap.Data..hrs.[k] ) +
                        (fit$b["mydata$isSaturday"] * myValidateData$isSaturday[k] ) +
                        (fit$b["mydata$isFriday"] * myValidateData$isFriday[k] ) +
                        (fit$b["mydata$isThursday"] * myValidateData$isThursday[k] ) +
                        (fit$b["mydata$isWednesday"] * myValidateData$isWednesday[k] ) +
                        (fit$b["mydata$isTuesday"] * myValidateData$isTuesday[k] ) +
                        (fit$b["mydata$isMonday"] * myValidateData$isMonday[k] ) +
                ##       #  (fit$b["mydata$isWeekend"] * myValidateData$isWeekend[k] ) +
                       (fit$b["mydata$isRegular"] * myValidateData$isRegular[k] ) +
                      #  (fit$b["mydata$isBreak"] * myValidateData$isBreak[k] ) +
                      #  (fit$b["mydata$isReadingDay"] * myValidateData$isReadingDay[k] ) +
                        (fit$b["mydata$Mean.Temperature"] * myValidateData$Mean.Temperature[k] ) +
                        (fit$b["mydata$Median.Temperature"] * myValidateData$Median.Temperature[k] ) +
                        (fit$b["mydata$Daily.Audio.Usage..min."] * myValidateData$Daily.Audio.Usage..min.[k] ) +
                        (fit$b["mydata$Audio.Usage.30.min.before.Sleep..min."] * myValidateData$Audio.Usage.30.min.before.Sleep..min.[k] ) +
                        (fit$b["mydata$Screen.Usage.30.Min.Before.Sleep..min."] * myValidateData$Screen.Usage.30.Min.Before.Sleep..min.[k] ) +
                        (fit$b["mydata$Audio.and.Screen.30.Min.Before.Sleep.Interaction"] * myValidateData$Audio.and.Screen.30.Min.Before.Sleep.Interaction[k] ) +
                        (fit$b["mydata$Previous.Night.Sleep.Duration..hrs."] * myValidateData$Previous.Night.Sleep.Duration..hrs.[k] ) 
                   #    (fit$b["mydata$Min.to.Fall.Asleep"] * myValidateData$Min.to.Fall.Asleep[k])
                ##     #   (fit$b["mydata$Audio.Usage.in.Bed..min."] * myValidateData$Audio.Usage.in.Bed..min.[k]) +
                ##     #   (fit$b["mydata$Screen.Usage.in.Bed..min."] * myValidateData$Screen.Usage.in.Bed..min.[k])
  )
  predictedValueArray <- c(predictedValueArray, sleepPrediction)
  print(" ")
  print("Number: ")
  print(k)
  print("Predicted Sleep:")
  print(sleepPrediction)
  print("Actual Sleep:")
  print(myValidateData$Sleep.Duration..hrs.[k])
  predictedValue = predictedValue + sleepPrediction
}
predictedValue = predictedValue / length(myValidateData$Row.)
print("Predicted Value of Validate Data:")
print(predictedValue)

print("Expected Value of Validate Data:")
print(mean(myValidateData$Sleep.Duration..hrs.))


print("Pearson Coefficient")
print(cor(predictedValueArray[1:50], myValidateData$Sleep.Duration..hrs.[1:50], method = "pearson"))
print("Spearman Coefficient")
print(cor(predictedValueArray[1:50], myValidateData$Sleep.Duration..hrs.[1:50], method = "spearman"))

plot(predictedValueArray[1:50], myValidateData$Sleep.Duration..hrs.[1:50], xlab = "Predicted Hours of Sleep", ylab = "Actual Hours of Sleep")


#}
