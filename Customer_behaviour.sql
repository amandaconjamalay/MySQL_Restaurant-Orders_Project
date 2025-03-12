# Analysing customer table. 

-- Joining the menu_items table and order_details table. 
SELECT *
FROM order_details od
JOIN menu_items mi
	ON od.item_id = mi.menu_item_id;
    
-- Most ordered item  was the "Hamburger" in the "American" category, this shows that we should keep that hamburgers on the menu as they are a popular item. 
SELECT category, item_name, COUNT(item_id) AS no_of_orders
FROM order_details od
JOIN menu_items mi
	ON od.item_id = mi.menu_item_id
GROUP BY item_name, category
ORDER BY COUNT(item_id) DESC; 

-- Least ordered item  was the "Chicken Tacos" in the "Mexican" category, possibly take this item off the menu. 
SELECT mi.category, item_name, COUNT(item_id) AS no_of_orders
FROM order_details od
JOIN menu_items mi
	ON od.item_id = mi.menu_item_id
GROUP BY item_name, category
ORDER BY COUNT(item_id) ASC;

-- Top 5 orders that spent the most money. 
SELECT order_id, COUNT(item_id), SUM(price)
FROM order_details od
JOIN menu_items mi
	ON od.item_id = mi.menu_item_id
GROUP BY order_id
ORDER BY SUM(price) DESC
LIMIT 5;

-- Highest spend order, italian was the most ordered category but it isn't the most popular overall. 
SELECT *
FROM order_details od
JOIN menu_items mi
	ON od.item_id = mi.menu_item_id
WHERE order_id = 440;

-- Details on the top 5 highest spend orders. 
	-- Out of the top 5, italian was order 26 times and is shown to me the most expensive cuisine, Asian: 17, mexican 16, american: 10.
	-- All 5 orders ordered at least 14/13 items.
	-- All orders were made between 1-3 lunch time
	-- Eggplant parmesan was the most popular dish. (italian)
	-- Chips and guacamole was the least popular. (mexican)
SELECT *
FROM order_details od
JOIN menu_items mi
	ON od.item_id = mi.menu_item_id
WHERE order_id IN (440, 2075, 1957, 330, 2675)
;

