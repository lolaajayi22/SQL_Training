USE [EmadeDev]
GO

/****** Object:  Table [dbo].[CovidVacc]    Script Date: 4/3/2025 10:47:25 PM ******/
/** Project 1
Developed: Lola Ajayi
Data: CovidVacc and CovidDeaths

Business Intelligence use case/KPI:
1. Show total cases vs total deaths, 
2. What percentage of the population is affected by covid?
3. Show countries with highest infection rate compared to population
4. Show countries with the highest death count per population
5. Display the continent with the highest death count per population.
6. Show the total population of a location with the number of people who have been vaccinated
7. Show the percentage of the population vaccinated in different countries and continents.
8. What is the Mortality rate - total deaths divided by total cases? (Note Mortality rate is the death rate divided by total cases
9. What are the global cases for each day?
**/

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO
drop table if exists CovidVacc 
CREATE TABLE [dbo].[CovidVacc](
	[iso_code] [varchar] (50) NULL,
	[continent] [varchar] (50) NULL,
	[location] [varchar] (50) NULL,
	[date] date,
	[new_tests] [float] NULL,
	[total_tests] [float] NULL,
	[total_tests_per_thousand] Float NULL,
	[new_tests_per_thousand] Float NULL,
	[new_tests_smoothed] Float NULL,
	[new_tests_smoothed_per_thousand] Float NULL,
	[positive_rate] Float NULL,
	[tests_per_case] Float NULL,
	[tests_units] Float NULL,
	[total_vaccinations] Float NULL,
	[people_vaccinated] Float NULL,
	[people_fully_vaccinated] Float NULL,
	[new_vaccinations] Float NULL,
	[new_vaccinations_smoothed] Float NULL,
	[total_vaccinations_per_hundred] Float NULL,
	[people_vaccinated_per_hundred] Float NULL,
	[people_fully_vaccinated_per_hundred] Float NULL,
	[new_vaccinations_smoothed_per_million] Float NULL,
	[stringency_index] Float NULL,
	[population_density] Float NULL,
	[median_age] Float NULL,
	[aged_65_older] Float NULL,
	[aged_70_older] Float NULL,
	[gdp_per_capita] Float NULL,
	[extreme_poverty] Float NULL,
	[cardiovasc_death_rate] Float NULL,
	[diabetes_prevalence] Float NULL,
	[female_smokers] Float NULL,
	[male_smokers] Float NULL,
	[handwashing_facilities] Float NULL,
	[hospital_beds_per_thousand] Float NULL,
	[life_expectancy] Float NULL,
	[human_development_index] Float NULL
) ON [PRIMARY]
GO


select * 
from CovidVacc

select distinct Continent
from CovidVacc

select * 
from CovidDeaths

--Altering column data type to float
alter table CovidDeaths
alter column total_cases float

alter table CovidDeaths
alter column total_deaths float

alter table CovidDeaths
alter column population float

alter table CovidDeaths
alter column positive_rate float

alter table CovidDeaths
alter column total_vaccinations float

alter table CovidDeaths
alter column date date

alter table CovidDeaths
alter column new_cases float

--Question 1: Show total cases vs total deaths
select 
sum(total_cases) as Total_Cases,
sum(total_deaths) as Total_Deaths
from CovidDeaths


--Question 2: What percentage of the population is affected by covid?
select
concat(round((cast(sum(total_cases) as float) / sum(population)) * 100, 2), '%') as Percentage_Affected
from CovidDeaths
 
--Question 3: Show countries with highest infection rate compared to population
select positive_rate
from CovidDeaths

select 
location,
total_cases,
population,
concat(round((cast(total_cases as float) / population) * 100, 2), '%') as HighestInfectionRate
from CovidDeaths
where population > 0
order by
cast(total_cases as float) / population desc;

--Aggregating the multiple rows of countries before finding out the ones with the highest rates of infections
select
location,
sum(total_cases) as Total_Cases,
sum(population) as Total_Population,
round((cast(sum(total_cases) as float) / nullif(sum(population), 0)) * 100, 2) as HighestInfectionRatePercentage
from CovidDeaths
group by location
order by HighestInfectionRatePercentage desc

--Question 4: Show countries with the highest death count per population
select
location,
sum(total_deaths) as Total_Deaths,
sum(population) as Total_Population,
round((cast(sum(total_deaths) as float) / nullif(sum(population), 0)) * 100, 2) as DeathRatePercentage
from CovidDeaths
group by location
order by DeathRatePercentage desc

--Question 5: Display the continent with the highest death count per population.
select 
continent,
sum(total_deaths) as Total_Deaths,
sum (population) as Total_Population,
round((cast(sum(Total_Deaths) as float) / nullif(sum(population), 0)) * 100, 2) as DeathRatePercentage
from CovidDeaths
group by Continent
order by DeathRatePercentage desc

select MAX (total_deaths) as Highest_Death_Count
from CovidDeaths
group by continent 
order by Highest_Death_Count desc

--Question 6: Show the total population of a location with the number of people who have been vaccinated
select 
location,
sum(total_vaccinations) as Total_Vaccinations,
sum(population) as Total_Population
from CovidDeaths
group by location
order by Total_Vaccinations desc

--Question 7: Show the percentage of the population vaccinated in different countries and continents
select 
location,
continent,
sum(total_vaccinations) as Total_Vaccinations,
sum(population) as Total_Population,
round((cast(sum(Total_Vaccinations) as float) / nullif(sum(population), 0)) * 100, 2) as VaccinationRatePercentage
from CovidDeaths
group by location, continent
order by VaccinationRatePercentage desc

--Question 8: What is the Mortality rate - total deaths divided by total cases? 
select 
location,
sum(total_cases) as Total_Cases,
sum(total_deaths) as Total_Deaths,
round((cast(sum(total_deaths) as float) / nullif(sum(total_cases), 0)) * 100, 2) as MortalityRatePercentage
from CovidDeaths
group by location
order by MortalityRatePercentage desc

--Question 9: What are the global cases for each day?
select 
date,
sum(new_cases) as Global_Cases
from CovidDeaths
group by date
order by date asc

