%Match the survey data to the person ID's and store in file

F = 30;
[M, flag] = readMappingFile();
if (flag == 0)
    disp(['File could not be found for mapping file']);
    exit;
end

[emailMapID] = sortMappingData(M);

[N, flag] = readPSQIFile();
if (flag == 0)
    disp(['File could not be found for PSQI FILE']);
    exit;
end
[emailPSQIData, PSQIC1_1Data, PSQIC2_1Data, PSQIC3_1Data, PSQIC4_1Data, PSQIC5_1Data, PSQIC6_1Data, PSQIC7_1Data, PSQICG_1Data, PSQIC1_2Data, PSQIC2_2Data, PSQIC3_2Data, PSQIC4_2Data, PSQIC5_2Data, PSQIC6_2Data, PSQIC7_2Data, PSQICG_2Data, PSQIC1_3Data, PSQIC2_3Data, PSQIC3_3Data, PSQIC4_3Data, PSQIC5_3Data, PSQIC6_3Data, PSQIC7_3Data, PSQICG_3Data, PSQIC1_4Data, PSQIC2_4Data, PSQIC3_4Data, PSQIC4_4Data, PSQIC5_4Data, PSQIC6_4Data, PSQIC7_4Data, PSQICG_4Data, PSQIC1_5Data, PSQIC2_5Data, PSQIC3_5Data, PSQIC4_5Data, PSQIC5_5Data, PSQIC6_5Data, PSQIC7_5Data, PSQICG_5Data] = sortPSQIData(N);

for studentNum = 1:F
    disp(num2str(studentNum));
    newFileName = ['PSQI_PostMapping_', num2str(studentNum), '.csv'];
    fileID = fopen(newFileName,'w');
    fprintf(fileID, ['SurveyNum, PSQIC1, PSQIC2, PSQIC3, PSQIC4, PSQIC5, PSQIC6, PSQIC7, PSQICG', newline]);
    
    NetId = emailMapID(studentNum);
    X = find(strcmp(emailPSQIData, NetId{1}));
    fprintf(fileID, ['1,', PSQIC1_1Data{X}, ',', PSQIC2_1Data{X}, ',', PSQIC3_1Data{X}, ',', PSQIC4_1Data{X}, ',', PSQIC5_1Data{X}, ',', PSQIC6_1Data{X}, ',', PSQIC7_1Data{X}, ',', PSQICG_1Data{X}, newline]);
    fprintf(fileID, ['2,', PSQIC1_2Data{X}, ',', PSQIC2_2Data{X}, ',', PSQIC3_2Data{X}, ',', PSQIC4_2Data{X}, ',', PSQIC5_2Data{X}, ',', PSQIC6_2Data{X}, ',', PSQIC7_2Data{X}, ',', PSQICG_2Data{X}, newline]);
    fprintf(fileID, ['3,', PSQIC1_3Data{X}, ',', PSQIC2_3Data{X}, ',', PSQIC3_3Data{X}, ',', PSQIC4_3Data{X}, ',', PSQIC5_3Data{X}, ',', PSQIC6_3Data{X}, ',', PSQIC7_3Data{X}, ',', PSQICG_3Data{X}, newline]);
    fprintf(fileID, ['4,', PSQIC1_4Data{X}, ',', PSQIC2_4Data{X}, ',', PSQIC3_4Data{X}, ',', PSQIC4_4Data{X}, ',', PSQIC5_4Data{X}, ',', PSQIC6_4Data{X}, ',', PSQIC7_4Data{X}, ',', PSQICG_4Data{X}, newline]);
    fprintf(fileID, ['5,', PSQIC1_5Data{X}, ',', PSQIC2_5Data{X}, ',', PSQIC3_5Data{X}, ',', PSQIC4_5Data{X}, ',', PSQIC5_5Data{X}, ',', PSQIC6_5Data{X}, ',', PSQIC7_5Data{X}, ',', PSQICG_5Data{X}, newline]);
end