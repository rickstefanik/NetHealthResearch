function [M, flag] = readAsLines(filename)
flag = 0;
N = 0;
fid = fopen(filename);
if (exist(filename, 'file') ~= 0)
    flag = 1;
    M = textscan(fid, '%s', 'Delimiter', '\n', 'HeaderLines', 1);
    fclose(fid);
    
end