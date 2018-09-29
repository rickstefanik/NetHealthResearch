function [N, flag] = readMappingFile()
flag = 0;
N = 0;
filename = 'NetHealth_Anonymous_Unique_LocationOrder2Phn2Email2FitbitParticipantID_Mapping_Aug24_2015toDec9_2016.csv';
if (exist(filename, 'file') ~= 0)
    flag = 1;
    fid = fopen(filename);
    N = textscan(fid, '%s %s %s %s', 'Delimiter', ',', 'HeaderLines', 1);
    fclose(fid);
end