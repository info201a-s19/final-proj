---
title: "Project Brainstorm"
author: "Wen Yi Aw, Lisa Marie Dias, Leila Li, Anna Zhou"
date: "5/01/2019"
output: html_document
---

## Domain of Interest
**Topic: Alcohol and car accidents**

We are interested in this field because many of us have friends who have been impacted by car accidents caused by driving under the influence. In addition, according to National Public Radio ([NPR](https://www.npr.org/sections/thetwo-way/2017/08/10/542409957/drinking-on-the-rise-in-u-s-especially-for-women-minorities-older-adults)), alcohol consumption has been increasing in the United States, and many people believe that this may be related to the frequency of car accidents. 


### Other Data-Driven Projects

1. **CDC Annual Self-reported Alcohol-impaired Driving Episodes among U.S. Adults, 1993-2014** ([source](https://www.cdc.gov/motorvehiclesafety/impaired_driving/impaired-drv_factsheet.html))
+ Description: This website collected and presented state-specific data on drunk driving and fatal car accidents, including age and gender specific death rate. 
+ Question: Is there a correlation between drunk driving and fatal car accidents in the United States?
+ How the Question Can be Answered Using Data: The dataset showed states, such as MT and ND, with a high percentage of adults who report driving after drinking too much with in the past 30 days, and a high percentage of fatal car accidents with BAC => 0.08%, which suggest a positive correlation between drunk driving and fatal car accidents. But it also showed states, such as MS with a low percentage of report drunk driving and a relatively high percentage death rate; as well as states like WA with relatively high rate of self reported drunk driving and low death rate. 

2. **Drunk driving rate falls to new low, federal data shows** ([source](https://www.washingtonpost.com/news/wonk/wp/2016/12/30/drunken-driving-rate-falls-to-new-low-federal-data-show/?utm_term=.68942ceebc17))
+ Description: The dataset showed the trend of driving under the influence of alcohol and drugs from 2002 to 2014, among people aged 16 and older. As well as the correlation between age and driving under the influence. 
+ Question: What is the trend of driving under the influence of alcohol by age group in the United States?
+ How the Question Can be Answered Using Data: The dataset showed that overall driving under the influence of alcohol has decreased from 15.3% to 11.1%. While drivers aged 16 to 25 has decreased dramatically, over 10 percent, drivers aged 26 and older only decreased less than 3 percent. 

3. **MADD** ([source](https://www.madd.org/statistics/))
+ Description: MADD focuses on working towards eliminating any drunk driving incidents. They also want to raise awareness to others and help spread the message to eliminate any potential incidents. The website has multiple interactive statistics and visualizations that help highlight the dangers of the issue and give solutions on what the next step could be.
+  Question: How do the different laws and regulations in each state affect the number of accidents? 
+ How the Question Can be Answered Using Data: Use the data from the website to showcase the number of laws to show the correlation between regulations and the number of accidents. Also can show trends from year to year that can show the impact of laws as the government changes. 

4. **Drunk Driving by the Numbers** ([source](https://www.bts.gov/archive/publications/by_the_numbers/drunk_driving/index))
+ Description: The Bureau of Transportation Statistics gathers data on drunk driving numbers. They mostly visualize the comparisons of drunk driving and non-drunk driving incidents to show the impact intoxication. 
+ Question: What is the rate of fatalities due to drunk driving accidents vs all other fatalities?
+ How can the question be answered using the data: We can pull the data from the website to show the total number of deaths per year in the United States due to all causes. Then we can pull the individual categories of causes of death to showcase how high or low the deaths due to car accidents are. 


### Data-Driven Questions

1. **What is the correlation between alcohol and car accidents in the United States?**
+ We would want to look at data about the total number of crashes in the United States, maybe by state or region, and compare that to data about car accidents involving alcohol for that same state/region.

2. **What percentage of alcohol-related car accidents are caused by drivers under the legal drinking age?**
+ This could be answered by looking at data which shows the age of the drivers who caused car crashes, and comparing to see which drivers were underage (15-20 years old) and under the influence of alcohol.  
  
3. **Is a driver with higher blood alcohol concentration (BAC) more likely to be involved in a crash?**
+ We would expect that drivers with higher BAC are more likely to be involved in a crash. We can compare the percentage of drivers in crashes, with BAC less than the U.S. legal limit of 0.8, to the percentage of drivers in crashes who were over the legal limit.

4. **Which areas in the United States had the the most amount of fatalities based on BAC in 2017?**
+ We can answer this question by looking at different states in the United States and looking for the maximum amount of fatalities. 

5. **In which areas in the United States is it most likely for people to knowingly be drinking and driving?**
+ This question can be answered by comparing different regions of the US with data collected, surveying people on whether they knowingly drink and drive. 

## Finding Data

1. **Drivers Involved in Fatal Crashes, by State and Blood Alcohol Concentration of the Driver** ([source](https://www-fars.nhtsa.dot.gov/States/StatesAlcohol.aspx))
+ This data was collected by Fatality Analysis Reporting System (FARS), published by National Highway Traffic Safety Administration, up to the year 2017.  FARS is a U.S. census that contains data on all vehicle crashes that occur on a public roadway and involve a fatality. Instead of counting and classifying all crashes that occur, a sample of crash data is collected. These data are provided voluntarily and anonymously.
+ This table has 52 rows (50 states and Washington D.C., plus 1 for the total), and 11 columns.
+ This dataset could help examine the question, "Is a driver with higher blood alcohol concentration (BAC) more likely to be involved in a crash?" because it clearly shows how the level of alcohol the driver has consumed, whether none, some but under the legal limit, and over the limit. 

2. **Impaired Driving Death Rate, by Age and Gender, 2012, All States** ([source](https://catalog.data.gov/dataset/impaired-driving-death-rate-by-age-and-gender-2012-all-states-587fd))
+ This data was collected by the US Department of Health and Human Service Control. This is information based on data from FARS. FARS is a census of fatal crashes in the 50 States and the District of Columbia. 
+ There are 53 rows in the data set (including one for the total in the US), and 14 columns. 
+ This dataset can help gain a concentrated insight into each individual state's information about the total number of fatalities due to impaired driving. Using this information, we can answer the question, "Which areas had the the most amount of fatalities based on impaired driving in 2012?"

3. **Percentage of Adults Who Report Driving After Drinking Too Much (in the past 30 days), 2012, 2014** ([source](https://catalog.data.gov/dataset/percentage-of-adults-who-report-driving-after-drinking-too-much-in-the-past-30-days-2012-r-3b532))
+ This data was presented by the Center of Disease Control and Prevention, specifically derived from the Behavioral Risk Factor Surveillance System. This data set includes information taken specifically from adults who reported driving after drinking a noticeably large amount in various states in a specific region of the United States. 
+ There are 10 rows and 4 columns in the data. 
+ Using this data, we could answer "In which areas in the United States is it most likely for people to knowingly be drinking and driving?". Additionally, a more specific question for this dataset could be "Has this statistic of people who drive after drinking too much changed from 2012-2014 in the United States?"

