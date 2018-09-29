%Process raw weather data and aggregate into daily values
clear;

[M, flag] = readWeatherFile();
if (flag == 0)
    disp(['File could not be found for weather file']);
    exit;
end
[weatherDayData, weatherHourData, weatherTemperatureData] = sortWeatherData(M);

newFileName = 'DailyWeatherData.csv';
fileID = fopen(newFileName,'w');
fprintf(fileID, ['Year, Month, Day, Mean Temperature, Median Temperature', newline]);

for year = 2015:2016
    for month  = 1:12
        m = num2str(month);
        if (month < 10)
            m = ['0', m];
        end
        if (((year == 2015) && (month < 8)))
            
        else
            l = eomday(year,month);
            for day = 1:l
                d = num2str(day);
                
                sessionNumber = 1;
                
                if (day < 10)
                    d = ['0', d];
                end
                startDay = [num2str(year), '-', m, '-', d];
                %dayIndexes = find([weaterDayData{:}] == startDay);
                dayIndexes = find(ismember(weatherDayData, startDay));
                dayTemps = weatherTemperatureData(dayIndexes(1):dayIndexes(length(dayIndexes)));
                tempMean = mean(dayTemps);
                tempMedian = median(dayTemps);
                fprintf(fileID, [num2str(year), ',', num2str(month), ',', d, ',', num2str(tempMean), ',', num2str(tempMedian), newline]);
            end
        end
    end
end