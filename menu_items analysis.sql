USE restaurant_db;

-- View the menu_items table.
SELECT *
FROM menu_items;

-- Find the number of items on the menu.
SELECT DISTINCT COUNT(menu_item_id)
FROM menu_items;

-- Cheapest item on the menu.
SELECT *
FROM menu_items 
ORDER BY price
LIMIT 1;

-- Most expensive item on the menu. 
SELECT *
FROM menu_items 
ORDER BY price DESC
LIMIT 1;

-- Number of italian dishes on the menu
SELECT COUNT(category)
FROM menu_items
WHERE category = 'Italian';

-- Cheapest italian dish on the menu. 
SELECT *
FROM menu_items
WHERE category = 'Italian'
ORDER BY price
LIMIT 1;

-- Most expensive item on the menu. 
SELECT *
FROM menu_items
WHERE category = 'Italian'
ORDER BY price DESC
LIMIT 1;

-- Number of dishes in each category. 
SELECT category, COUNT(*) AS no_dishes
FROM menu_items
GROUP BY category;

-- Average price of dishes for each category. 
SELECT category, ROUND(AVG(price),2) AS avg_price
FROM menu_items
GROUP BY category;


