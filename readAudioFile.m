function [M, flag] = readAudioFile(studentNum)
flag = 0;
M = 0;
filename = strcat('NetHealth_', num2str(studentNum), '_Audio_State.csv');
if (exist(filename, 'file') ~= 0)
    flag = 1;
    fid = fopen(filename);
    M = textscan(fid, '%f64 %d', 'Delimiter', ',', 'HeaderLines', 1);
    fclose(fid);
end