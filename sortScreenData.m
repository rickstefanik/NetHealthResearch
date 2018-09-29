function [screenTimeData, screenUnlockData] = sortScreenData(M)    

screenTimeData = M{1, 1}(:, 1);
screenUnlockData = M{1, 2}(:, 1);