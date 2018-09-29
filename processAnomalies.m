%Find anomalies in the screen usuage data
clear;
% F is number of student files being analyzed
F = 20;

for studentNum = 1:F
    disp(['Info for Student ', num2str(studentNum), ':']);
    
    %% Read in Original Data Files
    [M, flag] = readScreenFile(studentNum);
    if (flag == 0)
        disp(['File could not be found for student ', studentNum]);
        continue;
    end
    [screenTimeData, screenUnlockData] = sortScreenData(M);
    
    %% Scan Data for Anomalies
    ind1 = find(screenUnlockData == 1);
    df = ind1(2:end) - ind1(1:end - 1);
    ind2 = find(df == 1);
    
    p1 = (100 * length(ind2)) / length(ind1);
    disp(['Percent Repeat Ones: ', num2str(p1), '%']);
    
    screenUnlockDataAdjusted = screenUnlockData + 1;
    ind12 = find(screenUnlockDataAdjusted == 1);
    df2 = ind12(2:end) - ind12(1:end - 1);
    ind22 = find(df2 == 1);
    
    p2 = (100 * length(ind22)) / length(ind12);
    disp(['Percent Repeat Zeros: ', num2str(p2), '%']);
    
    disp(['Percent Anomaly: ', num2str(((p1 + p2) / 2)), '%']);
    disp(' ');
end
