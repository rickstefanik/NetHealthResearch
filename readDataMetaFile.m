function [N, flag] = readDataMetaFile()
flag = 0;
N = 0;
filename = 'DataMetaFile.csv';
if (exist(filename, 'file') ~= 0)
    flag = 1;
    fid = fopen(filename);
    N = textscan(fid, '%d %d %d %f %f %f %f %f %f %f %f %f %f %f %f %s %s %s %f %f %f %f %f %f %f %f %f %f ', 'Delimiter', ',', 'HeaderLines', 1);
    fclose(fid);
end