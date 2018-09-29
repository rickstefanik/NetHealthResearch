function [screenSessionStart, screenSessionEnd, duration] = sortSessionData(M)    

screenSessionStart = M{1, 1}(:, 1);
screenSessionEnd = M{1, 2}(:, 1);
duration = M{1, 3}(:, 1);