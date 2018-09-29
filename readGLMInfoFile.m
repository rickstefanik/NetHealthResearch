function [M, flag] = readGLMInfoFile(studentNum)
flag = 0;
M = 0;
filename = strcat('GLM_Student_Info_', num2str(studentNum), '.txt');
if (exist(filename, 'file') ~= 0)
    flag = 1;
    fid = fopen(filename);
    M = textscan(fid, '%s', 'Delimiter', ':', 'HeaderLines', 0);
    fclose(fid);
end