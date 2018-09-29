function [nonOutliersX, outliersX] = myDBScan(X, Y, radius, numPoints)
numOutliersCount = 1;
outlierCount = 1;

isVisited = zeros(length(X));

for i = 1:length(X)
    iX = X(i);
    iY = Y(i);
    surroundPointsX = [];
    surroundPointsY = []; 
    sPointCounter = 1;
    for j = 1:length(X)
        jX = X(j); 
        jY = Y(j);
        if i ~= j
            if (myDist(iX, iY, jX, jY) <= radius)
                surroundPointsX(sPointCounter) = jX;
                surroundPointsX(sPointCounter) = jX;
                sPointCounter = sPointCounter + 1;
            end
        end     
    end
end

end