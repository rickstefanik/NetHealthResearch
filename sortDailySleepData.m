function [sleepYear, sleepMonth, sleepDay, sleepDailyDuration, sleepNapDuration, sleepTimeStart, sleepMinToFallAsleep, sleepRestlessDuration] = sortDailySleepData(N)    

sleepYear = N{1, 1}(:,1);
sleepMonth = N{1, 2}(:,1);
sleepDay = N{1, 3}(:,1);
sleepDailyDuration = N{1, 4}(:,1);
sleepNapDuration = N{1, 5}(:,1);
sleepTimeStart = N{1, 6}(:,1);
sleepMinToFallAsleep = N{1, 7}(:,1);
sleepRestlessDuration = N{1, 8}(:,1);