/**
Developer: Lola Ajayi
Date: March 24th, 2025
Lesson 4 - Assignment 4 & 5
/** Data flow (case statement)
If the year is 2000, show as good
If the year is 2004, 2008 show as better 
If the year is below 2024 and above 2008 show as best
anything else show as perfect.
show result in a new column and name it year status
**/

select * 
from Games

-- Case statement

select 
Year, 
case
when Year = 2000 then 'Good'
when Year = 2004 or Year = 2008 then 'Better'
--when Year in (2004, 2008) then 'Better'
when Year < 2024 and Year > 2008 then 'Best'
else 'Perfect'
end as Year_Status
from Games


/**
Assignment 5
1: show the total salaries of individual countries
2: show the total salaries by gender
3: show the highest salaries 
4: show the total number of records in the table 
5: show the lowest salary in the table 
6: show the average salary in the table
7: show the total salaries of individual countries (repeated)
**/

drop Table if exists Employees
Create Table Employees  
(  
Id int primary key identity(1, 1),  
Name varchar(50), 
Gender varchar(10),  
Salary int,  
Country varchar(10)  
)  
Insert Into Employees Values ('Usama', 'Male', 5000, 'USA')  
Insert Into Employees Values ('Safwan', 'Male', 4500, 'India')  
Insert Into Employees Values ('Gulraiz', 'Female', 5500, 'USA')  
Insert Into Employees Values ('Ayesha', 'Female', 4000, 'India')  
Insert Into Employees Values ('Anas', 'Male', 3500, 'India')  
Insert Into Employees Values ('Areeha', 'Female', 5000, 'UK')  
Insert Into Employees Values ('Raza', 'Male', 6500, 'UK')  
Insert Into Employees Values ('Eeman', 'Female', 7000, 'USA')  
Insert Into Employees Values ('Faseeh', 'Male', 5500, 'UK')  
Insert Into Employees Values ('Hassan', 'Male', 5000, 'USA')

select *
from Employees

--Total salaries
--select sum (Salary) as Total_Salaries
select sum (Salary) Total_Salaries
from Employees

--Total salaries by gender
select Gender, sum (Salary) Total_Salaries
from Employees
group by gender
 
 --Highest salary
select max(Salary) as Highest_Salary
from Employees

 --Total number of records in the table
select count(*) as Total_No_of_Records
from Employees

 --Lowest salary
select min(Salary) as Lowest_Salary
from Employees

 --Average salary
select AVG(Salary) as Average_Salary
from Employees