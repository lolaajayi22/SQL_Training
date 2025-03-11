-- How to check data in a table
select *
from Games

-- Show the year 2004
select *
from Games
where Year = '2004'

-- Show where the city is London
select *
from Games
where City = 'London'

-- Show the latest year
select MAX (Year) as Latest_Year
from Games