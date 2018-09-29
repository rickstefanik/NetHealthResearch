function A = translateDayOfWeek(B)
if (strcmp(B, 'Sun'))
    A = [0, 0, 0, 0, 0, 0];
elseif (strcmp(B, 'Mon'))
    A = [0, 0, 0, 0, 0, 1];
elseif (strcmp(B, 'Tue'))
    A = [0, 0, 0, 0, 1, 0];
elseif (strcmp(B, 'Wed'))
    A = [0, 0, 0, 1, 0, 0];
elseif (strcmp(B, 'Thu'))
    A = [0, 0, 1, 0, 0, 0];
elseif (strcmp(B, 'Fri'))
    A = [0, 1, 0, 0, 0, 0];
else
    A = [1, 0, 0, 0, 0, 0];
end

end