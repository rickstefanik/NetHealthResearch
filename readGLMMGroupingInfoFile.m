function [M, flag] = readGLMMGroupingInfoFile()
flag = 0;
M = 0;
filename = 'GLMM_Grouping_Info.txt';
if (exist(filename, 'file') ~= 0)
    flag = 1;
    fid = fopen(filename);
    M = textscan(fid, '%s', 'Delimiter', ':', 'HeaderLines', 0);
    fclose(fid);
end