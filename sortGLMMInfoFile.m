function [AIC, BIC, factors] = sortGLMMInfoFile(M)

AIC = str2double(M{1, 1}{2});
BIC = str2double(M{1, 1}{4});
factors = M{1,1}{6};
if (length(M{1,1}) == 7)
    factors = [factors, M{1,1}{7}];
end