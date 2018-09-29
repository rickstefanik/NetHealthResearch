function prevDate = getPreviousDate(year, month, day)
dayNum = str2double(day) - 1;
monthNum = str2double(month);
yearNum = str2double(year);

if (dayNum < 1)
    monthNum = monthNum - 1;
    if (monthNum < 1)
        yearNum = yearNum - 1;
        monthNum = 12;
    end
    dayNum = eomday(yearNum, monthNum);
end

prevDate = [num2str(yearNum), '-', num2str(monthNum), '-', num2str(dayNum)];
end