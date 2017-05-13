---
layout: page
title: Group Report
order: 3
---

- [Word Document](#word-document)
- [Mathematician's Contribution to Election Method Design by Jamie](#mathematician's-contribution-to-election-method-design)
- [Major Voting Systems in Use Around the World by Manny](#major-voting-systems-in-use-around-the-world) 
- [Different Forms of Proportional Representation by Alex](#different-forms-of-proportional-representation)
- [Advantages and Disadvantages of First Past the Post by Michael](#advantages-and-disadvantages-of-first-past-the-post)
- [Accuracy of Opinion Polling](#accuracy-of-opinion-polling)
- [Excel Report](#excel-report)
- [MATLAB report](#matlab-report)
- [References](#references)

## Word Document 

To download the word document with our group report click [here](https://github.com/jamiecayley/MAT1041/raw/gh-pages/files/group-report.docx). To read the text of our report without downloading the word document, keep on reading. Note: the format of the word document and the report on this page differ; the Excel and MATLAB reports are the same as the ones on the Excel and MATLAB pages, they were reproduced there to supplement the spreadsheets and the MATLAB code.  

## Mathematician's Contribution to Election Method Design 

Election methods consist of a set of rules that must be followed for a vote to be valid, including the form of the ballot (how votes are cast) as well as the process used to determine the final result of an election. The specific election method used can have a significant effect in the election’s final result, especially if there are more than 2 options for voters to choose, making the study of election method design very important.1 This report offers a brief overview of the history of voting theory, some of the contributions mathematicians have made to the field as well as explain some of the mathematical challenges involved in designing election methods. 

### The Early History of Voting Theory 
Voting and elections have played a significant role in society for centuries, but academics didn’t start studying them until much later. Voting has been a part of democracy since the 6th century, when Athenian democracy was introduced. However, election method design, the main focus of voting theory, wasn’t an object of academic study until the 18th century.2 Jean-Charles the Borda and Marquis de Condorcet are usually credited as the founders of voting theory for their contributions developing the Borda count, the Condorcet method and the Condorcet paradox.3

Later in the 18th century the topic of apportionment (also sometimes known as proportional representation), the process by which seats in a legislature (e.g. parliament) are allocated, began to be studied because the United States Constitution mandated that seats in the House of Representatives had to be allocated proportional to the population in each state but didn’t specify how.4 Various methods were proposed, and later, some of the methods discovered in the United States were rediscovered in Europe in the 19th century including Jefferson’s method/d’Hondt method, Webster’s method/Sainte-Laguë method, and Hamilton’s method/Hare largest remainder method.4 The single transferable vote, another apportionment method, was developed by Carl Andræ in Denmark in 18555 and Thomas Hare in England in 1857.6 
In the late 19th century the focus went back to single winner methods. Around 1870 William Robert Ware propose applying single transferable vote to single winner elections, which became what is now known as the alternative vote.7 Shortly after mathematicians started revisiting Condorcet’s and Borda’s ideas and inventing new Condorcet methods, for example, Edward Nanson combined the alternative vote and the Borda count and produced a new Condorcet method called Nanson’s method.8 Charles Dodgson introduced the use of matrices to analyse Condorcet elections and proposed another Condorcet method known as Dodgson’s method.9 Ranked voting methods started gaining support and being used in government elections. The alternative vote was first adopted in Australia in 1893 and continues to be used to date.10  

### Some Election Methods in Action 

The Borda count, the Condorcet method and the alternative vote are all single winner election methods in which voters rank options in order of preference.11 When using the Borda count the outcome is determined by giving each option a number of points corresponding to the number of candidates ranked lower; when using the Condorcet method the outcome is determined by counting how many votes rank one candidate over the other for each possible pairing of candidates; when using the alternative votes the outcome is determined by counting the votes for each voter’s top choice, declaring a winner if a candidate has more than half of the voters or removing the candidate in last place and recounting until a candidate has a majority.11 

The Borda count is currently used for some political elections in Slovenia12, Kiribati13 and Nauru14; the Condorcet method is used in elections in various organizations including Music Television (MTV) 15, Ubuntu16, and Wikipedia17; the alternative vote is used for some political elections in Australia18, Canada19, the Czech Republic20, India21, Ireland22, New Zealand23, Papua New Guinea24, the United Kingdom25 and the United States26, 27. These 3 methods will be illustrated in the diagram below. 

### A Few Results Relating to Designing and Selecting Election Methods 

As seen above, the election method chosen can affect who is the winner, which raises the question of how to decide which election method to use. Mathematical criteria can be defined, and voting methods can hence be assessed based on whether or not they fit the criteria. However, the criteria might not be relevant in practice. An alternative approach is to define a set of ideal properties and then see how close different voting methods come to having said ideal properties over a large sample of simulated elections. In this case, the results are practically relevant but the result might be biased based on how the elections are simulated. In this section I’ll go over a few theorems and results relating to this topic. 
The Condorcet paradox states that when there are 3 or more alternatives, the collective preferences can be cyclic even if the preferences of individual voters aren’t, e.g. if the voters’ ranked preferences are ABC,  BCA, CAB  respectively then A is preferred over B which is preferred over C which is preferred over A.28 One important implication of this paradox is that in a two stage voting process the winner might depend on how the 2 stages are structured.11 If the winner of A versus B then faces C then A would defeat B and then lose to C. But if instead the winner of B versus C faces A then B would defeat C and then lose to A. 

Arrow’s theorem states that when there are 3 or more alternatives no ranked order voting system can convert the individuals’ ranked preferences into a community-wide ranking while also meeting the following criteria: 
Unrestricted domain: all voters’ preferences are allowed.
Non-dictatorship: a single voter’s preference can’t determine the result of the election
Pareto efficiency: we can’t pick a winner that would better fit an individual’s preferences without it being a worse fit for other individual’s preferences. 
Independence of irrelevant alternatives: if candidate A is preferred over candidate B, introducing a third option  C mustn’t make B preferred over A.29
A related result is the Gibbard-Satterthwaite theorem which states that if there are 3 or more options in a single-winner election one of the following must be true regardless of the specific election method used: 
Dictatorship (as explained above). 
There is a candidate who can never win. 
The method is susceptible to tactical voting, i.e. a voter supporting a candidate other than their preference to prevent their least favourite candidate from winning.30, 31

### Conclusion

Mathematicians have made a lot of valuable contributions to voting theory. Some of the contributions were listed here, like the Borda count and the Condorcet method, but this is by no means a comprehensive account. Mathematician’s contributions to voting theory aren’t limited to direct contributions to the field either, for example, number theory and cryptography have recently started playing a role in the field. However, a lot of work remains to be done to better determine which election methods can best represent voters’ opinions and how to avoid bias or result manipulation deriving from the election method design. 

## Major Voting Systems in Use Around the World

## Different Forms of Proportional Representation 

## Advantages and Disadvantages of First Past the Post 

## Accuracy of Opinion Polling

## Excel Report

## MATLAB report

## References
