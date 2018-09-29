clear;
F = 30;

newFileName = 'GLM_AllSubjects_Data.csv';
%newFileName = 'TestingToGetPlots.csv';
fileID = fopen(newFileName,'w');
fprintf(fileID, ['Significant Figures Only (true=1), Used Outlier Removal (true=1), PID, p-value, R, R^2, AIC, BIC, epsilon, MinPts, residDF, residDev, DF, Deviance, p-val ChiSq, number of factors, factors', newline]);

for studentNum = 1:F
    
    [residDF_A, residDF_B, residDev_A, residDev_B, DF, Deviance, pChi] = getChiVals(studentNum);
    
    filename = ['Predicted_GLM_Student_', num2str(studentNum) '.csv'];
    [M, flag] = readSecondCol(filename);
    if (flag == 0)
        disp(['File could not be found for student ', num2str(studentNum)]);
        continue;
    end
    Predicted_Sleep_Durations = sortSecondCol(M);
    
    filename = ['Actual_GLM_Student_', num2str(studentNum) '.csv'];
    [M, flag] = readSecondCol(filename);
    if (flag == 0)
        disp(['File could not be found for student ', num2str(studentNum)]);
        continue;
    end
    Actual_Sleep_Durations = sortSecondCol(M);
    
    f1 = fit(Predicted_Sleep_Durations, Actual_Sleep_Durations, 'poly1');
    
    plot(f1,Predicted_Sleep_Durations,Actual_Sleep_Durations);
    xlabel('Predicted Sleep Duration (hrs)');
    ylabel('Actual Sleep Duration (hrs)');
    title(['(No Ouliter Removal, All Factors) GLM Model of Student ', num2str(studentNum)]);
    
    
    [M, flag] = readGLMInfoFile(studentNum);
    if (flag == 0)
        disp(['File could not be found for student ', num2str(studentNum)]);
        continue;
    end
    [AIC, BIC, factors] = sortGLMInfoFile(M);
    
    [R, p] = corrcoef(Predicted_Sleep_Durations,Actual_Sleep_Durations);
    %disp(['StudentNum: ', num2str(studentNum), ' p-value: ', num2str(p(1,2))]);
    R_squared=R(2)^2;
    
    text(min(Predicted_Sleep_Durations) + 1   , min(Actual_Sleep_Durations) + 1.5, ['R = ', num2str(R(2))]);
    text(min(Predicted_Sleep_Durations) + 1 , min(Actual_Sleep_Durations) + 1, ['R^2 = ', num2str(R_squared)]);
    text(min(Predicted_Sleep_Durations) + 1 , min(Actual_Sleep_Durations) + .5, ['p-value = ', num2str(p(1,2))]);
    saveas(gcf, ['No_Outlier_Removal_GLM_Model_of_Student_', num2str(studentNum), '.png'], 'png');
    
    set(gcf, 'visible', 'off');
    
    
    fprintf(fileID, ['0,0,', num2str(studentNum), ',', num2str(p(1,2)), ',', ...
        num2str(R(2)), ',', num2str(R_squared), ...
        ',',  num2str(AIC), ',', num2str(BIC),',', ...
        num2str(-1), ',', num2str(-1), ',', ...
        num2str(residDF_A), ',', num2str(residDev_A), ',', ...
        num2str(DF), ',', num2str(Deviance), ',', num2str(pChi), ',', ...
        num2str(getNumFactors(factors)), ',' factors, newline]);
    
    
    
    
    
    
    %%%%%%
    X = makePointArray(Predicted_Sleep_Durations, Actual_Sleep_Durations);
    
    
    
    %epsilon=1.75;
    %epsilon = 1000;
    %MinPts=5;
    [epsilon, MinPts] = findBestParameters(Predicted_Sleep_Durations, Actual_Sleep_Durations);
    [IDX, isNoise] = DBSCAN(X,epsilon,MinPts);
    
    figure;
    %% Plot Results
    [pointX, pointY, outX, outY] = separatePoints(Predicted_Sleep_Durations, Actual_Sleep_Durations, IDX);
    PlotClusterinResult(X, IDX);
    title(['Clusters GLM Model of Student ', num2str(studentNum)]);
    saveas(gcf, ['Clusters_GLM_Model_of_Student_', num2str(studentNum), '.png'], 'png');
    %title(['DBSCAN Clustering (\epsilon = ' num2str(epsilon) ', MinPts = ' num2str(MinPts) ')']);
    set(gcf, 'visible', 'off');
    figure;
    %%%%%%%%
    
    pointX = pointX';
    pointY = pointY';
    f1 = fit(pointX, pointY, 'poly1');
    plot(f1,pointX,pointY);
    
    xlabel('Predicted Sleep Duration (hrs)');
    ylabel('Actual Sleep Duration (hrs)');
    title(['(Outlier Removal, All Factors) GLM Model of Student ', num2str(studentNum)]);
    
    [R, p] = corrcoef(pointX,pointY);
    %disp(['StudentNum: ', num2str(studentNum), ' p-value: ', num2str(p(1,2))]);
    R_squared=R(2)^2;
    
    text(min(pointX) + 1   , min(pointY) + 1.5, ['R = ', num2str(R(2))]);
    text(min(pointX) + 1 , min(pointY) + 1, ['R^2 = ', num2str(R_squared)]);
    text(min(pointX) + 1 , min(pointY) + .5, ['p-value = ', num2str(p(1,2))]);
    saveas(gcf, ['Outlier_Removal_GLM_Model_of_Student_', num2str(studentNum), '.png'], 'png');
    set(gcf, 'visible', 'off');
    figure;
    
    
    [M, flag] = readGLMInfoFile(studentNum);
    if (flag == 0)
        disp(['File could not be found for student ', num2str(studentNum)]);
        continue;
    end
    [AIC, BIC, factors] = sortGLMInfoFile(M);
    
    
    
    
    
    
    %    fprintf(fileID, ['0,1,', num2str(studentNum), ',', num2str(p(1,2)), ',', num2str(R(2)), ',', num2str(R_squared), ...
    %        ',',  num2str(AIC), ',', num2str(BIC), ',' factors, newline]);
    fprintf(fileID, ['0,1,', num2str(studentNum), ',', num2str(p(1,2)), ',', ...
        num2str(R(2)), ',', num2str(R_squared), ...
        ',',  num2str(AIC), ',', num2str(BIC),',', ...
        num2str(epsilon), ',', num2str(MinPts), ',',...
        num2str(residDF_A), ',', num2str(residDev_A), ',', ...
        num2str(DF), ',', num2str(Deviance), ',', num2str(pChi), ',', ...
        num2str(getNumFactors(factors)), ',' factors, newline]);
    
    
   % fclose(filename);
    
    
    clearvars -except studentNum F fileID
    
    
    
    
    
    
    
    
    
    
    
    
    %% Perform for only significant factors
    
    filename = ['Predicted_GLM_Student_OnlySig_', num2str(studentNum) '.csv'];
    
    [residDF_A, residDF_B, residDev_A, residDev_B, DF, Deviance, pChi] = getChiVals(studentNum);
    [M, flag] = readSecondCol(filename);
    if (flag == 0)
        disp(['File could not be found for student ', num2str(studentNum)]);
        continue;
    end
    Predicted_Sleep_Durations = sortSecondCol(M);
    
    filename = ['Actual_GLM_Student_OnlySig_', num2str(studentNum) '.csv'];
    [M, flag] = readSecondCol(filename);
    if (flag == 0)
        disp(['File could not be found for student ', num2str(studentNum)]);
        continue;
    end
    Actual_Sleep_Durations = sortSecondCol(M);
    
    f1 = fit(Predicted_Sleep_Durations, Actual_Sleep_Durations, 'poly1');
    
    plot(f1,Predicted_Sleep_Durations,Actual_Sleep_Durations);
    xlabel('Predicted Sleep Duration (hrs)');
    ylabel('Actual Sleep Duration (hrs)');
    title(['(No Ouliter Removal, Only Significant Factors) GLM Model of Student ', num2str(studentNum)]);
    [R, p] = corrcoef(Predicted_Sleep_Durations,Actual_Sleep_Durations);
    %disp(['StudentNum: ', num2str(studentNum), ' p-value: ', num2str(p(1,2))]);
    R_squared=R(2)^2;
    
    [M, flag] = readGLMOnlySigInfoFile(studentNum);
    if (flag == 0)
        disp(['File could not be found for student ', num2str(studentNum)]);
        continue;
    end
    [AIC, BIC, factors] = sortGLMInfoFile(M);
    
    
    text(min(Predicted_Sleep_Durations) + 1   , min(Actual_Sleep_Durations) + 1.5, ['R = ', num2str(R(2))]);
    text(min(Predicted_Sleep_Durations) + 1 , min(Actual_Sleep_Durations) + 1, ['R^2 = ', num2str(R_squared)]);
    text(min(Predicted_Sleep_Durations) + 1 , min(Actual_Sleep_Durations) + .5, ['p-value = ', num2str(p(1,2))]);
    saveas(gcf, ['No_Outlier_Removal_GLM_Model_of_Student_', num2str(studentNum), '.png'], 'png');
    set(gcf, 'visible', 'off');
    
    
    
    
    fprintf(fileID, ['1,0,', num2str(studentNum), ',', num2str(p(1,2)), ',', ...
        num2str(R(2)), ',', num2str(R_squared), ...
        ',',  num2str(AIC), ',', num2str(BIC),',', ...
        num2str(-1), ',', num2str(-1), ',',...
        num2str(residDF_B), ',', num2str(residDev_B), ',', ...
        num2str(DF), ',', num2str(Deviance), ',', num2str(pChi), ',', ...
        num2str(getNumFactors(factors)), ',' factors, newline]);
    
    
    
    
    
    %%%%%%
    X = makePointArray(Predicted_Sleep_Durations, Actual_Sleep_Durations);
    %epsilon=1.75;
    % epsilon = 1000;
    % MinPts=5;
    [epsilon, MinPts] = findBestParameters(Predicted_Sleep_Durations, Actual_Sleep_Durations);
    
    [IDX, isNoise] = DBSCAN(X,epsilon,MinPts);
    
    figure;
    %% Plot Results
    [pointX, pointY, outX, outY] = separatePoints(Predicted_Sleep_Durations, Actual_Sleep_Durations, IDX);
    PlotClusterinResult(X, IDX);
    % title(['DBSCAN Clustering (\epsilon = ' num2str(epsilon) ', MinPts = ' num2str(MinPts) ')']);
    title(['(Only Significant Factors) Clusters GLM Model of Student ', num2str(studentNum)]);
    saveas(gcf, ['Clusters_GLM_Model_OnlySig_of_Student_', num2str(studentNum), '.png'], 'png');
    set(gcf, 'visible', 'off');
    figure;
    %%%%%%%%
    
    pointX = pointX';
    pointY = pointY';
    f1 = fit(pointX, pointY, 'poly1');
    plot(f1,pointX,pointY);
    xlabel('Predicted Sleep Duration (hrs)');
    ylabel('Actual Sleep Duration (hrs)');
    title(['(Outlier Removal, Only Significant Factors) GLM Model of Student ', num2str(studentNum)]);
    [R, p] = corrcoef(pointX,pointY);
    %disp(['StudentNum: ', num2str(studentNum), ' p-value: ', num2str(p(1,2))]);
    R_squared=R(2)^2;
    
    text(min(pointX) + 1   , min(pointY) + 1.5, ['R = ', num2str(R(2))]);
    text(min(pointX) + 1 , min(pointY) + 1, ['R^2 = ', num2str(R_squared)]);
    text(min(pointX) + 1 , min(pointY) + .5, ['p-value = ', num2str(p(1,2))]);
    saveas(gcf, ['Outlier_Removal_GLM_Model_OnlySig_of_Student_', num2str(studentNum), '.png'], 'png');
    set(gcf, 'visible', 'off');
    if (studentNum ~= F)
        figure;
    end
    
    
    [M, flag] = readGLMOnlySigInfoFile(studentNum);
    if (flag == 0)
        disp(['File could not be found for student ', num2str(studentNum)]);
        continue;
    end
    [AIC, BIC, factors] = sortGLMInfoFile(M);
    
    
    
    
    
    
    
    fprintf(fileID, ['1,1,', num2str(studentNum), ',', num2str(p(1,2)), ',', ...
        num2str(R(2)), ',', num2str(R_squared), ...
        ',',  num2str(AIC), ',', num2str(BIC),',', ...
        num2str(epsilon), ',', num2str(MinPts), ',',...
        num2str(residDF_B), ',', num2str(residDev_B), ',', ...
        num2str(DF), ',', num2str(Deviance), ',', num2str(pChi), ',', ...
        num2str(getNumFactors(factors)), ',' factors, newline]);
    
    
    %    fprintf(fileID, ['1,', num2str(studentNum), ',', num2str(p(1,2)), ',', num2str(R(2)), ',', num2str(R_squared), ...
    %        ',',  num2str(AIC), ',', num2str(BIC), ',' factors, newline]);
    
  % fclose(filename);
    clearvars -except studentNum F fileID
    
    
end