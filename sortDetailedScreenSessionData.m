function [screenYear, screenMonth, screenDay, screenSessionNumbers, screenStartTimestamp, screenEndTimestamp, screenDuration, screenDayDurationOutlier, screenDayAverageOutlier, screenSessionOutlier] = sortDetailedScreenSessionData(N)    

screenYear = N{1, 1}(:,1);
screenMonth = N{1, 2}(:,1);
screenDay = N{1, 3}(:,1);
screenSessionNumbers = N{1, 4}(:,1);
screenStartTimestamp = N{1, 5}(:,1);
screenEndTimestamp = N{1, 6}(:,1);
screenDuration = N{1, 7}(:,1);
screenDayDurationOutlier = N{1, 8}(:,1);
screenDayAverageOutlier = N{1, 9}(:,1);
screenSessionOutlier = N{1, 10}(:,1);