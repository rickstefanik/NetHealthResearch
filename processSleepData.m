%Take the raw sleep data and aggregate into daily files

clear;
F = 30;
startOfDayTime = '00:00:00';
endOfDayTime = '23:59:59';
for studentNum = 1:F
    disp(num2str(studentNum));
    [N, flag] = readSleepFile(studentNum);
    if (flag == 0)
        disp(['File could not be found for student ', num2str(studentNum)]);
        continue;
    end
    
    [sleepStartDate, sleepEndDate, sleepStartTime, dt_sleep, isMainSleep, timeInBed, numAwakeTimes, minsAwake, restlessCount, restlessDuration, minutesAfterWakeup, minToFallAsleep ] = sortSleepData(N);
    newFileName = ['DailySleep_', num2str(studentNum), '.csv'];
    fileID = fopen(newFileName,'w');
    fprintf(fileID, ['Year, Month, Day, Sleep Duration, Nap Duration, Time of Sleep Start, Min to Fall Asleep, Restless Duration (min)', newline]);
    
    newFileName = ['DailySleep_NoEmpty_', num2str(studentNum), '.csv'];
    fileID2 = fopen(newFileName,'w');
    fprintf(fileID2, ['Year, Month, Day, Sleep Duration, Nap Duration, Time of Sleep Start, Min to Fall Asleep, Restless Duration (min)', newline]);
    
    sleepDateStamps{1, length(sleepStartDate)} = [];
    for i = 1:length(sleepStartDate)
        s = sleepStartDate{i};
        t = strsplit(s);
        u = t{1};
        sleepDateStamps{i} = u;
    end
    
    prevDayWritten = false;
    for year = 2015:2016
        for month = 1:12
            m = num2str(month);
            if (month < 10)
                m = ['0', m];
            end
            if (((year == 2015) && (month < 8)))
                
            else
                l = eomday(year,month);
                for day = 1:l
                    
                    d = num2str(day);
                    if (day < 10)
                        d = ['0', d];
                    end
                    sleepDurationMain = 0;
                    napDurationMain = 0;
                    startTimeMain = 0;
                    minToFallAsleepMain = 0;
                    restlessDurationMain = 0;
                    
                    sleepDurationPrev = 0;
                    napDurationPrev = 0;
                    startTimePrev = 0;
                    minToFallAsleepPrev = 0;
                    restlessDurationPrev = 0;
                    
                    
                    
                    
                    startDate = [m, '/', d, '/', num2str(year)];
                    prevDate = getPreviousDate(num2str(year), m, d);
                    prevDate = strsplit(prevDate, '-');
                    prevYear = prevDate{1};
                    prevMonth = prevDate{2};
                    prevDay = prevDate{3};
                    %disp(startDate);
                    dayIndexes = find(ismember(sleepDateStamps, startDate));
                    
                    if (~isempty(dayIndexes))
                        if (dayIndexes(length(dayIndexes)) <= length(isMainSleep))
                            %disp(dayIndexes);
                            slicedStartDate = sleepStartDate(dayIndexes(1):dayIndexes(length(dayIndexes)));
                            slicedEndDate = sleepEndDate(dayIndexes(1):dayIndexes(length(dayIndexes)));
                            slicedStartTimes = sleepStartTime(dayIndexes(1):dayIndexes(length(dayIndexes)));
                            slicedSleepDurations = dt_sleep(dayIndexes(1):dayIndexes(length(dayIndexes)));
                            slicedSleepMain = isMainSleep(dayIndexes(1):dayIndexes(length(dayIndexes)));
                            slicedMinToFallAsleep = minToFallAsleep(dayIndexes(1):dayIndexes(length(dayIndexes)));
                            slicedRestlessDuration = restlessDuration(dayIndexes(1):dayIndexes(length(dayIndexes)));
                            
                            
                            
                            
                            
                            for i = 1:length(slicedSleepDurations)
                                sDate = strsplit(slicedStartDate{i}, ' ');
                                sDate = sDate{1};
                                eDate = strsplit(slicedEndDate{i}, ' ');
                                eDate = eDate{1};
                                if (slicedSleepMain(i) == 1)
                                    
                                    if (strcmp(sDate, eDate))
                                        %        sleepDurationPrev = sleepDurationPrev + slicedSleepDurations(i);
                                        sleepDurationPrev = slicedSleepDurations(i);
                                        startTimePrev = slicedStartTimes(i);
                                        minToFallAsleepPrev = slicedMinToFallAsleep(i);
                                        restlessDurationPrev = slicedRestlessDuration(i);
                                        
                                    else
                                        
                                        %           sleepDurationMain = sleepDurationMain + slicedSleepDurations(i);
                                        sleepDurationMain = slicedSleepDurations(i);
                                        startTimeMain = slicedStartTimes(i);
                                        minToFallAsleepMain = slicedMinToFallAsleep(i);
                                        restlessDurationMain = slicedRestlessDuration(i);
                                    end
                                else
                                    if (strcmp(sDate, eDate))
                                        % napDurationPrev = napDurationPrev + slicedSleepDurations(i);
                                        napDurationPrev = slicedSleepDurations(i);
                                    else
                                        %  napDurationMain = napDurationMain + slicedSleepDurations(i);
                                        napDurationMain = slicedSleepDurations(i);
                                    end
                                    
                                end
                            end
                        end
                    end
                    
                    if (((sleepDurationPrev ~= 0) || (napDurationPrev ~= 0)) && (prevDayWritten == false))
                        p = prevDay;
                        if (str2double(prevDay) < 10)
                            p = ['0', p];
                        end
                        fprintf(fileID2, [prevYear, ',', prevMonth, ',', p, ',', num2str(sleepDurationPrev), ',', num2str(napDurationPrev), ',', num2str(startTimePrev), ',', num2str(minToFallAsleepPrev), ',', num2str(restlessDurationPrev), newline]);
                    end
                    prevDayWritten = false;
                    if ((sleepDurationMain ~= 0) || (napDurationMain ~= 0))
                        fprintf(fileID2, [num2str(year), ',', num2str(month), ',', d, ',', num2str(sleepDurationMain), ',', num2str(napDurationMain), ',', num2str(startTimeMain), ',', num2str(minToFallAsleepMain), ',', num2str(restlessDurationMain), newline]);
                        prevDayWritten = true;
                    end
                    
                    
                    
                    %    fprintf(fileID, [num2str(year), ',', num2str(month), ',', d, ',', num2str(sleepDuration), ',', num2str(napDuration), ',' num2str(startTime), ',', num2str(minToFallAsleepMain), ',', num2str(restlessDurationMain), newline]);
                end
            end
        end
    end
    clearvars -except F
end