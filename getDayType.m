function dayType = getDayType(year, month, day)
year = str2double(year);
month = str2double(month);
day = str2double(day);

if (year == 2015)
    if (month == 10)
        if ((day >= 12) && (day <= 16))
            dayType = 'Exam';
            return
        end
        if ((day >= 17) && (day <= 15))
            dayType = 'Break';
            return
        end
    end
    if (month == 11)
        if ((day >= 25) && (day <= 29))
            dayType = 'Break';
            return
        end
    end
    if (month == 12)
        if ((day >= 11) && (day <= 13))
            dayType = 'Reading Day';
            return
        end
        if ((day >= 14) && (day <= 18))
            dayType = 'Exam';
            return
        end
        if ((day >= 19) && (day <= 31))
            dayType = 'Break';
            return
        end
    end
end

if (year == 2016)
    if (month == 1)
        if ((day >= 1) && (day <= 11))
            dayType = 'Break';
            return
        end
    end
    if (month == 2)
        if (day == 29)
            dayType = 'Exam';
            return
        end
    end
    if (month == 3)
        if ((day >= 1) && (day <= 4))
            dayType = 'Exam';
            return
        end
        if ((day >= 5) && (day <= 13))
            dayType = 'Break';
            return
        end
        if ((day >= 25) && (day <= 28))
            dayType = 'Break';
            return
        end
    end
    if (month == 4)
        if ((day >= 28) && (day <= 30))
            dayType = 'Reading Day';
            return
        end
    end
    if (month == 5)
        if (day == 1)
            dayType = 'Reading Day';
            return
        end
        if ((day >= 2) && (day <= 6))
            dayType = 'Exam';
            return
        end
        if ((day >= 7) && (day <= 31))
            dayType = 'Break';
            return
        end
    end
    if ((month == 6) || (month == 7))
        dayType = 'Break';
        return
    end
    if (month == 8)
        if ((day >= 1) && (day <= 14))
            dayType = 'Break';
            return
        end
    end
    if (month == 10)
        if ((day >= 10) && (day <= 14))
            dayType = 'Exam';
            return
        end
        if ((day >= 15) && (day <= 23))
            dayType = 'Break';
            return
        end
    end
    if (month == 11)
        if ((day >= 23) && (day <= 27))
            dayType = 'Break';
            return
        end
    end
    if (month == 12)
        if ((day >= 9) && (day <= 11))
            dayType = 'Reading Day';
            return
        end
        if ((day >= 12) && (day <= 16))
            dayType = 'Exam';
            return
        end
        if ((day >= 17) && (day <= 31))
            dayType = 'Break';
            return
        end
    end
    
    
end
dayType = 'Regular';

end