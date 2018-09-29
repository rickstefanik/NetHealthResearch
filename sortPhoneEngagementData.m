function [phoneYearData, phoneMonthData, phoneDayData, sessionCountData, durationData, normalizedDurationData, percentDurationData] = sortPhoneEngagementData(M)    

phoneYearData = M{1, 1}(:, 1);
phoneMonthData = M{1, 2}(:, 1);
phoneDayData = M{1, 3}(:, 1);
sessionCountData = M{1, 4}(:, 1);
durationData = M{1, 5}(:, 1);
normalizedDurationData = M{1, 6}(:, 1);
percentDurationData = M{1, 7}(:, 1);