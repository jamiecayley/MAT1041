OriginalMatrix = xlsread('Modified Spreadsheet.xlsx','2015 election','E1:M650');
SizeOfMatrix = size(OriginalMatrix);
NumOfConstituencies = SizeOfMatrix(1);
NumOfColumns = SizeOfMatrix(2);

NewMatrix = zeros(NumOfConstituencies,NumOfColumns-1);
for i = (1:NumOfConstituencies)
    ConstituencyTotalElectorate = OriginalMatrix(i,1);
    OnePercent = ConstituencyTotalElectorate/100;
    NewMatrix(i,1) = OriginalMatrix(i,2) + 3*OnePercent; %Conservative increased by 3 percentage points
    NewMatrix(i,2) = OriginalMatrix(i,3) - 10*OnePercent; %Labour reduced by 10 percentage points  
    NewMatrix(i,3) = OriginalMatrix(i,4) + 5*OnePercent; %Libdem reduced by 5 percentage points
    NewMatrix(i,4) = OriginalMatrix(i,5) + 12*OnePercent; %UKIP increased by 12 percentage points
    for j =(6:NumOfColumns)
        NewMatrix(i,j-1) = OriginalMatrix(i,j);
    end
end