i = 7

filename = paste(c("Processed_Train_", i), collapse = "")
filename = paste(filename, ".csv", sep = "")
mydata = read.csv(filename)

fit <- glm(mydata$Sleep.Duration..hrs. ~ 
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
             #
             mydata$isWeekend +
             #
             mydata$isBreak + 
             mydata$isRegular + 
             mydata$isReadingDay + 
             mydata$Mean.Temperature +
             mydata$Median.Temperature +
             mydata$Daily.Audio.Usage..min. +
             mydata$Audio.Usage.30.min.before.Sleep..min. + 
             mydata$Screen.Usage.30.Min.Before.Sleep..min. +
             mydata$Audio.and.Screen.30.Min.Before.Sleep.Interaction +
             mydata$Previous.Night.Sleep.Duration..hrs. +
             #
             mydata$Min.to.Fall.Asleep +
             #
             mydata$Audio.Usage.in.Bed..min. +
             #
             mydata$Screen.Usage.in.Bed..min.,
           #
           family = gaussian())
summary(fit)

filename2 = paste(c("Processed_Validate_", i), collapse = "")
filename2 = paste(filename2, ".csv", sep = "")

myValidateData = read.csv(filename2)
predictedValue = 0
predictedValueArray = vector()
for (k in 1:length(myValidateData$Row.))
{
  sleepPrediction = 0
  if (!is.na(fit$coefficients["(Intercept)"]))
  {
    sleepPrediction = sleepPrediction + fit$coefficients["(Intercept)"]
  }
  if (!is.na(fit$coefficients["mydata$Acitivty.State.0..min."]))
  {
    sleepPrediction = sleepPrediction + (fit$coefficients["mydata$Acitivty.State.0..min."] * myValidateData$Acitivty.State.0..min.[k])
  }
  
  if (!is.na(fit$coefficients["mydata$Activity.State.1..min."]))
  {
    sleepPrediction = sleepPrediction + (fit$coefficients["mydata$Activity.State.1..min."] * myValidateData$Activity.State.1..min.[k])
  }
  
  if (!is.na(fit$coefficients["mydata$Activity.State.2..min."]))
  {
    sleepPrediction = sleepPrediction + (fit$coefficients["mydata$Activity.State.2..min."] * myValidateData$Activity.State.2..min.[k])
  }
  
  if (!is.na(fit$coefficients["mydata$Activity.State.3..min."]))
  {
    sleepPrediction = sleepPrediction + (fit$coefficients["mydata$Activity.State.3..min."] * myValidateData$Activity.State.3..min.[k])
  }
  
  if (!is.na(fit$coefficients["mydata$Calories.Burned.State.0"]))
  {
    sleepPrediction = sleepPrediction + (fit$coefficients["mydata$Calories.Burned.State.0"] * myValidateData$Calories.Burned.State.0[k])
  }
  if (!is.na(fit$coefficients["mydata$Calories.Burned.State.1"]))
  {
    sleepPrediction = sleepPrediction + (fit$coefficients["mydata$Calories.Burned.State.1"] * myValidateData$Calories.Burned.State.1[k])
  }
  if (!is.na(fit$coefficients["mydata$Calories.Burned.State.2"]))
  {
    sleepPrediction = sleepPrediction + (fit$coefficients["mydata$Calories.Burned.State.2"] * myValidateData$Calories.Burned.State.2[k])
  }
  if (!is.na(fit$coefficients["mydata$Calories.Burned.State.3"]))
  {
    sleepPrediction = sleepPrediction + (fit$coefficients["mydata$Calories.Burned.State.3"] * myValidateData$Calories.Burned.State.3[k])
  }
  
  if (!is.na(fit$coefficients["mydata$Screen.Usage..min."]))
  {
    sleepPrediction = sleepPrediction + (fit$coefficients["mydata$Screen.Usage..min."] * myValidateData$Screen.Usage..min.[k])
  }
  
  if (!is.na(fit$coefficients["mydata$Nap.Data..hrs."]))
  {
    sleepPrediction = sleepPrediction + (fit$coefficients["mydata$Nap.Data..hrs."] * myValidateData$Nap.Data..hrs.[k])
  }
  if (!is.na(fit$coefficients["mydata$isSaturday"]))
  {
    sleepPrediction = sleepPrediction + (fit$coefficients["mydata$isSaturday"] * myValidateData$isSaturday[k])
  }
  if (!is.na(fit$coefficients["mydata$isFriday"]))
  {
    sleepPrediction = sleepPrediction + (fit$coefficients["mydata$isFriday"] * myValidateData$isFriday[k])
  }
  if (!is.na(fit$coefficients["mydata$isThursday"]))
  {
    sleepPrediction = sleepPrediction + (fit$coefficients["mydata$isThursday"] * myValidateData$isThursday[k])
  }
  if (!is.na(fit$coefficients["mydata$isWednesday"]))
  {
    sleepPrediction = sleepPrediction + (fit$coefficients["mydata$isWednesday"] * myValidateData$isWednesday[k])
  }
  if (!is.na(fit$coefficients["mydata$isTuesday"]))
  {
    sleepPrediction = sleepPrediction + (fit$coefficients["mydata$isTuesday"] * myValidateData$isTuesday[k])
  }
  if (!is.na(fit$coefficients["mydata$isMonday"]))
  {
    sleepPrediction = sleepPrediction + (fit$coefficients["mydata$isMonday"] * myValidateData$isMonday[k])
  }
  if (!is.na(fit$coefficients["mydata$isWeekend"]))
  {
    sleepPrediction = sleepPrediction + (fit$coefficients["mydata$isWeekend"] * myValidateData$isWeekend[k])
  }
  if (!is.na(fit$coefficients["mydata$isRegular"]))
  {
    sleepPrediction = sleepPrediction + (fit$coefficients["mydata$isRegular"] * myValidateData$isRegular[k])
  }
  if (!is.na(fit$coefficients["mydata$isBreak"]))
  {
    sleepPrediction = sleepPrediction + (fit$coefficients["mydata$isBreak"] * myValidateData$isBreak[k])
  }
  if (!is.na(fit$coefficients["mydata$isReadingDay"]))
  {
    sleepPrediction = sleepPrediction + (fit$coefficients["mydata$isReadingDay"] * myValidateData$isReadingDay[k])
  }
  if (!is.na(fit$coefficients["mydata$Mean.Temperature"]))
  {
    sleepPrediction = sleepPrediction + (fit$coefficients["mydata$Mean.Temperature"] * myValidateData$Mean.Temperature[k])
  }
  if (!is.na(fit$coefficients["mydata$Median.Temperature"]))
  {
    sleepPrediction = sleepPrediction + (fit$coefficients["mydata$Median.Temperature"] * myValidateData$Median.Temperature[k])
  }
  if (!is.na(fit$coefficients["mydata$Daily.Audio.Usage..min."]))
  {
    sleepPrediction = sleepPrediction + (fit$coefficients["mydata$Daily.Audio.Usage..min."] * myValidateData$Daily.Audio.Usage..min.[k])
  }
  if (!is.na(fit$coefficients["mydata$Audio.Usage.30.min.before.Sleep..min."]))
  {
    sleepPrediction = sleepPrediction + (fit$coefficients["mydata$Audio.Usage.30.min.before.Sleep..min."] * myValidateData$Audio.Usage.30.min.before.Sleep..min.[k])
  }
  if (!is.na(fit$coefficients["mydata$Screen.Usage.30.min.before.Sleep..min."]))
  {
    sleepPrediction = sleepPrediction + (fit$coefficients["mydata$Sreen.Usage.30.min.before.Sleep..min."] * myValidateData$Screen.Usage.30.min.before.Sleep..min.[k])
  }
  if (!is.na(fit$coefficients["mydata$Audio.and.Screen.30.Min.Before.Sleep.Interaction"]))
  {
    sleepPrediction = sleepPrediction + (fit$coefficients["mydata$Audio.and.Screen.30.Min.Before.Sleep.Interaction"] * myValidateData$Audio.and.Screen.30.Min.Before.Sleep.Interaction[k])
  }
  if (!is.na(fit$coefficients["mydata$Previous.Night.Sleep.Duration..hrs."]))
  {
    sleepPrediction = sleepPrediction + (fit$coefficients["mydata$Previous.Night.Sleep.Duration..hrs."] * myValidateData$Previous.Night.Sleep.Duration..hrs.[k])
  }
  if (!is.na(fit$coefficients["mydata$Min.to.Fall.Asleep"]))
  {
    sleepPrediction = sleepPrediction + (fit$coefficients["mydata$Min.to.Fall.Asleep"] * myValidateData$Min.to.Fall.Asleep[k])
  }
  if (!is.na(fit$coefficients["mydata$Audio.Usage.in.Bed..min."]))
  {
    sleepPrediction = sleepPrediction + (fit$coefficients["mydata$Audio.Usage.in.Bed..min."] * myValidateData$Audio.Usage.in.Bed..min.[k])
  }
  if (!is.na(fit$coefficients["mydata$Screen.Usage.in.Bed..min."]))
  {
    sleepPrediction = sleepPrediction + (fit$coefficients["mydata$Screen.Usage.in.Bed..min."] * myValidateData$Screen.Usage.in.Bed..min.[k])
  }
  
  
  
  
  # sleepPrediction = (fit$coefficients["(Intercept)"] +
  #                      (fit$coefficients["mydata$Acitivty.State.0..min."] * myValidateData$Acitivty.State.0..min.[k]) +
  #                      (fit$coefficients["mydata$Activity.State.1..min."] * myValidateData$Activity.State.1..min.[k] ) +
  #                      (fit$coefficients["mydata$Activity.State.2..min."] * myValidateData$Activity.State.2..min.[k] ) +
  #                      (fit$coefficients["mydata$Activity.State.3..min."] * myValidateData$Activity.State.3..min.[k] ) +
  #                      (fit$coefficients["mydata$Calories.Burned.State.0"] * myValidateData$Calories.Burned.State.0[k] ) +
  #                      (fit$coefficients["mydata$Calories.Burned.State.1"] * myValidateData$Calories.Burned.State.1[k] ) +
  #                      (fit$coefficients["mydata$Calories.Burned.State.2"] * myValidateData$Calories.Burned.State.2[k] ) +
  #                      (fit$coefficients["mydata$Calories.Burned.State.3"] * myValidateData$Calories.Burned.State.3[k] ) +
  #                      (fit$coefficients["mydata$Screen.Usage..min."] * myValidateData$Screen.Usage..min.[k] ) +
  #                      (fit$coefficients["mydata$Nap.Data..hrs."] * myValidateData$Nap.Data..hrs.[k] ) +
  #                      (fit$coefficients["mydata$isSaturday"] * myValidateData$isSaturday[k] ) +
  #                      (fit$coefficients["mydata$isFriday"] * myValidateData$isFriday[k] ) +
  #                      (fit$coefficients["mydata$isThursday"] * myValidateData$isThursday[k] ) +
  #                      (fit$coefficients["mydata$isWednesday"] * myValidateData$isWednesday[k] ) +
  #                      (fit$coefficients["mydata$isTuesday"] * myValidateData$isTuesday[k] ) +
  #                      (fit$coefficients["mydata$isMonday"] * myValidateData$isMonday[k] ) +
  #                      #(fit$b["mydata$isWeekend"] * myValidateData$isWeekend[k] ) +
  #                      (fit$coefficients["mydata$isRegular"] * myValidateData$isRegular[k] ) +
  #                      (fit$coefficients["mydata$isBreak"] * myValidateData$isBreak[k] ) +
  #                      (fit$coefficients["mydata$isReadingDay"] * myValidateData$isReadingDay[k] ) +
  #                      (fit$coefficients["mydata$Mean.Temperature"] * myValidateData$Mean.Temperature[k] ) +
  #                      (fit$coefficients["mydata$Median.Temperature"] * myValidateData$Median.Temperature[k] ) +
  #                      (fit$coefficients["mydata$Daily.Audio.Usage..min."] * myValidateData$Daily.Audio.Usage..min.[k] ) +
  #                      (fit$coefficients["mydata$Audio.Usage.30.min.before.Sleep..min."] * myValidateData$Audio.Usage.30.min.before.Sleep..min.[k] ) +
  #                      (fit$coefficients["mydata$Screen.Usage.30.Min.Before.Sleep..min."] * myValidateData$Screen.Usage.30.Min.Before.Sleep..min.[k] ) +
  #                      (fit$coefficients["mydata$Audio.and.Screen.30.Min.Before.Sleep.Interaction"] * myValidateData$Audio.and.Screen.30.Min.Before.Sleep.Interaction[k] ) +
  #                      (fit$coefficients["mydata$Previous.Night.Sleep.Duration..hrs."] * myValidateData$Previous.Night.Sleep.Duration..hrs.[k] )
  #                      #(fit$b["mydata$Min.to.Fall.Asleep"] * myValidateData$Min.to.Fall.Asleep[k]) +
  #                      #(fit$b["mydata$Audio.Usage.in.Bed..min."] * myValidateData$Audio.Usage.in.Bed..min.[k]) +
  #                      #(fit$b["mydata$Screen.Usage.in.Bed..min."] * myValidateData$Screen.Usage.in.Bed..min.[k])
  # )
  predictedValueArray <- c(predictedValueArray, sleepPrediction)
  # print(" ")
  # print("Number: ")
  # print(k)
  # print("Predicted Sleep:")
  # print(sleepPrediction)
  # print("Actual Sleep:")
  # print(myValidateData$Sleep.Duration..hrs.[k])
  predictedValue = predictedValue + sleepPrediction
}
predictedValue = predictedValue / length(myValidateData$Row.)
print("Predicted Value of Validate Data:")
print(predictedValue)

print("Expected Value of Validate Data:")
print(mean(myValidateData$Sleep.Duration..hrs.))


print("Pearson Coefficient")
print(cor(predictedValueArray, myValidateData$Sleep.Duration..hrs., method = "pearson"))
print("Spearman Coefficient")
print(cor(predictedValueArray, myValidateData$Sleep.Duration..hrs., method = "spearman"))

plot(predictedValueArray, myValidateData$Sleep.Duration..hrs., xlab = "Predicted Hours of Sleep", ylab = "Actual Hours of Sleep",  xlim=c(0, 14), ylim=c(0, 14))

filename3 = paste(c("Predicted_GLM_AllStudents_", i), collapse = "")
filename3 = paste(filename3, ".csv", sep = "")
write.csv(predictedValueArray, file = filename3)

filename4 = paste(c("Actual_GLM_AllStudents_", i), collapse = "")
filename4 = paste(filename4, ".csv", sep = "")
write.csv(myValidateData$Sleep.Duration..hrs., file = filename4)

