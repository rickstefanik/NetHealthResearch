function [N, flag] = readGLMDataFile()
flag = 0;
N = 0;
filename = 'GLM_AllSubjects_Data.csv';
if (exist(filename, 'file') ~= 0)
    flag = 1;
    fid = fopen(filename);
    N = textscan(fid, '%d %d %f64 %f64 %f64 %f64 %f64 %s', 'Delimiter', ',', 'HeaderLines', 1);
    fclose(fid);
end