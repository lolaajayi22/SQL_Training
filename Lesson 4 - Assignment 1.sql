/**
Developer: Lola Ajayi
Date: March 24th, 2025
Lesson 4 - Assignment 1
1:--Write a query to show the unique fruitsname
2:--Write a query to show the highest amount
3:--Write a query to show the lowest amount
4:--Write a query to show the fruit that  does not have any amount
5:--Give 2500 for any record that shows missing amount
**/

--Foodco. table creation
create table [FoodCo.]
("S.no" int null,
FruitsName varchar (50) not null,
Amount int null)

select * from [FoodCo.]

insert into [FoodCo.]
([S.no], FruitsName, Amount)
values
(1,'Apple',150),
(2,'Banana',75),
(3,'Orange',60),
(4,'Papaya',80),
(5,'Mango',95),
(6,'Apple',150),
(7,'Lechi', null)

select 
  distinct FruitsName 
from 
  [FoodCo.]

select max(amount) as Highest_Amount
from [FoodCo.]

select min(amount) as Lowest_Amount
from [FoodCo.] 

select *
from [FoodCo.]
where Amount is null

update [FoodCo.]
set amount = 2500
where amount is null

update [FoodCo.]
set FruitsName = 'Lechi'
where FruitsName = 'lechi'