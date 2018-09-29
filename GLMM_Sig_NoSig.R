library(glmmADMB)  
i = 7

filename = paste(c("Processed_Train_", i), collapse = "")
filename = paste(filename, ".csv", sep = "")
mydata = read.csv(filename)
mydata$PID = as.factor(mydata$PID)
fit <- glmmadmb(Sleep.Duration..hrs. ~ 
                  Acitivty.State.0..min. +
                  Activity.State.1..min. + 
                  Activity.State.2..min. +
                  Activity.State.3..min. + 
                  Calories.Burned.State.0 +
                  Calories.Burned.State.1 + 
                  Calories.Burned.State.2 +
                  Calories.Burned.State.3 +
                  Screen.Usage..min. + 
                  Nap.Data..hrs. +
                  isSaturday + 
                  isFriday + 
                  isThursday +
                  isWednesday +
                  isTuesday + 
                  isMonday +
                  #isWeekend +
                  isBreak + 
                  isRegular + 
                  isReadingDay + 
                  Mean.Temperature +
                  Median.Temperature +
                  Daily.Audio.Usage..min. +
                  Audio.Usage.30.min.before.Sleep..min. + 
                  Screen.Usage.30.Min.Before.Sleep..min. +
                  Audio.and.Screen.30.Min.Before.Sleep.Interaction +
                  Previous.Night.Sleep.Duration..hrs. + 
                  Min.to.Fall.Asleep +
                  Audio.Usage.in.Bed..min. +
                  Screen.Usage.in.Bed..min.
                (1 | PID), 
                family = 'gaussian', data = mydata)
summary(fit)

filename2 = paste(c("Processed_Validate_", i), collapse = "")
filename2 = paste(filename2, ".csv", sep = "")

myValidateData = read.csv(filename2)
predictedValue = 0
predictedValueArray = vector()
for (k in 1:length(myValidateData$Row.))
{
  sleepPrediction = 0
  if (!is.na(fit$b["(Intercept)"]))
  {
    sleepPrediction = sleepPrediction + fit$b["(Intercept)"]
  }
  if (!is.na(fit$b["Acitivty.State.0..min."]))
  {
    sleepPrediction = sleepPrediction + (fit$b["Acitivty.State.0..min."] * myValidateData$Acitivty.State.0..min.[k])
  }
  
  if (!is.na(fit$b["Activity.State.1..min."]))
  {
    sleepPrediction = sleepPrediction + (fit$b["Activity.State.1..min."] * myValidateData$Activity.State.1..min.[k])
  }
  
  if (!is.na(fit$b["Activity.State.2..min."]))
  {
    sleepPrediction = sleepPrediction + (fit$b["Activity.State.2..min."] * myValidateData$Activity.State.2..min.[k])
  }
  
  if (!is.na(fit$b["Activity.State.3..min."]))
  {
    sleepPrediction = sleepPrediction + (fit$b["Activity.State.3..min."] * myValidateData$Activity.State.3..min.[k])
  }
  
  if (!is.na(fit$b["Calories.Burned.State.0"]))
  {
    sleepPrediction = sleepPrediction + (fit$b["Calories.Burned.State.0"] * myValidateData$Calories.Burned.State.0[k])
  }
  if (!is.na(fit$b["Calories.Burned.State.1"]))
  {
    sleepPrediction = sleepPrediction + (fit$b["Calories.Burned.State.1"] * myValidateData$Calories.Burned.State.1[k])
  }
  if (!is.na(fit$b["Calories.Burned.State.2"]))
  {
    sleepPrediction = sleepPrediction + (fit$b["Calories.Burned.State.2"] * myValidateData$Calories.Burned.State.2[k])
  }
  if (!is.na(fit$b["Calories.Burned.State.3"]))
  {
    sleepPrediction = sleepPrediction + (fit$b["Calories.Burned.State.3"] * myValidateData$Calories.Burned.State.3[k])
  }
  
  if (!is.na(fit$b["Screen.Usage..min."]))
  {
    sleepPrediction = sleepPrediction + (fit$b["Screen.Usage..min."] * myValidateData$Screen.Usage..min.[k])
  }
  
  if (!is.na(fit$b["Nap.Data..hrs."]))
  {
    sleepPrediction = sleepPrediction + (fit$b["Nap.Data..hrs."] * myValidateData$Nap.Data..hrs.[k])
  }
  if (!is.na(fit$b["isSaturday"]))
  {
    sleepPrediction = sleepPrediction + (fit$b["isSaturday"] * myValidateData$isSaturday[k])
  }
  if (!is.na(fit$b["isFriday"]))
  {
    sleepPrediction = sleepPrediction + (fit$b["isFriday"] * myValidateData$isFriday[k])
  }
  if (!is.na(fit$b["isThursday"]))
  {
    sleepPrediction = sleepPrediction + (fit$b["isThursday"] * myValidateData$isThursday[k])
  }
  if (!is.na(fit$b["isWednesday"]))
  {
    sleepPrediction = sleepPrediction + (fit$b["isWednesday"] * myValidateData$isWednesday[k])
  }
  if (!is.na(fit$b["isTuesday"]))
  {
    sleepPrediction = sleepPrediction + (fit$b["isTuesday"] * myValidateData$isTuesday[k])
  }
  if (!is.na(fit$b["isMonday"]))
  {
    sleepPrediction = sleepPrediction + (fit$b["isMonday"] * myValidateData$isMonday[k])
  }
  if (!is.na(fit$b["isWeekend"]))
  {
    sleepPrediction = sleepPrediction + (fit$b["isWeekend"] * myValidateData$isWeekend[k])
  }
  if (!is.na(fit$b["isRegular"]))
  {
    sleepPrediction = sleepPrediction + (fit$b["isRegular"] * myValidateData$isRegular[k])
  }
  if (!is.na(fit$b["isBreak"]))
  {
    sleepPrediction = sleepPrediction + (fit$b["isBreak"] * myValidateData$isBreak[k])
  }
  if (!is.na(fit$b["isReadingDay"]))
  {
    sleepPrediction = sleepPrediction + (fit$b["isReadingDay"] * myValidateData$isReadingDay[k])
  }
  if (!is.na(fit$b["Mean.Temperature"]))
  {
    sleepPrediction = sleepPrediction + (fit$b["Mean.Temperature"] * myValidateData$Mean.Temperature[k])
  }
  if (!is.na(fit$b["Median.Temperature"]))
  {
    sleepPrediction = sleepPrediction + (fit$b["Median.Temperature"] * myValidateData$Median.Temperature[k])
  }
  if (!is.na(fit$b["Daily.Audio.Usage..min."]))
  {
    sleepPrediction = sleepPrediction + (fit$b["Daily.Audio.Usage..min."] * myValidateData$Daily.Audio.Usage..min.[k])
  }
  if (!is.na(fit$b["Audio.Usage.30.min.before.Sleep..min."]))
  {
    sleepPrediction = sleepPrediction + (fit$b["Audio.Usage.30.min.before.Sleep..min."] * myValidateData$Audio.Usage.30.min.before.Sleep..min.[k])
  }
  if (!is.na(fit$b["Screen.Usage.30.min.before.Sleep..min."]))
  {
    sleepPrediction = sleepPrediction + (fit$b["Sreen.Usage.30.min.before.Sleep..min."] * myValidateData$Screen.Usage.30.min.before.Sleep..min.[k])
  }
  if (!is.na(fit$b["Audio.and.Screen.30.Min.Before.Sleep.Interaction"]))
  {
    sleepPrediction = sleepPrediction + (fit$b["Audio.and.Screen.30.Min.Before.Sleep.Interaction"] * myValidateData$Audio.and.Screen.30.Min.Before.Sleep.Interaction[k])
  }
  if (!is.na(fit$b["Previous.Night.Sleep.Duration..hrs."]))
  {
    sleepPrediction = sleepPrediction + (fit$b["Previous.Night.Sleep.Duration..hrs."] * myValidateData$Previous.Night.Sleep.Duration..hrs.[k])
  }
  if (!is.na(fit$b["Min.to.Fall.Asleep"]))
  {
    sleepPrediction = sleepPrediction + (fit$b["Min.to.Fall.Asleep"] * myValidateData$Min.to.Fall.Asleep[k])
  }
  if (!is.na(fit$b["Audio.Usage.in.Bed..min."]))
  {
    sleepPrediction = sleepPrediction + (fit$b["Audio.Usage.in.Bed..min."] * myValidateData$Audio.Usage.in.Bed..min.[k])
  }
  if (!is.na(fit$b["Screen.Usage.in.Bed..min."]))
  {
    sleepPrediction = sleepPrediction + (fit$b["Screen.Usage.in.Bed..min."] * myValidateData$Screen.Usage.in.Bed..min.[k])
  }

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


filename3 = paste(c("Predicted_GLMM_AllStudents_", i), collapse = "")
filename3 = paste(filename3, ".csv", sep = "")
write.csv(predictedValueArray, file = filename3)

filename4 = paste(c("Actual_GLMM_AllStudents_", i), collapse = "")
filename4 = paste(filename4, ".csv", sep = "")
write.csv(myValidateData$Sleep.Duration..hrs., file = filename4)



### Run for only significant factors
toselect.x <- summary(fit)$coeff[-1,4] < 0.1
relevant.x <- names(toselect.x)[toselect.x == TRUE] 
sig.formula <- as.formula(paste("Sleep.Duration..hrs. ~",paste(relevant.x, collapse= "+")))
sig.model <- glmmadmb(formula=sig.formula,data=mydata)
summary(sig.model)
print(sig.model$formula[3])


