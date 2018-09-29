function A = isoutlierPoint(p, B)


Q1 = quantile(B,0.25);
Q3 = quantile(B,0.75);
IQR = Q3 - Q1;

min = Q1 - (1.5 * IQR);
max = Q3 + (1.5 * IQR);

if ((p < min) || (p > max))
    A = 0;
else
    A = 1;
end