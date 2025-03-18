/* Approach 1 -  Using CTE */

WITH cte AS (
  SELECT artist_name,genre,concert_revenue,number_of_members,
  (concert_revenue/number_of_members) as revenue_per_bandMember,
  RANK() OVER (PARTITION BY genre ORDER BY (concert_revenue/number_of_members) DESC) AS ranked_concerts
  FROM concerts
)

SELECT artist_name,genre,concert_revenue,number_of_members,revenue_per_bandMember
FROM cte
WHERE ranked_concerts = 1
ORDER BY 5 DESC

/* Approach 2 - Using subquery */

SELECT artist_name,genre,concert_revenue,number_of_members,revenue_per_bandMember
FROM (
  SELECT artist_name,genre,concert_revenue,number_of_members,
  (concert_revenue/number_of_members) as revenue_per_bandMember,
  RANK() OVER (PARTITION BY genre ORDER BY (concert_revenue/number_of_members) DESC) AS ranked_concerts
  FROM concerts
) AS concert_subquery
WHERE ranked_concerts = 1
ORDER BY 5 DESC


/*

As the lead data analyst for a prominent music event management company, you have been entrusted with a dataset containing concert revenue and detailed information about various artists.

Your mission is to unlock valuable insights by analyzing the concert revenue data and identifying the top revenue-generating artists within each music genre.

Write a query to rank the artists within each genre based on their revenue per member and extract the top revenue-generating artist from each genre. Display the output of the artist name, genre, concert revenue, number of members, and revenue per band member, sorted by the highest revenue per member within each genre.

concerts Schema:

| Column Name       | Type      | Description                                               |
|-------------------|-----------|-----------------------------------------------------------|
| artist_id         | integer   | A unique identifier for each artist or band performing in the concert. |
| artist_name       | varchar(100) | The name of the artist or band performing in the concert. |
| genre             | varchar(50)  | The music genre associated with the concert.              |
| concert_revenue   | integer   | The total revenue generated from the concert.              |
| year_of_formation | integer   | The year that the artist or band was formed.               |
| country           | varchar(50)  | The country of origin or residence of the artist or band. |
| number_of_members | integer   | The number of members in the band.                         |
| album_released    | integer   | The total number of albums released by the artist or band. |
| label             | varchar(100) | The record label or music company associated with the artist or band. |

concerts Example Input:

| artist_id | artist_name  | genre   | concert_revenue | year_of_formation | country        | number_of_members | album_released | label             |
|-----------|--------------|---------|-----------------|-------------------|----------------|-------------------|----------------|-------------------|
| 103       | Taylor Swift | Pop     | 700000          | 2004              | United States  | 1                 | 9              | Republic Records  |
| 104       | BTS          | K-Pop   | 800000          | 2013              | South Korea    | 7                 | 7              | Big Hit Music     |
| 105       | Adele        | Pop     | 600000          | 2006              | United Kingdom | 1                 | 3              | Columbia Records  |
| 109       | Blackpink    | K-Pop   | 450000          | 2016              | South Korea    | 4                 | 5              | YG Entertainment  |
| 110       | Maroon 5     | Pop     | 550000          | 1994              | United States  | 5                 | 7              | Interscope Records|

Example Output:

| artist_name  | genre | concert_revenue | number_of_members | revenue_per_member |
|--------------|-------|-----------------|-------------------|--------------------|
| Taylor Swift | Pop   | 700000          | 1                 | 700000             |
| BTS          | K-Pop | 800000          | 7                 | 114285.71   

*/