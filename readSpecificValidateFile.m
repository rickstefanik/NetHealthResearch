function [N, flag] = readSpecificValidateFile(studentNum, num)
flag = 0;
N = 0;
filename = strcat('Validate_Student', num2str(studentNum), '_', num2str(num), '.csv');
if (exist(filename, 'file') ~= 0)
    flag = 1;
    fid = fopen(filename);
    N = textscan(fid, '%d %d', 'Delimiter', ',', 'HeaderLines', 1);
    fclose(fid);
end