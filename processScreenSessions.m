%Process the raw screen usage files into a file that shows duration of each
%session.
clear;
% F is number of student files being analyzed
F = 30;

for studentNum = 1:F
    disp(num2str(studentNum));
    [M, flag] = readScreenFile(studentNum);
    if (flag == 0)
        disp(['File could not be found for student ', num2str(studentNum)]);
        continue;
    end
    [screenTimeData, screenUnlockData] = sortScreenData(M);
    
    newFileName = ['ScreenSessions_', num2str(studentNum), '.csv'];
    fileID = fopen(newFileName,'w');
    fprintf(fileID, ['Time Unlocked, Time Locked, Duration in Seconds', newline]);
    
    imax = floor(length(screenTimeData)-1);
    for i = 1:imax
        if ((screenUnlockData(i) == 1) && (screenUnlockData(i+1) == 0))
            seconds = ((screenTimeData(i+1)) - (screenTimeData(i))) / 1000;
            fprintf(fileID, [num2str(screenTimeData(i)), ',', num2str(screenTimeData(i+1)), ',', num2str(seconds), newline]);
        end
    end
    
end