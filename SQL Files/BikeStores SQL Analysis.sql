USE BikeStores;


SELECT 
	ord.order_id,
	CONCAT(cus.first_name,' ', cus.last_name) as customers, 
	cus.city, 
	cus.state, 
	ord.order_date,
	SUM(quantity) as 'total units',
	SUM(quantity * ite.list_price) as 'revenue',
	prod.product_name,
	cat.category_name,
	sto.store_name,
	CONCAT(sta.first_name,' ', sta.last_name) AS sales_rep,
	bra.brand_name
FROM sales.customers cus
JOIN sales.orders ord ON cus.customer_id = ord.customer_id
JOIN sales.order_items ite ON ord.order_id = ite.order_id
JOIN production.products prod ON ite.product_id = prod.product_id
JOIN production.categories cat ON cat.category_id = prod.category_id
JOIN sales.stores sto ON sto.store_id = ord.store_id
JOIN production.brands bra ON prod.brand_id = bra.brand_id
JOIN sales.staffs sta ON sta.staff_id = ord.staff_id 
GROUP BY 
	ord.order_id, 
	CONCAT(cus.first_name,' ', cus.last_name), 
	cus.city, 
	cus.state, 
	order_date,
	prod.product_name,
	cat.category_name,
	sto.store_name,
	CONCAT(sta.first_name,' ', sta.last_name),
	bra.brand_name;


SELECT * FROM [production].[brands]
SELECT * FROM [production].[categories]
SELECT * FROM [production].[products]
SELECT * FROM [production].[stocks]
SELECT * FROM [sales].[customers]
SELECT * FROM [sales].[order_items]
SELECT * FROM [sales].[orders]
SELECT * FROM [sales].[staffs]
SELECT * FROM [sales].[stores]