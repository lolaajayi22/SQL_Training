/**
Developer: Lola Ajayi
Date: March 3rd, 2025
Lesson 1 - Assignment 1
Create a table and name it Noble
Write a SQL query for each question below
Question 1. Write a query to show the year 1962
Question 2. Write a query to show the subject of Medicine
Question 3. Write a query to show the latest year in the Noble table (use MAX function instead of Count function)
Question 4. Add add the next Noble winner, in the year 2024, the subject should be Economics
Question 5. Write a query to show the number of records in the Noble table
**/

use EmadeDev
go

-- How to check data in a table
select *
from Noble

-- Show the year 1962
select *
from Noble
where Year = '1963'

-- Show where the subject is medicine
select *
from Noble
where Subject = 'Medicine'

select *
from Noble
where Subject in ('Medicine')

--How to do pattern search or wild card
select *
from Noble
where Subject like 'M%'

-- Show the latest year
select MAX (Year) as Latest_Year
from Noble

-- Use of outer or outside query
select Year, Subject, Winner 
from Noble
where Year = 
(--Inner query or sub query or inside query
select MAX (Year) as Latest_Year
from Noble
)

-- Show the latest year
select MAX (Year) as Latest_Year
from Noble

-- Show number of records in the table
Select COUNT (*) as Number_of_Records
from Noble


