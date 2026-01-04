-- total centuries by each player in each year 
select * from cricket_data;
SELECT 
    Player_Name,
    COUNT(CASE WHEN Centuries > 0 THEN 1 END) AS Total_100s,
    COUNT(CASE WHEN Half_Centuries > 0 THEN 1 END) AS Total_50s
FROM cricket_data
GROUP BY Player_Name
ORDER BY Total_100s desc;

-- player with highest batting average 
select Player_Name,max(Batting_Average) as max_batting_average
from cricket_data
group by Player_Name
order by max_batting_average desc
limit 1;

-- Average number of runs scored per match
select Player_Name,round(avg(Runs_Scored/Matches_Batted),2) as Avg_Runs_Per_Match
from cricket_data
group by Player_Name
order by Avg_Runs_Per_Match desc;

-- wickets taken by each player 
select Player_Name,count(Wickets_Taken) as total_wickets_taken
from cricket_data
group by Player_Name
order by total_wickets_taken desc;

-- top 5 all-rounders
select Player_Name,round((avg(Batting_Average) + avg(Bowling_Average)) / 2,2) as composite_score
from cricket_data
group by Player_Name
order by composite_score desc
limit 5;

-- average batting average and bowling average changed over the years
select Year,round(avg(Batting_Average),2) as average_batting_average
from cricket_data
group by year
order by year;

-- year with highest number of centuries
select year,count(*) as Centuries_Count
from cricket_data
where Centuries>0
group by Year
order by Centuries_Count desc
limit 1;

-- players having similar batting styles 
select Player_Name,Fours,Sixes
from cricket_data
where Fours > 0 and Sixes > 0
order by Fours + Sixes desc;

-- top fielders based on number of catches taken
select Player_Name,Sum(Catches_Taken) as Total_Catches
from cricket_data
group by Player_Name
order by Total_Catches Desc;

use ipl;
select * from cricket_data;

select Highest_score from cricket_data
order by highest_score desc;

describe cricket_data;
alter table cricket_data
modify column Highest_score int;

select max(Highest_score) as highest_score from cricket_data;


