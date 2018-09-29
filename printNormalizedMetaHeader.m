function printNormalizedMetaHeader(fileID)
fprintf(fileID, ['PID, Row#, Original Index from DailySleepNoEmpty csv, Sleep Duration (hrs), Restless Duration (min), Acitivty State 0 (min), Activity State 1 (min),', ...
    ' Activity State 2 (min), Activity State 3 (min), Calories Burned State 0, Calories Burned State 1, Calories Burned State 2, Calories Burned State 3, Screen Usage (min),', ...
    ' Nap Data (hrs), isSaturday, isFriday, isThursday, isWednesday, isTuesday, isMonday, isWeekend, isRegular,' ...
    ' isReadingDay, isBreak, Mean Temperature, Median Temperature, Daily Audio Usage (min), Audio Usage 30 min before Sleep (min),', ...
    ' Screen Usage 30 Min Before Sleep (min), Audio and Screen 30 Min Before Sleep Interaction, Previous Night Sleep Duration (hrs),', ... 
    ' Min to Fall Asleep, Audio Usage in Bed (min), Screen Usage in Bed (min)', newline]);
end