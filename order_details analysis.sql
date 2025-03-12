# Exploring the order_details table. 

-- View the order_details table.
SELECT *
FROM order_details;

-- Date range of the order_details table
SELECT MIN(order_date),
MAX(order_date)
FROM order_details;

-- Number of orders made within the date range.
SELECT COUNT(DISTINCT order_id)
FROM order_details
;

-- Number of items ordered within this date range. 
SELECT COUNT(*)
FROM order_details;

-- Orders that have ordered the most items. 
SELECT order_id, COUNT(item_id)
FROM order_details
GROUP BY order_id
ORDER BY COUNT(item_id) DESC
;

-- 6. Number of orders that ordered more than 12 items. 
SELECT COUNT(*)
FROM(
	SELECT order_id, COUNT(item_id)
	FROM order_details
	GROUP BY order_id
	HAVING COUNT(item_id) > 12
    ) AS row_num
;


