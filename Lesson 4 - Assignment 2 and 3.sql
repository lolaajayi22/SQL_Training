/**
Developer: Lola Ajayi
Date: March 24th, 2025
Lesson 4 - Assignment 2 & 3
1: Create Store Procedure using Business table
2: Create Store Procedure using EmployeeInfo table
3: Create Store Procedure using CompanyInfo table
**/

--Create Store Procedure for Business table
create procedure spBusiness
as 
Begin
select *
from Business
end

select * from Business

exec spBusiness

--Create Store Procedure for EmployeeInfo table
create procedure spEmployeeInfo
as 
Begin
select *
from EmployeeInfo
end

exec spEmployeeInfo

--Create Store Procedure for CompanyInfo table
create procedure spCompanyInfo
as 
Begin
select *
from CompanyInfo
end

select * from CompanyInfo

exec spCompanyInfo