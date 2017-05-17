% A function to Calculate the fractional increase in the votes obtained by
% a party (as a result of non voters voting) required to win them a seat
% Written by Michael Goldsmith, 2017

function output = MinimumNonVoterFractionToWin(MatrixOfVotes,ConstituencyNum,PartyNum)
AnswerReached = 0;
CurrentRow = MatrixOfVotes(ConstituencyNum,:);
CurrentFraction = -0.0001; %Negative so that the function starts with 0, in case the selected party has already won
while AnswerReached == 0
    CurrentFraction = CurrentFraction + 0.0001;
    WinningPartyVotes = max(CurrentRow(2:9));
    IncumbentSupportingVotes = IncreaseVotes(MatrixOfVotes,ConstituencyNum,PartyNum,CurrentFraction);
    if IncumbentSupportingVotes >= WinningPartyVotes
        AnswerReached = 1;
    end
end
output = CurrentFraction;
end