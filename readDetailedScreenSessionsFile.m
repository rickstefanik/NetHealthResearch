function [N, flag] = readDetailedScreenSessionsFile(studentNum)
flag = 0;
N = 0;
filename = strcat('DetailedScreenSessions_', num2str(studentNum), '.csv');
if (exist(filename, 'file') ~= 0)
    flag = 1;
    fid = fopen(filename);
    N = textscan(fid, '%d %d %d %d %f64 %f64 %f %d %d %d', 'Delimiter', ',', 'HeaderLines', 1);
    fclose(fid);
end