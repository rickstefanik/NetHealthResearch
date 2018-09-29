function part = getPartOfWeek(year, month, day)

%[~,DayName] = weekday([num2str(month), '-', num2str(day), '-', num2str(year)]);
[~,DayName] = weekday([month, '-', day, '-', year]);

if (strcmpi(DayName,'Sat') || strcmpi(DayName,'Sun'))
    part = 'Weekend';
else
    part = 'Weekday';
end