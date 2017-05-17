% The Solution to Question 2 of the MATLAB section
% Written by Michael Goldsmith,2017

%First, import the 2015 results to make adjustments to
OriginalMatrix = xlsread('Modified Spreadsheet.xlsx','2015 election','E1:M650');
SizeOfMatrix = size(OriginalMatrix);
NumOfConstituencies = SizeOfMatrix(1);
NumOfColumns = SizeOfMatrix(2);

% Create the new matrix and fill it with values given after the changes
% specified in part 2a
NewMatrix = zeros(NumOfConstituencies,NumOfColumns);
for i = (1:NumOfConstituencies)
    TotalVoters = sum(OriginalMatrix(i,2:9)); % Calculating the total number who voted
    OnePercent = TotalVoters/100; % Calculating one percent of the total number who voted, to use in calculations
    NewMatrix(i,1) = OriginalMatrix(i,1); %Copying the total Electorate Column
    NewMatrix(i,2) = OriginalMatrix(i,2) + 3*OnePercent; %Conservative increased by 3 percentage points
    NewMatrix(i,3) = OriginalMatrix(i,3) - 10*OnePercent; %Labour reduced by 10 percentage points  
    NewMatrix(i,4) = OriginalMatrix(i,4) - 5*OnePercent; %Libdem reduced by 5 percentage points
    NewMatrix(i,5) = OriginalMatrix(i,5) + 12*OnePercent; %UKIP increased by 12 percentage points
    for j =(6:NumOfColumns)
        NewMatrix(i,j) = OriginalMatrix(i,j);
    end
end

%Modifying the votes as specified in part 2b
% NewMatrix = Question_2b(NewMatrix,OriginalMatrix);

% Modifying the votes earned as specified in part 2c
for i = (1:NumOfConstituencies)
    CurrentRow = NewMatrix(i,2:9);
    if CurrentRow(1) == max(CurrentRow) %does the Conservative Party have the most votes?
        if CurrentRow(4) == max(CurrentRow(CurrentRow < max(CurrentRow))) % if so, are UKIP second?
            TotalVoters = sum(CurrentRow); % Calculating the total number who voted
            OnePercent = TotalVoters/100; % Calculating one percent of the total number who voted, to use in the calculation
            NewMatrix(i,2) = CurrentRow(1) - 5*OnePercent; % Conservatives lose 5% of the votes
            NewMatrix(i,5) = CurrentRow(4) + 5*OnePercent; % UKIP gains 5% of the votes
        end
    elseif CurrentRow(2) == max(CurrentRow)% Does the Labour Party have the most votes?
        if CurrentRow(4) == max(CurrentRow(CurrentRow < max(CurrentRow))) % if so, are UKIP second?
            TotalVoters = sum(CurrentRow); % Calculating the total number who voted
            OnePercent = TotalVoters/100; % Calculating one percent of the total number who voted, to use in the calculation
            NewMatrix(i,3) = CurrentRow(2) - 7*OnePercent; % Labour loses 7% of the votes
            NewMatrix(i,5) = CurrentRow(4) + 7*OnePercent; % UKIP gains 7% of the votes
        end
    end
end

% Calculating the effects of the adjustments:
WonSeats = MatrixOfSeatsWon(NewMatrix(:,2:9));
PredictedNumOfSeatsWon = zeros(1,8);
for i = (1:8)
    PredictedNumOfSeatsWon(1,i) = sum(WonSeats(:,i));
end
TotalVotesArray = zeros(1,8);
for i = (1:8)
    TotalVotesArray(i) = sum(NewMatrix(:,i+1));
end
    
% Plotting Results
SpreadOfVotes = subplot(1,2,1);
Labels = {'CON', 'LAB', 'LIB', 'UKIP', 'Green', 'Nationalist','Minor','Other'};
pie(SpreadOfVotes,TotalVotesArray,Labels);
title(SpreadOfVotes,'The spread of votes after the changes')

SpreadOfSeats = subplot(1,2,2);
pie(SpreadOfSeats,PredictedNumOfSeatsWon,Labels);
title(SpreadOfSeats,'The projected spread of seats after the changes')