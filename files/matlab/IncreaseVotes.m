% This is a function to increase the votes of one party in a
% constituency by a certain fraction of the total, by increasing the number
% of non voters who vote for them.
% Written by Michael Goldsmith, 2017
function output = IncreaseVotes(Matrix,ConstituencyNum,PartyNum,FractionalVoteChange)
CurrentRow = Matrix(ConstituencyNum,:);
CurrentFraction = CurrentRow(PartyNum + 1)/sum(CurrentRow(2:9));
DesiredFraction = CurrentFraction + FractionalVoteChange;
TotalOpposition = sum(CurrentRow(2:9))-CurrentRow(PartyNum+1);
TotalOppositionDesiredFraction = 1 - DesiredFraction;
TotalVotersNeeded = TotalOpposition/TotalOppositionDesiredFraction;
SupportingVoters = TotalVotersNeeded - TotalOpposition;
output = SupportingVoters;
end