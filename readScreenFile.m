function [M, flag] = readScreenFile(studentNum)
flag = 0;
N = 0;
filename = strcat('NetHealth_', num2str(studentNum), '_Screen_State.csv');
if (exist(filename, 'file') ~= 0)
    flag = 1;
    fid = fopen(filename);
    M = textscan(fid, '%f64 %d', 'Delimiter', ',', 'HeaderLines', 1);
    fclose(fid);
end