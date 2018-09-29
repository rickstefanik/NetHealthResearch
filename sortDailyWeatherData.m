function [weatherYearData, weatherMonthData, weatherDayData, weatherMeanData, weatherMedianData] = sortDailyWeatherData(M)    

weatherYearData = M{1, 1}(:, 1);
weatherMonthData = M{1, 2}(:, 1);
weatherDayData = M{1, 3}(:, 1);
weatherMeanData = M{1, 4}(:, 1);
weatherMedianData = M{1, 5}(:, 1);