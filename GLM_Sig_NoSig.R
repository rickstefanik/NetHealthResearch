i = 1

filename = paste(c("Processed_Train_Student", i), collapse = "")
filename = paste(filename, "_1.csv", sep = "")
mydata = read.csv(filename)

fit <- glm(Sleep.Duration..hrs. ~ 
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
            #
             isWeekend +
             #
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
             #
             Min.to.Fall.Asleep +
             #
             Audio.Usage.in.Bed..min. +
             #
             Screen.Usage.in.Bed..min.
           ,
           family = gaussian(), data=mydata)
summary(fit)

filename2 = paste(c("Processed_Validate_Student", i), collapse = "")
filename2 = paste(filename2, "_1.csv", sep = "")

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
  if (!is.na(fit$coefficients["Acitivty.State.0..min."]))
  {
    sleepPrediction = sleepPrediction + (fit$coefficients["Acitivty.State.0..min."] * myValidateData$Acitivty.State.0..min.[k])
  }
  
  if (!is.na(fit$coefficients["Activity.State.1..min."]))
  {
    sleepPrediction = sleepPrediction + (fit$coefficients["Activity.State.1..min."] * myValidateData$Activity.State.1..min.[k])
  }
  
  if (!is.na(fit$coefficients["Activity.State.2..min."]))
  {
    sleepPrediction = sleepPrediction + (fit$coefficients["Activity.State.2..min."] * myValidateData$Activity.State.2..min.[k])
  }
  
  if (!is.na(fit$coefficients["Activity.State.3..min."]))
  {
    sleepPrediction = sleepPrediction + (fit$coefficients["Activity.State.3..min."] * myValidateData$Activity.State.3..min.[k])
  }
  
  if (!is.na(fit$coefficients["Calories.Burned.State.0"]))
  {
    sleepPrediction = sleepPrediction + (fit$coefficients["Calories.Burned.State.0"] * myValidateData$Calories.Burned.State.0[k])
  }
  if (!is.na(fit$coefficients["Calories.Burned.State.1"]))
  {
    sleepPrediction = sleepPrediction + (fit$coefficients["Calories.Burned.State.1"] * myValidateData$Calories.Burned.State.1[k])
  }
  if (!is.na(fit$coefficients["Calories.Burned.State.2"]))
  {
    sleepPrediction = sleepPrediction + (fit$coefficients["Calories.Burned.State.2"] * myValidateData$Calories.Burned.State.2[k])
  }
  if (!is.na(fit$coefficients["Calories.Burned.State.3"]))
  {
    sleepPrediction = sleepPrediction + (fit$coefficients["Calories.Burned.State.3"] * myValidateData$Calories.Burned.State.3[k])
  }
  
  if (!is.na(fit$coefficients["Screen.Usage..min."]))
  {
    sleepPrediction = sleepPrediction + (fit$coefficients["Screen.Usage..min."] * myValidateData$Screen.Usage..min.[k])
  }
  
  if (!is.na(fit$coefficients["Nap.Data..hrs."]))
  {
    sleepPrediction = sleepPrediction + (fit$coefficients["Nap.Data..hrs."] * myValidateData$Nap.Data..hrs.[k])
  }
  if (!is.na(fit$coefficients["isSaturday"]))
  {
    sleepPrediction = sleepPrediction + (fit$coefficients["isSaturday"] * myValidateData$isSaturday[k])
  }
  if (!is.na(fit$coefficients["isFriday"]))
  {
    sleepPrediction = sleepPrediction + (fit$coefficients["isFriday"] * myValidateData$isFriday[k])
  }
  if (!is.na(fit$coefficients["isThursday"]))
  {
    sleepPrediction = sleepPrediction + (fit$coefficients["isThursday"] * myValidateData$isThursday[k])
  }
  if (!is.na(fit$coefficients["isWednesday"]))
  {
    sleepPrediction = sleepPrediction + (fit$coefficients["isWednesday"] * myValidateData$isWednesday[k])
  }
  if (!is.na(fit$coefficients["isTuesday"]))
  {
    sleepPrediction = sleepPrediction + (fit$coefficients["isTuesday"] * myValidateData$isTuesday[k])
  }
  if (!is.na(fit$coefficients["isMonday"]))
  {
    sleepPrediction = sleepPrediction + (fit$coefficients["isMonday"] * myValidateData$isMonday[k])
  }
  if (!is.na(fit$coefficients["isWeekend"]))
  {
    sleepPrediction = sleepPrediction + (fit$coefficients["isWeekend"] * myValidateData$isWeekend[k])
  }
  if (!is.na(fit$coefficients["isRegular"]))
  {
    sleepPrediction = sleepPrediction + (fit$coefficients["isRegular"] * myValidateData$isRegular[k])
  }
  if (!is.na(fit$coefficients["isBreak"]))
  {
    sleepPrediction = sleepPrediction + (fit$coefficients["isBreak"] * myValidateData$isBreak[k])
  }
  if (!is.na(fit$coefficients["isReadingDay"]))
  {
    sleepPrediction = sleepPrediction + (fit$coefficients["isReadingDay"] * myValidateData$isReadingDay[k])
  }
  if (!is.na(fit$coefficients["Mean.Temperature"]))
  {
    sleepPrediction = sleepPrediction + (fit$coefficients["Mean.Temperature"] * myValidateData$Mean.Temperature[k])
  }
  if (!is.na(fit$coefficients["Median.Temperature"]))
  {
    sleepPrediction = sleepPrediction + (fit$coefficients["Median.Temperature"] * myValidateData$Median.Temperature[k])
  }
  if (!is.na(fit$coefficients["Daily.Audio.Usage..min."]))
  {
    sleepPrediction = sleepPrediction + (fit$coefficients["Daily.Audio.Usage..min."] * myValidateData$Daily.Audio.Usage..min.[k])
  }
  if (!is.na(fit$coefficients["Audio.Usage.30.min.before.Sleep..min."]))
  {
    sleepPrediction = sleepPrediction + (fit$coefficients["Audio.Usage.30.min.before.Sleep..min."] * myValidateData$Audio.Usage.30.min.before.Sleep..min.[k])
  }
  if (!is.na(fit$coefficients["Screen.Usage.30.min.before.Sleep..min."]))
  {
    sleepPrediction = sleepPrediction + (fit$coefficients["Sreen.Usage.30.min.before.Sleep..min."] * myValidateData$Screen.Usage.30.min.before.Sleep..min.[k])
  }
  if (!is.na(fit$coefficients["Audio.and.Screen.30.Min.Before.Sleep.Interaction"]))
  {
    sleepPrediction = sleepPrediction + (fit$coefficients["Audio.and.Screen.30.Min.Before.Sleep.Interaction"] * myValidateData$Audio.and.Screen.30.Min.Before.Sleep.Interaction[k])
  }
  if (!is.na(fit$coefficients["Previous.Night.Sleep.Duration..hrs."]))
  {
    sleepPrediction = sleepPrediction + (fit$coefficients["Previous.Night.Sleep.Duration..hrs."] * myValidateData$Previous.Night.Sleep.Duration..hrs.[k])
  }
  if (!is.na(fit$coefficients["Min.to.Fall.Asleep"]))
  {
    sleepPrediction = sleepPrediction + (fit$coefficients["Min.to.Fall.Asleep"] * myValidateData$Min.to.Fall.Asleep[k])
  }
  if (!is.na(fit$coefficients["Audio.Usage.in.Bed..min."]))
  {
    sleepPrediction = sleepPrediction + (fit$coefficients["Audio.Usage.in.Bed..min."] * myValidateData$Audio.Usage.in.Bed..min.[k])
  }
  if (!is.na(fit$coefficients["Screen.Usage.in.Bed..min."]))
  {
    sleepPrediction = sleepPrediction + (fit$coefficients["Screen.Usage.in.Bed..min."] * myValidateData$Screen.Usage.in.Bed..min.[k])
  }
  
  predictedValueArray <- c(predictedValueArray, sleepPrediction)
  # print(" ")
  # print("Number: ")
  # print(k)
  # print("Predicted Sleep:")
  # print(sleepPrediction)
  # print("Actual Sleep:")
  # print(myValidateData$Sleep.Duration..hrs.[k])
  # predictedValue = predictedValue + sleepPrediction
}
predictedValue = predictedValue / length(myValidateData$Row.)
#print("Predicted Value of Validate Data:")
#print(predictedValue)

#print("Expected Value of Validate Data:")
#print(mean(myValidateData$Sleep.Duration..hrs.))


#print("Pearson Coefficient")
#print(cor(predictedValueArray, myValidateData$Sleep.Duration..hrs., method = "pearson"))
#print("Spearman Coefficient")
#print(cor(predictedValueArray, myValidateData$Sleep.Duration..hrs., method = "spearman"))

plot(predictedValueArray, myValidateData$Sleep.Duration..hrs., xlab = "Predicted Hours of Sleep", ylab = "Actual Hours of Sleep",  xlim=c(0, 14), ylim=c(0, 14))

filename3 = paste(c("Predicted_GLM_Student_", i), collapse = "")
filename3 = paste(filename3, ".csv", sep = "")
write.csv(predictedValueArray, file = filename3)

filename4 = paste(c("Actual_GLM_Student_", i), collapse = "")
filename4 = paste(filename4, ".csv", sep = "")
write.csv(myValidateData$Sleep.Duration..hrs., file = filename4)

print(AIC(fit))
print(BIC(fit))
print(fit$formula[3])



filename8 = paste(c("GLM_Student_Info_", i), collapse = "")
filename8 = paste(filename8, ".txt", sep = "")
print(AIC(fit))
print(BIC(fit))
print(fit$formula[3])

write(paste(c("AIC:", AIC(fit)), collapse = " "), file = filename8, append = FALSE)
write(paste(c("BIC:", BIC(fit)), collapse = " "), file = filename8, append = TRUE)
write(paste(c("Formula:", fit$formula[3]), collapse = " "), file = filename8, append = TRUE)















# Now Run Signicant Factors Only

toselect.x <- summary(fit)$coeff[-1,4] < 0.1
relevant.x <- names(toselect.x)[toselect.x == TRUE] 
sig.formula <- as.formula(paste("Sleep.Duration..hrs. ~",paste(relevant.x, collapse= "+")))
sig.model <- glm(formula=sig.formula,data=mydata)
summary(sig.model)
####
predictedValue = 0
predictedValueArray = vector()
for (k in 1:length(myValidateData$Row.))
{
  sleepPrediction = 0
  if (!is.na(sig.model$coefficients["(Intercept)"]))
  {
    sleepPrediction = sleepPrediction + sig.model$coefficients["(Intercept)"]
  }
  if (!is.na(sig.model$coefficients["Acitivty.State.0..min."]))
  {
    sleepPrediction = sleepPrediction + (sig.model$coefficients["Acitivty.State.0..min."] * myValidateData$Acitivty.State.0..min.[k])
  }
  
  if (!is.na(sig.model$coefficients["Activity.State.1..min."]))
  {
    sleepPrediction = sleepPrediction + (sig.model$coefficients["Activity.State.1..min."] * myValidateData$Activity.State.1..min.[k])
  }
  
  if (!is.na(sig.model$coefficients["Activity.State.2..min."]))
  {
    sleepPrediction = sleepPrediction + (sig.model$coefficients["Activity.State.2..min."] * myValidateData$Activity.State.2..min.[k])
  }
  
  if (!is.na(sig.model$coefficients["Activity.State.3..min."]))
  {
    sleepPrediction = sleepPrediction + (sig.model$coefficients["Activity.State.3..min."] * myValidateData$Activity.State.3..min.[k])
  }
  
  if (!is.na(sig.model$coefficients["Calories.Burned.State.0"]))
  {
    sleepPrediction = sleepPrediction + (sig.model$coefficients["Calories.Burned.State.0"] * myValidateData$Calories.Burned.State.0[k])
  }
  if (!is.na(sig.model$coefficients["Calories.Burned.State.1"]))
  {
    sleepPrediction = sleepPrediction + (sig.model$coefficients["Calories.Burned.State.1"] * myValidateData$Calories.Burned.State.1[k])
  }
  if (!is.na(sig.model$coefficients["Calories.Burned.State.2"]))
  {
    sleepPrediction = sleepPrediction + (sig.model$coefficients["Calories.Burned.State.2"] * myValidateData$Calories.Burned.State.2[k])
  }
  if (!is.na(sig.model$coefficients["Calories.Burned.State.3"]))
  {
    sleepPrediction = sleepPrediction + (sig.model$coefficients["Calories.Burned.State.3"] * myValidateData$Calories.Burned.State.3[k])
  }
  
  if (!is.na(sig.model$coefficients["Screen.Usage..min."]))
  {
    sleepPrediction = sleepPrediction + (sig.model$coefficients["Screen.Usage..min."] * myValidateData$Screen.Usage..min.[k])
  }
  
  if (!is.na(sig.model$coefficients["Nap.Data..hrs."]))
  {
    sleepPrediction = sleepPrediction + (sig.model$coefficients["Nap.Data..hrs."] * myValidateData$Nap.Data..hrs.[k])
  }
  if (!is.na(sig.model$coefficients["isSaturday"]))
  {
    sleepPrediction = sleepPrediction + (sig.model$coefficients["isSaturday"] * myValidateData$isSaturday[k])
  }
  if (!is.na(sig.model$coefficients["isFriday"]))
  {
    sleepPrediction = sleepPrediction + (sig.model$coefficients["isFriday"] * myValidateData$isFriday[k])
  }
  if (!is.na(sig.model$coefficients["isThursday"]))
  {
    sleepPrediction = sleepPrediction + (sig.model$coefficients["isThursday"] * myValidateData$isThursday[k])
  }
  if (!is.na(sig.model$coefficients["isWednesday"]))
  {
    sleepPrediction = sleepPrediction + (sig.model$coefficients["isWednesday"] * myValidateData$isWednesday[k])
  }
  if (!is.na(sig.model$coefficients["isTuesday"]))
  {
    sleepPrediction = sleepPrediction + (sig.model$coefficients["isTuesday"] * myValidateData$isTuesday[k])
  }
  if (!is.na(sig.model$coefficients["isMonday"]))
  {
    sleepPrediction = sleepPrediction + (sig.model$coefficients["isMonday"] * myValidateData$isMonday[k])
  }
  if (!is.na(sig.model$coefficients["isWeekend"]))
  {
    sleepPrediction = sleepPrediction + (sig.model$coefficients["isWeekend"] * myValidateData$isWeekend[k])
  }
  if (!is.na(sig.model$coefficients["isRegular"]))
  {
    sleepPrediction = sleepPrediction + (sig.model$coefficients["isRegular"] * myValidateData$isRegular[k])
  }
  if (!is.na(sig.model$coefficients["isBreak"]))
  {
    sleepPrediction = sleepPrediction + (sig.model$coefficients["isBreak"] * myValidateData$isBreak[k])
  }
  if (!is.na(sig.model$coefficients["isReadingDay"]))
  {
    sleepPrediction = sleepPrediction + (sig.model$coefficients["isReadingDay"] * myValidateData$isReadingDay[k])
  }
  if (!is.na(sig.model$coefficients["Mean.Temperature"]))
  {
    sleepPrediction = sleepPrediction + (sig.model$coefficients["Mean.Temperature"] * myValidateData$Mean.Temperature[k])
  }
  if (!is.na(sig.model$coefficients["Median.Temperature"]))
  {
    sleepPrediction = sleepPrediction + (sig.model$coefficients["Median.Temperature"] * myValidateData$Median.Temperature[k])
  }
  if (!is.na(sig.model$coefficients["Daily.Audio.Usage..min."]))
  {
    sleepPrediction = sleepPrediction + (sig.model$coefficients["Daily.Audio.Usage..min."] * myValidateData$Daily.Audio.Usage..min.[k])
  }
  if (!is.na(sig.model$coefficients["Audio.Usage.30.min.before.Sleep..min."]))
  {
    sleepPrediction = sleepPrediction + (sig.model$coefficients["Audio.Usage.30.min.before.Sleep..min."] * myValidateData$Audio.Usage.30.min.before.Sleep..min.[k])
  }
  if (!is.na(sig.model$coefficients["Screen.Usage.30.min.before.Sleep..min."]))
  {
    sleepPrediction = sleepPrediction + (sig.model$coefficients["Sreen.Usage.30.min.before.Sleep..min."] * myValidateData$Screen.Usage.30.min.before.Sleep..min.[k])
  }
  if (!is.na(sig.model$coefficients["Audio.and.Screen.30.Min.Before.Sleep.Interaction"]))
  {
    sleepPrediction = sleepPrediction + (sig.model$coefficients["Audio.and.Screen.30.Min.Before.Sleep.Interaction"] * myValidateData$Audio.and.Screen.30.Min.Before.Sleep.Interaction[k])
  }
  if (!is.na(sig.model$coefficients["Previous.Night.Sleep.Duration..hrs."]))
  {
    sleepPrediction = sleepPrediction + (sig.model$coefficients["Previous.Night.Sleep.Duration..hrs."] * myValidateData$Previous.Night.Sleep.Duration..hrs.[k])
  }
  if (!is.na(sig.model$coefficients["Min.to.Fall.Asleep"]))
  {
    sleepPrediction = sleepPrediction + (sig.model$coefficients["Min.to.Fall.Asleep"] * myValidateData$Min.to.Fall.Asleep[k])
  }
  if (!is.na(sig.model$coefficients["Audio.Usage.in.Bed..min."]))
  {
    sleepPrediction = sleepPrediction + (sig.model$coefficients["Audio.Usage.in.Bed..min."] * myValidateData$Audio.Usage.in.Bed..min.[k])
  }
  if (!is.na(sig.model$coefficients["Screen.Usage.in.Bed..min."]))
  {
    sleepPrediction = sleepPrediction + (sig.model$coefficients["Screen.Usage.in.Bed..min."] * myValidateData$Screen.Usage.in.Bed..min.[k])
  }
  
  predictedValueArray <- c(predictedValueArray, sleepPrediction)
  # print(" ")
  # print("Number: ")
  # print(k)
  # print("Predicted Sleep:")
  # print(sleepPrediction)
  # print("Actual Sleep:")
  # print(myValidateData$Sleep.Duration..hrs.[k])
  # predictedValue = predictedValue + sleepPrediction
}
predictedValue = predictedValue / length(myValidateData$Row.)
#print("Predicted Value of Validate Data:")
#print(predictedValue)

#print("Expected Value of Validate Data:")
#print(mean(myValidateData$Sleep.Duration..hrs.))


#print("Pearson Coefficient")
#print(cor(predictedValueArray, myValidateData$Sleep.Duration..hrs., method = "pearson"))
#print("Spearman Coefficient")
#print(cor(predictedValueArray, myValidateData$Sleep.Duration..hrs., method = "spearman"))


plot(predictedValueArray, myValidateData$Sleep.Duration..hrs., xlab = "Predicted Hours of Sleep", ylab = "Actual Hours of Sleep",  xlim=c(0, 14), ylim=c(0, 14))

filename5 = paste(c("Predicted_GLM_Student_OnlySig_", i), collapse = "")
filename5 = paste(filename5, ".csv", sep = "")
write.csv(predictedValueArray, file = filename5)

filename6 = paste(c("Actual_GLM_Student_OnlySig_", i), collapse = "")
filename6 = paste(filename6, ".csv", sep = "")
write.csv(myValidateData$Sleep.Duration..hrs., file = filename6)

####
filename7 = paste(c("GLM_Student_OnlySig_Info_", i), collapse = "")
filename7 = paste(filename7, ".txt", sep = "")
print(AIC(sig.model))
print(BIC(sig.model))
print(sig.model$formula[3])

write(paste(c("AIC:", AIC(sig.model)), collapse = " "), file = filename7, append = FALSE)
write(paste(c("BIC:", BIC(sig.model)), collapse = " "), file = filename7, append = TRUE)
write(paste(c("Formula:", sig.model$formula[3]), collapse = " "), file = filename7, append = TRUE)



######



chi_test <- anova(fit,sig.model,test="Chisq")

filename9 = paste(c("GLM_Student_Chisq_", i), collapse = "")
filename9 = paste(filename9, ".txt", sep = "")
capture.output(chi_test, file = filename9)

# for (i in 1:(length(fit$coefficients) - 1)){
#   a <- coef(summary(fit))[,4][i]
#   if (a <= .1)
#   {
#     print(a)
#   }
# }
# for (i in 1:(length(fit$coefficients) - 1)){
#   a <- coef(summary(fit))[,1][i]
#   if (!is.na(a))
#   {
#     print(a)
#   }
# }
# 
# for (i in 1:(length(fit$coefficients) - 1)){
#   print(myValidateData[1,][i + 4])
# }





