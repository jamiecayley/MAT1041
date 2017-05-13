%This is a function to produce a matrix for use in question b, where 
%each row contains entirely 0's except a 1 correspoding to the winning
%party.
%The input "ImportedMatrix" in this case should contain only the 8 columns
%with the votes obtained by each party in, with each row corresponding to
%one constituency. ie colums F to M from the modified spreadsheet.
%Written by Michael Goldsmith, 2017
function OutputMatrix = MatrixOfSeatsWon(ImportedMatrix)
SizeOfMatrix = size(ImportedMatrix);
NumOfRows = SizeOfMatrix(1);
NumOfColumns = SizeOfMatrix(2);
if ~(NumOfColumns ==8) %Checking that the given input matrix contains the correct number of columns
    error('The Imported Matrix must contain 8 columns, with each column containing the votes obtained by one party in the various constituencies')
end
OutputMatrix = zeros(NumOfRows,NumOfColumns); %NumOfColumns will always be 8 if this stage is reached
for i = (1:NumOfRows)
    CurrentRow = ImportedMatrix(i,:);
    CurrentRowMaximum = max(CurrentRow); % Finding the largest value in the current row
    PositionOfMaximum = CurrentRow == CurrentRowMaximum; %Finding the location of this maximum value in the row
    OutputMatrix(i,PositionOfMaximum) = 1; %Setting the corresponding value in the output to 1
end
end