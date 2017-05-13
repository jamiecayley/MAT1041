%This is a function to find an Array of the total votes won by each party,
%using one of the modified excel spreadsheets. The input required is the
%name of the excel document, the name of the sheet and the data range 
%(i.e. A1:B2)
%Written By Michael Goldsmith, 2017
function TotalVotesArray = NumOfVotes(SpreadSheetName,Sheetname,DataRange)
ImportedMatrix = xlsread(SpreadSheetName,Sheetname,DataRange);
TotalVotesArray = zeros(1,6);
for i = (1:6)
    TotalVotesArray(1,i) = sum(ImportedMatrix(:,i));
end
end
