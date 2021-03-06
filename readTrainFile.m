function [N, flag] = readTrainFile(num)
flag = 0;
N = 0;
filename = strcat('Train_', num2str(num), '.csv');
if (exist(filename, 'file') ~= 0)
    flag = 1;
    fid = fopen(filename);
    N = textscan(fid, '%d %d', 'Delimiter', ',', 'HeaderLines', 1);
    fclose(fid);
end