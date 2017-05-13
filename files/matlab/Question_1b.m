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
