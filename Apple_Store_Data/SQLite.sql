CREATE Table  appleStore_description_combined AS

Select * From appleStore_description1

Union All 

SELECT * From appleStore_description2

Union all 

SELECT * FROM appleStore_description3

Union ALL

Select * From appleStore_description4


**EXPLORATORY DATA ANALYSIS88


--Check number of unique apps in both tables

SELECT Count(DISTINCT id) AS UniqueAppIDs
FROM AppleStore

SELECT COUNT(DISTINCT id) AS UniqueAppIDs
FROM appleStore_description_combined

--Check for any missing values 

SELECT COUNT (*) AS MissingValues
FROM AppleStore
WHERE track_name IS NULL OR user_rating is NULL or prime_genre is NULL

SELECT COUNT (*) AS MissingValues
FROM appleStore_description_combined
WHERE app_desc is NULL

--Find out the number of apps per genre

SELECT prime_genre, COunt(*) as NumApps
From AppleStore
Group BY prime_genre
order By NumApps DESC

--Get an overview of the apps' ratings

Select min(user_rating) as MinRating,
	   max(user_rating) as MaxRating,
       avg(user_rating) as AvgRating
FROM AppleStore

--Get the distribution of app prices

SELECT
	(price / 2) *2 as PriceBinStart,
    ((price / 2) *2) as PriceBinEnd,
    count(*) as NumApps
FROM AppleStore

Group BY PriceBinStart
Order by PriceBinStart


**DATA ANALYSIS**

--Determine whether paid apps here have higher rating than free apps

SELECT CASE
			When price > 0 Then 'Paid'
            ELSE 'FREE'
       END as App_Type, 
       avg(user_rating) As Avg_Rating
FROM AppleStore
GRoup By App_Type
          
--Check if apps with more supported languages have higher ratings

SELECT CASE 
			WHEN lang_num < 10 THEN '<10 languages'
            WHEN lang_num BETWEEN 10 and 30 Then '10-30 languages'
            Else '>30 languages'
       END AS  language_bucket,
       avg(user_rating) AS Avg_Rating
FROM AppleStore
Group BY language_bucket
ORder BY Avg_Rating DESC

--Check genres with low ratings

SELECT prime_genre, 
	   avg(user_rating) AS Avg_Rating
FROM AppleStore
GROUP BY prime_genre
ORder by Avg_Rating
Limit 10

--Check if there is correlation between the length of the app description and the user rating (apps with long/thorough descriptions seem to have higher user ratings)
          
SELECT CASE
			WHEN length(b.app_desc) <500 THEN 'SHORT'
            WHEN length(b.app_desc) BETWEEN 500 and 1000 THEN 'MEDIUM'
            ELSE 'LONG'
       END AS description_length_bucket,
	   avg(a.user_rating) as average_rating 
       
FROM 
	AppleStore As A
    
JOIN
	appleStore_description_combined as b
On
	a.id = b.id

GROUP BY description_length_bucket
order by average_rating DESC

--Chect the top-rated apps for each genre (stakeholder should try to emmulate these apps!)

SELECT
	prime_genre,
    track_name,
    user_rating
FROM (
      SELECT
      prime_genre,
      track_name,
      user_rating,
      RANK() OVER(PARTITION by prime_genre order by user_rating DESC, rating_count_tot) AS rank
      FROM
      appleStore            
     ) as a           
WHERE
a.rank = 1
          