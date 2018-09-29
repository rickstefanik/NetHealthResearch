function [glmmData_isSig, glmmData_PID, glmmData_pvalue, glmmData_R, glmmData_R2, glmmData_AIC, glmmData_BIC, glmmData_factors] = sortGLMMDataFile(N)    


glmmData_isSig = N{1, 1}(:,1);
glmmData_PID = N{1, 2}(:,1);
glmmData_pvalue = N{1, 3}(:,1);
glmmData_R = N{1, 4}(:,1);
glmmData_R2 = N{1, 5}(:,1);
glmmData_AIC = N{1, 6}(:,1);
glmmData_BIC = N{1, 7}(:,1);
glmmData_factors = N{1, 8}(:,1);