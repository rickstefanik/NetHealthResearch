%Normalize the meta file, so it can be used in RStudio.
clear;
[N, flag] = readDataMetaFile();
if (flag == 0)
    disp(['File could not be found for data meta file']);
    exit;
end

[metaPID, metaRow, metaIndex, metaSleepDuration, metaRestlessDuration, metaAS0, metaAS1, metaAS2, metaAS3, ...
    metaCalories0, metaCalories1, metaCalories2, metaCalories3, metaScreenUsage, metaNapDuration, metaDay, metaPartOfWeek, ...
    metaPartOfSemester, metaMeanTemp, metaMedianTemp, metaDailyAudioUsage, metaPreSleepAudioUsage, ...
    metaPreSleepScreenUsage, metaPreSleepAudioAndScreenInteraction, ...
    metaPreviousNightSleepDuration, ...
    metaMinToFallAsleep, metaInBedAudioUsage, metaInBedScreenUsage] = sortDataMetaFile(N);


metaNormalizedSleepDuration = normalizeArr(metaSleepDuration);
metaNormalizedAS0 = normalizeArr(metaAS0);
metaNormalizedAS1 = normalizeArr(metaAS1);
metaNormalizedAS2 = normalizeArr(metaAS2);
metaNormalizedAS3 = normalizeArr(metaAS3);
metaNormalizedCalories0 = normalizeArr(metaCalories0);
metaNormalizedCalories1 = normalizeArr(metaCalories1);
metaNormalizedCalories2 = normalizeArr(metaCalories2);
metaNormalizedCalories3 = normalizeArr(metaCalories3);
metaNormalizedScreenUsage = normalizeArr(metaScreenUsage);
metaNormalizedNapDuration = normalizeArr(metaNapDuration);
metaNormalizedMeanTemp = normalizeArr(metaMeanTemp);
metaNormalizedMedianTemp = normalizeArr(metaMedianTemp);
metaNormalizedDailyAudioUsage = normalizeArr(metaDailyAudioUsage);
metaNormalizedPreSleepAudioUsage = normalizeArr(metaPreSleepAudioUsage);
metaNormalizedPreSleepScreenUsage = normalizeArr(metaPreSleepScreenUsage);
metaNormalizedPreSleepAudioAndScreenInteraction = normalizeArr(metaPreSleepAudioAndScreenInteraction);
metaNormalizedPreviousNightSleepDuration = normalizeArr(metaPreviousNightSleepDuration);
metaNormalizedMinToFallAsleep = normalizeArr(metaMinToFallAsleep);
metaNormalizedInBedAudioUsage = normalizeArr(metaInBedAudioUsage);
metaNormalizedInBedScreenUsage = normalizeArr(metaInBedScreenUsage);

newFileName = 'NormalizedMetaFile.csv';
fileID = fopen(newFileName,'w');
printNormalizedMetaHeader(fileID);

for i=1:length(metaPID)
    dayVars = translateDayOfWeek(metaDay{i});
    partOfWeekVars = translatePartOfWeek(metaPartOfWeek{i});
    partOfSemesterVars = translatePartOfSemester(metaPartOfSemester{i});
    fprintf(fileID, [num2str(metaPID(i)), ',', num2str(metaRow(i)), ',', num2str(metaIndex(i)), ',', num2str(metaSleepDuration(i)), ...
        ',', num2str(metaRestlessDuration(i)), ... 
        ',', num2str(metaNormalizedAS0(i)), ',', num2str(metaNormalizedAS1(i)), ',', num2str(metaNormalizedAS2(i)), ...
        ',', num2str(metaNormalizedAS3(i)), ',', num2str(metaNormalizedCalories0(i)), ...
        ',', num2str(metaNormalizedCalories1(i)), ...
        ',', num2str(metaNormalizedCalories2(i)), ...
        ',', num2str(metaNormalizedCalories3(i)), ...
        ',', num2str(metaNormalizedScreenUsage(i)), ...
        ',', num2str(metaNormalizedNapDuration(i)), ',', num2str(dayVars(1)), ...
        ',', num2str(dayVars(2)), ',', num2str(dayVars(3)), ',', num2str(dayVars(4)), ...
        ',', num2str(dayVars(5)), ',', num2str(dayVars(6)), ',', num2str(partOfWeekVars(1)), ...
        ',', num2str(partOfSemesterVars(1)), ',', num2str(partOfSemesterVars(2)), ...
        ',', num2str(partOfSemesterVars(3)), ...
        ',', num2str(metaNormalizedMeanTemp(i)), ',', num2str(metaNormalizedMedianTemp(i)), ...
        ',', num2str(metaNormalizedDailyAudioUsage(i)), ...
        ',', num2str(metaNormalizedPreSleepAudioUsage(i)), ...
        ',', num2str(metaNormalizedPreSleepScreenUsage(i)), ...
        ',', num2str(metaNormalizedPreSleepAudioAndScreenInteraction(i)), ...
        ',', num2str(metaNormalizedPreviousNightSleepDuration(i)), ...
        ',', num2str(metaNormalizedMinToFallAsleep(i)), ...
        ',', num2str(metaNormalizedInBedAudioUsage(i)), ...
        ',', num2str(metaNormalizedInBedScreenUsage(i)),newline]);
end