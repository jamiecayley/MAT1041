---
layout: page
title: Group Report
order: 3
---

- [Word Document](#word-document)
- [Mathematician's Contribution to Election Method Design by Jamie](#mathematicians-contribution-to-election-method-design)
	- [The Early History of Voting Theory](#the-early-history-of-voting-theory)
	- [Some Election Methods in Action](#some-election-methods-in-action)
	- [A Few Results Relating to Designing and Selecting Election Methods](#a-few-results-relating-to-designing-and-selecting-election-methods)
	- [Conclusion](#conclusion)
- [Major Voting Systems in Use Around the World by Manny](#major-voting-systems-in-use-around-the-world) 
	- [First Past the Post](#first-past-the-post)
	- [Party List Proportional Representation](#party-list-proportional-representation)
	- [Two-Round Run-Off](#two-round-run-off)
	- [Additional-Member Sytem](#aditional-member-system)
	- [Alternative Vote](#alternative-vote)
- [Different Forms of Proportional Representation by Alex](#different-forms-of-proportional-representation)
	- [What is Proportional Representation?](#what-is-proportional-representation)
	- [The Different Forms of Proportional Representation](#the-different-forms-of-proportional-representation)
		- [Single Transferable Vote (STV)](#single-transferable-vote)
		- [Party List Proportional Representation](#party-list-proportional-representation)
		- [Semi-Proportional Representation](#semi-proportional-representation)
	- [Conclusion](#conclusion)
- [Advantages and Disadvantages of First Past the Post by Michael](#advantages-and-disadvantages-of-first-past-the-post)
- [Accuracy of Opinion Polling](#accuracy-of-opinion-polling)
	- [How is Opinion Polling Conducted?](#how-is-opinion-polling-conducted)
	- [Online Polling](#online-polling)
	- [Telephone Polling](#telephone-polling)
	- [Final Call Predictions for the 2015 Election by Multiple Polling Organisations](#final-call-predictions-for-the-2015-election-by-multiple-polling-organisations)
	- [Comparison of Online and Telephone Polling Accuracy in the 2015 General Election](#comparison-of-online-and-telephone-polling-accuracy-in-the-2015-general-election)
	- [Undecided Voters](#undecided-voters)
	- [Conclusion](#conclusion)
- [General Election Excel Analysis Findings](#general-election-excel-analysis-findings)
	- [Voter Turnout by Constituency](#voter-turnout-by-constituency)
	- [Swings](#swings)
		- [Region 2](#region-2)
		- [Wales](#wales)
		- [UK](#uk)
	- [Incumbent Effect](#incumbent-effect)
- [MATLAB report](#matlab-report)
- [References](#references)

## Word Document 

To download the word document with our group report click [here](https://github.com/jamiecayley/MAT1041/raw/gh-pages/files/group-report.docx). To read the text of our report without downloading the word document, keep on reading. Note: the format of the word document and the report on this page differ; the Excel and MATLAB reports are the same as the ones on the Excel and MATLAB pages, they were reproduced there to supplement the spreadsheets and the MATLAB code.  

## Mathematician's Contribution to Election Method Design 

Election methods consist of a set of rules that must be followed for a vote to be valid, including the form of the ballot (how votes are cast) as well as the process used to determine the final result of an election. The specific election method used can have a significant effect in the election’s final result, especially if there are more than 2 options for voters to choose, making the study of election method design very important.<sup>1</sup> This report offers a brief overview of the history of voting theory, some of the contributions mathematicians have made to the field as well as explain some of the mathematical challenges involved in designing election methods. 

### The Early History of Voting Theory 
Voting and elections have played a significant role in society for centuries, but academics didn’t start studying them until much later. Voting has been a part of democracy since the 6th century, when Athenian democracy was introduced. However, election method design, the main focus of voting theory, wasn’t an object of academic study until the 18th century.<sup>2</sup> Jean-Charles the Borda and Marquis de Condorcet are usually credited as the founders of voting theory for their contributions developing the Borda count, the Condorcet method and the Condorcet paradox.<sup>3</sup>

Later in the 18th century the topic of apportionment (also sometimes known as proportional representation), the process by which seats in a legislature (e.g. parliament) are allocated, began to be studied because the United States Constitution mandated that seats in the House of Representatives had to be allocated proportional to the population in each state but didn’t specify how.<sup>4</sup> Various methods were proposed, and later, some of the methods discovered in the United States were rediscovered in Europe in the 19th century including Jefferson’s method/d’Hondt method, Webster’s method/Sainte-Laguë method, and Hamilton’s method/Hare largest remainder method.<sup>4</sup> The single transferable vote, another apportionment method, was developed by Carl Andræ in Denmark in 1855<sup>5</sup> and Thomas Hare in England in 1857.<sup>6</sup> 
In the late 19th century the focus went back to single winner methods. Around 1870 William Robert Ware propose applying single transferable vote to single winner elections, which became what is now known as the alternative vote.<sup>7</sup> Shortly after mathematicians started revisiting Condorcet’s and Borda’s ideas and inventing new Condorcet methods, for example, Edward Nanson combined the alternative vote and the Borda count and produced a new Condorcet method called Nanson’s method.<sup>8</sup> Charles Dodgson introduced the use of matrices to analyse Condorcet elections and proposed another Condorcet method known as Dodgson’s method.<sup>9</sup> Ranked voting methods started gaining support and being used in government elections. The alternative vote was first adopted in Australia in 1893 and continues to be used to date.<sup>10</sup>  

### Some Election Methods in Action 

The Borda count, the Condorcet method and the alternative vote are all single winner election methods in which voters rank options in order of preference.<sup>11</sup> When using the Borda count the outcome is determined by giving each option a number of points corresponding to the number of candidates ranked lower; when using the Condorcet method the outcome is determined by counting how many votes rank one candidate over the other for each possible pairing of candidates; when using the alternative votes the outcome is determined by counting the votes for each voter’s top choice, declaring a winner if a candidate has more than half of the voters or removing the candidate in last place and recounting until a candidate has a majority.<sup>11</sup> 

The Borda count is currently used for some political elections in Slovenia<sup>12</sup>, Kiribati<sup>13</sup> and Nauru<sup>14</sup>; the Condorcet method is used in elections in various organizations including Music Television (MTV) <sup>15</sup>, Ubuntu<sup>16</sup>, and Wikipedia<sup>17</sup>; the alternative vote is used for some political elections in Australia<sup>18</sup>, Canada<sup>19</sup>, the Czech Republic<sup>20</sup>, India<sup>21</sup>, Ireland<sup>22</sup>, New Zealand<sup>23</sup>, Papua New Guinea<sup>24</sup>, the United Kingdom<sup>25</sup> and the United States<sup>26, 27</sup>. These 3 methods will be illustrated in the diagram below. 

![Election Methods](https://raw.githubusercontent.com/jamiecayley/MAT1041/gh-pages/public/images/image1.png#center)

### A Few Results Relating to Designing and Selecting Election Methods 

As seen above, the election method chosen can affect who is the winner, which raises the question of how to decide which election method to use. Mathematical criteria can be defined, and voting methods can hence be assessed based on whether or not they fit the criteria. However, the criteria might not be relevant in practice. An alternative approach is to define a set of ideal properties and then see how close different voting methods come to having said ideal properties over a large sample of simulated elections. In this case, the results are practically relevant but the result might be biased based on how the elections are simulated. In this section I’ll go over a few theorems and results relating to this topic. 
The Condorcet paradox states that when there are 3 or more alternatives, the collective preferences can be cyclic even if the preferences of individual voters aren’t, e.g. if the voters’ ranked preferences are ABC,  BCA, CAB  respectively then A is preferred over B which is preferred over C which is preferred over A.<sup>28</sup> One important implication of this paradox is that in a two stage voting process the winner might depend on how the 2 stages are structured.11 If the winner of A versus B then faces C then A would defeat B and then lose to C. But if instead the winner of B versus C faces A then B would defeat C and then lose to A. 

Arrow’s theorem states that when there are 3 or more alternatives no ranked order voting system can convert the individuals’ ranked preferences into a community-wide ranking while also meeting the following criteria: 
Unrestricted domain: all voters’ preferences are allowed.
Non-dictatorship: a single voter’s preference can’t determine the result of the election
Pareto efficiency: we can’t pick a winner that would better fit an individual’s preferences without it being a worse fit for other individual’s preferences. 
Independence of irrelevant alternatives: if candidate A is preferred over candidate B, introducing a third option  C mustn’t make B preferred over A.<sup>29</sup>
A related result is the Gibbard-Satterthwaite theorem which states that if there are 3 or more options in a single-winner election one of the following must be true regardless of the specific election method used: 
Dictatorship (as explained above). 
There is a candidate who can never win. 
The method is susceptible to tactical voting, i.e. a voter supporting a candidate other than their preference to prevent their least favourite candidate from winning.<sup>30, 31</sup>

### Conclusion

Mathematicians have made a lot of valuable contributions to voting theory. Some of the contributions were listed here, like the Borda count and the Condorcet method, but this is by no means a comprehensive account. Mathematician’s contributions to voting theory aren’t limited to direct contributions to the field either, for example, number theory and cryptography have recently started playing a role in the field. However, a lot of work remains to be done to better determine which election methods can best represent voters’ opinions and how to avoid bias or result manipulation deriving from the election method design. 

## Major Voting Systems in Use Around the World

There is a plethora of electoral systems in use to elect Parliaments around the world. We will explore the most popular electoral systems in this report and briefly comment on the fairness of these systems.

* First past the post (FPTP)
* Party list proportional representation (PR)
* Two-round run-off
* Additional-member system (AMS)
* Alternative Vote (AV)

### First Past the Post

First past the post is one of the most popular voting systems around the world, especially within countries formerly part of the British Empire.<sup>32</sup> It is used in the UK, USA, India, Canada, and a variety of other countries.<sup>32</sup> FPTP demands that the nation is divided into constituencies. Each constituency returns one member to Parliament. Hence, there are only as many members taking seats in Parliament as there are constituencies in the country.

On polling day, the electorate is given a list of candidates standing for election in their constituency.  An individual may only choose one candidate to vote for.  After polling stations close, the votes are subsequently counted and the candidate with the most votes wins and is sent to Parliament. Therefore, all other candidates lose and are not sent to Parliament; this leads to some dubbing this system “winner takes all”.<sup>33</sup>

![Election Results](https://raw.githubusercontent.com/jamiecayley/MAT1041/gh-pages/public/images/image2.png#center) Figure 1: Pie chart<sup>34</sup> showing the results from the UK 2015 Westminster elections. Inner circle shows popular vote. Outer circle shows seats won. 

The popular vote for a party is defined as the total number of votes won by all the candidates who stood for the same party.  Since losers are given nothing, nor is there a minimum vote the winner must achieve, this can lead to Parliaments where one party may have a majority of seats but a minority of the popular vote. This happens because the party that won the election, fielded candidates who defeated all alternative candidates in a majority of constituencies in the country. Thus, proportionality is traded for local accountability.

### Party List Proportional Representation

Party list PR is popular in the European Mainland, Latin America, and sub-Saharan Africa.<sup>35</sup> Unlike FPTP, the country does not need to be divided into constituencies. However, constituencies do exist in some countries such as Spain.<sup>36</sup> Political parties are required to produce ranked lists of candidates that they would like to sit in Parliament.

On polling day, the electorate is then given the right to choose their favourite list of candidates and may vote for one respectively. There are several different ways to count votes, here we will look at a commonly used method which is the d'Hondt method.<sup>37</sup> First, the total votes are tallied and divided by the number of seats won by the party (either in the constituency or the entire nation) plus one to acquire a number for the quota for each party. Obviously, at the beginning of the counting process every party has zero seats.

![Quota](https://raw.githubusercontent.com/jamiecayley/MAT1041/gh-pages/public/images/image3.png#center)

Under the d'Hondt counting system, the party which has the largest quota has its 1st member of the list granted a seat in Parliament and they are duly elected. Then the quota for that party is adjusted thereafter and the party with the largest quota is sought after again. This process is repeated, so ensuring a level of proportionality of seats won to votes cast for those parties. It also ensures that the leadership of all the parties are entrenched in Parliament since the leadership put themselves at the top of the list.<sup>38</sup> Here local accountability is exchanged for proportionality.

### Two-Round Run-Off

Two-round run-off systems are very similar to first past the post. The President of the 5th French Republic is elected this way. Like FPTP, the country is divided into constituencies and each constituency elects one MP from a list of candidates standing there. The election is split into two polling days usually a week apart.

On the 1st polling day, voters vote for their favourite candidate. If no-one receives more than 50% of the total vote in the first round,<sup>39</sup> then the two most popular candidates are selected to stand for election again in the 2nd round. All candidates who win over 10% may stand in the 2nd round.<sup>40</sup> The winner of the 2nd round is then returned to Parliament, with the loser of the 2nd round facing the same fate as those who didn’t make it to the 2nd round. A major consequence of two-round is establishment parties collaborating with each other in the 2nd round to cut down minor parties. They do this by standing down and letting a less disagreeable opponent win.<sup>41</sup>

### Additional-Member System

Additional-Member systems are a mixture of first past the post and party lists. The most well-known Parliaments which are elected using AMS are the Scottish Parliament and the German Bundestag. The nation is divided into constituencies and each of these constituencies belong to one region each e.g. all the Glasgow constituencies belong to the Glasgow region. Each constituency returns one member to the Parliament, just as it would do under FPTP. In addition to those MPs, more are elected from a top-up list which operates under the d’Hondt system. 

Figure 1 Scottish Parliamentary election results for 2016 with constituency results on the left and regional list results on the right.<sup>42</sup>
On polling day, individuals from the electorate are provided two ballots each. One for their constituency and one for their region. They then choose their favourite candidate to represent their constituency and then their favourite party list for the region. Constituency seats are allocated using FPTP. The distribution of regional seats operates under the d’Hondt system. Constituency seats won in that region as well as regional seats are used to find the quota. Therefore, there are two classes of politicians: one which was directly elected by a locality and another which was elected from a list for a region.<sup>43</sup>

![Election Results](https://raw.githubusercontent.com/jamiecayley/MAT1041/gh-pages/public/images/image4.png#center)Figure 2: Scottish Parliamentary election results for 2016 with constituency results on the left and regional list results on the right <sup>47</sup>

### Alternative Vote

AV is used to elect the Australian House of Representatives.<sup>44</sup> AV is like first past the post insofar as the country is divided into constituencies and each constituency elects one MP from a list of candidates.
On polling day, voters are then able to rank candidates in numerical order with lower numbers indicating higher preference. Voters are free to rank as many as they please. The votes are then tallied and if no candidates win over 50% of the 1st preference votes, then the candidate with the fewest votes is eliminated. That candidate’s votes are redistributed per their 2nd preferences. This process repeats (using 3rd, 4th, etc. preference votes) until a candidate breaches the 50% threshold, therefore winning a seat in Parliament. This system was devised to stop the ‘spoiler effect’ found in FPTP elections.<sup>45</sup> 

From the wide variety of electoral systems in use around the world, not only is democracy widespread but the people want different things from their electoral systems. FPTP offers direct accountability of politicians but party list PR gives proportionality of seats won to votes cast. Whilst others try to create a compromise between proportionality and local accountability.  So, we can conclude that fairness in elections implies different things to different electorates and nations.

## Different Forms of Proportional Representation 

### What is Proportional Representation?

Proportional Representation is a general term for different election processes which all attempt to fix the problems of majoritarian voting systems, to ensure that the distribution of power in a system is as equal as possible to the voting preferences of the population. The goal is to make every vote count as much as another, regardless of whether the vote was for a popular candidate or party. It is a system which chooses fairness over political stability, as it nearly always results in coalitions.

Before getting into the different types of Proportional Representation, it is important to highlight the main issues it attempts to resolve:

First Past the Post (FPTP) elections: This is the most basic form of majoritarian voting systems. In FPTP, the candidate or party with the most votes wins 100% of the election. While this may not seem unreasonable, if one considers a scenario where three parties are competing against each other and two of them receive 30% of votes each while the last party receives 40%, the last party will win the entire election and the 60% of the population that voted for other parties will not be represented at all. This encourages the population to vote tactically, rather than for the party they like the most.

The Spoiler Effect: This is an effect which even other majoritarian systems, such as the Alternative Vote, seek to mitigate. New parties entering a FPTP election help their biggest opponents, and damage the success of similarly motivated parties due to votes being split between them. Consider a FPTP election where the “Blue” Party will win 40% of the vote and the “Orange” party is predicted to win 60%. If a third party, the “Pink” party, with similar ideas to “Orange” decides to enter the election, the “Orange” party’s votes will now be split between both themselves and the new “Pink” party. If they each then win 30% of the vote, the “Blue” party’s 40% will win the entire election, even if it’s the party that the majority of the population liked the least. This discourages any political diversity and means that FPTP voting will always trend toward a Two-Party System.

Gerrymandering: This is a practice that can be abused by a party already in power to maximise their chances of being re-elected. It is done by manipulating the boundaries of constituencies so that their voters make up the minimum majority in each constituency.

### Different forms of Proportional Representation

#### Single Transferable Vote

Although not too common, the Single Transferable Vote system focuses on giving each constituency multiple representatives proportional to the votes in that constituency. It is used in Ireland’s Presidential election, as well as smaller elections in many other countries.

It works as follows: 

Each constituency will want to elect a number of representatives relative to its size. A candidate will need 100%/n of the vote, where “n” is the number of representatives, to be elected.

Several candidates will run for election. Multiple candidates from the same party can run alongside each other.

The population votes for the candidates, ordering them in terms of preference, much like the Alternative Vote.

If any candidates meet the voting quota, they are elected. Any votes that take them above this quota are redistributed to the second choice candidate.

If the redistribution of excess votes takes another candidate above the quota, they are elected. If not, the candidate with the fewest votes is eliminated, and their votes are redistributed to their second choice candidates. This step is repeated until the number of representatives needed is met.

This is an effective type of Proportional Representation, as it encourages the population to vote for the candidate they like most, even if they are worried they might not win. This is because if they are eliminated from the election, the vote goes to the second-best candidate, rather than going totally to waste, as in FPTP. It also gives a chance for smaller parties to be represented if they are the second choice for many other candidates. Because this system’s tries to make each person’s vote as valuable as possible, Gerrymandering is mitigated to a large extent. The greatest strength of STV is that you vote for direct representatives of your constituency, rather than for a party in general. It is however not as representative as Party-list Proportional Representation.

#### Party-list Proportional Representation 

Party-list Proportional Representation is different from STV in that a population will vote for a party in a larger district rather than a candidate in a constituency. This is interesting, as it means that parties are integral part of the voting system, and any individual candidate is treated as a party too.

Each district has a certain number of seats and each party will receive a number of seats proportional to the percentage of the vote they won in the district.

There are two main types of Party-list PR: Open-list PR and Closed-list PR. In Open-list, voters can decide which candidates they would like see take seats in the district. This is used in many European countries such as Sweden, Finland and the Netherlands. In Closed-list, voters do not get the choice, the candidates are decided within the party. This is used in Russia, South Africa, and other countries.

The advantage of Party-list PR is that it is the most fair, proportional system. Small parties and minorities are encouraged. Everyone is represented relative to the size of the vote. Because of this, there is near to no incentive to Gerrymander. It will however nearly always result in a coalition government, as it becomes incredibly difficult to achieve a majority with this system.

#### Semi-proportional representation

There are also a couple of systems which marry concepts from majoritarian and proportional elections. Most notable of these is Mixed Member proportional representation (MMP), where each constituency will elect one candidate using the FPTP model, but then an equal amount of candidates are elected to fit the proportional split in parties. If one were to consider five constituencies where three parties, the Green party, the Yellow party, and the Brown party were competing, and in each constituency, there was 20% support for Green, 35% support for Yellow and 45% support for Brown, the Brown party would win all five FPTP candidate elections. However, now the number of seats is doubled to ten, and the largest party is given a seat until they are over-represented. So here, Yellow would be given four seats, and Green would be given one, so that even if they did not win the FPTP elections, they are still proportionally represented overall.

### Conclusion

There are many ways to assemble a proportional election, but the goals of preventing minority rule, giving a fair voice to all people, and the mitigation of Gerrymandering are the same with them all. Their strength is however also their greatest weakness, as they nearly always result in coalitions.

## Advantages and Disadvantages of First Past the Post 

‘First Past the Post’ is a voting system that involves the electorate casting one vote each for a single candidate in their local constituency; the winner is the candidate who collects the most votes, and this candidate gains a seat in parliament. 

One of the defining features of this system is that candidates who do not win in a constituency gain no representation in parliament, regardless of how much support they accrued in the area. This is the underlying cause of most of the disadvantages of the system, but it also solves many of the problems that are faced by other electoral systems in place around the world.

Firstly, the system is very effective at producing majority governments – coalitions are rare. With only one seat in parliament available per constituency, election results in constituencies are much more decisive, which –in turn- causes the overall results of the general election to be much more decisive. This can be considered an advantage, since (in the UK) “conflicting ideologies” in a coalition “can make a government fractious whilst also weakening government”.<sup>53</sup>

On the other hand, the ‘winner gets the seat’ system causes the geographical location of a parties supporters to become very important in winning elections. A party will win many more seats if all of its supporters are concentrated in an area, rather than spread out over the whole of the UK. Taking the 2015 election as an example, the Scottish National Party was able to win 56 seats despite only having 4.7% of the overall vote share, whereas UKIP won only one seat with 12.6% of the overall vote share.<sup>54</sup> This was entirely due to the effect described, with the supporters of the Scottish National Party concentrated in Scotland (where the party won all but three seats)<sup>55</sup> and the supporters of UKIP spread over the whole of the UK. The concentration of SNP voters compared to UKIP voters is visualised in the maps below (figure 1 and figure 2), where the more opaque the colour, the higher the percentage of supporters in that constituency.

![UKIP Map](https://raw.githubusercontent.com/jamiecayley/MAT1041/gh-pages/public/images/image5.png#center)  Figure 1: Map showing the spread of UKIP votes <sup>55</sup> 

![SNP Map](https://raw.githubusercontent.com/jamiecayley/MAT1041/gh-pages/public/images/image7.png#center)  Figure 2: Map showing the spread of SNP votes <sup>55</sup> 

Marginal seats are also an occurrence when using a single-winner voting system. Marginal seats are seats for which the leading party has a very small lead over the other popular parties in the associated constituency. Most commonly, these seats are two way marginal, where two parties are in close competition to win. Such seats are an issue because the winning party will have often gained fewer than half of the votes, meaning that most voters in the constituency would prefer for a different candidate to be in power. In some cases, two way marginal seats can develop further into three way marginal seats, which significantly worsens the problem as supporters of the winning party will be considerably outnumbered by the combined supporters of the other two major parties.

Strongly linked to the problem of marginal seats is the issue of tactical voting. This may occur when an elector’s preferred candidate appears to be unable to win the seat, and so voting for their favourite would seem be a waste of the elector’s vote (this particularly occurs in marginal seats). As such, the elector will often choose to vote in such a way as to keep their least preferred candidate out of power. 

An example for marginal seats and tactical voting is the constituency of ‘Hampstead and Kilburn’ in London. This was a marginal seat in the 2015 election with Labour winning 44.4% of the votes and the Conservative party winning 42.3% of the votes.<sup>56</sup> In this case, supporters of other parties such as UKIP may have chosen to vote tactically for either Labour or the Conservatives - it would have been clear from opinion polls that their own preference would not win.

A further effect of the lack of representation for voters who do not support the winning candidate, is that voters may be divided if two or more candidates with similar goals run- an occurrence known as ‘split votes’. If this takes place, it can lead to opposition with fewer supporters completely controlling the constituency. The impact of this is most obvious in areas such as Northern Ireland where there is a strong divide between two groups with conflicting ideals. In this case, these groups are the unionists and the nationalists; they are extremely opposed to candidates from the respective opposite groups. 

By investigating the results for the constituency of ‘Fermanagh and South Tyrone’ in the 2015 general election, it can be seen that the seat was won by the unionist candidate Tom Elliot, despite him only having 46.4% of the votes, compared to a total 50.8% between the two largest nationalist parties. The reason for this was that –despite outnumbering the unionists- these nationalist voters were split with Michelle Gildernew winning 45.4% of the total votes and John Coyle winning the remaining 5.4%.<sup>57</sup> So, as a consequence of the ‘First Past the Post’ voting system, a constituency that is mostly populated by nationalists is entirely represented in parliament by a unionist. 

One advantage to the system is that voters have a strong link to their local MPs, since electors vote for candidates and not for a party. Due to these strong links, voters can be in support of an MP who they believe is good for their area, instead of a particular political party. This was highlighted in 2014 in the constituency of Clacton, when the MP Douglas Carswell defected from the Conservative party to UKIP and resigned his seat. This trigged a by-election but Douglas Carswell was able to win the seat once more (now for UKIP); he had an enormous majority of supporters despite switching parties.<sup>58</sup>

Another anomaly that occurs when using the ‘First Past the Post’ system is that parties can be almost guaranteed to win a certain number of seats in parliament. These seats are known as ‘safe seats’, where an overwhelming majority of supporters of a particular party exist in the associated constituency. In these constituencies, those who do not support the major party in the area will usually have no effect on the overall vote.

In immediate contrast to this however, are situations in which constituencies that are considered as ‘safe seats’ for certain parties are overthrown by other parties. For example, the victories of the Scottish National Party in Scotland in the 2015 election, where they won 56 of the 59 seats<sup>55</sup>, a large number of which were considered ‘safe seats’ for the Labour party.

To conclude, it is obvious that the ‘First Past the Post’ voting system has many weaknesses. Despite this, it is very effective at getting results and changing the voting system to a more proportional one would complicate the process, greatly weaken the link between MPs and their constituencies and make coalition governments much more common. It is therefore my belief that the system should remain the way it is – changing the system would present much more of a challenge than continuing to use the current ‘First Past the Post’ system.

## Accuracy of Opinion Polling

In modern society, opinion polls are widely used to measure public opinion, with questions being asked such as “do you favour a ban on smoking in public places?”. An opinion poll is an evaluation of public opinion on certain matters through questioning a representative group of people. Generally, these are carried out when various organisations want a political subject answered, in particular in the UK they are used when attempting to predict who will be elected in the next general election. Opinion polling can be a powerful yet dangerous tool, as it can misrepresent a certain party’s popularity. In this report, I will be discussing the reliability of opinion polling, comparing it to electoral results and using statistical analysis to come to a sound conclusion. 

### How Is Opinion Polling Conducted?

There are many ways in which opinion polling is carried out, the main ones being online polling, telephone polling, and door-knock polling. 

One of the leading polling organisations YouGov conducts its opinion polls online. The organisation has gathered a panel of over 360,000 people. When a political question needs to be answered they fill the sample quota from this panel, these people are then asked to fill out an online.<sup>59</sup>

Another large organisation that conducts opinion polling in the UK is Ipsos MORI. This organisation uses telephone polling to evaluate public opinion. They use random-digit dialling so the panel is completely random, they assort the panel into weighted demographics in order to fulfil the sample quota.<sup>59</sup>

The most accurate way of polling is the use of “door- knock polls”. This is where individuals hired by polling organisations go from house to house and fill out surveys regarding political issues. This is the ideal way of gaining polling data as it reaches the broadest demographic, it also gains the most reliable data as people are more likely to share their true opinion when the survey is carried out in person. However, it is impractical and costly. It requires a lot of finance as well as manpower to reach the required sample quota, a significant amount more than online and telephone polling.

### Online Polling 

The use of online polling is extremely convenient; people can fill out polling surveys on the go, on their smart phone. The costs implicated with online polling are also extremely low, including costs for creating and maintaining a website. The cost per person reached appears to be even lower with an almost limitless reach of people to question. However, those questioned will in most cases be of a younger generation. The elderly may find it difficult to navigate their way through a computer in order to fill out a survey, hence this may skew the results of a poll as not all opinions will be recorded.<sup>60</sup> In order to resolve this, organizations put “weights” onto certain demographics. This is where demographic results are increased or decreased appropriately to gain a fair and accurate representation of the population.

In the 2015 general election, the polling organizations such as YouGov put weights onto different age categories, however 
these weights were not correct and they did not successfully represent the opinion of different demographics. The younger generations were over-represented skewing the polling results in favour of the Labour party. This was due to the voter samples containing a higher proportion of Labour supporters than in the general election.<sup>61</sup> Whereas the older generations were under-represented due to the incorrect weighting. This led to a lower show in support for the Conservative party, as opinion polls underestimated the number of older typically-Conservative voters in the country.<sup>62</sup> This had the overall effect of making the 2015 online opinion polling results very inaccurate, it gave the impression that both Labour and the Conservatives were neck and neck, whereas in fact the Conservative party had a much stronger showing in the country than was predicted in the polls. This is shown in the figure below.

### Telephone Polling

![Election Performance](https://raw.githubusercontent.com/jamiecayley/MAT1041/gh-pages/public/images/image9.png#center)  Figure 1: YouCov Election Performance 2015 <sup>61</sup> 

The use of telephone polling is extremely convenient. In modern society, most people carry a mobile phone around with them wherever they go. This means that a large number of participants respond to polling organisations within 10 minutes of being contacted. Furthermore, participants will respond to questions in their natural state, not having much time to question themselves about their answers. This results in true opinions being recorded with no outside influence. Mobile phones also reach a broad demographic, with even those in the older generations using them. This means that a broad demographic can be reached by polling organisations resulting in more reliable and accurate data.<sup>63,64</sup>

![Polling Results](https://raw.githubusercontent.com/jamiecayley/MAT1041/gh-pages/public/images/image10.png#center)  Figure 2: Ipsos-Mori Polling Results <sup>65</sup> 

Telephone polling organisations have higher costs than that of online polling organisations. They have to hire a lot of people to call up voters, as a result of this, sample quotas are usually relatively small, meaning weights have to be assigned to demographics in order to gain reliable data. Ipsos MORI predicted that the General Election would be a close call between Labour and Conservative party, though in actual fact the Conservative party won by 7%. This gives the impression that telephone polling is no more reliable than online polling as results gained there were similarly wrong.                          

### Final Call Predictions for the 2015 Election by Multiple Polling Organisations

![Final Call Predictions](https://raw.githubusercontent.com/jamiecayley/MAT1041/gh-pages/public/images/image11.png#center)  Table 1: Finall Call predictions <sup> 59 </sup> 

As you can see from the data above, there was a significant difference in the opinion polls and the actual general election results with an overestimate of 2.9% for the Labour party and an underestimate of -2.4% for the Conservative party on average. 

### Comparison of Online and Telephone Polling Accuracy in the 2015 General Election

![Online vs Telephone Polling](https://raw.githubusercontent.com/jamiecayley/MAT1041/gh-pages/public/images/image11-2.png#center)  Table 2: Comparison Between Online and Telephone Polling Accuracy <sup> 59 </sup> 

As you can see from the data that I calculated, online polling appeared to experience a larger percentage error than that of telephone polling, with the exception of the “Labour” and “Other” column results. This implies that during the 2015 election, telephone polling was more accurate than online polling, despite the use of larger sample sizes from online polling organisations such as YouGov. This is borne from the inaccurate weighting used by YouGov when calculating opinion poll results.

### Undecided Voters

![Undecided Voters](https://raw.githubusercontent.com/jamiecayley/MAT1041/gh-pages/public/images/image13.png#center)  Figure 3: 'Have the Voters Decided Yet?' <sup>63</sup> 

As you can see from the data above collected by Ipsos MORI, of the sample of 1186 people questioned 22% were still not certain who they were going to vote for as of the 6th of May 2015 (one day before the General Election). This means a significant amount of the sample was deemed to be unreliable, hence voting intention figures were only based on 862 adults. This is small sample size cannot be considered representative of the UK electorate. 

### Conclusion

In conclusion, I believe that the opinion polling results of 2015 were inaccurate. They gave off the impression that the election was much closer than what was actually the case. This was a result of the combination of the incorrect demographic weights as well as the small sample sizes used in particular by telephone-polls. Furthermore, the significant number of undecided voters made predictions much more difficult to ascertain. In order to make opinion polling more accurate, adjustments of voter samples are needed to better reflect the UK’s voters. Additionally, a substantial increase in sample size for telephone polls are needed in order to improve accuracy of data gathered. Whilst opinion polling may never be 100% accurate, they are still necessary to view a rough snapshot of where the mood of the country is.

## General Election Excel Analysis Findings 

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


## MATLAB report

## References
1. O'Neal, Brian. Electoral Systems. Ottawa: Library of Parliament, Research Branch, 1993. 24 p. 
2. O'Connor, J. J. and Robertson, E. F. "The history of voting". The MacTutor History of Mathematics Archive. Retrieved March 10, 2017.
3. Pacuit, Eric, "Voting Methods", The Stanford Encyclopedia of Philosophy (Winter 2016 Edition), Edward N. Zalta (ed.)
4. Joseph Malkevitch. "Apportionment". AMS Feature Columns. Retrieved March 10, 2017.
5. Homeshaw, Judith (2001). "Inventing Hare-Clark: The model arithmetocracy". In Marian Sawer. Elections: Full, Free & Fair Editor. Federation Press. pp.97–98. ISBN186287395X.
6. Hare, T. (1857). The machinery of representation. 1st ed. London: W. Maxwell.
7. "The History of IRV". FairVote.org. Archived from the original on 2009-10-28. Retrieved March 10, 2017.
8. Mattei, Nicholas; Narodytska, Nina; Walsh, Toby (2014-01-01). "How Hard is It to Control an Election by Breaking Ties?". Proceedings of the Twenty-first European Conference on Artificial Intelligence. ECAI'14. Amsterdam, The Netherlands, The Netherlands: IOS Press: 1067–1068. doi:10.3233/978-1-61499-419-0-1067. ISBN 9781614994183.
9. Bartholdi, J.; Tovey, C. A.; Trick, M. A. (April 1989). "Voting schemes for which it can be difficult to tell who won the election". Social Choice and Welfare. 6 (2): 157–165. doi:10.1007/BF00303169.
10. McLean, I. (2002). "Australian electoral reform and two concepts of representation" (PDF).
11. Lippman, David. "Voting Theory" (PDF). Math in Society
12. "Slovenia's electoral law"
13. Reilly, B. (2002). Social Choice in the South Seas: Electoral Innovation and the Borda Count in the Pacific Island Countries. International Political Science Review, 23(4), pp.355-372.
14. "Results of the General Election held on 19th June 2010" (PDF). Parliament of Nauru. Archived from the original (PDF) on 2012-10-29. Retrieved March 10, 2017.
15. Benjamin Mako Hill, Voting Machinery for the Masses, July 2008
16. Ubuntu IRC Council Position, May 2012. Accessed March 10, 2017.
17. Choix dans les votes. Accessed March 10, 2017
18. "Australian Electoral Commission". Aec.gov.au. 2014-04-23. Retrieved March 10, 2017
19. "What Comes Next in the Liberal Vote". Maclean's. 5 April 2013. Retrieved March 10, 2017.
20. Václav Novák (28 February 2013). "Zelení otestovali volební systém bez ztracených hlasů, který podporuje širokou shodu". data.blog.ihned.cz. Retrieved March 10, 2017.
21. swapnil (29 October 2010). "IAS OUR DREAM: Presidents of India, Rashtrapati Bhavan, Trivia". Swapsushias.blogspot.com. Retrieved March 10, 2017.
22. Muckerras, Malcolm; William Muley (1998). "Preferential Voting in Australia, Ireland and Malta" (PDF). Griffith Law Review. 7 (2): 225–248.
23.  "Elections – 2007 Final Results". Wellington city council. 2007.
24.  "Center for Voting and Democracy". Archive.fairvote.org. Retrieved March 10, 2017.
25. "Notice of Conservative Hereditary Peers' By-Election to the House of Lords" (PDF). House of Lords.
26. "Instant runoff voting exercises election judge fingers" Minnesota Public Radio, 10 May 2009
27. "Oakland Rising:Instant Runoff Voting". oaklandrising.com. 2010. Retrieved March 10, 2017.
28. Gehrlein, William V. "Condorcet's paradox and the likelihood of its occurrence: different perspectives on balanced preferences*". Theory and Decision. 52 (2): 171–199. doi:10.1023/A:1015551010381. ISSN 0040-5833
29. Hunt, Earl (2007). The Mathematics of Behavior. Cambridge University Press. ISBN 9780521850124.
30. Gibbard, Allan (1973). "Manipulation of voting schemes: A general result". Econometrica. 41 (4): 587–601. doi:10.2307/1914083. JSTOR 1914083
31. Satterthwaite, Mark Allen (April 1975). "Strategy-proofness and Arrow's conditions: Existence and correspondence theorems for voting procedures and social welfare functions". Journal of Economic Theory. 10 (2): 187–217. doi:10.1016/0022-0531(75)90050-2.
32. Wilkinson, M. (2017). What is the First Past The Post voting system?. [online] Telegraph.co.uk. Available at: http://www.telegraph.co.uk/news/general-election-2015/11452839/What-is-the-First-Past-The-Post-voting-system.html [Accessed 14 Mar. 2017].
33. British Broadcasting Corporation (2017). BBC - Higher Bitesize Modern Studies - Electoral systems, voting and political attitudes: Revision. [online] Available at: http://www.bbc.co.uk/bitesize/higher/modern/uk_gov_politics/elect_vote/revision/1/ [Accessed 14 Mar. 2017].
34. Wikipedia (2017). First-past-the-post 2015.svg. [online] Available at: https://en.wikipedia.org/wiki/File:First-past-the-post_2015.svg [Accessed 14 Mar. 2017].
35. iforindiaorg.files.wordpress.com (2017).  [online] Available at: https://iforindiaorg.files.wordpress.com/2014/09/electoral.png [Accessed 14 Mar. 2017].
36. Wikipedia (2017). Congress of Deputies (Spain). [online] Available at: https://en.wikipedia.org/wiki/Congress_of_Deputies_(Spain) [Accessed 14 Mar. 2017].
37. Scottish Parliament Website (2017). The Additional Member System - Calculating the Regional Results guidance. [online] Available at: http://www.parliament.scot/visitandlearn/Education/65978.aspx [Accessed 14 Mar. 2017].
38. aceproject.org. (2017). Advantages and disadvantages of List PR —. [online] Available at: http://aceproject.org/ace-en/topics/es/esd/esd02/esd02c/esd02c01 [Accessed 14 Mar. 2017].
39. Electoral Reform Society (2017). The Two Round System. [online] Available at: http://www.electoral-reform.org.uk/two-round-system [Accessed 14 Mar. 2017].
40. Wikipedia (2017). French regional elections, 2015. [online] Available at: https://en.wikipedia.org/wiki/French_regional_elections,_2015 [Accessed 14 Mar. 2017].
41. British Broadcasting Corporation (2016). French National Front defeated in bid to win regional vote - BBC News. [online] Available at: http://www.bbc.com/news/world-europe-35088276 [Accessed 14 Mar. 2017].
42. Wikipedia (2017). [online] Available at: https://upload.wikimedia.org/wikipedia/commons/thumb/d/d1/Scottish_Election_Results_2016.svg/1662px-Scottish_Election_Results_2016.svg.png [Accessed 14 Mar. 2017].
43. Direct Party and Representative Voting (2017). FPTP compared. [online] Available at: http://www.dprvoting.org/FPTP_comparison.htm [Accessed 14 Mar. 2017].
44. Wikipedia (2017). Instant-runoff voting. [online] Available at: https://en.wikipedia.org/wiki/Instant-runoff_voting#Australia [Accessed 14 Mar. 2017].
45. thecrimson.com (2017). Beware The Spoiler Effect Opinion The Harvard Crimson. [online] Available at: http://www.thecrimson.com/article/2012/10/30/third-party-spoiler/ [Accessed 14 Mar. 2017].
46. Aceproject.org. (2017). Proportional Representation (PR) —. [online] Available at: http://aceproject.org/ace-en/topics/es/esd/esd02/default [Accessed 16 Mar. 2017].
47. CGP Grey. (2017). Mixed-Member Proportional Representation Explained. [online] Available at: http://www.cgpgrey.com/blog/mixed-member-proportional-representation-explained.html [Accessed 16 Mar. 2017].
48. Electoral-reform.org.uk. (2017). Proportional Representation ERS. [online] Available at: http://www.electoral-reform.org.uk/proportional-representation [Accessed 16 Mar. 2017].
49. FairVote. (2017). Proportional Representation Voting Systems - FairVote. [online] Available at: http://www.fairvote.org/proportional_representation_voting_systems [Accessed 16 Mar. 2017].
50. politics.co.uk. (2017). Electoral Reform and Voting Systems. [online] Available at: http://www.politics.co.uk/reference/electoral-reform-and-voting-systems [Accessed 16 Mar. 2017].
51. The Center for Election Science. (2017). The Spoiler Effect. [online] Available at: https://electology.org/spoiler-effect [Accessed 16 Mar. 2017].
52. Washington Post. (2017). This is the best explanation of gerrymandering you will ever see. [online] Available at: https://www.washingtonpost.com/news/wonk/wp/2015/03/01/this-is-the-best-explanation-of-gerrymandering-you-will-ever-see/?utm_term=.fcddd5e1fef2 [Accessed 16 Mar. 2017].
53. Finley, M., 2012. Discuss the Advantages and Disadvantages of a Coalition Government. [Online] Available at: http://www.peterjepson.com/law/UK-4%20Finley.pdf
[Accessed 15 March 2017].
54. BBC, 2015. Election 2015 - BBC News. [Online] Available at: http://www.bbc.co.uk/news/election/2015/results [Accessed 10 March 2017]
55. BBC, 2015. Election 2015: Maps of turnout and party strength - BBC News. [Online] Available at: http://www.bbc.co.uk/news/election-2015-32624405[Accessed 10 March 2017].
56. Wikipedia, 2015. Hampstead and Kilburn (UK Parliament constituency). [Online] Available at: https://en.wikipedia.org/wiki/Hampstead_and_Kilburn_(UK_Parliament_constituency)[Accessed 15 March 2017].
57. Wikipedia, 2015. Fermanagh and South Tyrone (UK Parliament constituency). [Online] Available at: https://en.wikipedia.org/wiki/Fermanagh_and_South_Tyrone_(UK_Parliament_constituency)#Elections [Accessed 6 March 2017].
58. Wikipedia, 2014. Clacton by-election. [Online] Available at: https://en.wikipedia.org/wiki/Clacton_by-election,_2014 [Accessed 10 March 2017
59. Survation. (2015). The General Election 2015 & The Polls – What Happened?. [online] Available at: http://survation.com/the-general-election-2015-the-polls-what-happened/ [Accessed 14 Mar. 2017].
60. BBC News. (2015). Is it the end for telephone polling? - BBC News. [online] Available at: http://www.bbc.co.uk/news/uk-politics-33228669 [Accessed 13 Mar. 2017].
61. Study.com. (2016). The Measurement of Public Opinion - Video & Lesson Transcript Study.com. [online] Available at: http://study.com/academy/lesson/the-measurement-of-public-opinion.html [Accessed 15 Mar. 2017].
62. Clark, T. and Perraudin, F. (2016). General election opinion poll failure down to not reaching Tory voters. [online] the Guardian. Available at: https://www.theguardian.com/politics/2016/jan/19/general-election-opinion-poll-failure-down-to-not-reaching-tory-voters [Accessed 11 Mar. 2017].
63. Ipsos-mori.com. (2015). Ipsos MORI Digital Research Mobile Research. [online] Available at: https://www.ipsos-mori.com/ourexpertise/digitalresearch/mobileresearch.aspx [Accessed 11 Mar. 2017].
64. Ipsos-mori.com. (2015). Ipsos MORI Poll The Ipsos MORI Final Election poll. [online] Available at: https://www.ipsos-mori.com/researchpublications/researcharchive/3572/The-Ipsos-MORI-Final-Election-poll.aspx [Accessed 15 Mar. 2017].
65. Shakespeare, S. (2015). YouGov Analysis: what went wrong with our GE15 polling and what will we do to improve?. [online] YouGov: What the world thinks. Available at: https://yougov.co.uk/news/2015/12/07/analysis-what-went-wrong-our-ge15-polling-and-what/ [Accessed 14 Mar. 2017].
