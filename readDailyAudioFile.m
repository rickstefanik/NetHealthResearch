function [M, flag] = readDailyAudioFile(studentNum)
flag = 0;
N = 0;
filename = strcat('DailyAudio_', num2str(studentNum), '.csv');
if (exist(filename, 'file') ~= 0)
    flag = 1;
    fid = fopen(filename);
    M = textscan(fid, '%s %s %s %d', 'Delimiter', ',', 'HeaderLines', 1);
    fclose(fid);
end