function [M, flag] = readWeatherFile()
flag = 0;
N = 0;
filename = 'weather2015-2016.csv';
if (exist(filename, 'file') ~= 0)
    flag = 1;
    fid = fopen(filename);
    M = textscan(fid, '%s %s %f64', 'Delimiter', ',', 'HeaderLines', 0);
    fclose(fid);
end