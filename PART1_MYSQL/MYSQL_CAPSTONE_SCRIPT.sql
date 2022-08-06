#CAPSTONE PROJECT _ PART 1 MYSQL

#We will upload our csv file using sqlalchemy, create engine , pandas on MYSQL database. 
#WE have already created schema name ‘capstone’ and we will import our 
#csv data ‘olympix_data_organized_with_header (1) (1).csv’ using python and jupyter notebook. 
#Once we have uploaded the data, we will check if the data is being loaded correctly load or not as follows:

SELECT * FROM capstone.olympic;
#To drop the index column from our loaded data we will use following:
ALTER TABLE `capstone`.`olympic`
DROP COLUMN `index`;

#Find the average number of medals won by each country

CREATE OR REPLACE VIEW total3 
AS (SELECT country, sum(total_medal) 
FROM capstone.olympic GROUP BY country);
SELECT * FROM capstone.total3;
SELECT AVG(`sum(total_medal)`) FROM capstone.total3;


#Display the countries and the number of gold medals they have won in decreasing order

SELECT * FROM capstone.olympic;
CREATE OR REPLACE VIEW gold 
AS (SELECT country, sum(gold_medal) 
FROM capstone.olympic GROUP BY country);
SELECT * FROM capstone.gold
ORDER BY `sum(gold_medal)` DESC;

#Display the list of people and the medals they have won in descending order, grouped by their country
select country, `name`, sum(total_medal) 
FROM capstone.olympic 
GROUP BY `name`
ORDER BY sum(total_medal) DESC;


#Display the list of people with the medals they have won according to their age

SELECT name, age, sum(total_medal)
FROM capstone.olympic
GROUP BY name
ORDER BY age DESC;

#Which country has won the most number of medals (cumulative)

select country, sum(total_medal) 
FROM capstone.olympic 
GROUP BY country
ORDER BY sum(total_medal) DESC LIMIT 1;