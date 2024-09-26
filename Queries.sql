1)
SELECT SUM (Value) TOTAL_MILK_PRODUCTION
FROM milk_production 
WHERE Year = '2023';
Total milk production for 2023: 91812000000

2)
SELECT sum(Value) total_coffee_production 
from coffee_production
Coffee production data for the year 2015: 6600000

3)
SELECT avg(value) total_honey_production
from honey_production
where year='2022';
Average Honey production in year2022: 3133275.0

4)
SELECT State
,state_ansi
FROM state_lookup;
State names with their corresponding ANSI codes: Alabama 1

5)
SELECT MAX(value) max_yogurt_prduction 
from yogurt_production
where year='2022';
Highest yogurt production value for the year 2022: 793256000

6)
SELECT
 SUM(YP.Value) TOTAL_YOGHURT_PRODUCTION
FROM yogurt_production YP
WHERE YP.Year = '2022'
 AND YP.State_ANSI IN (
  SELECT DISTINCT
   CP.State_ANSI
  FROM cheese_production CP
  WHERE CP.Year = '2022'
 );
States where both honey and milk were produced in 2022: 1171095000

7)
SELECT
 L.State
 ,L.State_ANSI
FROM cheese_production P
INNER JOIN state_lookup L
ON P.State_ANSI = L.State_ANSI
WHERE P.Value > 100000000
 AND P.Period = 'APR'
 AND P.Year = 2023;
Total yogurt production for states that also produced cheese in 2022: CALIFORNIA


8)
SELECT
 P.Year,
 SUM(P.Value) TOTAL_COFFEE_PRO_IN_2011
FROM coffee_production P
GROUP BY P.Year
HAVING P.Year = 2011;
Manager wants this information about total milk production: 91812000000


9)
SELECT
 AVG(P.Value) AVG_HONEY_PRO_IN_2022
FROM honey_production P
WHERE P.Year = 2022;
Cheese production was greater than 100 million in April 2023 in: CALIFORNIA


10)
SELECT * FROM state_lookup
where state='florida';
State_ANSI code for Florida: 12


11)
SELECT 
 State,
 SUM(Value) TOTAL_CHEESE_PRODUCTION
FROM state_lookup L
LEFT JOIN cheese_production P
ON L.State_ANSI = P.State_ANSI
WHERE P.Period = 'APR'
 AND P.Year = 2023
GROUP BY L.State
HAVING L.State = 'NEW JERSEY';
cheese production values of New Jersey: 9778000


12)
SELECT
 SUM(YP.Value) TOTAL_YOGHURT_PRODUCTION
FROM yogurt_production YP
WHERE YP.Year = '2022'
 AND YP.State_ANSI IN (
  SELECT DISTINCT
   CP.State_ANSI
  FROM cheese_production CP
  WHERE CP.Year = '2023'
 );
 Total yogurt production for states in the year 2022 which also have cheese production data from 2023: 1171095000


13)
SELECT 
 COUNT(DISTINCT S.State) COUNT_OF_MISSING_MILK_PRODUCTION_STATE_IN_2023
FROM state_lookup S
LEFT JOIN milk_production P
ON S.State_ANSI = P.State_ANSI
 AND P.Year = 2023
WHERE P.State_ANSI IS NULL;
Missing from milk_production states in 2023: 26

14)
SELECT
 AVG(Value) AVERAGE_COFFEE_PRODUCTION
FROM coffee_production P
WHERE Year IN (
 SELECT
  Year
 FROM honey_production HP
 WHERE Value > 1000000
);
Average coffee production for all years where the honey production exceeded 1 million: 6426666
