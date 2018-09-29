function A = isoutlier(B)


Q1 = quantile(B,0.25);
Q3 = quantile(B,0.75);
IQR = Q3 - Q1;

min = Q1 - (1.5 * IQR);
max = Q3 + (1.5 * IQR);

A = (100 * (length(find(B < min | B > max)))) / (length(B));

end