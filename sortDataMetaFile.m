function [metaPID, metaRow, metaIndex, metaSleepDuration, metaRestlessDuration, metaAS0, metaAS1, metaAS2, metaAS3, ...
    metaCalories0, metaCalories1, metaCalories2, metaCalories3, metaScreenUsage, metaNapDuration, metaDay, metaPartOfWeek, ...
    metaPartOfSemester, metaMeanTemp, metaMedianTemp, metaDailyAudioUsage, metaPreSleepAudioUsage, ...
    metaPreSleepScreenUsage, metaPreSleepAudioAndScreenInteraction, ...
    metaPreviousNightSleepDuration, ...
    metaMinToFallAsleep, metaInBedAudioUsage, metaInBedScreenUsage] = sortDataMetaFile(N)    

metaPID = N{1, 1}(:,1);
metaRow = N{1, 2}(:,1);
metaIndex = N{1, 3}(:,1);
metaSleepDuration = N{1, 4}(:,1);
metaRestlessDuration = N{1, 5}(:,1);
metaAS0 = N{1, 6}(:,1);
metaAS1 = N{1, 7}(:,1);
metaAS2 = N{1, 8}(:,1);
metaAS3 = N{1, 9}(:,1);
metaCalories0 = N{1, 10}(:,1);
metaCalories1 = N{1, 11}(:,1);
metaCalories2 = N{1, 12}(:,1);
metaCalories3 = N{1, 13}(:,1);
metaScreenUsage = N{1, 14}(:,1);
metaNapDuration = N{1, 15}(:,1);
metaDay = N{1, 16}(:,1);
metaPartOfWeek = N{1, 17}(:,1);
metaPartOfSemester = N{1, 18}(:,1);
metaMeanTemp = N{1, 19}(:,1);
metaMedianTemp = N{1, 20}(:,1);
metaDailyAudioUsage = N{1, 21}(:,1);
metaPreSleepAudioUsage = N{1, 22}(:,1);
metaPreSleepScreenUsage = N{1, 23}(:,1);
metaPreSleepAudioAndScreenInteraction = N{1, 24}(:,1);
metaPreviousNightSleepDuration = N{1, 25}(:,1);
metaMinToFallAsleep = N{1, 26}(:,1);
metaInBedAudioUsage = N{1, 27}(:,1);
metaInBedScreenUsage = N{1, 28}(:,1);
