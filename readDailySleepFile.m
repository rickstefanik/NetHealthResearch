function [N, flag] = readDailySleepFile(studentNum)
flag = 0;
N = 0;
filename = strcat('DailySleep_', num2str(studentNum), '.csv');
if (exist(filename, 'file') ~= 0)
    flag = 1;
    fid = fopen(filename);
    N = textscan(fid, '%s %s %s %f %f %f %f %f', 'Delimiter', ',', 'HeaderLines', 1);
    fclose(fid);
end