function [pointX, pointY, outX, outY] = separatePoints(X, Y, IDX)

pointX = [];
pointY = [];
outX = [];
outY = [];

pointCounter = 1;
outCounter = 1;
for i = 1:length(IDX)
    if IDX(i) ~= 0
        pointX(pointCounter) = X(i);
        pointY(pointCounter) = Y(i);
        pointCounter = pointCounter + 1;
    else
        outX(outCounter) = X(i);
        outY(outCounter) = Y(i);
        outCounter = outCounter + 1;   
    end
end
end