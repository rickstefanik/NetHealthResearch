function [audioYearData, audioMonthData, audioDayData, audioDailyDuration] = sortDailyAudioData(M)    

audioYearData = M{1, 1}(:, 1);
audioMonthData = M{1, 2}(:, 1);
audioDayData = M{1, 3}(:, 1);
audioDailyDuration = M{1, 4}(:, 1);