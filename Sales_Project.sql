/**
Project Name: Sales Project
Developer: Lola Ajayi
Date: April 23, 2025

Project Steps:
1. Visual studio for ETL 
2. Data transformations. Added 'Execute SQL Task' in Control Flow', to truncate existing tables whenever a package needs to be rerun, 
to prevent duplication in MS SQL 
3. Table checks for import and integrity in SQL
4. ERD in SQL
5. Queries
6. Data visualisation in Power BI
**/

select *
from [dbo].[SalesCustomers]

select * 
from [dbo].[SalesDeliveryPerson]

select *
from [dbo].[SalesOrders]

select *
from [dbo].[SalesPinCode]

select *
from [dbo].[SalesProducts]

--Had inadvertently added a 'space' to the column name, so renaming it here
exec sp_rename '[dbo].[SalesProducts].[product_id ]', 'product_id', 'COLUMN';

--To check for duplication of product ID because of error encountered during ERD creation
select product_id, count(*) as count
from [dbo].[SalesProducts]
group by product_id
having count(*) > 1;

--To check for duplication of order ID because of error encountered during ERD creation
select order_id, count(*) as count
from [dbo].[SalesOrders]
group by order_id
having count(*) > 1;

--To check for nulls first before creating the composite key as a primary key cannot work with nulls
select *
from [dbo].[SalesOrders]
where order_id IS NULL or cust_id IS NULL or order_type IS NULL;

alter table [dbo].[SalesOrders]
alter column order_id bigint NOT NULL;

alter table [dbo].[SalesOrders]
alter column cust_id bigint NOT NULL;

alter table [dbo].[SalesOrders]
alter column order_type varchar(50) NOT NULL;

select order_id, cust_id, order_type, count(*) as occurrences
from [dbo].[SalesOrders]
group by order_id, cust_id, order_type
having count(*) > 1;

/** Attempts to check why I couldn't save the ERD
SELECT 
    order_id, 
    cust_id, 
    LTRIM(RTRIM(LOWER(order_type))) AS normalized_order_type,
    COUNT(*) AS occurrences
FROM SalesOrders
GROUP BY 
    order_id, 
    cust_id, 
    LTRIM(RTRIM(LOWER(order_type)))
HAVING COUNT(*) > 1;

-- Step 1: Drop the current PK
ALTER TABLE SalesOrders
DROP CONSTRAINT PK_SalesOrders;

-- Step 2: Recreate the PK
ALTER TABLE SalesOrders
ADD CONSTRAINT PK_SalesOrders PRIMARY KEY (order_id, cust_id, order_type);

SELECT 
    i.name AS index_name,
    c.name AS column_name
FROM sys.indexes i
JOIN sys.index_columns ic ON i.index_id = ic.index_id AND i.object_id = ic.object_id
JOIN sys.columns c ON c.column_id = ic.column_id AND c.object_id = ic.object_id
WHERE i.object_id = OBJECT_ID('SalesOrders') AND i.is_primary_key = 1;

-- Drop the wrongly ordered PK
ALTER TABLE SalesOrders
DROP CONSTRAINT PK_SalesOrders;

-- Recreate it with the correct column order
ALTER TABLE SalesOrders
ADD CONSTRAINT PK_SalesOrders 
PRIMARY KEY (order_id, cust_id, order_type);

SELECT order_id, cust_id, order_type, COUNT(*) AS occurrences
FROM SalesOrders
GROUP BY order_id, cust_id, order_type
HAVING COUNT(*) > 1;

Eventually discovered that after forming a composite key, you must remove the key as being the PK, 
since its now a combination of IDs to create a unique ID. In this case I had to remove order_ID as 
being the PK in the SalesOrder table
**/

--Duplicate order ID exists in table, as ID is same for item purchase and item return. 
--Creation of composite key
alter table [dbo].[SalesOrders]
add constraint PK_SalesOrders primary key (order_id, cust_id, order_type);

--Question 0: How many SalesCustomers are male and female?
select gender, count(*) as 'total gender'
from [dbo].[SalesCustomers]
group by gender

--Question 1: How many SalesCustomers do not have DOB information available?
select count (*) as 'count of missing dob'
from [dbo].[SalesCustomers]
where dob is null

--Question 2: How many SalesCustomers are there in each SalesPinCode (should this be primary_pincode, as there is no link betwen SalesCustomers & SalesPinCode) and gender combination?
select primary_pincode, gender, count(*) as 'total customers'
from [dbo].[SalesCustomers]
group by primary_pincode, gender
order by primary_pincode, gender

--Question 3: Print product name and mrp for SalesProducts which have more than 50000 MRP?
select product_name, mrp 
from [dbo].[SalesProducts]
where mrp >= 50000

--Question 4: How many delivery personal are there in each SalesPinCode (should this be pincode)?
select pincode, count(*) as 'count of delivery personal'
from [dbo].[SalesDeliveryPerson]
group by pincode
order by pincode

/**
Question 5: For each Pin code, print the count of SalesOrders, sum of total amount paid, average amount paid, 
--maximum amount paid, minimum amount paid for the transactions which were paid by 'cash'. Take only 'buy' order types
**/
select 
SP.pincode,
count(*) as 'Total Orders',
sum(SO.total_amount_paid) as 'Total Amount Paid',
avg(SO.total_amount_paid) as 'Average Amount Paid',
max(SO.total_amount_paid) as 'Max Amount Paid',
min(SO.total_amount_paid) as 'Min Amount Paid'
from 
SalesOrders SO
join SalesCustomers SC on SO.cust_ID = SC.cust_ID
join SalesPinCode SP on SC.primary_pincode = SP.pincode
where 
SO.payment_type = 'Cash' and 
SO.order_type = 'Buy'
group by SP.pincode
order by SP.pincode

/**
Question 6: For each SalesDeliveryPerson_id, print the count of SalesOrders and 
total amount paid for product_id = 12350 or 12348 and total units > 8. 
Sort the output by total amount paid in descending order. Take only 'buy' order types
**/
select delivery_person_id, 
count (*) as 'Sales Orders Count',
sum(tot_units) as 'Total Units',
sum(total_amount_paid) as 'Total Amount Paid'
from [dbo].[SalesOrders]
where order_type = 'Buy' and product_id in (12350, 12348) and tot_units > 8
group by delivery_person_id
order by 'Total Amount Paid' desc

--Question 7: Print the Full names (first name plus last name) for SalesCustomers that have email on 'gmail.com'?
select first_name, last_name, email
from [dbo].[SalesCustomers]
where email like '%gmail.com'

--Question 8: How many SalesOrders had #units between 1-3, 4-6 and 7+? Take only 'buy' order types
select * 
from [dbo].[SalesOrders]
where tot_units >= 1 and order_type = 'Buy'

select 
case 
when tot_units between 1 AND 3 then '1-3 units'
when tot_units between 4 AND 6 then '4-6 units'
when tot_units >= 7 then '7+ units'
else 'Other'
end as TotalUnitRange,
count(*) AS TotalOrders
from [dbo].[SalesOrders]
where order_type = 'Buy'
group BY 
case 
when tot_units between 1 AND 3 then '1-3 units'
when tot_units between 4 AND 6 then '4-6 units'
when tot_units >= 7 then '7+ units'
else 'Other'
end
order by TotalUnitRange;

--Question 9: Which SalesPinCode has average amount paid more than 150,000? Take only 'buy' order types
select 
SP.pincode,
count(*) as 'Total Orders',
avg(SO.total_amount_paid) as 'Average Amount Paid'
from 
SalesOrders SO
join SalesCustomers SC on SO.cust_ID = SC.cust_ID
join SalesPinCode SP on SC.primary_pincode = SP.pincode
where 
total_amount_paid > 150000 and SO.order_type = 'Buy'
group by SP.pincode
order by SP.pincode

/**
Question 10: Create the following columns from order data. Take only 'buy' order types
order_date
order day
order month
order year 
**/

select order_date,
day(order_date) as 'order_day',
format(order_date, 'MMMM') as 'order_month', 
year(order_date) as 'order_year'
from [dbo].[SalesOrders]
where order_type = 'Buy'

--Question 12: How many units have been sold by each brand? Also get total returned units for each brand.
select 
P.brand,
sum(case when SO.order_type = 'Buy' then SO.tot_units else 0 end) as 'Units Sold',
sum(case when SO.order_type = 'Return' then SO.tot_units else 0 end) as 'Units Returned'
from SalesOrders SO
join SalesProducts P on SO.product_ID = P.product_ID
group by P.brand
order by P.brand

--Question 13: How many unique SalesCustomers and delivery boys are there in each state?
select 
SP.state,
count(distinct SC.cust_id) as 'Unique Sales Customers',
count(distinct SD.delivery_person_id) as 'Unique Delivery Personnel'
from SalesPinCode SP
LEFT JOIN SalesCustomers SC ON SC.primary_pincode = SP.pincode
LEFT JOIN SalesDeliveryPerson SD ON SD.pincode = SP.pincode
group by SP.state
order by SP.state;

/**
Question 14: For every customer, print how many total units were ordered, how many units were 
ordered from their primary_SalesPinCode and how many were ordered not from the primary_SalesPinCode. 
Also calulate the percentage of total units which were ordered from 
primary_SalesPinCode(remember to multiply the numerator by 100.0). Sort by the percentage column in descending order.
**/

/**
Task 17
Using the per unit procurement cost in product table, find which product category has made the most profit in both absolute amount and percentage
Absolute Profit = Total Amt Sold - Total Procurement Cost
Percentage Profit = 100.0 * Total Amt Sold / Total Procurement Cost - 100.0 

Calculated in Power BI
**/

/**
Task 20 
 Generally the more numbers of units you buy, the more discount seller will give you.
 For 'Dell AX420' is there a relationship between number of units ordered and average discount 
 from selling price? Take only 'buy' order types
 **/

 --Joining all 5 tables
select 
SC.first_name, SC.last_name,
SD.name,
P.product_name,
SP.state,
SO.total_amount_paid
from SalesOrders SO
join SalesCustomers SC ON SO.cust_id = SC.cust_id
join SalesDeliveryPerson SD ON SO.delivery_person_id = SD.delivery_person_id
join SalesProducts P ON SO.product_id = P.product_id
join SalesPinCode SP ON SC.primary_pincode = SP.pincode
where SO.order_type = 'Buy'
order by SO.order_id;

select 
SC.*,
SD.*,
P.*,
SP.*,
SO.*
from SalesOrders SO
join SalesCustomers SC ON SO.cust_id = SC.cust_id
join SalesDeliveryPerson SD ON SO.delivery_person_id = SD.delivery_person_id
join SalesProducts P ON SO.product_id = P.product_id
join SalesPinCode SP ON SC.primary_pincode = SP.pincode

--Joining all five tables with selected columns to use in Power BI data visualisation
select 
    SO.order_id,
    SO.order_date,
    SO.order_type,
    SO.product_id,
    SO.cust_id,
    SO.delivery_person_id,
    SO.tot_units,
    SO.total_amount_paid,
    SO.payment_type,
    SC.first_name,
	SC.last_name,
    SC.gender,
    SC.primary_pincode as 'customer pincode',
    SD.name,
    SD.pincode 'delivery pincode',
    P.product_name,
    P.category,
    P.procurement_cost_per_unit,
    SP.pincode as 'sales pincode',
    SP.city,
    SP.state
from SalesOrders SO
join SalesCustomers SC ON SO.cust_id = SC.cust_id
join SalesProducts P ON SO.product_id = P.product_id
join SalesDeliveryPerson SD ON SO.delivery_person_id = SD.delivery_person_id
join SalesPinCode SP ON SC.primary_pincode = SP.pincode
