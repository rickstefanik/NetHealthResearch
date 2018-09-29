function [M, flag] = readSecondCol(filename)
flag = 0;
M = 0;
if (exist(filename, 'file') ~= 0)
    flag = 1;
    fid = fopen(filename);
    M = textscan(fid, '%s %f64', 'Delimiter', ',', 'HeaderLines', 1);
    fclose(fid);
end