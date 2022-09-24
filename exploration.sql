SELECT * FROM covid_data_220922;

-- Comparation between continent
-- Shows continent with highest percentage of death per case
SELECT d1.continent, d2.continent_population,
        MAX(d1.total_cases) AS total_cases_per_continent,
        MAX(d1.total_deaths) AS total_deaths_per_continent,
        CAST((MAX(d1.total_cases)/d2.continent_population)*100 AS decimal(4,2)) AS percentage_of_total_cases,
        CAST((MAX(d1.total_deaths)/d2.continent_population)*100 AS decimal(4,2)) AS percentage_of_total_deaths,
        CAST((MAX(d1.total_deaths)/MAX(d1.total_cases))*100 AS decimal(4,2)) AS percentage_of_death_per_cases
FROM covid_data_220922 d1
JOIN (SELECT continent, MAX(population) AS continent_population
     FROM covid_data_220922
     WHERE continent IS NOT NULL
    GROUP BY continent) d2
ON d1.continent = d2.continent
WHERE d1.continent IS NOT NULL
GROUP BY d1.continent, d2.continent_population 
ORDER BY percentage_of_death_per_cases DESC;

-- Shows total vaccination in every continent
SELECT d1.continent, d2.continent_population,
       MAX(total_vaccinations) AS total_vacc, 
       MAX(people_vaccinated) AS people_vacc,
       MAX(people_fully_vaccinated) AS people_fully_vacc,
       MAX(total_boosters) AS total_booster,
       CAST(MAX(people_fully_vaccinated)/d2.continent_population*100 AS decimal(4,2)) AS percent_fully_vaccinated,
       CAST(MAX(total_boosters)/d2.continent_population*100 AS decimal(4,2)) AS percent_total_booster,
       CAST((MAX(d1.total_deaths)/MAX(d1.total_cases))*100 AS decimal(4,2)) AS percentage_of_death_per_cases
FROM covid_data_220922 d1
JOIN ( SELECT continent, MAX(population) AS continent_population
     FROM covid_data_220922
     WHERE continent IS NOT NULL
     GROUP BY continent) d2
ON d1.continent = d2.continent
WHERE d1.continent IS NOT NULL
GROUP BY d1.continent, d2.continent_population
ORDER BY percent_fully_vaccinated DESC, percentage_of_death_per_cases DESC;

-- ASIA
-- Shows the data for Asian countries only
SELECT location, population
FROM covid_data_220922
WHERE lower(continent) like 'asia';

-- Total deaths
SELECT d1.location, d2.location_population,
        MAX(d1.total_cases) AS total_cases,
        MAX(d1.total_deaths) AS total_deaths,
        CAST((MAX(d1.total_cases)/d2.location_population)*100 AS decimal(6,3)) AS percentage_of_total_cases,
        CAST((MAX(d1.total_deaths)/d2.location_population)*100 AS decimal(6,3)) AS percentage_of_total_deaths,
        CAST((MAX(d1.total_deaths)/MAX(d1.total_cases))*100 AS decimal(6,3)) AS percentage_of_death_per_cases
FROM covid_data_220922 d1
JOIN (SELECT location, MAX(population) AS location_population
     FROM covid_data_220922
     WHERE lower(continent) like 'asia'
    GROUP BY location) d2
ON d1.location = d2.location
WHERE lower(continent) like 'asia'
GROUP BY d1.location, d2.location_population 
ORDER BY total_cases DESC;

-- Total vaccinations
-- Shows total vaccination in every continent
SELECT d1.location, d2.location_population,
       MAX(d1.total_cases) AS total_cases,
       MAX(total_vaccinations) AS total_vacc, 
       MAX(people_vaccinated) AS people_vacc,
       MAX(people_fully_vaccinated) AS people_fully_vacc,
       MAX(total_boosters) AS total_booster,
       CAST(MAX(people_fully_vaccinated)/d2.location_population*100 AS decimal(6,3)) AS percent_fully_vaccinated,
       CAST(MAX(total_boosters)/d2.location_population*100 AS decimal(6,3)) AS percent_total_booster,
       CAST((MAX(d1.total_deaths)/MAX(d1.total_cases))*100 AS decimal(6,3)) AS percentage_of_death_per_cases
FROM covid_data_220922 d1
JOIN ( SELECT location, MAX(population) AS location_population
     FROM covid_data_220922
     WHERE lower(continent) like 'asia'
     GROUP BY location) d2
ON d1.location = d2.location
WHERE lower(continent) like 'asia'
GROUP BY d1.location, d2.location_population
ORDER BY percentage_of_death_per_cases DESC, percent_fully_vaccinated DESC, total_cases DESC;

-- Percentage of vaccination per population VS Percentage death per cases VS extreme poverty VS cardiovasc_death_rate VS diabeles_prevalence
-- Look at how poverty and other illness affect the death percentage
SELECT d1.location,
       CAST(MAX(people_fully_vaccinated)/d2.location_population*100 AS decimal(6,3)) AS percent_fully_vaccinated,
       CAST(MAX(total_boosters)/d2.location_population*100 AS decimal(6,3)) AS percent_total_booster,
       CAST((MAX(d1.total_deaths)/MAX(d1.total_cases))*100 AS decimal(6,3)) AS percentage_of_death_per_cases,
       MAX(extreme_poverty) AS extreme_poverty,
       MAX(cardiovasc_death_rate) AS cardiovasc_death_rate,
       MAX(diabetes_prevalence) AS diabetes_prevalence
FROM covid_data_220922 d1
JOIN ( SELECT location, MAX(population) AS location_population
     FROM covid_data_220922
     WHERE lower(continent) like 'asia'
     GROUP BY location) d2
ON d1.location = d2.location
WHERE lower(continent) like 'asia'
GROUP BY d1.location, d2.location_population
ORDER BY cardiovasc_death_rate DESC, percentage_of_death_per_cases DESC;