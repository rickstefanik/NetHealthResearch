function [activityTimeData, activityStateData, activityStepData, acitivityMetabolicData, activityCalorieData, activityHeartData] = sortActivityData(N)    

activityTimeData = N{1, 1}(:,1);
activityStateData = N{1, 2}(:,1);
activityStepData = N{1, 3}(:,1);
acitivityMetabolicData = N{1, 4}(:,1);
activityCalorieData = N{1, 5}(:,1);
activityHeartData = N{1, 6}(:,1);