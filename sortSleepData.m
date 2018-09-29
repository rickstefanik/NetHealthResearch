function [sleepStartDate, sleepEndData, sleepStartTime, dt_sleep, isMainSleep, timeInBed, numAwakeTimes, minsAwake, restlessCount, restlessDuration, minutesAfterWakeup, minToFallAsleep] = sortSleepData(N)    

sleepStartDate = N{1, 1}(:,1);
sleepEndData = N{1, 2}(:,1);
sleepStartTime = N{1, 3}(:,1);
dt_sleep = N{1, 7}(:,1);
isMainSleep = N{1, 15}(:,1);
timeInBed = N{1, 17}(:,1);
numAwakeTimes = N{1, 20}(:,1);
minsAwake = N{1, 21}(:,1);
restlessCount = N{1,22}(:,1);
restlessDuration = N{1, 23}(:,1);
minutesAfterWakeup = N{1, 19}(:,1);
minToFallAsleep = N{1, 16}(:,1);
