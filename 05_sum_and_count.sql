# 1. Show the total population of the world.
SELECT SUM(population) FROM world

# 2. List all the continents - just once each. 
SELECT DISTINCT continent FROM world

# 3. Give the total GDP of Africa 
SELECT SUM(gdp) FROM world WHERE continent = 'Africa'

# 4. How many countries have an area of at least 1000000 
SELECT COUNT(name) FROM world WHERE area > 1000000

# 5. What is the total population of ('Estonia', 'Latvia', 'Lithuania') 
SELECT SUM(population) FROM world WHERE name in('Estonia', 'Latvia', 'Lithuania')

# 6. For each continent show the continent and number of countries. 
SELECT continent, COUNT(name) FROM world GROUP BY continent

# 7. For each continent show the continent and number of countries with populations of at least 10 million. 
SELECT continent, COUNT(name) FROM world WHERE population > 10000000 GROUP BY continent

# 8. List the continents that have a total population of at least 100 million. 
SELECT continent FROM world GROUP BY continent HAVING SUM(population) > 100000000


### PART 2: NOBEL PRIZES ###

# 1. Show the total number of prizes awarded. 
SELECT COUNT(winner) FROM nobel

# 2. List each subject - just once 
SELECT DISTINCT subject FROM nobel

# 3. Show the total number of prizes awarded for Physics. 
SELECT COUNT(winner) FROM nobel WHERE subject = 'Physics'

# 4. For each subject show the subject and the number of prizes. 
SELECT subject, COUNT(winner) FROM nobel GROUP BY subject

# 5. For each subject show the first year that the prize was awarded. 
SELECT subject, MIN(yr) FROM nobel GROUP BY subject

# 6. For each subject show the number of prizes awarded in the year 2000. 
SELECT subject, COUNT(winner) FROM nobel WHERE yr = 2000 GROUP By subject

# 7. Show the number of different winners for each subject. 
SELECT subject, COUNT(DISTINCT winner) FROM nobel GROUP By subject

# 8. For each subject show how many years have had prizes awarded. 
SELECT subject, COUNT(DISTINCT yr) FROM nobel GROUP BY subject

# 9. Show the years in which three prizes were given for Physics. 
SELECT yr FROM nobel WHERE subject = 'Physics' GROUP BY yr HAVING COUNT(subject) = 3

# 10. Show winners who have won more than once. 
SELECT winner FROM nobel GROUP BY winner HAVING COUNT(subject) > 1

# 11. Show winners who have won more than one subject. 
SELECT winner FROM nobel GROUP BY winner HAVING COUNT(DISTINCT subject) > 1

# 12. Show the year and subject where 3 prizes were given. Show only years 2000 onwards. 
SELECT yr, subject FROM nobel WHERE yr >= 2000 GROUP BY yr, subject HAVING COUNT(subject) = 3
