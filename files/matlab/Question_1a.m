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
