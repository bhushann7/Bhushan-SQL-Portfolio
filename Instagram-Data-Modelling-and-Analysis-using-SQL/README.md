# Instagram Data Analysis: User Engagement and Interactions

## Project Overview

This project focuses on analyzing user engagement and interactions within a simulated Instagram-like platform using SQL. The analysis is performed on a database designed to model key aspects of Instagram functionality, including users, posts, comments, likes, and follower relationships.

## Project Structure

1.  **SQL Database Creation (DDL)**
2.  **Data Population (DML)**
3.  **SQL Query Analysis**
4.  **Database Schema Visualization**
5.  **Interpretation of Results**

## Detailed Steps

1.  **SQL Database Creation (DDL)**

    * The project begins by defining the database schema using `CREATE TABLE` statements. This establishes the structure for tables such as `users`, `post`, `comment`, `likes`, and `follower`.
    * Foreign keys are used to define relationships between tables, ensuring data integrity.

2.  **Data Population (DML)**

    * Sample data is inserted into the tables using `INSERT INTO` statements, simulating real-world Instagram data.
    * An example of the update statement is also included.

3.  **SQL Query Analysis**

    * A series of SQL queries are executed to analyze user interactions and engagement. These queries calculate:
        * Post likes and comments.
        * User follower counts.
        * Post popularity based on likes.
        * User post counts.
        * Average likes per post.
        * User and post ranking.
    * Queries use `JOIN`, `GROUP BY`, `HAVING`, `ORDER BY`, `LIMIT`, `CASE`, CTE's, subqueries, and window functions to derive insights.
    * Examples of queries that find posts without comments, or users without followers are also shown.

    * Example of some of the analysis queries:

        ```sql
        SELECT p.post_id, COUNT(l.like_id) AS total_likes_per_post,
        DENSE_RANK() OVER (ORDER BY COUNT(l.like_id) DESC) AS like_rnk
        FROM post p
        LEFT JOIN likes l
        ON p.post_id = l.post_id
        GROUP BY p.post_id
        ```

        ```sql
        SELECT u.user_id,COUNT(f.follower_id) AS number_of_followers
        FROM users u
        LEFT JOIN follower f
        ON u.user_id = f.user_id
        GROUP BY u.user_id
        ORDER BY 2 DESC
        LIMIT 1;
        ```

4.  **Database Schema Visualization**

    * A visual diagram of the database schema is included to provide a clear understanding of the relationships between tables.

    ![](https://github.com/bhushann7/Instagram-Data-Modelling-and-Analysis-using-SQL/blob/58e91756d556051012cf10599849f5783cbb253d/Instagram%20Data%20Model.jpg)

5.  **Interpretation of Results**

    * The SQL query results provide insights into user engagement patterns, post popularity, and user influence.
    * The analysis identifies popular posts, active users, and follower trends.
    * The queries demonstrate how to extract meaningful information from relational data, such as identifying posts without comments, or users without followers.
    * The project provides a foundation for further analysis and optimization of the simulated Instagram platform.
    * The project demonstrates best practices for SQL analysis, and database design.