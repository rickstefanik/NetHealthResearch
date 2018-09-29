function [N, flag] = readActivityFile(studentNum)
flag = 0;
N = 0;
filename = strcat('NetHealth_', num2str(studentNum), '_Activity.csv');
if (exist(filename, 'file') ~= 0)
    flag = 1;
    fid = fopen(filename);
    N = textscan(fid, '%f %d %d %f %f %f', 'Delimiter', ',', 'HeaderLines', 1);
    fclose(fid);
end