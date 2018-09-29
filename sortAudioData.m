function [audioTimeData, audioUnlockData] = sortAudioData(M)    

audioTimeData = M{1, 1}(:, 1);
audioUnlockData = M{1, 2}(:, 1);