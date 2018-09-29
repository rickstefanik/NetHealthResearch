clear;
studentNum = 7;
filename = ['Predicted_GLM_AllStudents_', num2str(studentNum) '.csv'];
[M, flag] = readSecondCol(filename);
if (flag == 0)
    disp(['File could not be found for student ', num2str(studentNum)]);
end
Predicted_Sleep_Durations = sortSecondCol(M);

filename = ['Actual_GLM_AllStudents_', num2str(studentNum) '.csv'];
[M, flag] = readSecondCol(filename);
if (flag == 0)
    disp(['File could not be found for student ', num2str(studentNum)]);
end
Actual_Sleep_Durations = sortSecondCol(M);


actSleepMin = 0;
actSleepMax = 14;
predSleepMin = 0;
predSleepMax = 14;

for j = 1:length(Predicted_Sleep_Durations)
    flagged(j) = 0;
end

%disp(flagged)

for i =1:length(Predicted_Sleep_Durations)
    if (Predicted_Sleep_Durations(i) > predSleepMax)
        flagged(i) = 1;
    end
    if (Predicted_Sleep_Durations(i) < predSleepMin)
        flagged(i) = 1;
    end
    if (Actual_Sleep_Durations(i) > actSleepMax)
        flagged(i) = 1;
    end
    if (Actual_Sleep_Durations(i) < actSleepMin)
        flagged(i) = 1;
    end
end

distance = 1.5 * std(Actual_Sleep_Durations);

% disp(flagged);

for k = length(Predicted_Sleep_Durations):-1:1
    if (flagged(k) == 1)
        Predicted_Sleep_Durations(k) = [];
        Actual_Sleep_Durations(k) = [];
    end
end

f1 = fit(Predicted_Sleep_Durations, Actual_Sleep_Durations, 'poly1');

for j = 1:length(Predicted_Sleep_Durations)
    flagged(j) = 0;
end

for i =1:length(Predicted_Sleep_Durations)
    pSleep = (f1.p1 * Predicted_Sleep_Durations(i)) + f1.p2;
    if ((abs(pSleep) - Actual_Sleep_Durations(i)) > distance)
        flagged(i) = 1;
    end
end


for k = length(Predicted_Sleep_Durations):-1:1
    if (flagged(k) == 1)
        Predicted_Sleep_Durations(k) = [];
        Actual_Sleep_Durations(k) = [];
    end
end
f1 = fit(Predicted_Sleep_Durations, Actual_Sleep_Durations, 'poly1');

plot(f1,Predicted_Sleep_Durations,Actual_Sleep_Durations);
xlabel('Predicted Sleep Duration (hrs)');
ylabel('Actual Sleep Duration (hrs)');
title(['GLM Model of All Students']);
[R, p] = corrcoef(Predicted_Sleep_Durations,Actual_Sleep_Durations);
%disp(['p-value: ', num2str(p(1,2))]);
R_squared=R(2)^2;

text(min(Predicted_Sleep_Durations) + 1   , min(Actual_Sleep_Durations) + 1.5, ['R = ', num2str(R(2))]);
text(min(Predicted_Sleep_Durations) + 1 , min(Actual_Sleep_Durations) + 1, ['R^2 = ', num2str(R_squared)]);
text(min(Predicted_Sleep_Durations) + 1 , min(Actual_Sleep_Durations) + .5, ['p-value = ', num2str(p(1,2))]);