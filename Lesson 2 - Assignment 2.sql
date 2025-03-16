/**
Lesson 2 - Assignment 3a
Create a table and name it Business.
Write a case statement to show all the fields in the table Business.
If the age of the customer is more than or equals to 25, it returns Senior Developer.
If the age of the customer is not more than 25, should be Intern.
If the age of the customer is more than and equal to 25, but also lower and equals to 27 then it should be Associate Engineer.
If the age of the customer is lower than 25, then it should be intern and make sure to name the field as JobPosition.
**/

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
/**(1, 'Ramesh', 32, 'Ahmedabad', 2000),
(2, 'Khilan', 25, 'Delhi', 1500),
(3, 'Kaushik', 23, 'Kota', 2000),
(4, 'Chaitali', 25, 'Mumbai', 6500),
(5, 'Hardik', 27, 'Bhopal', 8500),
(6, 'Komal', 22, 'MP', 4500),**/
(7, 'Muffet', 26, 'Indore', 10000)

/**
Lesson 2 - Assignment 3b
Write a case statement to show all the fields in the table Business.
If the age of the customer is more than 30, it returns Gen X, and
If the age of the customer is 23, 24,25, should be Gen Z, 
If the age of the customer is 22, then it should be Gen Alpha, 
If the age of the customer is 27, then it should be Gen Y and make sure to name the field as Generation.
**/

select
ID,
NAME,
AGE,
ADDRESS,
SALARY,
case
when AGE >=25 and AGE <27 then 'Associate Engineer'
when AGE > 25 then 'Senior Developer'
when AGE < 25 then 'Intern'
--when AGE >=25 and AGE <=27 then 'Associate Engineer'
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

--SK Code
select AGE,ID,[NAME],[ADDRESS],SALARY,case when AGE > 30 then 'Gen X'when AGE between 23 and 25 then 'Gen Z'when AGE = 22 then 'Gen Alpha'when AGE = 27 then 'Gen Y'end as Generationfrom Business