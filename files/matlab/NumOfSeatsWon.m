%This is a function to calculate the number of seats won by each party,
%where the input is the name of the spreadsheet containing the data, the
%name of the sheet containing the data, and the excel range in which the
%data lies
function outputArray = NumOfSeatsWon(SpreadsheetName,SheetName,DataRange)
ImportedMatrix = xlsread(SpreadsheetName,SheetName,DataRange);
MatrixOfWinners = MatrixOfSeatsWon(ImportedMatrix); %Using the MatrixOfSeatsWon function to generate a matrix of 1's and 0's
outputArray = zeros(1,8);
for i = (1:8)
    outputArray(1,i) = sum(MatrixOfWinners(:,i));
end
end