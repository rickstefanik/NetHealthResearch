function A = cleanArray(array, min, max)

A = array;

lower = find(array < min);
for i = 1:length(lower)
    A(lower(i)) = min;
end

higher = find(array > max);
for i = 1:length(higher)
    A(higher(i)) = min;
end