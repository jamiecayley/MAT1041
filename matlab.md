---
layout: page
title: MATLAB
order: 2
---

## Contents

- [Datasets](#datasets)
- [Code](#code)
	- [Functions](#functions)
		- [Constituency Percentage Turnout](#constituency-percentage-turnout)
		- [Average Percentage Turnout](#average-percentage-turnout)
		- [Number of Votes](#number-of-votes)
		- [Number of Seats Won](#number-of-seats-won)
		- [Matrix of Seats Won ](#matrix-of-seats-won)
	- [Answers](#answers)
		- [Question 1a](#question-1a)
		- [Question 1b](#question-1b)
		- [Question 1c](#question-1c)
		- [Question 1d](#question-1d)
		- [Question 2a](#question-2a)
		- [Question 2b](#question-2b)
		- [Question 2c](#question-2c)
- [Report](#report)


## Datasets 

To download the excel spreadsheet with the original dataset click [here](https://github.com/jamiecayley/MAT1041/raw/gh-pages/files/matlab/original-spreadsheet.xlsx)

To download the modified spreadsheet that was used for the matlab analysis click [here](https://github.com/jamiecayley/MAT1041/raw/gh-pages/files/matlab/modified-spreadsheet.xlsx)


## Code
### Functions

#### Constituency Percentage Turnout 

```matlab
% This is a function to find the percentage turnout in a particular constituency, 
% the input is the row of the required constituency and the matrix of columns E to M imported 
% from the excel document
% Written by Michael Goldsmith, 2017
function output = ConstituencyPercentageTurnout(ConstituencyRowNum,ImportedMatrix)
NumOfEligibleVoters = ImportedMatrix(ConstituencyRowNum,1);
NumWhoVoted = 0;
for i = (2:9)
    NumWhoVoted = NumWhoVoted + ImportedMatrix(ConstituencyRowNum,i);
end
output = (NumWhoVoted/NumOfEligibleVoters)*100;
end
```

#### Average Percentage Turnout

```matlab
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
```
#### Number of Votes 

```matlab
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
```

#### Number of Seats Won

```matlab
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
```
#### Matrix of Seats Won 

```matlab
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
```

### Answers

#### Question 1a
```matlab
% The Solution to Question 1a of the MATLAB section
% Written by Michael Goldsmith,2017
ElectorateSum = SumOfExcelRange('Modified Spreadsheet.xlsx','2015 election','E1:E650');
fprintf('According to the data, at the time of the 2015 election there were %d people eligible to vote in the UK.\n',ElectorateSum)

TotalNumWhoVoted = SumOfExcelRange('Modified Spreadsheet.xlsx','2015 election','F1:M650');
fprintf('According to the data, %d people voted in the 2015 UK election.\n',TotalNumWhoVoted)

Turnout = TotalNumWhoVoted/ElectorateSum;
PercentageTurnout = Turnout*100;
fprintf('The overall percentage turnout for the whole UK was therefore %d percent.\n',PercentageTurnout)

ImportedMatrix = xlsread('Modified Spreadsheet.xlsx','2015 election','E1:M650'); 
% Importing the required columns of the modified spreadsheet,
% in order to calculate the average percentage turnout across all constituencies
AverageTurnoutPercentage = AveragePercentageTurnout(ImportedMatrix);
fprintf('The average of the percentage turnouts in every constituency was %d percent.\n',AverageTurnoutPercentage)
```

#### Question 1b
```matlab
% The Solution to Question 1b of the MATLAB section
% Written by Michael Goldsmith,2017

ArrayOfWonSeats = NumOfSeatsWon('Modified Spreadsheet.xlsx','2015 election','F1:M650');
% ArrayOfWonSeats produces a row array for all 8 columns in the spreadsheet,
% so this must be shortened and transposed:
ArrayOfSixMainParties = zeros(6:1);
for i = (1:6)
    ArrayOfSixMainParties(i,1) = ArrayOfWonSeats(1,i);
end

display('The 6 by 1 array for seats held by the six main parties is:')
display(ArrayOfSixMainParties)
fprintf('Therefore: CON won %d seats; LAB won %d seats; LIB won %d seats; UKIP won %d seats; Green won %d seats and Nationalists won %d seats\n',ArrayOfSixMainParties)
```

#### Question 1c
```matlab
% The Solution to Question 1c of the MATLAB section
% Written by Michael Goldsmith,2017

TotalVotesArray = NumOfVotes('Modified Spreadsheet.xlsx','2015 election','F1:M650');
TotalSeatsArray = NumOfSeatsWon('Modified Spreadsheet.xlsx','2015 election','F1:M650');
ReducedSeatsArray = TotalSeatsArray(1:6);

Labels = {'CON', 'LAB', 'LIB', 'UKIP', 'Green', 'Nationalist'};

SpreadOfVotes = subplot(1,2,1);
pie(SpreadOfVotes,TotalVotesArray,Labels);
title(SpreadOfVotes,'The spread of votes in the 2015 election')

SpreadOfSeats = subplot(1,2,2);
pie(SpreadOfSeats,ReducedSeatsArray,Labels);
title(SpreadOfSeats,'The spread of seats after the 2015 election')
```

#### Question 1d
```matlab

```

#### Question 2a
```matlab
OriginalMatrix = xlsread('Modified Spreadsheet.xlsx','2015 election','E1:M650');
SizeOfMatrix = size(OriginalMatrix);
NumOfConstituencies = SizeOfMatrix(1);
NumOfColumns = SizeOfMatrix(2);

NewMatrix = zeros(NumOfConstituencies,NumOfColumns-1);
for i = (1:NumOfConstituencies)
    ConstituencyTotalElectorate = OriginalMatrix(i,1);
    OnePercent = ConstituencyTotalElectorate/100;
    NewMatrix(i,1) = OriginalMatrix(i,2) + 3*OnePercent; %Conservative increased by 3 percentage points
    NewMatrix(i,2) = OriginalMatrix(i,3) - 10*OnePercent; %Labour reduced by 10 percentage points  
    NewMatrix(i,3) = OriginalMatrix(i,4) + 5*OnePercent; %Libdem reduced by 5 percentage points
    NewMatrix(i,4) = OriginalMatrix(i,5) + 12*OnePercent; %UKIP increased by 12 percentage points
    for j =(6:NumOfColumns)
        NewMatrix(i,j-1) = OriginalMatrix(i,j);
    end
end
```

#### Question 2b
```matlab

```

#### Question 2c
```matlab

```
## Report


