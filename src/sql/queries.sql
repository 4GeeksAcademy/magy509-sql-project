-- PLEASE READ THIS BEFORE RUNNING THE EXERCISE

-- ⚠️ IMPORTANT: This SQL file may crash due to two common issues: comments and missing semicolons.

-- ✅ Suggestions:
-- 1) Always end each SQL query with a semicolon `;`
-- 2) Ensure comments are well-formed:
--    - Use `--` for single-line comments only
--    - Avoid inline comments after queries
--    - Do not use `/* */` multi-line comments, as they may break execution

-- -----------------------------------------------
-- queries.sql
-- Complete each mission by writing your SQL query
-- directly below the corresponding instruction
-- -----------------------------------------------

SELECT * FROM regions;
SELECT * FROM species;
SELECT * FROM climate;
select * from regions;
SELECT * FROM observations;

-- MISSION 1 
-- Your query here;
SELECT r.id, r.name, r.country, count(DISTINCT o.species_id) different_species
FROM observations o
INNER JOIN regions r ON r.id = o.region_id
GROUP BY r.id, r.name, r.country
ORDER BY different_species desc;

-- MISSION 2
-- Your query here

SELECT strftime('%m', observations.observation_date) AS month, sum(count) observations
FROM observations
GROUP BY month
ORDER BY observations DESC;

-- MISSION 3
-- Your query here;
SELECT s.id, s.scientific_name, s.common_name, sum(o.count) observations 
FROM species s
INNER JOIN observations o ON s.id = o.species_id
GROUP BY s.id, s.scientific_name, s.common_name
HAVING sum(o.count) <= 5
ORDER BY observations;

-- MISSION 4
-- Your query here;
SELECT r.name, r.country, COUNT(DISTINCT o.species_id) as different_species
FROM observations o
INNER JOIN regions r ON o.region_id = r.id
GROUP BY r.name, r.country
ORDER BY different_species DESC
LIMIT 1;

-- MISSION 5
-- Your query here;
SELECT s.scientific_name, s.common_name, COUNT(o.species_id) as species_observations
FROM observations o
INNER JOIN species s ON o.species_id = s.id
GROUP BY s.scientific_name, s.common_name
ORDER BY species_observations DESC
LIMIT 10;

-- MISSION 6
-- Your query here;
SELECT observer, count(1) total_observations
FROM observations
GROUP BY observer
ORDER BY total_observations DESC
LIMIT 10;


-- MISSION 7
-- Your query here;
SELECT s.*
FROM species s
WHERE NOT EXISTS (SELECT 1
                  FROM observations o
                  WHERE o.species_id = s.id);

-- MISSION 8
-- Your query here;
SELECT observation_date, count(distinct species_id) observed_species
FROM observations
GROUP BY observation_date
ORDER BY observed_species DESC
LIMIT 10;
