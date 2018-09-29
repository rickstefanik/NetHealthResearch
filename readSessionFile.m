function [M, flag] = readSessionFile(studentNum)
flag = 0;
N = 0;
filename = strcat('ScreenSessions_', num2str(studentNum), '.csv');
if (exist(filename, 'file') ~= 0)
    flag = 1;
    fid = fopen(filename);
    M = textscan(fid, '%f64 %f64 %f64', 'Delimiter', ',', 'HeaderLines', 1);
    fclose(fid);
end