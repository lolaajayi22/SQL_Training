/**
Lesson 9 Assignments
Developer: Lola Ajayi
Date: April 29th, 2025

Create Store Procedures using these tables
World, Games, CompanyInfo, EmployeeInfo and Business Table
**/

--Store procedure for World
create procedure spWorld
as 
Begin
select *
from World
end

exec spWorld

--Store procedure for Games
create procedure spGames
as 
Begin
select *
from Games
end

exec spGames

--Store procedure for CompanyInfo
create procedure spCompanyInfo
as 
Begin
select *
from CompanyInfo
end

exec spCompanyInfo

--Store procedures already created for CompanyInfo, EmployeeInfo and Business Table
exec [dbo].[spBusiness]

exec [dbo].[spEmployeeInfo]

