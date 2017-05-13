%This is a function to calculate the average percentage turnout across all
%constituencies, making use of the "Constituency Percentage Turnout"
%function. The input is the matrix consisting of the columns E to M of the
%modified excel sheet over which the calculation needs to be done
% Written by Michael Goldsmith, 2017
function output = AveragePercentageTurnout(ImportedMatrix)
SizeOfSelection = size(ImportedMatrix);
NumOfRows = SizeOfSelection(1);
NumOfColumns = SizeOfSelection(2);
if ~(NumOfColumns == 9); %Checking that the Imported Matrix given contains 9 columns
    error('The Imported Matrix must contain 9 columns, the first for the total electorate and the other 8 for the split of votes')
end
TotalPercentageTurnout = 0;
for i = (1:NumOfRows)
    TotalPercentageTurnout = TotalPercentageTurnout + ConstituencyPercentageTurnout(i,ImportedMatrix);
end
output = (TotalPercentageTurnout/NumOfRows);
end