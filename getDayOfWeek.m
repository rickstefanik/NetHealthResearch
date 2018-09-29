function DayName = getDayOfWeek(year, month, day)

[~,DayName] = weekday([month, '-', day, '-', year]);
