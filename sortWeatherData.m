function [weatherDayData, weatherHourData, weatherTemperatureData] = sortWeatherData(M)    

weatherDayData = M{1, 1}(:, 1);
weatherHourData = M{1, 2}(:, 1);
weatherTemperatureData = M{1, 3}(:, 1);