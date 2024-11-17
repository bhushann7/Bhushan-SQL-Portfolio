
/* Subquery 

SELECT 
	si.student_id, 
    si.date_registered, 
    MIN(se.date_watched) AS first_date_watched,
    MIN(sp.date_purchased) AS first_date_purchased,
	DATEDIFF(MIN(se.date_watched),MIN(si.date_registered)) AS days_diff_reg_watch,
    DATEDIFF(MIN(sp.date_purchased),MIN(se.date_watched)) AS days_diff_watch_purch
FROM student_info si
JOIN student_engagement se
	ON si.student_id = se.student_id
LEFT JOIN student_purchases sp
	ON si.student_id = sp.student_id
GROUP BY si.student_id
HAVING first_date_watched <= first_date_purchased
	OR first_date_purchased IS NULL
;
*/



