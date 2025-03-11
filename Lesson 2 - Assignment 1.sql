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

select *
from CompanyInfo

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
when Employees <=1 then 'No Employees'
when Employees <=10 then 'Small'
when Employees <= 50 then 'Medium'
when Employees >50 then 'Large'
end as SIZE_OF_COMPANY
from EmployeeInfo