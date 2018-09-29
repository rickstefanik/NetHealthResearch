%Randomly select person ID values to be used in train and validate files.
fclose('all');
clear;
[N, flag] = readDataMetaFile();
if (flag == 0)
    disp(['File could not be found for data meta file']);
    exit;
end
[metaPID, metaRow, metaIndex, metaSleepDuration, metaAS0, metaAS1, metaAS2, metaAS3, ...
    metaCalories, metaScreenUsage, metaNapDuration, metaDay, metaPartOfWeek, ...
    metaPartOfSemester, metaMeanTemp, metaMedianTemp] = sortDataMetaFile(N);

%Desired Number of Training and Validation Files to Create
Files = 10;

F = 30;

for i = 1:Files
    newFileName = ['Train_', num2str(i), '.csv'];
    fileID = fopen(newFileName,'w');
    fprintf(fileID, ['PID, Row#', newline]);
    
    newFileName = ['Validate_', num2str(i), '.csv'];
    fileID2 = fopen(newFileName,'w');
    fprintf(fileID2, ['PID, Row#', newline]);
    
    
    for studentNum = 1:F
        studentIndexes = find(metaPID == studentNum);
        if (length(studentIndexes) == 0)
            continue;
        end
        rowSubset = metaRow(studentIndexes(1):studentIndexes(length(studentIndexes)));
        [set_75, set_25] = split_75_25(rowSubset);
        s = num2str(studentNum);
        
        newFileName = ['Train_Student', num2str(studentNum), '_', num2str(i), '.csv'];
        fileID3 = fopen(newFileName,'w');
        fprintf(fileID3, ['PID, Row#', newline]);
        
        newFileName = ['Validate_Student', num2str(studentNum), '_', num2str(i), '.csv'];
        fileID4 = fopen(newFileName,'w');
        fprintf(fileID4, ['PID, Row#', newline]);
        
        for j = 1:length(set_75)
            fprintf(fileID, [ s, ',', num2str(set_75(j)), newline]);
            fprintf(fileID3, [ s, ',', num2str(set_75(j)), newline]);
        end
        
        for j = 1:length(set_25)
            fprintf(fileID2, [s, ',', num2str(set_25(j)), newline]);
            fprintf(fileID4, [ s, ',', num2str(set_25(j)), newline]);
        end
        
        fclose(fileID3);
        fclose(fileID4);
        
    end
    fclose(fileID);
    fclose(fileID2);
    clearvars -except F Files metaRow metaPID
end