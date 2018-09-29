function [activityYearData, activityMonthData, activityDayData, activityDailyState0Data, activityDailyState1Data, activityDailyState2Data, activityDailyState3Data, activityDailyCalories] = sortDailyActivityData(M)    

activityYearData = M{1, 1}(:, 1);
activityMonthData = M{1, 2}(:, 1);
activityDayData = M{1, 3}(:, 1);
activityDailyState0Data = M{1, 4}(:, 1);
activityDailyState1Data = M{1, 5}(:, 1);
activityDailyState2Data = M{1, 6}(:, 1);
activityDailyState3Data = M{1, 7}(:, 1);
activityDailyCalories = M{1, 14}(:, 1);
