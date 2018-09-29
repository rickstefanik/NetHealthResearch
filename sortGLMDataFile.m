function [glmData_isSig, glmData_PID, glmData_pvalue, glmData_R, glmData_R2, glmData_AIC, glmData_BIC, glmData_factors] = sortGLMDataFile(N)    


glmData_isSig = N{1, 1}(:,1);
glmData_PID = N{1, 2}(:,1);
glmData_pvalue = N{1, 3}(:,1);
glmData_R = N{1, 4}(:,1);
glmData_R2 = N{1, 5}(:,1);
glmData_AIC = N{1, 6}(:,1);
glmData_BIC = N{1, 7}(:,1);
glmData_factors = N{1, 8}(:,1);
