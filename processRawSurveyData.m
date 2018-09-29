%Map the raw survey data with person ID's
F = 30;
[M, flag] = readMappingFile();
if (flag == 0)
        disp(['File could not be found for mapping file']);
        exit;
end
[emailMapID] = sortMappingData(M);
    
[N, flag] = readPSQIRawFile();
if (flag == 0)
        disp(['File could not be found for PSQI RAW File']);
        exit;
end
[emailPSQIData, PSQI1_1Data, PSQI2_1Data, PSQI3_1Data, PSQI4_1Data, PSQI5_1Data, PSQI6_1Data, PSQI7_1Data, PSQI8_1Data, PSQI9_1Data, PSQI10_1Data, PSQI11_1Data, PSQI12_1Data, PSQI13_1Data, PSQI14_1Data, PSQI15_1Data, PSQI16_1Data, PSQI17_1Data, PSQI18_1Data, PSQI19_1Data, PSQI20_1Data, PSQI1_2Data, PSQI2_2Data, PSQI3_2Data, PSQI4_2Data, PSQI5_2Data, PSQI6_2Data, PSQI7_2Data, PSQI8_2Data, PSQI9_2Data, PSQI10_2Data, PSQI11_2Data, PSQI12_2Data, PSQI13_2Data, PSQI14_2Data, PSQI15_2Data, PSQI16_2Data, PSQI17_2Data, PSQI18_2Data, PSQI19_2Data, PSQI20_2Data, PSQI1_3Data, PSQI2_3Data, PSQI3_3Data, PSQI4_3Data, PSQI5_3Data, PSQI6_3Data, PSQI7_3Data, PSQI8_3Data, PSQI9_3Data, PSQI10_3Data, PSQI11_3Data, PSQI12_3Data, PSQI13_3Data, PSQI14_3Data, PSQI15_3Data, PSQI16_3Data, PSQI17_3Data, PSQI18_3Data, PSQI19_3Data, PSQI20_3Data, PSQI1_4Data, PSQI2_4Data, PSQI3_4Data, PSQI4_4Data, PSQI5_4Data, PSQI6_4Data, PSQI7_4Data, PSQI8_4Data, PSQI9_4Data, PSQI10_4Data, PSQI11_4Data, PSQI12_4Data, PSQI13_4Data, PSQI14_4Data, PSQI15_4Data, PSQI16_4Data, PSQI17_4Data, PSQI18_4Data, PSQI19_4Data, PSQI20_4Data, PSQI1_5Data, PSQI2_5Data, PSQI3_5Data, PSQI4_5Data, PSQI5_5Data, PSQI6_5Data, PSQI7_5Data, PSQI8_5Data, PSQI9_5Data, PSQI10_5Data, PSQI11_5Data, PSQI12_5Data, PSQI13_5Data, PSQI14_5Data, PSQI15_5Data, PSQI16_5Data, PSQI17_5Data, PSQI18_5Data, PSQI19_5Data, PSQI20_5Data] = sortPSQIRawData(N);
for studentNum = 1:F
    disp(num2str(studentNum));
    newFileName = ['PSQIRaw_PostMapping_', num2str(studentNum), '.csv'];
    fileID = fopen(newFileName,'w');
    fprintf(fileID, ['SurveyNum, PSQI1, PSQI2, PSQI3, PSQI4, PSQI5, PSQI6, PSQI7, PSQI8, PSQI9, PSQI10, PSQI11, PSQI12, PSQI13, PSQI14, PSQI15, PSQI16, PSQI17, PSQI18, PSQI19, PSQI20', newline]);
    
    NetId = emailMapID(studentNum);
    X = find(strcmp(emailPSQIData, NetId{1}));
    fprintf(fileID, ['1,', PSQI1_1Data{X}, ',', PSQI2_1Data{X}, ',', PSQI3_1Data{X}, ',', PSQI4_1Data{X}, ',', PSQI5_1Data{X}, ',', PSQI6_1Data{X}, ',', PSQI7_1Data{X}, ',', PSQI8_1Data{X}, ',', PSQI9_1Data{X}, ',', PSQI10_1Data{X}, ',', PSQI11_1Data{X}, ',', PSQI12_1Data{X}, ',', PSQI13_1Data{X}, ',', PSQI14_1Data{X}, ',', PSQI15_1Data{X}, ',', PSQI16_1Data{X}, ',', PSQI17_1Data{X}, ',', PSQI18_1Data{X}, ',', PSQI19_1Data{X}, ',', PSQI20_1Data{X}, newline]);
    fprintf(fileID, ['2,', PSQI1_2Data{X}, ',', PSQI2_2Data{X}, ',', PSQI3_2Data{X}, ',', PSQI4_2Data{X}, ',', PSQI5_2Data{X}, ',', PSQI6_2Data{X}, ',', PSQI7_2Data{X}, ',', PSQI8_2Data{X}, ',', PSQI9_2Data{X}, ',', PSQI10_2Data{X}, ',', PSQI11_2Data{X}, ',', PSQI12_2Data{X}, ',', PSQI13_2Data{X}, ',', PSQI14_2Data{X}, ',', PSQI15_2Data{X}, ',', PSQI16_2Data{X}, ',', PSQI17_2Data{X}, ',', PSQI18_2Data{X}, ',', PSQI19_2Data{X}, ',', PSQI20_2Data{X}, newline]);
    fprintf(fileID, ['3,', PSQI1_3Data{X}, ',', PSQI2_3Data{X}, ',', PSQI3_3Data{X}, ',', PSQI4_3Data{X}, ',', PSQI5_3Data{X}, ',', PSQI6_3Data{X}, ',', PSQI7_3Data{X}, ',', PSQI8_3Data{X}, ',', PSQI9_3Data{X}, ',', PSQI10_3Data{X}, ',', PSQI11_3Data{X}, ',', PSQI12_3Data{X}, ',', PSQI13_3Data{X}, ',', PSQI14_3Data{X}, ',', PSQI15_3Data{X}, ',', PSQI16_3Data{X}, ',', PSQI17_3Data{X}, ',', PSQI18_3Data{X}, ',', PSQI19_3Data{X}, ',', PSQI20_3Data{X}, newline]);
    fprintf(fileID, ['4,', PSQI1_4Data{X}, ',', PSQI2_4Data{X}, ',', PSQI3_4Data{X}, ',', PSQI4_4Data{X}, ',', PSQI5_4Data{X}, ',', PSQI6_4Data{X}, ',', PSQI7_4Data{X}, ',', PSQI8_4Data{X}, ',', PSQI9_4Data{X}, ',', PSQI10_4Data{X}, ',', PSQI11_4Data{X}, ',', PSQI12_4Data{X}, ',', PSQI13_4Data{X}, ',', PSQI14_4Data{X}, ',', PSQI15_4Data{X}, ',', PSQI16_4Data{X}, ',', PSQI17_4Data{X}, ',', PSQI18_4Data{X}, ',', PSQI19_4Data{X}, ',', PSQI20_4Data{X}, newline]);
    fprintf(fileID, ['5,', PSQI1_5Data{X}, ',', PSQI2_5Data{X}, ',', PSQI3_5Data{X}, ',', PSQI4_5Data{X}, ',', PSQI5_5Data{X}, ',', PSQI6_5Data{X}, ',', PSQI7_5Data{X}, ',', PSQI8_5Data{X}, ',', PSQI9_5Data{X}, ',', PSQI10_5Data{X}, ',', PSQI11_5Data{X}, ',', PSQI12_5Data{X}, ',', PSQI13_5Data{X}, ',', PSQI14_5Data{X}, ',', PSQI15_5Data{X}, ',', PSQI16_5Data{X}, ',', PSQI17_5Data{X}, ',', PSQI18_5Data{X}, ',', PSQI19_5Data{X}, ',', PSQI20_5Data{X}, newline]);
    
end