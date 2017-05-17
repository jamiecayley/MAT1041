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
		- [Increase Votes](#increase-votes)
		- [Minimum Non-Voter Fraction to Win](#minimum-non-voter-fraction-to-win)
		- [Non-Voter Party](#non-voter-party)
		- [Predicting 2017 Election](#predicting-2017-election)
		- [Turnout Gain](#turnout-gain)
		- [Sum of Excel Range](#sum-of-excel-range)
	- [Answers](#answers)
		- [Question 1a](#question-1a)
		- [Question 1b](#question-1b)
		- [Question 1c](#question-1c)
		- [Question 1d](#question-1d)
		- [Question 2a](#question-2a)
		- [Question 2b](#question-2b)
		- [Question 2 full solution](#question-2-full-solution)
- [Outputs](#outputs)
- [Report](#report)
	- [Further Analysis](#further-analysis)

## Datasets 

To download the Excel spreadsheet with the original dataset click [here](https://github.com/jamiecayley/MAT1041/raw/gh-pages/files/matlab/original-spreadsheet.xlsx)

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

#### Increase Votes

```matlab
% This is a function to increase the votes of one party in a
% constituency by a certain fraction of the total, by increasing the number
% of non voters who vote for them.
% Written by Michael Goldsmith, 2017
function output = IncreaseVotes(Matrix,ConstituencyNum,PartyNum,FractionalVoteChange)
CurrentRow = Matrix(ConstituencyNum,:);
CurrentFraction = CurrentRow(PartyNum + 1)/sum(CurrentRow(2:9));
DesiredFraction = CurrentFraction + FractionalVoteChange;
TotalOpposition = sum(CurrentRow(2:9))-CurrentRow(PartyNum+1);
TotalOppositionDesiredFraction = 1 - DesiredFraction;
TotalVotersNeeded = TotalOpposition/TotalOppositionDesiredFraction;
SupportingVoters = TotalVotersNeeded - TotalOpposition;
output = SupportingVoters;
end
```

#### Minimum Non-Voter Fraction to Win 

```matlab
% A function to Calculate the fractional increase in the votes obtained by
% a party (as a result of non voters voting) required to win them a seat
% Written by Michael Goldsmith, 2017

function output = MinimumNonVoterFractionToWin(MatrixOfVotes,ConstituencyNum,PartyNum)
AnswerReached = 0;
CurrentRow = MatrixOfVotes(ConstituencyNum,:);
CurrentFraction = -0.0001; %Negative so that the function starts with 0, in case the selected party has already won
while AnswerReached == 0
    CurrentFraction = CurrentFraction + 0.0001;
    WinningPartyVotes = max(CurrentRow(2:9));
    IncumbentSupportingVotes = IncreaseVotes(MatrixOfVotes,ConstituencyNum,PartyNum,CurrentFraction);
    if IncumbentSupportingVotes >= WinningPartyVotes
        AnswerReached = 1;
    end
end
output = CurrentFraction;
end
```

#### Non-Voter Party

```matlab
% Modelling What would have happened in the 2015 election if the non voters
% was a political party
% Written by Michael Goldsmith
% Suggestion and Inspiration from Manny Abdul Gaffur

MatrixFor2015 = xlsread('Modified Spreadsheet.xlsx','2015 election','E1:M650');
SizeOfMatrix = size(MatrixFor2015);
NumOfConstituencies = SizeOfMatrix(1);
ModifiedMatrix = zeros(NumOfConstituencies,10);

for ConstituencyNum = (1:NumOfConstituencies)
    ModifiedMatrix(ConstituencyNum,1) = MatrixFor2015(ConstituencyNum,1);
    for PartyNum = (1:8)
        NumOfVotesWon = MatrixFor2015(ConstituencyNum,PartyNum+1);
        ModifiedMatrix(ConstituencyNum,PartyNum+1) = NumOfVotesWon;
    end
    NumberOfNonVoters = MatrixFor2015(ConstituencyNum,1) - sum(MatrixFor2015(ConstituencyNum,2:9));
    ModifiedMatrix(ConstituencyNum,10) = NumberOfNonVoters;
end

% Calculating the effects of the adjustments:
WonSeats = MatrixOfSeatsWon(ModifiedMatrix(:,2:10));
SpradOfSeatsWon = zeros(1,9);
for i = (1:9)
    SpradOfSeatsWon(1,i) = sum(WonSeats(:,i));
end
TotalVotesArray = zeros(1,9);
for i = (1:9)
    TotalVotesArray(i) = sum(ModifiedMatrix(:,i+1));
end
    
% Plotting Results
SpreadOfVotes = subplot(1,2,1);
Labels = {'CON', 'LAB', 'LIB', 'UKIP', 'Green', 'Nationalist','Minor','Other','Non Voters'};
pie(SpreadOfVotes,TotalVotesArray,Labels);
title(SpreadOfVotes,'The spread of votes after the changes')

SpreadOfSeats = subplot(1,2,2);
pie(SpreadOfSeats,SpradOfSeatsWon,Labels);
title(SpreadOfSeats,'The projected spread of seats after the changes')
```

#### Predicting 2017 Election

```matlab
% Predicting the results of the 2017 snap election by using the results of the
% 2015 election and opinion polls
%Written by Michael Goldsmith, 2017

% Input electionwide opinion poll results (0.1 is 10% of the total votes)
ConOpinion =0.5;
LabOpinion =0.25;
LibOpinion =0.11;
UKIPOpinion =0.07;
GreenOpinion =0.03;
NationalistOpinion =0.04;
MinorOpinion =0.005;
OtherOpinion =0.005;
% CAUTION, Parties will only stand in the simulated 2017 election in
% constituencies that they stood in for the 2015 election, so an error will
% occur if all parties that stood in a constituency have 0% support, and
% those with support didn't stand there. (every party will collect 0 votes)
Opinion = [ConOpinion LabOpinion LibOpinion UKIPOpinion GreenOpinion NationalistOpinion MinorOpinion OtherOpinion];

% Input electionwide turnout changes (0.1 means
% that 10% of those who didn't vote now vote for that party)
ConTurnoutGain =0;
LabTurnoutGain =0;
LibTurnoutGain =0;
UKIPTurnoutGain =0;
GreenTurnoutGain =0;
NationalistTurnoutGain =0;
MinorTurnoutGain =0;
OtherTurnoutGain =0;

TurnoutGain = [ConTurnoutGain LabTurnoutGain LibTurnoutGain UKIPTurnoutGain GreenTurnoutGain NationalistTurnoutGain MinorTurnoutGain OtherTurnoutGain];

%This code assumes that the relationship between a parties support in a
%constituency and overall votes remains the same as in the 2015 election

% Importing the 2015 info
MatrixFor2015 = xlsread('Modified Spreadsheet.xlsx','2015 election','E1:M650');
SizeOfMatrix = size(MatrixFor2015);
NumOfConstituencies = SizeOfMatrix(1);

%Calculating total support in 2015
TotalVotesArray2015 = NumOfVotes('Modified Spreadsheet.xlsx','2015 election','F1:M650');

%Calculating the total support in 2017 based off opinion and support in
%2015 
PredictedTotalVotesArray2017 = zeros(1,8);
for i = (1:8)
    PredictedTotalVotesArray2017(i) = sum(TotalVotesArray2015)*Opinion(i);
end

PredictedPopularityArray = zeros(NumOfConstituencies,10); %Initialising the array to fill with data about the popularity of the parties
% Will also contain previous turnout and total electorate

for ConstituencyNum =(1:NumOfConstituencies) %Filling the predicted Popularity Array
    Current2015Row = MatrixFor2015(ConstituencyNum,:);
    PredictedPopularityArray(ConstituencyNum,1) = Current2015Row(1); % Copying the total electorate column
    PredictedPopularityArray(ConstituencyNum,2) = ConstituencyPercentageTurnout(ConstituencyNum,MatrixFor2015); % Calculating the previous turnout and adding to the matrix
    for j =(2:9)
        ConstituencyPopularity2015 = Current2015Row(j)/sum(Current2015Row(2:9));
        TotalPopularity2015 = TotalVotesArray2015(j-1)/sum(TotalVotesArray2015);
        ConstituencyToTotalRatio = ConstituencyPopularity2015/TotalPopularity2015;
        TotalPopularity2017 = PredictedTotalVotesArray2017(j-1)/sum(PredictedTotalVotesArray2017);
        PredictedPopularity2017 = TotalPopularity2017*ConstituencyToTotalRatio;
        PredictedPopularityArray(ConstituencyNum,j+1) = PredictedPopularity2017;
    end
end

PredictedArrayOfVotes2017 = zeros(NumOfConstituencies,9);
for ConstituencyNum = (1:NumOfConstituencies)
    PredictedArrayOfVotes2017(ConstituencyNum,1) = PredictedPopularityArray(ConstituencyNum,1); % Copying total electorate number
    ConstituencyTurnout = (PredictedPopularityArray(ConstituencyNum,2)/100)*PredictedPopularityArray(ConstituencyNum,1); %Calculating the Turnout for the constituency
    for PartyNum = (1:8)
        FractionOfVotesWon = PredictedPopularityArray(ConstituencyNum,PartyNum+2)/sum(PredictedPopularityArray(ConstituencyNum,3:10));
        NumOfVotesWon =  FractionOfVotesWon*ConstituencyTurnout;
        if ~(TurnoutGain(PartyNum) == 0)
            NumberOfNonVoters = PredictedArrayOfVotes2017(ConstituencyNum,1) - ConstituencyTurnout;
            NumberOfTurnoutVotesGained = NumberOfNonVoters*TurnoutGain(PartyNum);
            NumOfVotesWon = NumOfVotesWon + NumberOfTurnoutVotesGained;
        end
        PredictedArrayOfVotes2017(ConstituencyNum,PartyNum+1) = NumOfVotesWon;
    end
end

%Calculating results
PredictedWonSeats2017 = MatrixOfSeatsWon(PredictedArrayOfVotes2017(:,2:9));
PredictedNumOfSeatsWon2017 = zeros(1,8);
for i = (1:8)
    PredictedNumOfSeatsWon2017(1,i) = sum(PredictedWonSeats2017(:,i));
end
PredictedTotalVotesArray2017 = zeros(1,8);
for i = (1:8)
    PredictedTotalVotesArray2017(i) = sum(PredictedArrayOfVotes2017(:,i+1));
end

% Plotting Results
PredictedSpreadOfVotes2017 = subplot(1,2,1);
Labels = {'CON', 'LAB', 'LIB', 'UKIP', 'Green', 'Nationalist','Minor','Other'};
pie(PredictedSpreadOfVotes2017,PredictedTotalVotesArray2017,Labels);
title(PredictedSpreadOfVotes2017,'The Predicted Spread Of Votes')

PredictedSpreadOfSeats2017 = subplot(1,2,2);
pie(PredictedSpreadOfSeats2017,PredictedNumOfSeatsWon2017,Labels);
title(PredictedSpreadOfSeats2017,'The Predicted Spread Of Seats')
```

#### Turnout Gain 

```matlab
% Modelling how non voters could have affected the 2015 UK general election
% Written by Michael Goldsmith, 2017
% Inspiration From Manny Abdul Gaffur


% Input electionwide turnout changes (0.1 means
% that 10% of those who didn't vote now vote for that party)
ConTurnoutGain =0;
LabTurnoutGain =0.33;
LibTurnoutGain =0;
UKIPTurnoutGain =0;
GreenTurnoutGain =0;
NationalistTurnoutGain =0;
MinorTurnoutGain =0;
OtherTurnoutGain =0;

TurnoutGains = [ConTurnoutGain LabTurnoutGain LibTurnoutGain UKIPTurnoutGain GreenTurnoutGain NationalistTurnoutGain MinorTurnoutGain OtherTurnoutGain];

MatrixFor2015 = xlsread('Modified Spreadsheet.xlsx','2015 election','E1:M650');
SizeOfMatrix = size(MatrixFor2015);
NumOfConstituencies = SizeOfMatrix(1);
ModifiedMatrix = zeros(NumOfConstituencies,9);

for ConstituencyNum = (1:NumOfConstituencies)
    ModifiedMatrix(ConstituencyNum,1) = MatrixFor2015(ConstituencyNum,1);
    for PartyNum = (1:8)
        NumOfVotesWon = MatrixFor2015(ConstituencyNum,PartyNum+1);
        if ~(TurnoutGains(PartyNum) == 0)
            NumberOfNonVoters = MatrixFor2015(ConstituencyNum,1) - sum(MatrixFor2015(ConstituencyNum,2:9));
            NumberOfTurnoutVotesGained = NumberOfNonVoters*TurnoutGains(PartyNum);
            NumOfVotesWon = NumOfVotesWon + NumberOfTurnoutVotesGained;
        end
        ModifiedMatrix(ConstituencyNum,PartyNum+1) = NumOfVotesWon;
    end
end
%Calculating results
PredictedWonSeats = MatrixOfSeatsWon(ModifiedMatrix(:,2:9));
PredictedNumOfSeatsWon = zeros(1,8);
for i = (1:8)
    PredictedNumOfSeatsWon(i) = sum(PredictedWonSeats(:,i));
end
PredictedTotalVotesArray = zeros(1,8);
for i = (1:8)
    PredictedTotalVotesArray(i) = sum(ModifiedMatrix(:,i+1));
end

% Plotting Results
PredictedSpreadOfVotes = subplot(1,2,1);
Labels = {'CON', 'LAB', 'LIB', 'UKIP', 'Green', 'Nationalist','Minor','Other'};
pie(PredictedSpreadOfVotes,PredictedTotalVotesArray,Labels);
title(PredictedSpreadOfVotes,'The spread of votes after the changes')

PredictedSpreadOfSeats = subplot(1,2,2);
pie(PredictedSpreadOfSeats,PredictedNumOfSeatsWon,Labels);
title(PredictedSpreadOfSeats,'The projected spread of seats after the changes')
```

#### Sum of Excel Range

```matlab
% This is a function to find the sum of numbers in a specified excel range
% in a given excel document eg: SumOfExcelRange('Example.xlsx','A1:B2')
% Written By Michael Goldsmith,2017
function Sum = SumOfExcelRange(DocumentName,sheetname,Range)
AreaToSum = xlsread(DocumentName,sheetname,Range);
Sum = 0;
SizeOfArea = size(AreaToSum);
NumberOfRows = SizeOfArea(1);
NumberOfColumns = SizeOfArea(2);
for j =(1:NumberOfColumns)
    ColumnSum = 0;
    for i = (1:NumberOfRows)
        ColumnSum = ColumnSum + AreaToSum(i,j);
    end
    Sum = Sum + ColumnSum;
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
% The Solution to Question 1a of the MATLAB section, modified by changing
% all instances of "2015" to "2010" so that the answers produced are for
% 2010, as is required in part 1d.
% Written by Michael Goldsmith,2017
ElectorateSum = SumOfExcelRange('Modified Spreadsheet.xlsx','2010 election','E1:E650');
fprintf('According to the data, at the time of the 2010 election there were %d people eligible to vote in the UK.\n',ElectorateSum)

TotalNumWhoVoted = SumOfExcelRange('Modified Spreadsheet.xlsx','2010 election','F1:M650');
fprintf('According to the data, %d people voted in the 2010 UK election.\n',TotalNumWhoVoted)

Turnout = TotalNumWhoVoted/ElectorateSum;
PercentageTurnout = Turnout*100;
fprintf('The overall percentage turnout for the whole UK was therefore %d percent.\n',PercentageTurnout)

ImportedMatrix = xlsread('Modified Spreadsheet.xlsx','2010 election','E1:M650'); 
% Importing the required columns of the modified spreadsheet,
% in order to calculate the average percentage turnout across all constituencies
AverageTurnoutPercentage = AveragePercentageTurnout(ImportedMatrix);
fprintf('The average of the percentage turnouts in every constituency was %d percent.\n',AverageTurnoutPercentage)


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
% This is a function to perform the calculation required to complete section 2b, it
% makes use of the "MinimumNonVoterFractionToWin"  function and the "IncreaseVotes" function 
% The purpose is to calculate the minimum percentage of non voters required to vote for Incumbents
% after the previous election, such that one current Incumbent (who would lose their seat) retains
% their seats in the 2020 election predicted by section 2a
% Both "ModifiedMatrixOfVotes" and "OriginalMatrixOfVotes" should contain 9
% columns, with the first being for the total electorate and the other 8
% being for votes achieved by each party.
% Written by Michael Goldsmith,2017

function output = Question_2b(ModifiedMatrixOfVotes,OriginalMatrixOfVotes)
SizeOfMatrix = size(OriginalMatrixOfVotes);
NumOfConstituencies = SizeOfMatrix(1);
NumOfParties = SizeOfMatrix(2) - 1;
OriginalMatrixOfSeatsWon = MatrixOfSeatsWon(OriginalMatrixOfVotes(:,2:9));
ModifiedMatrixOfSeatsWon = MatrixOfSeatsWon(ModifiedMatrixOfVotes(:,2:9)); % Generate the matrices of 1's and 0's showing who won the seats
MinimumGainsForIncumbentHolds = zeros(NumOfConstituencies);
for ConstituencyNum = (1:NumOfConstituencies)
    SeatChange = 0;
    for PartyNum = (1:NumOfParties)
        if ~(OriginalMatrixOfSeatsWon(ConstituencyNum,PartyNum) == ModifiedMatrixOfSeatsWon(ConstituencyNum,PartyNum)) %Did the seat change parties?
            SeatChange = 1;
            if OriginalMatrixOfSeatsWon(ConstituencyNum,PartyNum) == 1 %Is the current party being checked the 2015 incumbent?
                IncumbentNum = PartyNum; %If so, save its number
            end
        end
    end
    if SeatChange == 1
        RequiredIncumbentFractionalGain = MinimumNonVoterFractionToWin(ModifiedMatrixOfVotes,ConstituencyNum,IncumbentNum);
        MinimumGainsForIncumbentHolds(ConstituencyNum) = RequiredIncumbentFractionalGain;
    end
end
MinGainForOneIncumbentHold = min(MinimumGainsForIncumbentHolds(MinimumGainsForIncumbentHolds>0));
MinGainForOneIncumbentHoldPercent = MinGainForOneIncumbentHold*100;
fprintf('The minimum gain for one Incumbent to hold their constituency is %f percent',MinGainForOneIncumbentHoldPercent)
for ConstituencyNum = (1:NumOfConstituencies) %now, loop through all incumbents and increase their votes by the minimum amount
    SeatChange = 0;
    for PartyNum = (1:NumOfParties)
        if ~OriginalMatrixOfSeatsWon(ConstituencyNum,PartyNum) == ModifiedMatrixOfSeatsWon(ConstituencyNum,PartyNum) %Did the seat change parties?
            SeatChange = 1;
            if OriginalMatrixOfSeatsWon(ConstituencyNum,PartyNum) == 1 %Is the current party being checked the 2015 incumbent?
                IncumbentNum = PartyNum; %If so, save its number
            end
        end
    end
    if SeatChange == 1
        ModifiedMatrixOfVotes(ConstituencyNum,IncumbentNum+1)= IncreaseVotes(ModifiedMatrixOfVotes,ConstituencyNum,IncumbentNum,MinGainForOneIncumbentHold);
    end
end
output = ModifiedMatrixOfVotes;
end
```

#### Question 2 full solution
```matlab
% This is a function to perform the calculation required to complete section 2b, it
% makes use of the "MinimumNonVoterFractionToWin"  function and the "IncreaseVotes" function 
% The purpose is to calculate the minimum percentage of non voters required to vote for Incumbents
% after the previous election, such that one current Incumbent (who would lose their seat) retains
% their seats in the 2020 election predicted by section 2a
% Both "ModifiedMatrixOfVotes" and "OriginalMatrixOfVotes" should contain 9
% columns, with the first being for the total electorate and the other 8
% being for votes achieved by each party.
% Written by Michael Goldsmith,2017

function output = Question_2b(ModifiedMatrixOfVotes,OriginalMatrixOfVotes)
SizeOfMatrix = size(OriginalMatrixOfVotes);
NumOfConstituencies = SizeOfMatrix(1);
NumOfParties = SizeOfMatrix(2) - 1;
OriginalMatrixOfSeatsWon = MatrixOfSeatsWon(OriginalMatrixOfVotes(:,2:9));
ModifiedMatrixOfSeatsWon = MatrixOfSeatsWon(ModifiedMatrixOfVotes(:,2:9)); % Generate the matrices of 1's and 0's showing who won the seats
MinimumGainsForIncumbentHolds = zeros(NumOfConstituencies);
for ConstituencyNum = (1:NumOfConstituencies)
    SeatChange = 0;
    for PartyNum = (1:NumOfParties)
        if ~(OriginalMatrixOfSeatsWon(ConstituencyNum,PartyNum) == ModifiedMatrixOfSeatsWon(ConstituencyNum,PartyNum)) %Did the seat change parties?
            SeatChange = 1;
            if OriginalMatrixOfSeatsWon(ConstituencyNum,PartyNum) == 1 %Is the current party being checked the 2015 incumbent?
                IncumbentNum = PartyNum; %If so, save its number
            end
        end
    end
    if SeatChange == 1
        RequiredIncumbentFractionalGain = MinimumNonVoterFractionToWin(ModifiedMatrixOfVotes,ConstituencyNum,IncumbentNum);
        MinimumGainsForIncumbentHolds(ConstituencyNum) = RequiredIncumbentFractionalGain;
    end
end
MinGainForOneIncumbentHold = min(MinimumGainsForIncumbentHolds(MinimumGainsForIncumbentHolds>0));
MinGainForOneIncumbentHoldPercent = MinGainForOneIncumbentHold*100;
fprintf('The minimum gain for one Incumbent to hold their constituency is %f percent',MinGainForOneIncumbentHoldPercent)
for ConstituencyNum = (1:NumOfConstituencies) %now, loop through all incumbents and increase their votes by the minimum amount
    SeatChange = 0;
    for PartyNum = (1:NumOfParties)
        if ~OriginalMatrixOfSeatsWon(ConstituencyNum,PartyNum) == ModifiedMatrixOfSeatsWon(ConstituencyNum,PartyNum) %Did the seat change parties?
            SeatChange = 1;
            if OriginalMatrixOfSeatsWon(ConstituencyNum,PartyNum) == 1 %Is the current party being checked the 2015 incumbent?
                IncumbentNum = PartyNum; %If so, save its number
            end
        end
    end
    if SeatChange == 1
        ModifiedMatrixOfVotes(ConstituencyNum,IncumbentNum+1)= IncreaseVotes(ModifiedMatrixOfVotes,ConstituencyNum,IncumbentNum,MinGainForOneIncumbentHold);
    end
end
output = ModifiedMatrixOfVotes;
end
```
## Outputs 

1. For the 2015 election: 
a.  According to the data, how many people are there in the UK eligible to vote and how many voted in the 2015 election? Calculate this as a percentage and then calculate the average percentage turnout across all constituencies. 
b. Produce a 6 by 1 array showing the number of seats held by the 6 main parties in parliament as a result of the 2015 election. Hint: start by producing a matrix where each row has all 0s except for a single 1 in the column corresponding to the winning party. 
c. Produce a pie chart to show the proportions of total votes gained by each of the6 main parties. Comment on how this compares with the number of seats gained. 
d. Perform the same analysis for the 2010 election and display the 2010 and 2015 results in a comparative manner. Find a suitable way to show graphically the difference between parties share of the votes and share of parliamentary seats in 2010 and 2015. 

a. By running the script ‘Question_1a.m’, the following output is given:
According to the data, at the time of the 2015 election there were 46428805 people eligible to vote in the UK.
According to the data, 30697854 people voted in the 2015 UK election.
The overall percentage turnout for the whole UK was therefore 6.611812e+01 percent.
The average of the percentage turnouts in every constituency was 6.605318e+01 percent.
b. By running the script ‘Question_1b.m’, the following output is given:
The 6 by 1 array for seats held by the six main parties is:

ArrayOfSixMainParties =

   333
   235
    16
     1
     1
    63

Therefore: CON won 333 seats; LAB won 235 seats; LIB won 16 seats; UKIP won 1 seats; Green won 1 seats and Nationalists won 63 seats.

c. Running the script ‘Question_1c.m’ produces the following pie charts:

![](https://raw.githubusercontent.com/jamiecayley/MAT1041/gh-pages/public/images/image32-1.png#center) 

Note that the UKIP slice in the pie chart showing the spread of seats has been exploded to make the labels legible, without adjusting the order (and therefore colour) of the slices. 

In these two pie charts, the consequences of using a ‘First Past The Post’ voting system can be seen: the representation for the Green Party and for UKIP was much smaller than the number of votes received, and the opposite is true for the Conservative and nationalist parties.

d. Running the script ‘Question_1c.m’ produces the following pie charts:

![](https://raw.githubusercontent.com/jamiecayley/MAT1041/gh-pages/public/images/image32-2.png#center) 

There is the issue of overlapping section labels on these pie charts, which will be resolved for the presentation by redrawing the graphs using excel, using the data from these MATLAB functions. This will also allow us to change the colours of the section of the pie chart to match the parties represented by each section.

Additionally, running the script “Question_1a_Modified_for_2010.m” produces the following results:

According to the data, at the time of the 2010 election there were 45601060 people eligible to vote in the UK.
According to the data, 29687737 people voted in the 2010 UK election.

The overall percentage turnout for the whole UK was therefore 6.510317e+01 percent.
The average of the percentage turnouts in every constituency was 6.501744e+01 percent.

2. The year is now 2020. Assume that there is no change in the electorate or candidates and that the following occur in each constituency, in each case the changes are by comparison with 2015:

a. Assume that the Conservative share of the vote goes up by 3 percentage points, Labour down by 10 percentage points, Libdem down by 5 percentage points and UKIP up by 12 percentage points.
b. Incumbents experience an increase of x% in the number of their votes in each constituency as a result of non-voters now voting. What is the smallest value of x that results in incumbents obtaining an additional seat? 
c. Assume that where UKIP are second to the Conservatives they gain 5 percentage points of share of vote and Conservatives lose 5% and where UKIP are second to Labour they gain 7% and Labour lose 7%. Calculate the overall number of seats for each party with the combined effect of these assumptions. 

Running the script “Question_2.m” (Which internally runs the script “Question_2b.m”), the following pie charts are produced: 

![](https://raw.githubusercontent.com/jamiecayley/MAT1041/gh-pages/public/images/image32-3.png#center) 

Also, the following console output is produced: The minimum gain for one Incumbent to hold their constituency is 0.090000 percent

Once again, the pie chart on the left shows the issue of overlapping pie chart section labels, which will be resolved in the same way as before – by redrawing the pie charts on excel using the data produced by the MATLAB functions. 
Part 2b is included in the running of the code, but has little effect on the overall outcome because it causes one seat that would be taken over by UKIP after the effects of part ‘a’ to be held by the Labour incumbent. This means it is then a seat in which UKIP are second to Labour by a very small amount, and so with the 7% swing from Labour to UKIP in all constituencies where UKIP is second to Labour in part c, the seat falls to UKIP once more. Therefore, the only change that results from part b is an increase of 0.09% to the votes of all incumbents as a result of non-voters voting. However, this is not enough to gain them any additional seats.

### Further Study

The Outputs of the further study section will be explored in the “Written Analysis” Section, as we chose not to complete the suggested ideas for further study, to instead investigate our own ideas (such as the upcoming 2017 snap.


## Report

In section one of the MATLAB analysis, we were asked to calculate the total electorate and the total number of people who voted for both the 2010 and 2015 elections.
We found that there overall percentage turnout for the 2015 election was 66.12%, which is very similar to the average percentage turnout across all constituencies – which was 66.05%. In 2010, the overall percentage turnout was 65.10% and the average across all constituencies was 65.02%.

Turnout in the United Kingdom is comparably low when compared to other Western democracies. For instance, in the Netherlands and Sweden turnout regularly exceeds 70% of the electorate. This may be attributed to the electoral system in use in both those countries which is party list proportional representation. As explained earlier in the report party list PR allows a vote to have greater strength in deciding who their lawmakers are as seats won are proportional to votes cast for parties. On the other hand, changing the electoral system from FPTP to PR in the UK may not improve turnout – in some Western countries such as Portugal the Czech Republic turnout is lower than it is in the UK even though both of those countries have PR.

It is not therefore possible to conclude that FPTP lowers turnout or PR increases turnout, but it is still fair to say that a voter in Britain may be persuaded to abstain from the voting process if they feel that their vote will not make a difference.

We also noted that the UK general election results from both 2010 and 2015 were not proportional, in that the percentage of seats won by both the Conservative and Labour parties exceeded their percentage of vote share. In 2010 the Liberal Democrats won 24% of the vote but won 10% of the seats according to our model. This is in fact skewed because the data for the Democratic Unionist Party which only stands candidates in Northern Ireland is also included within the Liberal Democrats data. In reality, the Liberal Democrats won fewer than 10% of the seats in the 2010 general election.
In 2015 the results were even less proportional. The surge in UKIP support failed to materialise in seat wins as their support was too thinly spread, unlike the SNP’s support which was smaller nationally than UKIP, but concentrated more densely in part of the country: Scotland.

The following question asked us to model the results of the next general election altering some inputs for party vote share. In Q2a) we saw that if we increased the Conservatives by 3% and UKIP by 12%, with Labour and the Liberal Democrats losing 10% and 5% respectively, the Conservatives gain more seats than UKIP do despite the much smaller increase in vote share. This shows that the Conservatives are a closer 2nd in more constituencies than UKIP are. The Excel analysis showed that UKIP are 2nd in 120 constituencies, but in most of these constituencies they are far behind such as the seats in Doncaster, Sheffield, and Barnsley. This further reinforces the point that UKIP’s votes are spread across the country too thinly. In order for them to win seats they must work hard to concentrate their vote in areas where they are strong.
The next question galvanises the points made earlier. If there were a 5% CON-UKIP swing and a 7% LAB-UKIP swing in seats where UKIP are 2nd to both of those parties respectively, UKIP would win just 4 extra seats. 
However if one combined both Q2a) and Q2c) UKIP would win several more seats, returning dozens of MPs to Parliament. However here again the Conservatives would increase their majority, and Labour would have more seats than UKIP despite having a smaller overall vote share.

### Further Analysis

We asked ourselves 4 questions.
1) If there were an Empty Chair party which automatically collected abstentions, how would they fare in a general election using the 2015 results?
2) How many non-voters would Labour need to win in order to win a majority in the House of Commons, keeping other party’s vote share the same?
3) What integer percentage of Conservative voters need to switch to Labour in order for Jeremy Corbyn to lead a majority government?
4) What would the results be for the 2017 general election using the best and worst opinion polls for the Conservatives?

For Q1) all that was required was to add a new column to the matrix of votes cast in each constituency and treat it as a political party competing with the others. The Empties would have won 34% of the votes cast and 346 seats at the general election, winning 194 from Labour and 123 from the Conservatives. Labour would be reduced to a rump of just 41 seats if the Empty Chair party existed – and the Tories would have 69% of the remaining seats in the House of Commons. This further compounds the results obtained in the Excel analysis which showed that Labour won constituencies with considerably lower turnout than the Conservatives did. This shows that there is a greater sense of voter apathy in Labour towns than there is in a Conservative town. This may be down to factors that correlate with Labour voters such as lower socioeconomic status and finding it difficult to travel to a polling station or students who move between addresses regularly.

Alternatively, the reason Labour areas have higher abstentions is because there is less of a debate about Labour’s right to govern in Labour-held areas. So non-Labour supporters are unable to articulate their opposition to Labour in Labour towns to the same extent as non-Conservative supporters in Tory areas. It is evident with the rise of the Scottish Nationalists and UKIP that core Labour voters in their heartlands are losing loyalty to the party, and with enough momentum like the SNP had, Labour could be thrown out of their bases in England and Wales. The Empty Chair party may seem a tad farcical, but it ought to worry Labour that there is a battalion of non-voters lying dormant in their heartlands.

In Q2) we used a script called TurnoutGain and experimented until Labour won more than or equal to 325 seats. The exact percentage of non-voters needed to switch to Labour was 33% and this gave Labour 325 seats.  This amounts to winning 5.4 million non-voters. In practice this is a working majority of 8 because of Sinn Féin’s abstention from the Westminster Parliament. As a caveat to that, the majority is doubtlessly exaggerated because the Social Democratic Labour party, an Irish nationalist party in Northern Ireland, is included within Labour’s data for the purposes of the analysis.

Answering Q3) is crucial as it will provide an answer as to what Labour’s strategy should be for the next general election and whether tacking to the right is worthwhile. If Labour were to target Conservative voters and lose none of their existing voters, then just 2.7 million Conservative voters would need to change their minds to provide Labour with a majority in Parliament. This represents 24% of existing Conservative voters. 

Q2) and Q3) show that is far more efficient for Labour to win Conservative voters than to win non-voters in order to achieve a Labour victory and propel Corbyn and McDonnell into Downing Street. This is because if a Conservative switches to Labour, not only does Labour’s vote share increase but the Conservative vote share decreases too. Winning a non-voter to Labour does not change the Conservative vote share however. It is therefore twice as powerful to convince a Conservative voter to vote Labour as it is to convince a non-voter to vote Labour.

For the final question, we ultimately tried to predict the outcome of the general election on the 8th of June which elects the United Kingdom’s 57th Parliament. The opinion polls were described as worst and best with respect to the Conservatives’ point of view. The worst opinion poll gave the Conservatives a 9% lead over Labour. This represents a 1% LAB-CON swing from the 2015 general election. The results computed from MATLAB showed that the Conservatives would stand to win over a dozen seats directly from Labour and increase their majority from 12 to 50 in the Commons.

If the best opinion poll were borne out by reality then the Conservatives would improve their result to better than anything they have had in living memory with a majority of 194. Just 151 Labour bottoms would sit on the green benches. Such a mega majority for the Conservatives could potentially cause ructions for the Tories as a large group of them may want to break off from the main Conservative party group and could form an Opposition which was larger than the Labour party, thereby becoming the Official Opposition.

