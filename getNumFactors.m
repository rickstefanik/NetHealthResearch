function numFactors = getNumFactors(s)
    numFactors = 1 + length(find(s == '+'));
end