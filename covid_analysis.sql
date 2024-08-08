--SHOW FULL TABLE OF COVID DEATHS
select * 
from Covid_Analysis..CovidDeaths
where continent is not null
order by 3,4

--SHOW TOTAL CASES VS NEW CASES VS DEATHS
select location, date, total_cases, new_cases,total_deaths,population
from Covid_Analysis..CovidDeaths
order by 1,2

--SHOW TOTAL CASES VS TOTAL DEATHS VS DEATH PERCENTAGE
select location, total_cases,total_deaths, (total_deaths/total_cases)*100 as DeathPercentage
from Covid_Analysis..CovidDeaths
order by 1,2

--RISE IN COVID CASES AS PER DATE 
select location,date,population, total_cases, (total_cases/population)*100 as DeathPercentage 
from Covid_Analysis..CovidDeaths
order by 1,2

-- countries with highest infection rate
select location, population, max(total_cases) as highestInfectionCount,max(total_cases/population)*100 as PercentagePopulationAffected 
from Covid_Analysis..CovidDeaths
group by location ,population
order by PercentagePopulationAffected desc

--highest death count per population
select location,max(cast(total_deaths as int)) as TotalDeathCount
from Covid_Analysis..CovidDeaths
where continent is not null
group by location
order by TotalDeathCount desc

--Stats as per continents
select location, max(cast(total_deaths as int)) as TotalDeathCount
from Covid_Analysis..CovidDeaths
where continent is null
group by location
order by TotalDeathCount desc

--continent with highest death count
select continent, max(cast(total_deaths as int)) as TotalDeathCount
from Covid_Analysis..CovidDeaths
where continent is not null
group by continent
order by TotalDeathCount desc

--Global numbers
select  sum(new_cases) as Total_Cases, sum(cast(new_deaths as int)) as Total_deaths, sum(cast(new_deaths as int))/sum(new_cases)*100 as DeathPercentage
from Covid_Analysis..CovidDeaths
where continent is not null
order by 1,2 


--JOIN COVID DEATH TABLE AND COVID VACCINATION TABLE 
select * 
from Covid_Analysis..CovidDeaths dea
join
 Covid_Analysis..CovidVaccinations vac
on dea.location=vac.location
and dea.date=vac.date


--total population vs vaccination
select dea.continent,dea.location,dea.date,dea.population,vac.new_vaccinations,
sum(cast(vac.new_vaccinations as int))
over (partition by dea.location order by dea.location,dea.date) as RollingPeopleVaccinated

from Covid_Analysis..CovidDeaths dea
join Covid_Analysis..CovidVaccinations vac
on dea.location=vac.location
and dea.date=vac.date
where dea.continent is not null
order by 2,3


--TOTAL DEATH COUNT PER CONTINENT
select location,sum(cast(total_deaths as int)) as TotalDeathCount
from Covid_Analysis..CovidDeaths
where continent is null
and location not in ('world','european union','international')
group by location
order by 1,2


-- DATE WISE HIGHEST INFECTION COUNT
select location,population,date, max(total_cases) as HighestInfectionCount,max(total_cases/population) as PercentagePopulationAffected
from Covid_Analysis..CovidDeaths
group by location,population,date
order by PercentagePopulationAffected desc
