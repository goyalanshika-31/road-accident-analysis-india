/*
Road Accident Analysis Project
Author: Anshika Goel
Description: SQL queries used for accident analysis dashboard
*/
CREATE TABLE accidents (
state_name TEXT,
city_name TEXT,
year INT,
month TEXT,
day_of_week TEXT,
time_of_day TIME,
accident_severity TEXT,
number_of_vehicles INT,
vehicle_type TEXT,
number_of_casualties INT,
number_of_fatalities INT,
weather_conditions TEXT,
road_type TEXT,
road_condition TEXT,
lighting_conditions TEXT,
traffic_control TEXT,
speed_limit INT,
driver_age INT,
driver_gender TEXT,
driver_license_status TEXT,
alcohol_involvement TEXT,
accident_location TEXT
);

SELECT *
FROM accidents
LIMIT 10;


SELECT COUNT(*)
FROM accidents;

-- cleaning the data
SELECT *
FROM accidents
WHERE state_name IS NULL
   OR city_name IS NULL
   OR driver_age IS NULL
   OR weather_conditions IS NULL
   OR road_type IS NULL;

SELECT DISTINCT city_name
FROM accidents
ORDER BY city_name;


UPDATE accidents
SET city_name = 'Unknown City'
WHERE city_name = 'Unknown';


SELECT DISTINCT driver_gender
FROM accidents;

SELECT *
FROM accidents
WHERE driver_age < 18 OR driver_age > 90;


SELECT state_name, city_name, year, month, day_of_week, time_of_day, COUNT(*)
FROM accidents
GROUP BY state_name, city_name, year, month, day_of_week, time_of_day
HAVING COUNT(*) > 1;


SELECT MIN(speed_limit) AS min_speed,
       MAX(speed_limit) AS max_speed
FROM accidents;


SELECT DISTINCT alcohol_involvement
FROM accidents;



-- EDA(Exploratory data analysis)

SELECT COUNT(DISTINCT state_name)
FROM accidents;

SELECT DISTINCT state_name
FROM accidents
ORDER BY state_name;

SELECT DISTINCT accident_severity
FROM accidents;

SELECT DISTINCT weather_conditions
FROM accidents
ORDER BY weather_conditions;

SELECT DISTINCT road_type
FROM accidents;

SELECT DISTINCT vehicle_type
FROM accidents;

SELECT DISTINCT lighting_conditions
FROM accidents;

SELECT state_name, COUNT(*) AS total_accidents
FROM accidents
GROUP BY state_name
ORDER BY total_accidents DESC;


SELECT weather_conditions, COUNT(*) AS accidents
FROM accidents
GROUP BY weather_conditions
ORDER BY accidents DESC;


SELECT road_type, COUNT(*) AS accidents
FROM accidents
GROUP BY road_type
ORDER BY accidents DESC;


SELECT accident_severity, COUNT(*) AS total
FROM accidents
GROUP BY accident_severity
ORDER BY total DESC;


SELECT alcohol_involvement, COUNT(*) AS accidents
FROM accidents
GROUP BY alcohol_involvement;

SELECT road_type, COUNT(*) AS fatal_accidents
FROM accidents
WHERE accident_severity = 'Fatal'
GROUP BY road_type
ORDER BY fatal_accidents DESC;

SELECT driver_age, COUNT(*) AS accidents
FROM accidents
GROUP BY driver_age
ORDER BY accidents DESC
LIMIT 10;


SELECT lighting_conditions, COUNT(*) AS accidents
FROM accidents
GROUP BY lighting_conditions
ORDER BY accidents DESC;
