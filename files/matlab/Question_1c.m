% The Solution to Question 1c of the MATLAB section
% Written by Michael Goldsmith,2017

TotalVotesArray = NumOfVotes('Modified Spreadsheet.xlsx','2015 election','F1:M650');
TotalSeatsArray = NumOfSeatsWon('Modified Spreadsheet.xlsx','2015 election','F1:M650');
ReducedSeatsArray = TotalSeatsArray(1:6);
ReducedVotesArray = TotalVotesArray(1:6);

Labels = {'CON', 'LAB', 'LIB', 'UKIP', 'Green', 'Nationalist'};

SpreadOfVotes = subplot(1,2,1);
pie(SpreadOfVotes,ReducedVotesArray,Labels);
title(SpreadOfVotes,'The spread of votes for the main parties in the 2015 election')

explode = [0 0 0 1 0 0];
SpreadOfSeats = subplot(1,2,2);
pie(SpreadOfSeats,ReducedSeatsArray,explode,Labels);
title(SpreadOfSeats,'The spread of seats for the main parties after the 2015 election')