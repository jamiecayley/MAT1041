% This is a function to find the sum of numbers in a specified excel range
% in a given excel document eg: SumOfExcelRange('Example.xlsx','A1:B2')
% Written By Michael Goldsmith,2017
function Sum = SumOfExcelRange(DocumentName,sheetname,Range)
AreaToSum = xlsread(DocumentName,sheetname,Range);
Sum = 0;
SizeOfArea = size(AreaToSum);
NumberOfRows = SizeOfArea(1);
NumberOfColumns = SizeOfArea(2);
for j =(1:NumberOfColumns)
    ColumnSum = 0;
    for i = (1:NumberOfRows)
        ColumnSum = ColumnSum + AreaToSum(i,j);
    end
    Sum = Sum + ColumnSum;
end
end