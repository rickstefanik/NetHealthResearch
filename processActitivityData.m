%Read in the raw NetHealth activity file aggregate into daily values
clear;
startOfDayTime = '00:00:00';
endOfDayTime = '23:59:59';
% F is number of student files being analyzed
F = 30;

for studentNum = 1:F
    disp(num2str(studentNum));
    [N, flag] = readActivityFile(studentNum);
    if (flag == 0)
        disp(['File could not be found for student ', num2str(studentNum)]);
        continue;
    end
    newFileName = ['DailyActivity_', num2str(studentNum), '.csv'];
    fileID3 = fopen(newFileName,'w');
    fprintf(fileID3, ['Year, Month, Day, State 0 (min), State 1 (min), State 2 (min), State 3 (min), Total Steps, Average Steps per Minute, Steps in State 0, Steps in State 1, Steps in State 2, Steps in State 3, Total Calories Burned, Average Calories Burned per minute, Calories burned in State 0, Calories burned in State 1, Calories burned in State 2, Calories burned in State 3',  newline]);
    
    [activityTimeData, activityStateData, activityStepData, acitivityMetabolicData, activityCalorieData, activityHeartData] = sortActivityData(N);
    
    for year = 2015:2016
        for month = 1:12
            if (((year == 2015) && (month < 8)))
                
            else
                l = eomday(year,month);
                for day = 1:l
                    d = num2str(day);
                    
                    sessionNumber = 1;
                    
                    if (day < 10)
                        d = ['0', d];
                    end
                    startDay = [num2str(month), '/', d, '/', num2str(year), ' ', startOfDayTime];
                    endDay = [num2str(month), '/', d, '/', num2str(year), ' ', endOfDayTime];
                    
                    s = convert_time_timestamp(startDay);
                    e = convert_time_timestamp(endDay);
                    
                    activityDayI = find(activityTimeData > s & activityTimeData < e);
                    if (isempty(activityDayI))
                        fprintf(fileID3, [num2str(year), ',', num2str(month), ',', d, ',',  num2str(0), ',', num2str(0), ',', num2str(0), ',', num2str(0), ',', num2str(0), ',', num2str(0), ',', num2str(0), ',', num2str(0), ',', num2str(0), ',', num2str(0), ',', num2str(0), ',', num2str(0), ',', num2str(0), ',', num2str(0), ',', num2str(0), ',', num2str(0), newline]);
                    else
                        activityStates = activityStateData((activityDayI(1)):activityDayI(length(activityDayI)));
                        
                        aS0Indexes = find(activityStates == 0);
                        aS1Indexes = find(activityStates == 1);
                        aS2Indexes = find(activityStates == 2);
                        aS3Indexes = find(activityStates == 3);
                        
                        activity0Day = length(aS0Indexes);
                        activity1Day = length(aS1Indexes);
                        activity2Day = length(aS2Indexes);
                        activity3Day = length(aS3Indexes);
                        activity0Steps = sumIndexes(aS0Indexes, activityStepData);
                        activity1Steps = sumIndexes(aS1Indexes, activityStepData);
                        activity2Steps = sumIndexes(aS2Indexes, activityStepData);
                        activity3Steps = sumIndexes(aS3Indexes, activityStepData);
                        activity0Calories = sumIndexes(aS0Indexes, activityCalorieData);
                        activity1Calories = sumIndexes(aS1Indexes, activityCalorieData);
                        activity2Calories = sumIndexes(aS2Indexes, activityCalorieData);
                        activity3Calories = sumIndexes(aS3Indexes, activityCalorieData);
                        daySteps = sum(activityStepData((activityDayI(1)):activityDayI(length(activityDayI))));
                        averageSteps = daySteps / length(activityDayI);
                        dayCalories = sum(activityCalorieData((activityDayI(1)):activityDayI(length(activityDayI))));
                        averageCalories = dayCalories / length(activityDayI);
                        
                        fprintf(fileID3, [num2str(year), ',', num2str(month), ',', d, ',',  num2str(activity0Day), ',', num2str(activity1Day), ',', num2str(activity2Day), ',', num2str(activity3Day), ',' num2str(daySteps), ',', num2str(averageSteps), ',', num2str(activity0Steps), ',', num2str(activity1Steps), ',', num2str(activity2Steps), ',', num2str(activity3Steps), ',', num2str(dayCalories), ',', num2str(averageCalories), ',', num2str(activity0Calories), ',', num2str(activity1Calories), ',', num2str(activity2Calories), ',', num2str(activity3Calories), newline]);
                    end
                end
            end
        end
    end
end