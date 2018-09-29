function [N, flag] = readPSQIFile()
flag = 0;
N = 0;
filename = 'basic_survey_merged_W1-5(6-29-17)_ONLY_PSQI_Categories.csv';
if (exist(filename, 'file') ~= 0)
    flag = 1;
    fid = fopen(filename);
    N = textscan(fid, '%s %s %s %s %s %s %s %s %s %s %s %s %s %s %s %s %s %s %s %s %s %s %s %s %s %s %s %s %s %s %s %s %s %s %s %s %s %s %s %s %s %s %s %s %s %s %s %s %s %s %s %s %s', 'Delimiter', ',', 'HeaderLines', 1);
    fclose(fid);
end
