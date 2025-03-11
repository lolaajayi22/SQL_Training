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