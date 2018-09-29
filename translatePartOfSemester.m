function A = translatePartOfSemester(B)
if (strcmp(B,'Exam'))
    A = [0, 0, 0];
elseif (strcmp(B, 'Break'))
    A = [0, 0, 1];
elseif (strcmp(B, 'Reading Day'))
    A = [0, 1, 0];
else
    A = [1, 0, 0];
end