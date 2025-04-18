/**
Health Insurance Project
Developer: Lola Ajayi
Date: April 13th, 2025

Step 1: ETL via Visual Studio of all 7 Tables
Step 2: Table queries and checks in SSMS
Step 3: Data transformation to correct data types
**/

--Health Insurance Coverage
select * 
from [dbo].[HealthInsCoverage]

alter table [dbo].[HealthInsCoverage]
alter column [coverage_id] bigint

alter table [dbo].[HealthInsCoverage]
alter column [member_id] int

--Health Insurance Claims
select *
from [dbo].[HealthInsClaim]

alter table [dbo].[HealthInsClaim]
alter column [claim_id] int

alter table [dbo].[HealthInsClaim]
alter column [status_id] int

--Health Insurance Claims Address
/** cell contents swapped haphazardly between apartment no and city
select *
from [dbo].[HealthInsClaimAddress]

alter table [dbo].[HealthInsClaimAddress]
alter column [address_id] int

select apartment_no, city
from [dbo].[HealthInsClaimAddress]
where ISNUMERIC(city) = 1
or apartment_no like '%[A-Za-z]%'

update [dbo].[HealthInsClaimAddress]
set city = apartment_no,
apartment_no = null
where isnumeric(city) = 1
**/

--Health Insurance Claims Address
select * 
from [dbo].[DST_HealthInsClaimAddress]

--Health Insurance Claims Payment
select *
from [dbo].[HealthInsClaimPayment]

alter table [dbo].[HealthInsClaimPayment]
alter column [claim_payment_id] int

alter table [dbo].[HealthInsClaimPayment]
alter column [billed_amount] int

alter table [dbo].[HealthInsClaimPayment]
alter column [approved_amount] int

alter table [dbo].[HealthInsClaimPayment]
alter column [copay_amount] int

alter table [dbo].[HealthInsClaimPayment]
alter column [coinsurance_amount] int

alter table [dbo].[HealthInsClaimPayment]
alter column [deductible_amount] int

alter table [dbo].[HealthInsClaimPayment]
alter column [net_payment] int

alter table [dbo].[HealthInsClaimPayment]
alter column [claim_id] int


--Health Insurance Members
select * 
from [dbo].[HealthInsMembers]

alter table [dbo].[HealthInsMembers]
alter column [member_id] int

alter table [dbo].[HealthInsMembers]
alter column [address_id] int

alter table [dbo].[HealthInsMembers]
alter column [claim_id] int

alter table [dbo].[HealthInsMembers]
alter column [coverage_id] bigint

--Health Insurance Provider
select *
from [dbo].[HealthInsProvider]

alter table [dbo].[HealthInsProvider]
alter column [provider_id] int

alter table [dbo].[HealthInsProvider]
alter column [claim_id] int

alter table [dbo].[HealthInsProvider]
alter column [address_id] int

--Health Insurance Status
select *
from [dbo].[HealthInsStatus]

alter table [dbo].[HealthInsStatus]
alter column [status_id] int