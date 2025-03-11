-- Database to use
use EmadeDev
go

-- Business table creation
create table Business
(
ID int not null,
NAME varchar(50) null,
AGE int null,
ADDRESS varchar(50) null,
SALARY int null,
)
-- Loading data into the Business table
insert into Business
(ID, NAME, AGE, ADDRESS, SALARY)
values
(1, 'Ramesh', 32, 'Ahmedabad', 2000),
(2, 'Khilan', 25, 'Delhi', 1500),
(3, 'Kaushik', 23, 'Kota', 2000),
(4, 'Chaitali', 25, 'Mumbai', 6500),
(5, 'Hardik', 27, 'Bhopal', 8500),
(6, 'Komal', 22, 'MP', 4500),
(7, 'Muffy', 24, 'Indore', 10000)

-- Case statement 1
select
ID,
NAME,
AGE,
ADDRESS,
SALARY,
case
when AGE >=25 then 'Senior Developer'
when AGE <25 then 'Intern'
when AGE >=25 and AGE <=27 then 'Associate Engineer'
end as JobPosition
from Business;

-- Case statement 2
select
ID,
NAME,
AGE,
ADDRESS,
SALARY,
case
when AGE >30 then 'Gen X'
when AGE >=23 and AGE <=25 then 'Gen Z'
when AGE =22 then 'Gen Alpha'
when AGE = 27 then 'Gen Y'
end as GENERATION
from Business;