%Aggregate the data from all different files and store in DataMetaFile.
clear;

newFileName = 'DataMetaFile.csv';
fileID = fopen(newFileName,'w');
printMetaHeader(fileID);

F = 30;
for studentNum = 1:F
    disp(num2str(studentNum));
    [M, flag] = readDailyAudioFile(studentNum);
    if (flag == 0)
        disp(['File could not be found for student ', num2str(studentNum)]);
        continue;
    end
    [audioYearData, audioMonthData, audioDayData, audioDailyDuration] = sortDailyAudioData(M);
    audioDateStamp{1, length(audioYearData)} = [];
    for i = 1:length(audioYearData)
        audioDateStamp{i} = [audioYearData{i}, '-', audioMonthData{i}, '-', audioDayData{i}];
    end
    
    [M, flag] = readAudioFile(studentNum);
    if (flag == 0)
        disp(['File could not be found for student ', num2str(studentNum)]);
        continue;
    end
    [audioTimeData, audioUnlockData] = sortAudioData(M);
    
    [N, flag] = readDetailedScreenSessionsFile(studentNum);
    if (flag == 0)
        disp(['File could not be found for student ', num2str(studentNum)]);
        continue;
    end
    [screenYear, screenMonth, screenDay, screenSessionNumbers, screenStartTimestamp, screenEndTimestamp, screenDuration, screenDayDurationOutlier, screenDayAverageOutlier, screenSessionOutlier] = sortDetailedScreenSessionData(N);
    
    [N, flag] = readDailyActivityFile(studentNum);
    if (flag == 0)
        disp(['File could not be found for student ', num2str(studentNum)]);
        continue;
    end
    [activityYearData, activityMonthData, activityDayData, activityDailyState0Data, activityDailyState1Data, activityDailyState2Data, activityDailyState3Data, activityDailyCalories] = sortDailyActivityData(N);
    
    activityDateStamp{1, length(activityYearData)} = [];
    for i = 1:length(activityYearData)
        activityDateStamp{i} = [activityYearData{i}, '-', activityMonthData{i}, '-', activityDayData{i}];
    end
    
    [N, flag] = readPhoneEngagementFile(studentNum);
    if (flag == 0)
        disp(['File could not be found for student ', num2str(studentNum)]);
        continue;
    end
    [phoneYearData, phoneMonthData, phoneDayData, sessionCountData, durationData, normalizedDurationData, percentDurationData] = sortPhoneEngagementData(N);
    
    durationDataNoZeros = removeZeros(durationData);
    
    phoneDateStamp{1, length(phoneYearData)} = [];
    for i = 1:length(phoneYearData)
        phoneDateStamp{i} = [phoneYearData{i}, '-', phoneMonthData{i}, '-', phoneDayData{i}];
    end
    
    [N, flag] = readDailySleepNoEmptyFile(studentNum);
    if (flag == 0)
        disp(['File could not be found for student ', num2str(studentNum)]);
        continue;
    end
    [sleepYear, sleepMonth, sleepDay, sleepDailyDuration, sleepNapDuration, sleepTimeStart, sleepMinToFallAsleep, sleepRestlessDuration] = sortDailySleepNoEmptyData(N);
    
    sleepDateStamp{1, length(sleepYear)} = [];
    for i = 1:length(sleepYear)
        sleepDateStamp{i} = [sleepYear{i}, '-', sleepMonth{i}, '-', sleepDay{i}];
    end
    
    [M, flag] = readDailyWeatherFile();
    if (flag == 0)
        disp(['File could not be found for student ', num2str(studentNum)]);
        continue;
    end
    [weatherYearData, weatherMonthData, weatherDayData, weatherMeanData, weatherMedianData] = sortDailyWeatherData(M);
    
    weatherDateStamp{1, length(weatherYearData)} = [];
    for i = 1:length(weatherYearData)
        weatherDateStamp{i} = [weatherYearData{i}, '-', weatherMonthData{i}, '-', weatherDayData{i}];
    end
    count = 1;
    for i = 1:length(sleepDateStamp)
        dateStamp = sleepDateStamp{i};
        dateData = strsplit(sleepDateStamp{i}, '-');
        year = dateData{1};
        month = dateData{2};
        day = dateData{3};
        dayOfWeek = getDayOfWeek(year, month, day);
        partOfWeek = getPartOfWeek(year, month, day);
        dayType = getDayType(year, month, day);
        
        
        
        prevDate = getPreviousDate(year, month, day);
        previousNightSleep = 0;
        previousNightSleepDataAvailable = 0;
        minAudio30MinBeforeSleep = 0;
        minScreen30MinBeforeSleep = 0;
        minAudioInBed = 0;
        minScreenInBed = 0;
        
        prevNightSleepArray = find(ismember(sleepDateStamp, prevDate));
        if (length(prevNightSleepArray) ~= 0)
            previousNightSleep = sleepDailyDuration(prevNightSleepArray(1));
            previousNightSleepDataAvailable = 1;
        end
        
        if (previousNightSleepDataAvailable == 1)
            
            
            timeOfSleepStart = sleepTimeStart(i);
            time30MinBefore = timeOfSleepStart - (30 * 60 * 1000);
            timeOfActualSleepStart = timeOfSleepStart + (sleepMinToFallAsleep(i) * 60 * 1000);
            
            if (length(month) == 1)
                month = ['0', month];
            end
            
            morningTimestamp = convert_time_timestamp([month, '/', day, '/', year, ' 08:30:00']);
            [specificActivityState0, specificActivityState1, specificActivityState2, specificActivityState3, specificCaloriesBurned0, specificCaloriesBurned1, specificCaloriesBurned2, specificCaloriesBurned3, specificStepsTaken] = getActivitySpecific(morningTimestamp, timeOfSleepStart, studentNum);
            
            audioPreSleepIndexes = find((audioTimeData >= time30MinBefore) & (audioTimeData <= timeOfSleepStart));
            screenPreSleepIndexes = find((screenStartTimestamp >= time30MinBefore) & (screenStartTimestamp <= timeOfSleepStart));
            
            if (length(audioPreSleepIndexes) ~= 0)
                audioPreSleepUnlock = audioUnlockData(audioPreSleepIndexes(1):audioPreSleepIndexes(length(audioPreSleepIndexes)));
                minAudio30MinBeforeSleep = length(find(audioPreSleepUnlock == 1));
            end
            
            if (length(screenPreSleepIndexes) ~= 0)
                for j=screenPreSleepIndexes(1):screenPreSleepIndexes(length(screenPreSleepIndexes))
                    minScreen30MinBeforeSleep = minScreen30MinBeforeSleep + screenDuration(j);
                end
            end
            
            
            if (timeOfSleepStart ~= timeOfActualSleepStart)
                audioInBedIndexes = find((audioTimeData >= timeOfSleepStart) & (audioTimeData <= timeOfActualSleepStart));
                screenInBedIndexes = find((screenStartTimestamp >= timeOfSleepStart) & (screenStartTimestamp <= timeOfActualSleepStart));
                
                if (length(audioInBedIndexes) ~= 0)
                    audioInBedUnlock = audioUnlockData(audioInBedIndexes(1):audioInBedIndexes(length(audioInBedIndexes)));
                    minAudioInBed = length(find(audioInBedUnlock == 1));
                end
                
                if (length(screenInBedIndexes) ~= 0)
                    for j=screenInBedIndexes(1):screenInBedIndexes(length(screenInBedIndexes))
                        minScreenInBed = minScreenInBed + screenDuration(j);
                    end
                end
            end
            
            %disp([num2str(i), ': ', dateStamp, ' ', partOfWeek, ' ', dayType]);
            audioDayIndex = find(ismember(audioDateStamp, dateStamp));
            activityDayIndex = find(ismember(activityDateStamp, dateStamp));
            phoneDayIndex = find(ismember(phoneDateStamp, dateStamp));
            weatherDayIndex = find(ismember(weatherDateStamp, dateStamp));
            if ((sleepDailyDuration(i) > 0) && (sleepDailyDuration(i) <= 16))
                if (~((specificActivityState0 == 0) && (specificActivityState1 == 0) && ...
                        (specificActivityState2 == 0) && (specificActivityState3 == 0)))
                    if ((durationData(phoneDayIndex) > 0) && (isoutlierPoint(durationData(phoneDayIndex), durationDataNoZeros) == 1))
                        fprintf(fileID, [num2str(studentNum), ',', num2str(count), ',', num2str(i), ',', ...
                            num2str(sleepDailyDuration(i)), ',', num2str(sleepRestlessDuration(i)), ',', ...
                            num2str(specificActivityState0), ...
                            ',', num2str(specificActivityState1), ',', num2str(specificActivityState2), ...
                            ',', num2str(specificActivityState3), ',' num2str(specificCaloriesBurned0), ',', ...
                            num2str(specificCaloriesBurned1), ',', ...
                            num2str(specificCaloriesBurned2), ',', ...
                            num2str(specificCaloriesBurned3), ',', ...
                            num2str(durationData(phoneDayIndex)), ',', num2str(sleepNapDuration(i)), ',', dayOfWeek, ',', ...
                            partOfWeek, ',', dayType, ',', num2str(weatherMeanData(weatherDayIndex)), ',', ...
                            num2str(weatherMedianData(weatherDayIndex)), ',', num2str(audioDailyDuration(audioDayIndex)), ...
                            ',', num2str(minAudio30MinBeforeSleep), ',', num2str(minScreen30MinBeforeSleep), ...
                            ',', num2str(minAudio30MinBeforeSleep * minScreen30MinBeforeSleep), ...
                            ',', num2str(previousNightSleep), ...
                            ',', num2str(sleepMinToFallAsleep(i)), ...
                            ',', num2str(minAudioInBed), ...
                            ',', num2str(minScreenInBed), newline]);
                        count = count + 1;
                    end
                end
            end
        end
    end
    clearvars -except F fileID
end