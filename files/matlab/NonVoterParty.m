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