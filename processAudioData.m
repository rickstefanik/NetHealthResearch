%Process the raw NetHealth Audio data and aggregate into daily values
clear;
startOfDayTime = '00:00:00';
endOfDayTime = '23:59:59';
% F is number of student files being analyzed
F = 30;

for studentNum = 1:F
    disp(num2str(studentNum));
    [M, flag] = readAudioFile(studentNum);
    if (flag == 0)
        disp(['File could not be found for student ', num2str(studentNum)]);
        continue;
    end
    newFileName = ['DailyAudio_', num2str(studentNum), '.csv'];
    fileID3 = fopen(newFileName,'w');
    fprintf(fileID3, ['Year, Month, Day, Minutes Audio Used',  newline]);
    
    [audioTimeData, audioUnlockData] = sortAudioData(M);
    
    for year = 2015:2016
        for month = 1:12
            if (((year == 2015) && (month < 8)))
                
            else
                l = eomday(year,month);
                for day = 1:l
                    d = num2str(day);

                    if (day < 10)
                        d = ['0', d];
                    end
                    startDay = [num2str(month), '/', d, '/', num2str(year), ' ', startOfDayTime];
                    endDay = [num2str(month), '/', d, '/', num2str(year), ' ', endOfDayTime];
                                   
                    s = convert_time_timestamp(startDay);
                    e = convert_time_timestamp(endDay);
                         
                    audioDayI = find(audioTimeData > s & audioTimeData < e);
                    if (isempty(audioDayI))
                        fprintf(fileID3, [num2str(year), ',', num2str(month), ',', d, ',',  num2str(0), newline]);
                    else
                        audioStates = audioUnlockData((audioDayI(1)):audioDayI(length(audioDayI)));
                        minutesOfAudio = length(find(audioStates == 1));
                        
                    
                        
                        fprintf(fileID3, [num2str(year), ',', num2str(month), ',', d, ',', num2str(minutesOfAudio), newline]);
                    end
                end
            end
        end
    end
end