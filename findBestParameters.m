function [epsilon, MinPts] = findBestParameters(Predicted_Sleep_Durations, Actual_Sleep_Durations)
X = makePointArray(Predicted_Sleep_Durations, Actual_Sleep_Durations);
bestRVal = -1;
bestE = -1;
bestM = -1;
for e=0:.05:10
    for m=1:1:10
       [IDX, isNoise] = DBSCAN(X,e,m);
       [pointX, pointY, outX, outY] = separatePoints(Predicted_Sleep_Durations, Actual_Sleep_Durations, IDX);
       pointX = pointX';
       pointY = pointY';
       [R, p] = corrcoef(pointX,pointY);
       rval = R(2);
 %      disp(num2str(rval));
       if ((rval > bestRVal) && (length(pointX) >= (.5 * length(Predicted_Sleep_Durations))))
          bestE = e;
          bestM = m;
          bestRVal = rval;
       end
    end
end

if ((bestE == -1) && (bestM == 1))
    bestE = 1.75;
    bestM = 5;
end
epsilon = bestE;
MinPts = bestM;