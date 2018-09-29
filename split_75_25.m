function [A, B] = split_75_25(C)

splitPoint = floor(.75 * length(C));

shuf = randperm(numel(C));

A = shuf(1:splitPoint);
B = shuf(splitPoint + 1:length(shuf));

end