SELECT CASE
    WHEN (A+B) > C AND (B+C) > A AND (C+A) > B THEN  CASE
        WHEN a = b AND b = c THEN 'Equilateral'
        WHEN a <> b AND b <> c AND c <> a THEN 'Scalene'
        ELSE 'Isosceles' END
    ELSE 'Not A Triangle'
    END AS type_of_triangle
FROM triangles


/*

Write a query identifying the type of each record in the TRIANGLES table using its three side lengths. Output one of the following statements for each record in the table:

Equilateral: It's a triangle with 3 sides of equal length.
Isosceles: It's a triangle with 2 sides of equal length.
Scalene: It's a triangle with all sides of differing lengths.
Not A Triangle: The given values of A, B, and C don't form a triangle.

*/