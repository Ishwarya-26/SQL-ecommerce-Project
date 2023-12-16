-- CREATING DATABASE TO SAVE THE DATA
CREATE DATABASE ecommerce;

-- IMPORTED THE DATA SUCESSFULLY IN ECOMMERCE DATABASE
-- STRUCTURE OF THE TABLE
USE ecommerce;

-- first 100 rows of the database
SELECT * FROM users_data
LIMIT 100;

-- distinct values exist in table for field country and language
SELECT count(DISTINCT(country)) AS COUNTRY_COUNT,
count(DISTINCT (language)) AS LANGUAGE_COUNT 
FROM users_data;

-- Checking whether male users are having maximum followers or female users.
SELECT gender,SUM(socialNBFollowers) AS Followers 
from users_data GROUP BY  gender;

-- total users those use Profile Picture in their Profile
SELECT COUNT(hasProfilePicture) AS profilepicture 
from users_data 
WHERE hasProfilePicture= 'True';

-- Uses Application for Ecommerce platform
SELECT COUNT(hasAnyApp) AS Application_user 
from users_data 
WHERE hasAnyApp= 'True';

-- Uses Android app
SELECT COUNT(hasAndroidApp) AS Android_user 
from users_data 
WHERE hasAndroidApp= 'True';

-- Uses ios app
SELECT COUNT(hasIosApp) AS Ios_user
from users_data 
WHERE hasIosApp= 'True';

-- total number of buyers for each country 
SELECT country,COUNT(productsBought) AS Buyers
 FROM users_data 
 WHERE productsBought>=1 
 GROUP BY country 
 ORDER BY buyers DESC ;

--  the total number of sellers for each country
SELECT country,COUNT(productsSold) AS Sellers
 FROM users_data 
 WHERE productsSold>=1 
 GROUP BY country 
 ORDER BY Sellers;
 
 -- top 10 countries having maximum products pass rate
 SELECT country FROM users_data 
 GROUP BY country
 HAVING MAX(productsPassRate) 
 LIMIT 10;

-- number of users on an ecommerce platform for different language choices.
SELECT Language, COUNT(*) AS NumberOfUsers
FROM users_data
GROUP BY Language;

-- country having maximum number of buyers
SELECT Country, COUNT(productsbought) AS NumberOfBuyers
FROM users_data
GROUP BY Country
ORDER BY NumberOfBuyers DESC
LIMIT 1;

-- record of top 110 users who have used ecommerce platform recently.
SELECT * FROM users_data 
WHERE hasAnyApp='True' 
ORDER BY daysSinceLastLogin LIMIT 110 ;

-- number of female users those who have not logged in since last 100 days.
SELECT COUNT(type)  AS female_user 
FROM users_data 
WHERE gender="F"
AND daysSinceLastLogin>=100;

-- number of female users of each country at ecommerce platform.
SELECT country,COUNT(gender) female_user  
FROM users_data 
WHERE gender="F" AND hasAnyApp='True'
GROUP BY country;

-- number of male users of each country at ecommerce platform.
SELECT country,COUNT(gender) male_user 
FROM users_data 
WHERE gender="M" AND hasAnyApp='True'
GROUP BY country;

-- number of products sold and bought on ecommerce platform by male users for each country
SELECT country,count(productsSold) product_sold, count(productsBought) product_bought 
FROM users_data 
WHERE gender="M" AND hasAnyApp='True' 
GROUP BY country ;

