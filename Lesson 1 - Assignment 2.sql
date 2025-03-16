/**
Developer: Lola Ajayi
Date: March 3rd, 2025
Lesson 1 - Assignment 2
Create a table named Games
Write SQL queries for each question below
Question 1. Write a query to show the year 2004
Question 2. Write a query to show the city of London
Question 3. Write a query to show the latest year in the games table ( use MAX function instead of count function)
Question 4. Add add the next Olympic games, in the year 2024, Which will be held in the city of Paris.
**/

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