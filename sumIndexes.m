function A = sumIndexes(indexes, data)
    A = 0;
    for i =1:length(indexes)
        A = A + data(indexes(i));
    end
end