function [M, flag] = readDailyWeatherFile()
flag = 0;
N = 0;
filename = 'DailyWeatherData.csv';
if (exist(filename, 'file') ~= 0)
    flag = 1;
    fid = fopen(filename);
    M = textscan(fid, '%s %s %s %f64 %f64', 'Delimiter', ',', 'HeaderLines', 1);
    fclose(fid);
end