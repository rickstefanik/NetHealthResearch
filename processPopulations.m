clear;

newFileName = 'Population_Data.csv';
fileID = fopen(newFileName,'w');
fprintf(fileID, ['Model (GLM = 0; GLMM = 1), Significant Figures Only (true=1), Used Outlier Removal (true=1), p-value, R, R^2, AIC, BIC, epsilon, MinPts, residDF, residDev, DF, Deviance, p-val ChiSq, number of factors, factors', newline]);


[residDF_A, residDF_B, residDev_A, residDev_B, DF, Deviance, pChi] = getChiValsGLMM();

[M, flag] = readGLMMGroupingInfoFile();
if (flag == 0)
    disp(['File could not be found']);
end
[AIC, BIC, factors] = sortGLMMInfoFile(M);

filename = ['Predicted_GLMM_AllStudents.csv'];
[M, flag] = readSecondCol(filename);
if (flag == 0)
    disp(['File could not be found']);
end
Predicted_Sleep_Durations = sortSecondCol(M);

filename = ['Actual_GLMM_AllStudents_.csv'];
[M, flag] = readSecondCol(filename);
if (flag == 0)
    disp(['File could not be found']);
end
Actual_Sleep_Durations = sortSecondCol(M);

f1 = fit(Predicted_Sleep_Durations, Actual_Sleep_Durations, 'poly1');
plot(f1,Predicted_Sleep_Durations,Actual_Sleep_Durations);
xlabel('Predicted Sleep Duration (hrs)');
ylabel('Actual Sleep Duration (hrs)');
title(['(No Ouliter Removal, All Factors) GLMM Model']);


[R, p] = corrcoef(Predicted_Sleep_Durations,Actual_Sleep_Durations);
%disp(['StudentNum: ', num2str(studentNum), ' p-value: ', num2str(p(1,2))]);
R_squared=R(2)^2;

text(min(Predicted_Sleep_Durations) + 1   , min(Actual_Sleep_Durations) + 1.5, ['R = ', num2str(R(2))]);
text(min(Predicted_Sleep_Durations) + 1 , min(Actual_Sleep_Durations) + 1, ['R^2 = ', num2str(R_squared)]);
text(min(Predicted_Sleep_Durations) + 1 , min(Actual_Sleep_Durations) + .5, ['p-value = ', num2str(p(1,2))]);
saveas(gcf, ['No_Outlier_Removal_GLMM_Model.png'], 'png');

set(gcf, 'visible', 'off');


fprintf(fileID, ['1, 0,0,', num2str(p(1,2)), ',', ...
    num2str(R(2)), ',', num2str(R_squared), ...
    ',',  num2str(AIC), ',', num2str(BIC),',', ...
    num2str(-1), ',', num2str(-1), ',', ...
    num2str(residDF_A), ',', num2str(residDev_A), ',', ...
    num2str(DF), ',', num2str(Deviance), ',', num2str(pChi), ',', ...
    num2str(getNumFactors(factors)), ',' factors, newline]);








%%%%%%
X = makePointArray(Predicted_Sleep_Durations, Actual_Sleep_Durations);
[epsilon, MinPts] = findBestParameters(Predicted_Sleep_Durations, Actual_Sleep_Durations);
[IDX, isNoise] = DBSCAN(X,epsilon,MinPts);


%% Plot Results
[pointX, pointY, outX, outY] = separatePoints(Predicted_Sleep_Durations, Actual_Sleep_Durations, IDX);
PlotClusterinResult(X, IDX);
title(['DBSCAN Clustering (\epsilon = ' num2str(epsilon) ', MinPts = ' num2str(MinPts) ')']);
saveas(gcf, ['Clusters_GLMM_Model.png'], 'png');
set(gcf, 'visible', 'off');
figure;
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
title(['Outlier Removal GLMM Model of All Students ']);
[R, p] = corrcoef(pointX,pointY);
%disp(['StudentNum: ', num2str(studentNum), ' p-value: ', num2str(p(1,2))]);
R_squared=R(2)^2;

text(min(pointX) + 1   , min(pointY) + 1.5, ['R = ', num2str(R(2))]);
text(min(pointX) + 1 , min(pointY) + 1, ['R^2 = ', num2str(R_squared)]);
text(min(pointX) + 1 , min(pointY) + .5, ['p-value = ', num2str(p(1,2))]);

saveas(gcf, ['Outlier_Removal_GLMM_Model.png'], 'png');

set(gcf, 'visible', 'off');

fprintf(fileID, ['1, 0,1,', num2str(p(1,2)), ',', ...
    num2str(R(2)), ',', num2str(R_squared), ...
    ',',  num2str(AIC), ',', num2str(BIC),',', ...
    num2str(epsilon), ',', num2str(MinPts), ',', ...
    num2str(residDF_A), ',', num2str(residDev_A), ',', ...
    num2str(DF), ',', num2str(Deviance), ',', num2str(pChi), ',', ...
    num2str(getNumFactors(factors)), ',' factors, newline]);



clearvars -except fileID
figure;


%% Perform for only significant factors

[residDF_A, residDF_B, residDev_A, residDev_B, DF, Deviance, pChi] = getChiValsGLMM();

[M, flag] = readGLMMGroupingOnlySigInfoFile();
if (flag == 0)
    disp(['File could not be found']);
end
[AIC, BIC, factors] = sortGLMMInfoFile(M);


filename = ['Predicted_GLMM_AllStudents_OnlySig.csv'];
[M, flag] = readSecondCol(filename);
if (flag == 0)
    disp(['File could not be found']);
end
Predicted_Sleep_Durations = sortSecondCol(M);

filename = ['Actual_GLMM_AllStudents_OnlySig.csv'];
[M, flag] = readSecondCol(filename);
if (flag == 0)
    disp(['File could not be found']);
end
Actual_Sleep_Durations = sortSecondCol(M);

f1 = fit(Predicted_Sleep_Durations, Actual_Sleep_Durations, 'poly1');
plot(f1,Predicted_Sleep_Durations,Actual_Sleep_Durations);
xlabel('Predicted Sleep Duration (hrs)');
ylabel('Actual Sleep Duration (hrs)');
title(['(No Outlier Removal, Only Significant Factors) GLMM Model']);


[R, p] = corrcoef(Predicted_Sleep_Durations,Actual_Sleep_Durations);
%disp(['StudentNum: ', num2str(studentNum), ' p-value: ', num2str(p(1,2))]);
R_squared=R(2)^2;

text(min(Predicted_Sleep_Durations) + 1   , min(Actual_Sleep_Durations) + 1.5, ['R = ', num2str(R(2))]);
text(min(Predicted_Sleep_Durations) + 1 , min(Actual_Sleep_Durations) + 1, ['R^2 = ', num2str(R_squared)]);
text(min(Predicted_Sleep_Durations) + 1 , min(Actual_Sleep_Durations) + .5, ['p-value = ', num2str(p(1,2))]);
saveas(gcf, ['No_Outlier_Removal_GLMM_Model_OnlySig.png'], 'png');

set(gcf, 'visible', 'off');


fprintf(fileID, ['1, 1,0,', num2str(p(1,2)), ',', ...
    num2str(R(2)), ',', num2str(R_squared), ...
    ',',  num2str(AIC), ',', num2str(BIC),',', ...
    num2str(-1), ',', num2str(-1), ',', ...
    num2str(residDF_B), ',', num2str(residDev_B), ',', ...
    num2str(DF), ',', num2str(Deviance), ',', num2str(pChi), ',', ...
    num2str(getNumFactors(factors)), ',' factors, newline]);





%%%%%%
X = makePointArray(Predicted_Sleep_Durations, Actual_Sleep_Durations);
[epsilon, MinPts] = findBestParameters(Predicted_Sleep_Durations, Actual_Sleep_Durations);
[IDX, isNoise] = DBSCAN(X,epsilon,MinPts);

figure;
%% Plot Results
[pointX, pointY, outX, outY] = separatePoints(Predicted_Sleep_Durations, Actual_Sleep_Durations, IDX);
PlotClusterinResult(X, IDX);
title(['DBSCAN Clustering (\epsilon = ' num2str(epsilon) ', MinPts = ' num2str(MinPts) ')']);
saveas(gcf, ['Clusters_GLMM_Model_OnlySig.png'], 'png');
set(gcf, 'visible', 'off');
figure;
%%%%%%%%

pointX = pointX';
pointY = pointY';
f1 = fit(pointX, pointY, 'poly1');
plot(f1,pointX,pointY);

xlabel('Predicted Sleep Duration (hrs)');
ylabel('Actual Sleep Duration (hrs)');
title(['(Outlier Removal, Only Significant Factors) GLMM Model of All Students']);
[R, p] = corrcoef(pointX,pointY);
%disp(['StudentNum: ', num2str(studentNum), ' p-value: ', num2str(p(1,2))]);
R_squared=R(2)^2;

text(min(pointX) + 1   , min(pointY) + 1.5, ['R = ', num2str(R(2))]);
text(min(pointX) + 1 , min(pointY) + 1, ['R^2 = ', num2str(R_squared)]);
text(min(pointX) + 1 , min(pointY) + .5, ['p-value = ', num2str(p(1,2))]);

saveas(gcf, ['Outlier_Removal_GLMM_Model_OnlySig.png'], 'png');

set(gcf, 'visible', 'off');

fprintf(fileID, ['1, 1,1,', num2str(p(1,2)), ',', ...
    num2str(R(2)), ',', num2str(R_squared), ...
    ',',  num2str(AIC), ',', num2str(BIC),',', ...
    num2str(epsilon), ',', num2str(MinPts), ',', ...
    num2str(residDF_B), ',', num2str(residDev_B), ',', ...
    num2str(DF), ',', num2str(Deviance), ',', num2str(pChi), ',', ...
    num2str(getNumFactors(factors)), ',' factors, newline]);

clearvars -except fileID


%%




%% Now run for GLM Population Model


[residDF_A, residDF_B, residDev_A, residDev_B, DF, Deviance, pChi] = getChiValsGLM();

[M, flag] = readGLMGroupingInfoFile();
if (flag == 0)
    disp(['File could not be found']);
end
[AIC, BIC, factors] = sortGLMInfoFile(M);

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
plot(f1,Predicted_Sleep_Durations,Actual_Sleep_Durations);
xlabel('Predicted Sleep Duration (hrs)');
ylabel('Actual Sleep Duration (hrs)');
title(['(No Ouliter Removal, All Factors) GLM Model']);


[R, p] = corrcoef(Predicted_Sleep_Durations,Actual_Sleep_Durations);
%disp(['StudentNum: ', num2str(studentNum), ' p-value: ', num2str(p(1,2))]);
R_squared=R(2)^2;

text(min(Predicted_Sleep_Durations) + 1   , min(Actual_Sleep_Durations) + 1.5, ['R = ', num2str(R(2))]);
text(min(Predicted_Sleep_Durations) + 1 , min(Actual_Sleep_Durations) + 1, ['R^2 = ', num2str(R_squared)]);
text(min(Predicted_Sleep_Durations) + 1 , min(Actual_Sleep_Durations) + .5, ['p-value = ', num2str(p(1,2))]);
saveas(gcf, ['No_Outlier_Removal_GLM_Model.png'], 'png');

set(gcf, 'visible', 'off');


fprintf(fileID, ['0, 0,0,', num2str(p(1,2)), ',', ...
    num2str(R(2)), ',', num2str(R_squared), ...
    ',',  num2str(AIC), ',', num2str(BIC),',', ...
    num2str(-1), ',', num2str(-1), ',', ...
    num2str(residDF_A), ',', num2str(residDev_A), ',', ...
    num2str(DF), ',', num2str(Deviance), ',', num2str(pChi), ',', ...
    num2str(getNumFactors(factors)), ',' factors, newline]);








%%%%%%
X = makePointArray(Predicted_Sleep_Durations, Actual_Sleep_Durations);
[epsilon, MinPts] = findBestParameters(Predicted_Sleep_Durations, Actual_Sleep_Durations);
[IDX, isNoise] = DBSCAN(X,epsilon,MinPts);


%% Plot Results
[pointX, pointY, outX, outY] = separatePoints(Predicted_Sleep_Durations, Actual_Sleep_Durations, IDX);
PlotClusterinResult(X, IDX);
title(['DBSCAN Clustering (\epsilon = ' num2str(epsilon) ', MinPts = ' num2str(MinPts) ')']);
saveas(gcf, ['Clusters_GLM_Model.png'], 'png');
set(gcf, 'visible', 'off');
figure;
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
title(['Outlier Removal GLM Model of All Students ']);
[R, p] = corrcoef(pointX,pointY);
%disp(['StudentNum: ', num2str(studentNum), ' p-value: ', num2str(p(1,2))]);
R_squared=R(2)^2;

text(min(pointX) + 1   , min(pointY) + 1.5, ['R = ', num2str(R(2))]);
text(min(pointX) + 1 , min(pointY) + 1, ['R^2 = ', num2str(R_squared)]);
text(min(pointX) + 1 , min(pointY) + .5, ['p-value = ', num2str(p(1,2))]);

saveas(gcf, ['Outlier_Removal_GLM_Model.png'], 'png');

set(gcf, 'visible', 'off');

fprintf(fileID, ['0, 0,1,', num2str(p(1,2)), ',', ...
    num2str(R(2)), ',', num2str(R_squared), ...
    ',',  num2str(AIC), ',', num2str(BIC),',', ...
    num2str(epsilon), ',', num2str(MinPts), ',', ...
    num2str(residDF_A), ',', num2str(residDev_A), ',', ...
    num2str(DF), ',', num2str(Deviance), ',', num2str(pChi), ',', ...
    num2str(getNumFactors(factors)), ',' factors, newline]);



clearvars -except fileID
figure;


%% Perform for only significant factors

[residDF_A, residDF_B, residDev_A, residDev_B, DF, Deviance, pChi] = getChiValsGLM();

[M, flag] = readGLMGroupingOnlySigInfoFile();
if (flag == 0)
    disp(['File could not be found']);
end
[AIC, BIC, factors] = sortGLMInfoFile(M);


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
plot(f1,Predicted_Sleep_Durations,Actual_Sleep_Durations);
xlabel('Predicted Sleep Duration (hrs)');
ylabel('Actual Sleep Duration (hrs)');
title(['(No Outlier Removal, Only Significant Factors) GLM Model']);


[R, p] = corrcoef(Predicted_Sleep_Durations,Actual_Sleep_Durations);
%disp(['StudentNum: ', num2str(studentNum), ' p-value: ', num2str(p(1,2))]);
R_squared=R(2)^2;

text(min(Predicted_Sleep_Durations) + 1   , min(Actual_Sleep_Durations) + 1.5, ['R = ', num2str(R(2))]);
text(min(Predicted_Sleep_Durations) + 1 , min(Actual_Sleep_Durations) + 1, ['R^2 = ', num2str(R_squared)]);
text(min(Predicted_Sleep_Durations) + 1 , min(Actual_Sleep_Durations) + .5, ['p-value = ', num2str(p(1,2))]);
saveas(gcf, ['No_Outlier_Removal_GLM_Model_OnlySig.png'], 'png');

set(gcf, 'visible', 'off');


fprintf(fileID, ['0, 1,0,', num2str(p(1,2)), ',', ...
    num2str(R(2)), ',', num2str(R_squared), ...
    ',',  num2str(AIC), ',', num2str(BIC),',', ...
    num2str(-1), ',', num2str(-1), ',', ...
    num2str(residDF_B), ',', num2str(residDev_B), ',', ...
    num2str(DF), ',', num2str(Deviance), ',', num2str(pChi), ',', ...
    num2str(getNumFactors(factors)), ',' factors, newline]);





%%%%%%
X = makePointArray(Predicted_Sleep_Durations, Actual_Sleep_Durations);
[epsilon, MinPts] = findBestParameters(Predicted_Sleep_Durations, Actual_Sleep_Durations);
[IDX, isNoise] = DBSCAN(X,epsilon,MinPts);

figure;
%% Plot Results
[pointX, pointY, outX, outY] = separatePoints(Predicted_Sleep_Durations, Actual_Sleep_Durations, IDX);
PlotClusterinResult(X, IDX);
title(['DBSCAN Clustering (\epsilon = ' num2str(epsilon) ', MinPts = ' num2str(MinPts) ')']);
saveas(gcf, ['Clusters_GLM_Model_OnlySig.png'], 'png');
set(gcf, 'visible', 'off');
figure;
%%%%%%%%

pointX = pointX';
pointY = pointY';
f1 = fit(pointX, pointY, 'poly1');
plot(f1,pointX,pointY);

xlabel('Predicted Sleep Duration (hrs)');
ylabel('Actual Sleep Duration (hrs)');
title(['(Outlier Removal, Only Significant Factors) GLM Model of All Students']);
[R, p] = corrcoef(pointX,pointY);
%disp(['StudentNum: ', num2str(studentNum), ' p-value: ', num2str(p(1,2))]);
R_squared=R(2)^2;

text(min(pointX) + 1   , min(pointY) + 1.5, ['R = ', num2str(R(2))]);
text(min(pointX) + 1 , min(pointY) + 1, ['R^2 = ', num2str(R_squared)]);
text(min(pointX) + 1 , min(pointY) + .5, ['p-value = ', num2str(p(1,2))]);

saveas(gcf, ['Outlier_Removal_GLM_Model_OnlySig.png'], 'png');

set(gcf, 'visible', 'off');

fprintf(fileID, ['0, 1,1,', num2str(p(1,2)), ',', ...
    num2str(R(2)), ',', num2str(R_squared), ...
    ',',  num2str(AIC), ',', num2str(BIC),',', ...
    num2str(epsilon), ',', num2str(MinPts), ',', ...
    num2str(residDF_B), ',', num2str(residDev_B), ',', ...
    num2str(DF), ',', num2str(Deviance), ',', num2str(pChi), ',', ...
    num2str(getNumFactors(factors)), ',' factors, newline]);

clearvars -except fileID








