/**
Developer: Lola Ajayi
Date: March 3rd, 2025
Lesson 1 - Assignment 3
Create a table named World
Write SQL queries for each of the questions below
Question 1. Write a query to show the area of 468
Question 2. Write a query to show the county name of Angola
Question 3. Write a query to show the country with the lowest Gdp in the world table (use Min function instead of count function)
Question 5. Write a query to show the number of records in the World table
**/

-- change GDP data type from int to bigint
ALTER table World
ALTER COLUMN GDP BIGINT;

-- Show the area 468
select *
from World
where Area = '468'

-- Show country of Angola
select *
from World
where CountryName = 'Angola'

-- Show the country with the lowest GDP in this table
select min (GDP) as Lowest_GDP
from World

-- Show number of records in the table
select COUNT (*) as Record_Total_Number
from World