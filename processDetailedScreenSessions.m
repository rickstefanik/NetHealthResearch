% Take session data and create daily phone usage file and file with details
% on each session
clear;
startOfDayTime = '00:00:00';
endOfDayTime = '23:59:59';
% F is number of student files being analyzed
F = 30;

for studentNum = 1:F
    isGraph = false; 
    disp(num2str(studentNum));
    %% Create PhoneEngagement csv
    [M, flag] = readSessionFile(studentNum);
    if (flag == 0)
        disp(['File could not be found for student ', num2str(studentNum)]);
        continue;
    end
    [screenSessionStart, screenSessionEnd, duration] = sortSessionData(M);
    
    newFileName = ['PhoneEngagement_', num2str(studentNum), '.csv'];
    fileID = fopen(newFileName,'w');
    fprintf(fileID, ['Year, Month, Day, Number of Session Counts, Duration in Minutes, Normalized Sessions in Seconds, Percent of Day', newline]);
    
    newFileName = ['DetailedScreenSessions_', num2str(studentNum), '.csv'];
    fileID4 = fopen(newFileName,'w');
    fprintf(fileID4, ['Year, Month, Day, Session Number, Start Timestamp, End Timestamp, Duration in Minutes, Day Level Total Session Duration (valid = 1), Day Level Average Session Duration (valid = 1), Session Duration (valid = 1)', newline]);
    
    %Loop through each day
    i = 1;
    i2 = 1;
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
                    
                    %% Screen Data Day by Day
                    daySessions = find(screenSessionStart > s & screenSessionStart < e);
                    dayDuration = 0;
                    
                    if (isempty(daySessions))
                        normalizedSession = 0;
                    else
                        
                        for dd = daySessions(1):daySessions(length(daySessions))
                            dayDuration = dayDuration + duration(dd);
                        end
                        normalizedSession = dayDuration/length(daySessions);
                        
                    end
                    
                    %     if (isempty(daySessions))
                    %         normalizedSession = 0;
                    %     else
                    %         normalizedSession = dayDuration/length(daySessions);
                    %     end
                    
                    
                    
                    fprintf(fileID, [num2str(year), ',', num2str(month), ',', d, ',',  num2str(length(daySessions)), ',', num2str(dayDuration / 60), ',', num2str(normalizedSession), ',', num2str(((100 * dayDuration) / (60 * 60 * 24))), newline]);
                    
                    if ((dayDuration >= 0) && (dayDuration < (60 * 60 * 24)))
                        dayDurationArray2(i2) = dayDuration;
                        i2 = i2 + 1;
                    end
                    
                    if (isempty(daySessions))
                        
                    else
                        %if ((dayDuration > 0) && (dayDuration < (60 * 60 * 24)))
                        if (dayDuration > 0)
                            dayDurationArray(i) = dayDuration;
                            normalizedSessionArray(i) = normalizedSession;
                            i = i + 1;
                        end
                    end
                end
            end
        end
    end
    
    
    normalizedOutlierIndexes = getOutlierIndexes(normalizedSessionArray);
    totalOutlierIndexes = getOutlierIndexes(dayDurationArray);
    
    
    %% Detect Outliers
    averageLengthCounter = 1;
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
                    
                    %% Screen Data Day by Day
                    daySessions = find(screenSessionStart > s & screenSessionStart < e);
                    %  dayDuration = 0;
                    
                    if (isempty(daySessions))
                        
                    else
                        isOut1 = 0;
                        isOut2 = 0;
                        if (isempty(find(normalizedOutlierIndexes == averageLengthCounter, 1)))
                            isOut2 = 1;
                        end
                        if (isempty(find(totalOutlierIndexes == averageLengthCounter, 1)))
                            isOut1 = 1;
                        end
                        
                        for dd = daySessions(1):daySessions(length(daySessions))
                            isOut3 = isoutlierPoint(duration(dd), duration);
                            fprintf(fileID4, [num2str(year), ',', num2str(month), ',', d, ',', num2str(sessionNumber), ',', num2str(screenSessionStart(dd)), ',', num2str(screenSessionEnd(dd)), ',', num2str(duration(dd) / 60), ',', num2str(isOut1), ',', num2str(isOut2), ',', num2str(isOut3), newline]);
                            sessionNumber = sessionNumber + 1;
                        end
                        averageLengthCounter = averageLengthCounter + 1;
                    end
                end
            end
        end
    end
    
    %% Scan Data for Anomalies
    disp(['Percent of Data Points that are outliers: ', num2str(isoutlier(dayDurationArray)), '%']);
    disp(' ');
    %% Graph Figures
    if (isGraph)     
        dayDurationArray2 = dayDurationArray2/60;
        figure;
        h = boxplot(dayDurationArray);
        title(['Boxplot of Student ', num2str(studentNum)]);
        figure;
        bar(dayDurationArray2);
        title(['Bar Graph of Student ', num2str(studentNum)]);
        xlabel('Days');
        ylabel('Minutes')
    end
    
    clearvars -except F startOfDayTime endOfDayTime
end
