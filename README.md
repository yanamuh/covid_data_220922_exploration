# Covid Data (220922) Exploration
This repository contains SQL code for the COVID data (last updated 22092022) exploration. Dataset was obtained from https://ourworldindata.org/covid-deaths (last updated 22092022). The queries were done using PostgreSQL.
Exploration is mainly focused on per continent and Asia. Some insight those could be found are

### For WORLDWIDE
- North America has the highest number of total cases and Africa has the least. 
- But, Oceania has the highest percentage of total cases per population with North America as the 2nd highest. The continent with the least percentage of total cases per population is Africa.
- Eventhough Africa is the continent with the least percentage of total cases, it has the highest percentage of total death per cases.
- Oceania has the highest percentage of total cases per population, but it has the least percentage of total death per population. Which means it has highest percentage of recovery per total cases.
- Asia has the highest percentage vaccination per population, with 89.11% people already fully vaccinated and 56.51% people already got booster.
- Africa has the least percentage vaccination per population. Just 18.45% of total population that got vaccinated and 3.96% of total population already got booster. It also has the highest percentage of death per cases which possibly caused by low vaccination rate.

### For ASIA
- Northern Cyprus, Turkmenistan, and North Korea data will be ignored because some data are missing.
- Countries with the highest number of total cases are India, South Korea, and Japan. Percentage of death per cases for India, South Korea, and Japan are 1.186%, 0.114%, and 0.211%.
- Brunei, Israel, and South Korea have the highest percentage of cases per population, the numbers are 50.79%, 50.11%, and 47.39% respectively . But, the total death per cases are relatively low, which are 0.099%, 0.251%, 0.114%.
- China has low percentage of cases per population of 0.069. That is probably the result of strict lockdown measure. It also has low death cases with 0.531% percentage of total deaths per cases. It could be because good response from government to handle the virus or because the actual death numbers is not updated.
- Indonesia has 2.34% percentage of total cases per population and 2.461% percentage of total deaths per cases. Eventhough number of infected people are lower than highest infected countries such as India, South Korea, or Japan. Indonesia has the higher percentage of death per cases than the those countries. This means the handling of virus is not much better. It could be because the lack of good health care system or low vaccination rate.
- 62.32% of Indonesian population have been vaccinated. Meanwhile India, South Korea, and Japan have respectively 67.28%, 86.19%, and 82.48% of their population vaccinated. They do have higher ration of vaccination per population. 
- Countries with highest percentage of deaths per case are Yemen 18.07%, Syria 5.52%, and Afghanistan 3.94%. They have a really low vaccination per population, which are 1.43%, 9.69%, and 25.61% respectively, and are the countries in the lowest 5 of percentage of vaccination per population.
