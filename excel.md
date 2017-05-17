---
layout: page
title: Excel
order: 1
---

## Contents

- [Spreadsheet](#spreadsheet)
- [Report](#report)
	- [General Election Excel Analysis Findings](#general-election-excel-analysis-findings)
	- [Voter Turnout by Constituency](#voter-turnout-by-constituency)
	- [Swings](#swings)
		- [Region 2](#region-2)
		- [Wales](#wales)
		- [UK](#uk)
	- [Incumbent Effect](#incumbent-effect)
	- [Further Analysis](#further-analysis)

## Spreadsheet 

To download the spreadsheet with our Excel analysis click [here](https://github.com/jamiecayley/MAT1041/raw/gh-pages/files/excel/excel-results.xlsx)

## Report

To download the Word document with our group report click [here](https://github.com/jamiecayley/MAT1041/raw/gh-pages/files/group-report.docx). To download the Word document with our Excel report only click [here](https://github.com/jamiecayley/MAT1041/raw/gh-pages/files/excel/excel.docx). To read the text of our report without downloading the word document, keep on reading. Note: the format of the Word document and the report on this page differ.

### General Election Excel Analysis Findings 

The datasets given contained the final results for the 2010 and 2015 General Elections, it contained 649 constituencies within 20 regions and outlined the results per party.

Within the Excel analysis, we selected three regions and analysed the results found. We evaluated each region’s average result and compared them to the national results. The regions chosen were regions 1, 2 and 3. 

![](https://raw.githubusercontent.com/jamiecayley/MAT1041/gh-pages/public/images/image13.png#center)

![](https://raw.githubusercontent.com/jamiecayley/MAT1041/gh-pages/public/images/image13-2.png#center)

![](https://raw.githubusercontent.com/jamiecayley/MAT1041/gh-pages/public/images/image13-3.png#center)

As you can see from the graphs made, there was a significant shift in­ voters in regions 1 and 2. It can be seen that the votes shifted from the Labour Party and Liberal Democrats to the Nationalist party from 2010 to 2015. Within region 3, average votes per party experienced very little change, with the liberal democrats leading in both years with the nationalist party close behind. 

Despite this significant change in votes from regions 1 and 2 regions, the National Average votes for the Nationalist party was still considerably low. Implying that regions 1 and 2 had little influence over the general election.

Next our group analysed the frequency of nth places (n=1,2,3,4) for all parties in the 2015 election. 

We did this by finding the nth places of each party in each constituency by using the “Rank” function.

![](https://raw.githubusercontent.com/jamiecayley/MAT1041/gh-pages/public/images/image14.png#center)

![](https://raw.githubusercontent.com/jamiecayley/MAT1041/gh-pages/public/images/image15.png#center)


Then we used the “Countif” function to count the frequency of nth places for the selectedparty.

![](https://raw.githubusercontent.com/jamiecayley/MAT1041/gh-pages/public/images/image16.png#center)

As you can see, the conservative party came first in a considerable number of constituencies. This reflects on the fact that they won the 2015 election.

The highlighted cell is the amount of times UKIP came second to other parties in 2015.

Next, we found the top ten “winnable” seats for UKIP from other parties in the next election based on the 2015 results. The results were as follows:

<table>

<tbody>

<tr>

<th>UKIP's Top Ten Most "Winnable" Seats from Other Parties in 2015</th>

<th>Difference in Votes from the Winning Party</th>


</tr>

<tr class="even">

<td>Thanet South</td>

<td>2,812</td>


</tr>

<tr>

<td>Hartlepool</td>

<td>3,024</td>


</tr>

<tr class="even">

<td>Boston and Skegness</td>

<td>4,336</td>


</tr>

<tr>

<td>Dagengam and Rainham</td>

<td>4,980</td>


</tr>

<tr class="even">

<td>Stone-on-Trent Central</td>

<td>5,179</td>


</tr>

<tr>

<td>Heywood and Middleton</td>

<td>5,299</td>


</tr>

<tr class="even">

<td>Rochester and Strood</td>

<td>7,133</td>


</tr>

<tr>

<td>Rother Valley</td>

<td>7,297</td>


</tr>

<tr class="even">

<td>Basildon South and East Thurrock</td>

<td>7,691</td>


</tr>

<tr>

<td>West Bromwich West</td>

<td>7,742</td>


</tr>

</tbody>

</table>


This was achieved by filtering the results to find all of those of which UKIP came second. Then, we found the constituencies that had the lowest difference in votes from 1st and 2nd through simply subtracting the second-place result from the first-place result. Then we used conditional formatting to find the 10 lowest values from those results.

### Voter Turnout by Constituency 

Average turnout overall was 65.0% in 2010 and 66.1% in 2015.
We can see from the following graphs that constituencies won by the Conservative and Green parties have the highest turnouts overall, with 68.2% and 70.0% respectively. The constituencies with the lowest turnouts appear to favour minor parties over the larger ones, however Labour held constituencies too have a low turnout rate.

We also observe that a change in turnout rate correlates with a change of leading party vote. All parties that won constituencies which increased in turnout also increased their lead over their opponents, while a decrease in turnouts made for a weaker victory.

![](https://raw.githubusercontent.com/jamiecayley/MAT1041/gh-pages/public/images/image17.png#center)

![](https://raw.githubusercontent.com/jamiecayley/MAT1041/gh-pages/public/images/image18.png#center)

![](https://raw.githubusercontent.com/jamiecayley/MAT1041/gh-pages/public/images/image19.png#center) 

![](https://raw.githubusercontent.com/jamiecayley/MAT1041/gh-pages/public/images/image20.png#center) 


### Swings 

#### Region 2

![](https://raw.githubusercontent.com/jamiecayley/MAT1041/gh-pages/public/images/image21.png#center)

![](https://raw.githubusercontent.com/jamiecayley/MAT1041/gh-pages/public/images/image22.png#center) 

In region 2 we can observe the large shift in support in favour of the Nationalist party, which gained over three times more votes in 2015 than it won in the 2010 election. These votes appear to have come from ex-Labour and ex-Liberal-Democrats, as these parties appear to have suffered the most from this shift, with the Liberal Democrats losing more than half their support. The Conservative party did lose votes, but their overall support seems to have remained largely unaffected.

#### Wales 

![](https://raw.githubusercontent.com/jamiecayley/MAT1041/gh-pages/public/images/image23.png#center)

![](https://raw.githubusercontent.com/jamiecayley/MAT1041/gh-pages/public/images/image24.png#center)

In Wales we observe a large swing from the Liberal-Democratic Party to the UK Independence Party. The Conservative and Labour parties have similar votes in each election, slightly higher in 2015. While their overall votes remain much lower than those of the leading parties, it is worth noting that the Green Party received six times as many votes in 2015 than it did in 2010.

#### UK

![](https://raw.githubusercontent.com/jamiecayley/MAT1041/gh-pages/public/images/image25.png#center)

![](https://raw.githubusercontent.com/jamiecayley/MAT1041/gh-pages/public/images/image26.png#center)

The overall changes in the UK as a whole are very similar to those in Wales, with the Liberal-Democratic party losing a large portion of their votes and UKIP taking their position as the third largest British party. No significant shifts in either the Conservative or Labour parties, which both seem to slightly strengthen their positions. Support of the Nationalist Party has doubled, which can be related back to the large swing of votes in Scotland.

### Incumbent Effect

![](https://raw.githubusercontent.com/jamiecayley/MAT1041/gh-pages/public/images/image27.png#center)

![](https://raw.githubusercontent.com/jamiecayley/MAT1041/gh-pages/public/images/image28.png#center) 

![](https://raw.githubusercontent.com/jamiecayley/MAT1041/gh-pages/public/images/image29.png#center) 

Using the IF and COUNTIF functions, we can show and find the number of recurring winners in the 2015 election.

In 2015, 453 of the 650 constituencies (69.7%) were won by winners in 2010, with only 197 won by new candidates (30.3%). This supports the idea of there being an “Incumbent Effect” as a current MP has a much higher likelihood of being re-elected. While a previous winner does appear to be significantly more likely to win, they do not seem to gain a huge number of votes for the following election, although there is still an increase. These candidates won an average of 50.5% of votes in their constituencies in 2015, compared to 47.1% in 2010 (increase of 7.2%).

### Further Analysis 

#### Average votes between countries within the UK 


![](https://raw.githubusercontent.com/jamiecayley/MAT1041/gh-pages/public/images/image30-1.png#center) 

![](https://raw.githubusercontent.com/jamiecayley/MAT1041/gh-pages/public/images/image30.png#center) 

As you can see from the data, all three regions had different winning parties. Region 1 in Scotland had a significant win by the Nationalist Party. Region 3 in Northern Ireland had a narrow win by the Lib Dems. Region 12 in Wales had a convincing win by the Labour Party. Region 20 in England had a substantial win by the Conservative Party. Region 20 had a similar result to the National Average, suggesting that this region and those around it had a large influence over the final result.

![](https://raw.githubusercontent.com/jamiecayley/MAT1041/gh-pages/public/images/image31-1.png#center) 

As you can see from the pie charts above, The national average vote distribution experienced little change for the conservative (+1%) and labour (+2%) parties. However, the Lib Dem party experienced a significant fall in average votes (-16%), whereas UKIP experienced a significant increase in average votes (+12%).

![](https://raw.githubusercontent.com/jamiecayley/MAT1041/gh-pages/public/images/image31-2.png#center) 

As you can see from the pie charts above, there was a massive shift in voters from the Labour Party in 2010 to the Scottish National Party in 2015. This resulted in the SNP going from 21% in 2010 to49% in 2015. This change occurred due to the massive support of the Scottish People for the SNP’s policies and promises.

![](https://raw.githubusercontent.com/jamiecayley/MAT1041/gh-pages/public/images/image31-3.png#center) 

As you can see from the pie charts above, there was very little change in average votes per party within region 3 (Northern Ireland). The largest change in votes came from UKIP, which experienced a change from 0% in 2010 to 3% in 2015.

![](https://raw.githubusercontent.com/jamiecayley/MAT1041/gh-pages/public/images/image31-4.png#center) 

As you can see from the pie charts above, Region 12 (Wales) mainly experienced changes in average votes in the Lib Dems, which experienced a fall in average votes from 20% to 6%, and UKIP which experienced and increase in voted from 3% to 14%.

![](https://raw.githubusercontent.com/jamiecayley/MAT1041/gh-pages/public/images/image31-5.png#center) 

As you can see from the pie chart above, Region 20 (England) experienced average vote changes again in the Lib Dems and UKIP. The Lib Dems experienced a change from 24% in 2010 to 8% in 2015. UKIP experienced a changed of average voted from 4% in 2010 to 17% in 2015.

Though it looks like those who voted Lib Dem switched to UKIP, this was not the case. In actual fact, unhappy voters from the Conservative party switched to UKIP and then voters that voted for the Lib Dems in 2010 voted conservative in 2015.
