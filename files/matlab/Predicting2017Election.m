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