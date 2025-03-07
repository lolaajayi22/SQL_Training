use EmadeDev
go

-- How to check data in a table
select *
from Noble

-- Show the year 1962
select *
from Noble
where Year = '1962'

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


