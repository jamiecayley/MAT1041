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