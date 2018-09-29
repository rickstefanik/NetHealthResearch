[N, flag] = readGLMDataFile();
[glmData_isSig, glmData_PID, glmData_pvalue, glmData_R, glmData_R2, glmData_AIC, glmData_BIC, glmData_factors] = sortGLMDataFile(N);

count1 = 1;
count2 = 1;

noSigRVals = [];
sigRVals = [];
noSigAIC = [];
sigAIC = [];

for i=1:length(glmData_isSig)
    %   if ((i ~= 3) && (i ~= 8))
    if (glmData_isSig(i) == 0)
        
        noSigRVals(count1) = glmData_R(i);
        noSigAIC(count1) = glmData_AIC(i);
        count1 = count1 + 1;
        
    else
        
        sigRVals(count2) = glmData_R(i);
        sigAIC(count2) = glmData_AIC(i);
        count2 = count2 + 1;
        
    end
    %  end
end

[noSigRVals' sigRVals']
pause

ind_v=find(noSigRVals>=0);
noSigRVals=noSigRVals(ind_v);
[mean(noSigRVals) std(noSigRVals)]
noSigAIC=noSigAIC(ind_v);

ind_v=find(sigRVals>=0);
sigRVals=sigRVals(ind_v);
[mean(sigRVals) std(sigRVals)]
sigAIC=sigAIC(ind_v);

% pause

boxplot(noSigRVals);
title('R values, GLM models with all factors')
figure;
boxplot(noSigAIC);
title('AIC values, GLM models with all factors')
figure;
boxplot(sigRVals);
title('R values, GLM models with only significant factors')
figure;
boxplot(sigAIC);
title('AIC values, GLM models with only significant factors')



