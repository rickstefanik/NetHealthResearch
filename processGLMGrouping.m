clear;

newFileName = 'GLM_Grouping_Data.csv';
fileID = fopen(newFileName,'w');
fprintf(fileID, ['Significant Figures Only (true=1), PID, p-value, R, R^2, AIC, BIC, factors', newline]);

filename = ['Predicted_GLM_Grouping.csv'];
[M, flag] = readSecondCol(filename);
if (flag == 0)
    disp(['File could not be found']);
end
Predicted_Sleep_Durations = sortSecondCol(M);

filename = ['Actual_GLM_Grouping.csv'];
[M, flag] = readSecondCol(filename);
if (flag == 0)
    disp(['File could not be found']);
end
Actual_Sleep_Durations = sortSecondCol(M);

f1 = fit(Predicted_Sleep_Durations, Actual_Sleep_Durations, 'poly1');

%plot(f1,Predicted_Sleep_Durations,Actual_Sleep_Durations);

%%%%%%
X = makePointArray(Predicted_Sleep_Durations, Actual_Sleep_Durations);
epsilon=1.75;
MinPts=5;
[IDX, isNoise] = DBSCAN(X,epsilon,MinPts);


%% Plot Results
[pointX, pointY, outX, outY] = separatePoints(Predicted_Sleep_Durations, Actual_Sleep_Durations, IDX);
% PlotClusterinResult(X, IDX);
% title(['DBSCAN Clustering (\epsilon = ' num2str(epsilon) ', MinPts = ' num2str(MinPts) ')']);
% figure;
%%%%%%%%

pointX = pointX';
pointY = pointY';
f1 = fit(pointX, pointY, 'poly1');
plot(f1,pointX,pointY);
%scatter(pointX, pointY);

%xlim([0 18])
%ylim([0 18])
xlabel('Predicted Sleep Duration (hrs)');
ylabel('Actual Sleep Duration (hrs)');
title(['GLM Model of All Students ']);
[R, p] = corrcoef(pointX,pointY);
%disp(['StudentNum: ', num2str(studentNum), ' p-value: ', num2str(p(1,2))]);
R_squared=R(2)^2;

text(min(pointX) + 1   , min(pointY) + 1.5, ['R = ', num2str(R(2))]);
text(min(pointX) + 1 , min(pointY) + 1, ['R^2 = ', num2str(R_squared)]);
text(min(pointX) + 1 , min(pointY) + .5, ['p-value = ', num2str(p(1,2))]);


[M, flag] = readGLMGroupingInfoFile();
if (flag == 0)
    disp(['File could not be found']);
end
[AIC, BIC, factors] = sortGLMInfoFile(M);




fprintf(fileID, ['0, ', num2str(-100), ',', num2str(p(1,2)), ',', num2str(R(2)), ',', num2str(R_squared), ...
    ',',  num2str(AIC), ',', num2str(BIC), ',' factors, newline]);


clearvars -except fileID
figure;


%% Perform for only significant factors

filename = ['Predicted_GLM_Grouping_OnlySig.csv'];
[M, flag] = readSecondCol(filename);
if (flag == 0)
    disp(['File could not be found']);
end
Predicted_Sleep_Durations = sortSecondCol(M);

filename = ['Actual_GLM_Grouping_OnlySig.csv'];
[M, flag] = readSecondCol(filename);
if (flag == 0)
    disp(['File could not be found']);
end
Actual_Sleep_Durations = sortSecondCol(M);

f1 = fit(Predicted_Sleep_Durations, Actual_Sleep_Durations, 'poly1');

%plot(f1,Predicted_Sleep_Durations,Actual_Sleep_Durations);

%%%%%%
X = makePointArray(Predicted_Sleep_Durations, Actual_Sleep_Durations);
epsilon=1.75;
MinPts=5;
[IDX, isNoise] = DBSCAN(X,epsilon,MinPts);


%% Plot Results
[pointX, pointY, outX, outY] = separatePoints(Predicted_Sleep_Durations, Actual_Sleep_Durations, IDX);
% PlotClusterinResult(X, IDX);
% title(['DBSCAN Clustering (\epsilon = ' num2str(epsilon) ', MinPts = ' num2str(MinPts) ')']);
% figure;
%%%%%%%%

pointX = pointX';
pointY = pointY';
f1 = fit(pointX, pointY, 'poly1');
plot(f1,pointX,pointY);
%scatter(pointX, pointY);

%xlim([0 18])
%ylim([0 18])
xlabel('Predicted Sleep Duration (hrs)');
ylabel('Actual Sleep Duration (hrs)');
title(['(Only Significant Factors) GLM Model of All Students']);
[R, p] = corrcoef(pointX,pointY);
%disp(['StudentNum: ', num2str(studentNum), ' p-value: ', num2str(p(1,2))]);
R_squared=R(2)^2;

text(min(pointX) + 1   , min(pointY) + 1.5, ['R = ', num2str(R(2))]);
text(min(pointX) + 1 , min(pointY) + 1, ['R^2 = ', num2str(R_squared)]);
text(min(pointX) + 1 , min(pointY) + .5, ['p-value = ', num2str(p(1,2))]);



[M, flag] = readGLMGroupingOnlySigInfoFile();
if (flag == 0)
    disp(['File could not be found']);
end
[AIC, BIC, factors] = sortGLMInfoFile(M);


fprintf(fileID, ['1, ', num2str(-200), ',', num2str(p(1,2)), ',', num2str(R(2)), ',', num2str(R_squared), ...
    ',',  num2str(AIC), ',', num2str(BIC), ',' factors, newline]);

