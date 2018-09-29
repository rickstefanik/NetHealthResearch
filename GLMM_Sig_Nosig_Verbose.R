library(glmmADMB)  


i = 7

filename = paste(c("Processed_Train_", i), collapse = "")
filename = paste(filename, ".csv", sep = "")
mydata = read.csv(filename)
pid_f = as.factor(mydata$PID)
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
                (1 | pid_f), 
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
# print("Predicted Value of Validate Data:")
# print(predictedValue)
# 
# print("Expected Value of Validate Data:")
# print(mean(myValidateData$Sleep.Duration..hrs.))
# 
# 
# print("Pearson Coefficient")
# print(cor(predictedValueArray, myValidateData$Sleep.Duration..hrs., method = "pearson"))
# print("Spearman Coefficient")
# print(cor(predictedValueArray, myValidateData$Sleep.Duration..hrs., method = "spearman"))

plot(predictedValueArray, myValidateData$Sleep.Duration..hrs., xlab = "Predicted Hours of Sleep", ylab = "Actual Hours of Sleep",  xlim=c(0, 14), ylim=c(0, 14))


filename3 = "Predicted_GLMM_AllStudents"
filename3 = paste(filename3, ".csv", sep = "")
write.csv(predictedValueArray, file = filename3)

filename4 = "Actual_GLMM_AllStudents_"
filename4 = paste(filename4, ".csv", sep = "")
write.csv(myValidateData$Sleep.Duration..hrs., file = filename4)


filename8 = "GLMM_Grouping_Info"
filename8 = paste(filename8, ".txt", sep = "")
print(AIC(fit))
print(BIC(fit))
print(fit$formula[3])

write(paste(c("AIC:", AIC(fit)), collapse = " "), file = filename8, append = FALSE)
write(paste(c("BIC:", BIC(fit)), collapse = " "), file = filename8, append = TRUE)
write(paste(c("Formula:", fit$formula[3]), collapse = " "), file = filename8, append = TRUE)





####### Now run for only significant factors
i = 7

filename100 = paste(c("Processed_Train_", i), collapse = "")
filename100 = paste(filename100, ".csv", sep = "")
mydata2 = read.csv(filename100)
pid_f2 = as.factor(mydata2$PID)
fit2 <- glmmadmb(Sleep.Duration..hrs. ~ 
                  #    Acitivty.State.0..min. +
                  Activity.State.1..min. + 
                  Activity.State.2..min. +
                  #    Activity.State.3..min. + 
                  #    Calories.Burned.State.0 +
                  Calories.Burned.State.1 + 
                  #    Calories.Burned.State.2 +
                  #    Calories.Burned.State.3 +
                  Screen.Usage..min. + 
                  Nap.Data..hrs. +
                  isSaturday + 
                  isFriday + 
                  #isThursday +
                  isWednesday +
                  isTuesday + 
                  isMonday +
                  #isWeekend +
                  isBreak + 
                  # isRegular + 
                  #  isReadingDay + 
                  #  Mean.Temperature +
                  #  Median.Temperature +
                  Daily.Audio.Usage..min. +
                  Audio.Usage.30.min.before.Sleep..min. + 
                  #  Screen.Usage.30.Min.Before.Sleep..min. +
                  #  Audio.and.Screen.30.Min.Before.Sleep.Interaction +
                  # Previous.Night.Sleep.Duration..hrs. + 
                  # Min.to.Fall.Asleep +
                  #  Audio.Usage.in.Bed..min. +
                  #  Screen.Usage.in.Bed..min. + 
                  (1 | pid_f2), 
                family = 'gaussian', data = mydata2)
summary(fit2)

filename12 = paste(c("Processed_Validate_", i), collapse = "")
filename12 = paste(filename12, ".csv", sep = "")

myValidateData = read.csv(filename12)
predictedValue = 0
predictedValueArray2 = vector()
for (k in 1:length(myValidateData$Row.))
{
  sleepPrediction = 0
  if (!is.na(fit2$b["(Intercept)"]))
  {
    sleepPrediction = sleepPrediction + fit2$b["(Intercept)"]
  }
  if (!is.na(fit2$b["Acitivty.State.0..min."]))
  {
    sleepPrediction = sleepPrediction + (fit2$b["Acitivty.State.0..min."] * myValidateData$Acitivty.State.0..min.[k])
  }
  
  if (!is.na(fit2$b["Activity.State.1..min."]))
  {
    sleepPrediction = sleepPrediction + (fit2$b["Activity.State.1..min."] * myValidateData$Activity.State.1..min.[k])
  }
  
  if (!is.na(fit2$b["Activity.State.2..min."]))
  {
    sleepPrediction = sleepPrediction + (fit2$b["Activity.State.2..min."] * myValidateData$Activity.State.2..min.[k])
  }
  
  if (!is.na(fit2$b["Activity.State.3..min."]))
  {
    sleepPrediction = sleepPrediction + (fit2$b["Activity.State.3..min."] * myValidateData$Activity.State.3..min.[k])
  }
  
  if (!is.na(fit2$b["Calories.Burned.State.0"]))
  {
    sleepPrediction = sleepPrediction + (fit2$b["Calories.Burned.State.0"] * myValidateData$Calories.Burned.State.0[k])
  }
  if (!is.na(fit2$b["Calories.Burned.State.1"]))
  {
    sleepPrediction = sleepPrediction + (fit2$b["Calories.Burned.State.1"] * myValidateData$Calories.Burned.State.1[k])
  }
  if (!is.na(fit2$b["Calories.Burned.State.2"]))
  {
    sleepPrediction = sleepPrediction + (fit2$b["Calories.Burned.State.2"] * myValidateData$Calories.Burned.State.2[k])
  }
  if (!is.na(fit2$b["Calories.Burned.State.3"]))
  {
    sleepPrediction = sleepPrediction + (fit2$b["Calories.Burned.State.3"] * myValidateData$Calories.Burned.State.3[k])
  }
  
  if (!is.na(fit2$b["Screen.Usage..min."]))
  {
    sleepPrediction = sleepPrediction + (fit2$b["Screen.Usage..min."] * myValidateData$Screen.Usage..min.[k])
  }
  
  if (!is.na(fit2$b["Nap.Data..hrs."]))
  {
    sleepPrediction = sleepPrediction + (fit2$b["Nap.Data..hrs."] * myValidateData$Nap.Data..hrs.[k])
  }
  if (!is.na(fit2$b["isSaturday"]))
  {
    sleepPrediction = sleepPrediction + (fit2$b["isSaturday"] * myValidateData$isSaturday[k])
  }
  if (!is.na(fit2$b["isFriday"]))
  {
    sleepPrediction = sleepPrediction + (fit2$b["isFriday"] * myValidateData$isFriday[k])
  }
  if (!is.na(fit2$b["isThursday"]))
  {
    sleepPrediction = sleepPrediction + (fit2$b["isThursday"] * myValidateData$isThursday[k])
  }
  if (!is.na(fit2$b["isWednesday"]))
  {
    sleepPrediction = sleepPrediction + (fit2$b["isWednesday"] * myValidateData$isWednesday[k])
  }
  if (!is.na(fit2$b["isTuesday"]))
  {
    sleepPrediction = sleepPrediction + (fit2$b["isTuesday"] * myValidateData$isTuesday[k])
  }
  if (!is.na(fit2$b["isMonday"]))
  {
    sleepPrediction = sleepPrediction + (fit2$b["isMonday"] * myValidateData$isMonday[k])
  }
  if (!is.na(fit2$b["isWeekend"]))
  {
    sleepPrediction = sleepPrediction + (fit2$b["isWeekend"] * myValidateData$isWeekend[k])
  }
  if (!is.na(fit2$b["isRegular"]))
  {
    sleepPrediction = sleepPrediction + (fit2$b["isRegular"] * myValidateData$isRegular[k])
  }
  if (!is.na(fit2$b["isBreak"]))
  {
    sleepPrediction = sleepPrediction + (fit2$b["isBreak"] * myValidateData$isBreak[k])
  }
  if (!is.na(fit2$b["isReadingDay"]))
  {
    sleepPrediction = sleepPrediction + (fit2$b["isReadingDay"] * myValidateData$isReadingDay[k])
  }
  if (!is.na(fit2$b["Mean.Temperature"]))
  {
    sleepPrediction = sleepPrediction + (fit2$b["Mean.Temperature"] * myValidateData$Mean.Temperature[k])
  }
  if (!is.na(fit2$b["Median.Temperature"]))
  {
    sleepPrediction = sleepPrediction + (fit2$b["Median.Temperature"] * myValidateData$Median.Temperature[k])
  }
  if (!is.na(fit2$b["Daily.Audio.Usage..min."]))
  {
    sleepPrediction = sleepPrediction + (fit2$b["Daily.Audio.Usage..min."] * myValidateData$Daily.Audio.Usage..min.[k])
  }
  if (!is.na(fit2$b["Audio.Usage.30.min.before.Sleep..min."]))
  {
    sleepPrediction = sleepPrediction + (fit2$b["Audio.Usage.30.min.before.Sleep..min."] * myValidateData$Audio.Usage.30.min.before.Sleep..min.[k])
  }
  if (!is.na(fit2$b["Screen.Usage.30.min.before.Sleep..min."]))
  {
    sleepPrediction = sleepPrediction + (fit2$b["Sreen.Usage.30.min.before.Sleep..min."] * myValidateData$Screen.Usage.30.min.before.Sleep..min.[k])
  }
  if (!is.na(fit2$b["Audio.and.Screen.30.Min.Before.Sleep.Interaction"]))
  {
    sleepPrediction = sleepPrediction + (fit2$b["Audio.and.Screen.30.Min.Before.Sleep.Interaction"] * myValidateData$Audio.and.Screen.30.Min.Before.Sleep.Interaction[k])
  }
  if (!is.na(fit2$b["Previous.Night.Sleep.Duration..hrs."]))
  {
    sleepPrediction = sleepPrediction + (fit2$b["Previous.Night.Sleep.Duration..hrs."] * myValidateData$Previous.Night.Sleep.Duration..hrs.[k])
  }
  if (!is.na(fit2$b["Min.to.Fall.Asleep"]))
  {
    sleepPrediction = sleepPrediction + (fit2$b["Min.to.Fall.Asleep"] * myValidateData$Min.to.Fall.Asleep[k])
  }
  if (!is.na(fit2$b["Audio.Usage.in.Bed..min."]))
  {
    sleepPrediction = sleepPrediction + (fit2$b["Audio.Usage.in.Bed..min."] * myValidateData$Audio.Usage.in.Bed..min.[k])
  }
  if (!is.na(fit2$b["Screen.Usage.in.Bed..min."]))
  {
    sleepPrediction = sleepPrediction + (fit2$b["Screen.Usage.in.Bed..min."] * myValidateData$Screen.Usage.in.Bed..min.[k])
  }
  
  
  predictedValueArray2 <- c(predictedValueArray2, sleepPrediction)
  # print(" ")
  # print("Number: ")
  # print(k)
  # print("Predicted Sleep:")
  #print(sleepPrediction)
  # print("Actual Sleep:")
  # print(myValidateData$Sleep.Duration..hrs.[k])
  predictedValue = predictedValue + sleepPrediction
}
predictedValue = predictedValue / length(myValidateData$Row.)
# print("Predicted Value of Validate Data:")
# print(predictedValue)
# 
# print("Expected Value of Validate Data:")
# print(mean(myValidateData$Sleep.Duration..hrs.))
# 
# 
# print("Pearson Coefficient")
# print(cor(predictedValueArray, myValidateData$Sleep.Duration..hrs., method = "pearson"))
# print("Spearman Coefficient")
# print(cor(predictedValueArray, myValidateData$Sleep.Duration..hrs., method = "spearman"))

plot(predictedValueArray2, myValidateData$Sleep.Duration..hrs., xlab = "Predicted Hours of Sleep", ylab = "Actual Hours of Sleep",  xlim=c(0, 14), ylim=c(0, 14))


filename13 = "Predicted_GLMM_AllStudents_OnlySig"
filename13 = paste(filename13, ".csv", sep = "")
write.csv(predictedValueArray2, file = filename13)

filename14 = "Actual_GLMM_AllStudents_OnlySig"
filename14 = paste(filename14, ".csv", sep = "")
write.csv(myValidateData$Sleep.Duration..hrs., file = filename14)


print(AIC(fit2))
print(BIC(fit2))


filename17 = "GLMM_Grouping_OnlySig_Info"
filename17 = paste(filename17, ".txt", sep = "")
print(AIC(fit2))
print(BIC(fit2))
print(fit2$formula[3])

write(paste(c("AIC:", AIC(fit2)), collapse = " "), file = filename17, append = FALSE)
write(paste(c("BIC:", BIC(fit2)), collapse = " "), file = filename17, append = TRUE)
write(paste(c("Formula:", fit2$formula[3]), collapse = " "), file = filename17, append = TRUE)

######


chi_test2 <- anova(fit,fit2,test="Chisq")

filename19 = "GLMM_Grouping_Chisq"
filename19 = paste(filename19, ".txt", sep = "")
capture.output(chi_test2, file = filename19)




