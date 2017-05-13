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