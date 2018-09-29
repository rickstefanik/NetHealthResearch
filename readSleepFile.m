function [N, flag] = readSleepFile(studentNum)
flag = 0;
N = 0;
filename = strcat('NetHealth_', num2str(studentNum), '_Sleep.csv');
if (exist(filename, 'file') ~= 0)
    flag = 1;
    fid = fopen(filename);
    %N = textscan(fid, '%s %s %s %s %s %s %s %s %s %s %s %s %s %s %s %s %s %s %s %s %s %s %s', 'Delimiter', ',', 'HeaderLines', 1);
    N = textscan(fid, '%s %s %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f', 'Delimiter', ',', 'HeaderLines', 1);
    fclose(fid);
end