%Create graphs of scree usage duration with outliers colored in red
clear;
F = 1;

count = 1;

graph1 = true;
graph2 = true;

for studentNum = 1:F
    N = readPhoneEngagementFile(studentNum);
    [yearData, monthData, dayData, sessionCountData, durationData, normalizedDurationData, percentDurationData] = sortPhoneEngagementData(N);
    durationDataFixed = cleanArray(durationData, 0, 1440);
    nonZeroDayDurationIndexes = find(durationDataFixed > 0);
    for i = 1:length(nonZeroDayDurationIndexes)
        nonZeroDayDurations(i) = durationDataFixed(nonZeroDayDurationIndexes(i));
        allNonZeroDurations(count) = durationDataFixed(nonZeroDayDurationIndexes(i));
        count = count + 1;
    end
    
    if (graph1)
        dayDurationOutlier = getOutlierIndexes(nonZeroDayDurations);
        x = linspace(1, length(durationDataFixed), length(durationDataFixed));
        h1 = bar(x, diag(durationDataFixed), 'stacked');
        title(['Bar Graph of Student ', num2str(studentNum), ': Local Outliers Red']);
        xlabel('Days');
        ylabel('Minutes')
        
        for i = 1:length(durationData)
            if (durationDataFixed(i) == 0)
                
            elseif (isoutlierPoint(durationDataFixed(i), nonZeroDayDurations) == 0)
                set(h1(i),'facecolor', 'r')
            else
                set(h1(i),'facecolor', 'g')
            end
        end
        
        %Fall 2015 Midterms Oct 11 - Oct17 (71 days after start)
        %Fall 2015 Finals Dec 13 - Dec 19 (134 days after start)
        %Spring 2016 Midterms Feb 28 - March 5 (211 days after start)
        %Spring 2016 Finals May 1 - May 7 (274 days after start)
        %Fall 2016 Midterms Oct 9 - Oct 159 (435 days after start)
        %Fall 2016 Finals Dec 11 - Dec 17 (498 days after start)
        hold on
        plot([71 77], [700 700], 'Color', 'black', 'LineWidth', 2);
        hold on
        plot([134 140], [700 700], 'Color', 'black', 'LineWidth', 2);
        hold on
        plot([211 217], [700 700], 'Color', 'black', 'LineWidth', 2);
        hold on
        plot([274 280], [700 700], 'Color', 'black', 'LineWidth', 2);
        hold on
        plot([435 441], [700 700], 'Color', 'black', 'LineWidth', 2);
        hold on
        plot([498 504], [700 700], 'Color', 'black', 'LineWidth', 2);
        figure;
    end
end

if (graph2)
    for studentNum = 1:F
        N = readPhoneEngagementFile(studentNum);
        [yearData, monthData, dayData, sessionCountData, durationData, normalizedDurationData, percentDurationData] = sortPhoneEngagementData(N);
        durationDataFixed = cleanArray(durationData, 0, 1440);
        x = linspace(1, length(durationDataFixed), length(durationDataFixed));
        figure;
        h = bar(x, diag(durationDataFixed),'stacked');
        title(['Bar Graph of Student ', num2str(studentNum), ': Global Outliers Red']);
        xlabel('Days');
        ylabel('Minutes')
        
        for i = 1:length(durationDataFixed)
            if (durationDataFixed(i) == 0)
                
            elseif (isoutlierPoint(durationDataFixed(i), allNonZeroDurations) == 0)
                set(h(i),'facecolor', 'r')
            else
                set(h(i),'facecolor', 'g')
            end
        end
        hold on
        plot([71 77], [700 700], 'Color', 'black', 'LineWidth', 2);
        hold on
        plot([134 140], [700 700], 'Color', 'black', 'LineWidth', 2);
        hold on
        plot([211 217], [700 700], 'Color', 'black', 'LineWidth', 2);
        hold on
        plot([274 280], [700 700], 'Color', 'black', 'LineWidth', 2);
        hold on
        plot([435 441], [700 700], 'Color', 'black', 'LineWidth', 2);
        hold on
        plot([498 504], [700 700], 'Color', 'black', 'LineWidth', 2);
        figure;
    end
end
