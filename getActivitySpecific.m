function [specificActivityState0, specificActivityState1, specificActivityState2, specificActivityState3, specificCaloriesBurned0, specificCaloriesBurned1, specificCaloriesBurned2, specificCaloriesBurned3, specificStepsTaken] = getActivitySpecific(timeStart, timeEnd, studentNum)


N = readActivityFile(studentNum);
[activityTimeData, activityStateData, activityStepData, activityMetabolicData, activityCalorieData, activityHeartData] = sortActivityData(N);

splitActivity = find(activityTimeData > timeStart & activityTimeData < timeEnd);

specificActivityState0 = 0;
specificActivityState1 = 0;
specificActivityState2 = 0;
specificActivityState3 = 0;
specificCaloriesBurned0 = 0;
specificCaloriesBurned1 = 0;
specificCaloriesBurned2 = 0;
specificCaloriesBurned3 = 0;
specificStepsTaken = 0;


%disp(splitActivity);
%disp(timeStart);
%disp(timeEnd);

if (length(splitActivity) > 0)
    
    splitActivityData = activityStateData(splitActivity(1):splitActivity(length(splitActivity)));
    splitCalories = activityCalorieData(splitActivity(1):splitActivity(length(splitActivity)));
    splitSteps = activityStepData(splitActivity(1):splitActivity(length(splitActivity)));
    
    AS0Indexes = find(splitActivityData == 0);
    AS1Indexes = find(splitActivityData == 1);
    AS2Indexes = find(splitActivityData == 2);
    AS3Indexes = find(splitActivityData == 3);
    
    specificStepsTaken = sum(splitSteps);
    
    specificActivityState0 = length(AS0Indexes);
    specificActivityState1 = length(AS1Indexes);
    specificActivityState2 = length(AS2Indexes);
    specificActivityState3 = length(AS3Indexes);
    
    for i=1:length(AS0Indexes)
        specificCaloriesBurned0 = specificCaloriesBurned0 + splitCalories(AS0Indexes(i));
    end
    
    for i=1:length(AS1Indexes)
        specificCaloriesBurned1 = specificCaloriesBurned1 + splitCalories(AS1Indexes(i));
    end
    
    for i=1:length(AS2Indexes)
        specificCaloriesBurned2 = specificCaloriesBurned2 + splitCalories(AS2Indexes(i));
    end
    
    for i=1:length(AS3Indexes)
        specificCaloriesBurned3 = specificCaloriesBurned3 + splitCalories(AS3Indexes(i));
    end
    
end

