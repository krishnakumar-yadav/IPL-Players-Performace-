-- Data Cleaning
create database ipl;
use ipl;

select * from cricket_data;

alter table cricket_data
change column ï»¿Year Year int not null;

describe cricket_data;

select * from cricket_data;
delete from cricket_data
where Year = "No stats";

delete from cricket_data
where Year = 2024;

-- checking whether no stats data is available or not
SELECT COUNT(*)
FROM cricket_data
WHERE Year = "No stats";

set sql_safe_updates = 0;

-- changing highest score 82* like to 82
update cricket_data
set Highest_Score = Replace(highest_score, '*','')
where Highest_Score like '%*%';

-- changing Batting_Average to upto 2 decimal places
update cricket_data
set Batting_Average = round(Batting_Average,2)
where Batting_Average is not null;

-- changing Batting_Strike_Rate to 2 decimal Places
update cricket_data
set Batting_Strike_Rate = round(Batting_Strike_Rate,2)
where Batting_Strike_Rate is not null;

-- dropping column Best_Bowling_Match
alter table cricket_data
drop column Best_Bowling_Match;

select * from cricket_data;
SHOW COLUMNS FROM cricket_data;

