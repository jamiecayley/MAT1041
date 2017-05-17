% The Solution to Question 1d of the MATLAB section
% Written by Michael Goldsmith,2017

%Large Sections of this are directly copied from my solutions to part 1c
TotalVotesArray2015 = NumOfVotes('Modified Spreadsheet.xlsx','2015 election','F1:M650');
TotalSeatsArray2015 = NumOfSeatsWon('Modified Spreadsheet.xlsx','2015 election','F1:M650');
ReducedSeatsArray2015 = TotalSeatsArray2015(1:6);
ReducedVotesArray2015 = TotalVotesArray2015(1:6);

TotalVotesArray2010 = NumOfVotes('Modified Spreadsheet.xlsx','2010 election','F1:M650');
TotalSeatsArray2010 = NumOfSeatsWon('Modified Spreadsheet.xlsx','2010 election','F1:M650');
ReducedSeatsArray2010 = TotalSeatsArray2010(1:6);
ReducedVotesArray2010 = TotalVotesArray2010(1:6);

Labels = {'CON', 'LAB', 'LIB', 'UKIP', 'Green', 'Nationalist'};

SpreadOfVotes2015 = subplot(2,2,1);
pie(SpreadOfVotes2015,ReducedVotesArray2015,Labels);
title(SpreadOfVotes2015,'The spread of votes for the main parties in the 2015 election')

explode = [0 0 0 1 0 0];
SpreadOfSeats2015 = subplot(2,2,2);
pie(SpreadOfSeats2015,ReducedSeatsArray2015,explode,Labels);
title(SpreadOfSeats2015,'The spread of seats for the main parties after the 2015 election')

explode = [0 0 0 0 1 0];
SpreadOfVotes2010 = subplot(2,2,3);
pie(SpreadOfVotes2010,ReducedVotesArray2010,explode,Labels);
title(SpreadOfVotes2010,'The spread of votes for the main parties in the 2010 election')

explode = [0 0 0 0 0 0];
SpreadOfSeats2010 = subplot(2,2,4);
pie(SpreadOfSeats2010,ReducedSeatsArray2010,explode,Labels);
title(SpreadOfSeats2010,'The spread of seats for the main parties after the 2010 election')