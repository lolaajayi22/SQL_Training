/**
Developer: Lola Ajayi
Date: March 11th, 2025
Lesson 2 - Assignment 1
Create a table and name it CompanyInfo. Load the data to the CompanIinfo table.
Write a case statement to show all the fields in the table CompanyInfo.
If the countries are Canada and USA, show the continent as North America 
But show the continent as Europe if the country is UK.
**/

-- Database to use
use EmadeDev
go

-- Company Info table creation
create table CompanyInfo
(
FIRST_NAME varchar(50) null,
LAST_NAME varchar(50) null,
COUNTRY varchar(50) null,
)

-- Loading data into the Company Info table
insert into CompanyInfo
(FIRST_NAME, LAST_NAME, COUNTRY)
values
('Adam', 'Cooper', 'USA'),
('John', 'Smith', 'USA'),
('Mark', 'Allan', 'UK'),
('Sally', 'Jones', 'USA'),
('Steven', 'Brown', 'Canada')
('Steven', 'Brown', 'Canada')

select *
from CompanyInfo

-- How to identify duplicate records in a  table / only unique records
select distinct * 
from CompanyInfo

-- How to use 'group by' to eliminate records in a  table 
select FIRST_NAME, LAST_NAME, COUNTRY 
from CompanyInfo
group by FIRST_NAME, LAST_NAME, COUNTRY

--How to use 'order by', decending and ascending
select *
from CompanyInfo
order by COUNTRY desc

-- Sort data in ascending order
select *
from CompanyInfo
order by COUNTRY asc 

-- How to count number of records
select COUNT(*) as Duplicate
from CompanyInfo
having COUNT (*) > 1

select FIRST_NAME, COUNT(*) as DUPLICATE
from CompanyInfo
group by FIRST_NAME
having COUNT (*) > 1

--Case Statement
select
FIRST_NAME,
LAST_NAME,
COUNTRY,
case
when COUNTRY in ('Canada', 'USA') then 'North America'
when COUNTRY = 'UK' then 'Europe'
end as CONTINENT
from CompanyInfo;

/**
Lesson 2 - Assigment 2
Create a table and name it Employeelnfo. Load data to the Employeenfo table.
Write a case statement to show all the fields in the table EmployeeInfo. 
If the employees are not more than 1 you should show the SizeOfCompany as No Employees,
If the employees are not more than 10 you should show the SizeOfCompany as Small, 
If the employees are not more than 50 or same as 50 you should show the SizeOfCompany as Medium,
But show the SizeOfCompany as Large if the number of employees more than 50.
**/

-- Employee Info table creation
create table EmployeeInfo
(
FIRST_NAME varchar(50) null,
LAST_NAME varchar(50) null,
EMPLOYEES INT not null,
)

drop table EmployeeInfo

-- Employee Info table creation
create table EmployeeInfo
(
FIRST_NAME varchar(50) null,
LAST_NAME varchar(50) null,
EMPLOYEES INT not null,
)

select * 
from EmployeeInfo

-- Loading data into the Employee Info table
insert into EmployeeInfo
(FIRST_NAME, LAST_NAME, EMPLOYEES)
values
('Adam', 'Cooper', 55),
('John', 'Smith', 4),
('Mark', 'Allan', 23),
('Sally', 'Jones', 10),
('Steven', 'Brown', 15),
('Michael', 'James', 1)

--Case Statement
select
FIRST_NAME,
LAST_NAME,
EMPLOYEES,
case
when Employees <1 then 'No Employees'
when Employees <=10 then 'Small'
when Employees <= 50 then 'Medium'
when Employees >50 then 'Large'
end as SIZE_OF_COMPANY
from EmployeeInfo