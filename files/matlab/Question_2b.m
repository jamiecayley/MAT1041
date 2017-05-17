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