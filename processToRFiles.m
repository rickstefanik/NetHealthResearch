%Creates train and validate files that are ready to use in RStudio
clear;
numFiles = 10;

F = 30;

[M, flag] = readAsLines('NormalizedMetaFile.csv');
if (flag == 0)
    disp(['File could not be found for normalized meta file']);
    exit;
end
fileLines = sortLines(M);

[N, flag] = readDataMetaFile();
if (flag == 0)
    disp(['File could not be found for data meta file']);
    exit;
end

[metaPID, metaRow, metaIndex, metaSleepDuration, metaAS0, metaAS1, metaAS2, metaAS3, ...
    metaCalories, metaScreenUsage, metaNapDuration, metaDay, metaPartOfWeek, ...
    metaPartOfSemester, metaMeanTemp, metaMedianTemp, metaDailyAudioUsage, ...
    metaPreSleepAudioUsage, metaPreSleepScreenUsage, ...
    metaPreviousNightSleepDataAvailable, metaPreviousNightSleepDuration, ...
    metaMinToFallAsleep] = sortDataMetaFile(N);

for i=1:length(metaPID)
    metaID{i} = [num2str(metaPID(i)), ',', num2str(metaRow(i))];
end

for num=1:numFiles
    
    
    [N, flag] = readTrainFile(num);
    if (flag == 0)
        disp(['File could not be found for num ', num2str(num)]);
        continue;
    end
    [trainPID, trainRow] = sortTrainData(N);
        
    [N, flag] = readValidateFile(num);
    if (flag == 0)
        disp(['File could not be found for num ', num2str(num)]);
        continue;
    end
    [validatePID, validateRow] = sortValidateData(N);
    
    
    newFileName = ['Processed_Train_', num2str(num), '.csv'];
    fileID = fopen(newFileName,'w');
    printNormalizedMetaHeader(fileID);
    
    newFileName = ['Processed_Validate_', num2str(num), '.csv'];
    fileID2 = fopen(newFileName,'w');
    printNormalizedMetaHeader(fileID2);
    
    
    for i=1:length(trainPID)
        trainID{i} = [num2str(trainPID(i)), ',', num2str(trainRow(i))];
    end
    
    for i=1:length(trainID)
        h = find(ismember(metaID, trainID{i}));
        fprintf(fileID, [fileLines{h}, '\n']);
    end
    
    fclose(fileID);
    
    for studentNum = 1:F
        [N, flag] = readSpecificTrainFile(studentNum, num);
        if (flag == 0)
            disp(['File could not be found for student ', num2str(studentNum)]);
            continue;
        end
        [specificTrainPID, specificTrainRow] = sortTrainData(N);
        
        newFileName = ['Processed_Train_Student', num2str(studentNum), '_', num2str(num), '.csv'];
        fileID3 = fopen(newFileName,'w');
        printNormalizedMetaHeader(fileID3);
        
        for i=1:length(specificTrainPID)
            specificTrainID{i} = [num2str(specificTrainPID(i)), ',', num2str(specificTrainRow(i))];
        end
        
        for i=1:length(specificTrainID)
            h = find(ismember(metaID, specificTrainID{i}));
            fprintf(fileID3, [fileLines{h}, '\n']);
        end
        
        fclose(fileID3);
    end
    
    for i=1:length(validatePID)
        validateID{i} = [num2str(validatePID(i)), ',', num2str(validateRow(i))];
    end
    for i=1:length(validateID)
        h = find(ismember(metaID, validateID{i}));
        fprintf(fileID2, [fileLines{h}, '\n']);
    end
    fclose(fileID2);
    
    
    
    for studentNum = 1:F
        [N, flag] = readSpecificValidateFile(studentNum, num);
        if (flag == 0)
            disp(['File could not be found for student ', num2str(studentNum)]);
            continue;
        end
        [specificValidatePID, specificValidateRow] = sortValidateData(N);
        
        newFileName = ['Processed_Validate_Student', num2str(studentNum), '_', num2str(num), '.csv'];
        fileID4 = fopen(newFileName,'w');
        printNormalizedMetaHeader(fileID4);
        
        for i=1:length(specificValidatePID)
            specificValidateID{i} = [num2str(specificValidatePID(i)), ',', num2str(specificValidateRow(i))];
        end
        
        for i=1:length(specificValidateID)
            h = find(ismember(metaID, specificValidateID{i}));
            fprintf(fileID4, [fileLines{h}, '\n']);
        end
        fclose(fileID4);
    end
    
    clearvars -except F Files metaID numFiles fileLines 
    
end