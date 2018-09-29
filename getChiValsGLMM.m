function [residDF_A, residDF_B, residDev_A, residDev_B, DF, Deviance, pChi] = getChiValsGLMM()

residDF_A = -1;
residDF_B = -1;
residDev_A = -1;
residDev_B = -1;
DF = -1;
Deviance = -1;
pChi = -1;
% filename = ['GLMM_Grouping_Chisq.txt'];
% [M, flag] = readAsLines(filename);
% firstS = '';
% secondS = '';
% if (flag == 1)
%     for i=1:length(M{1})
%         %disp(M{i});
%         %disp(num2str(i));
%         if (length(M{1}{i} > 0))
%             if (M{1}{i}(1) == '1')
%                 firstS = M{1}{i};
%             end
%             if (M{1}{i}(1) == '2')
%                 secondS = M{1}{i};
%             end
%         end
%     end
% %    disp(firstS);
%     C = strsplit(firstS,' ');
% %    disp(C);
%     D = strsplit(secondS,' ');
% %    disp(D);
%     
%     residDF_A = C{2};
%     residDev_A = C{3};
%     residDF_B = D{2};
%     residDev_B = D{3};
%     DF = D{4};
%     Deviance = D{5};
%     pChi = D{6};
% end

end