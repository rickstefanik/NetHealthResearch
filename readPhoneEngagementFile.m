function [N, flag] = readPhoneEngagementFile(studentNum)
flag = 0;
N = 0;
filename = strcat('PhoneEngagement_', num2str(studentNum), '.csv');
if (exist(filename, 'file') ~= 0)
    flag = 1;
    fid = fopen(filename);
    N = textscan(fid, '%s %s %s %f64 %f64 %f64 %f64', 'Delimiter', ',', 'HeaderLines', 1);
    fclose(fid);
end