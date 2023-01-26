CREATE VIEW v_order_monthly 
AS 
select strftime('%Y',order_purchase_timestamp) as year, strftime('%m',order_purchase_timestamp) as month,count(a.order_id) as numberoforder, sum(price) as ordervalue, sum(freight_value) as freightvalue  
from olist_order_dataset a INNER JOIN olist_order_items_dataset b ON a.order_id = b.order_id
WHERE strftime('%Y%m',a.order_purchase_timestamp) BETWEEN '201701' AND '201808'
GROUP by 1,2
ORDER by 1,2

CREATE VIEW v_top_ten_product_category_by_number_of_order 
AS
select d.product_category_name_english, count(a.order_id) as numberoforder
from olist_order_dataset a INNER JOIN olist_order_items_dataset b ON a.order_id = b.order_id 
INNER JOIN olist_products_dataset c on b.product_id = c.product_id
INNER JOIN product_category_name_translation d on c.product_category_name = d.product_category_name
WHERE strftime('%Y%m',a.order_purchase_timestamp) BETWEEN '201701' AND '201808'
GROUP by 1
ORDER by 2 DESC
LIMIT 10

CREATE VIEW v_top_ten_product_category_by_value_of_order 
AS
select d.product_category_name_english, sum(b.price) as valueoforder
from olist_order_dataset a INNER JOIN olist_order_items_dataset b ON a.order_id = b.order_id 
INNER JOIN olist_products_dataset c on b.product_id = c.product_id
INNER JOIN product_category_name_translation d on c.product_category_name = d.product_category_name
WHERE strftime('%Y%m',a.order_purchase_timestamp) BETWEEN '201701' AND '201808'
GROUP by 1
ORDER by 2 DESC
LIMIT 10

CREATE VIEW v_customer_order_number_by_state 
AS 
SELECT b.customer_state, count(a.order_id) as numberoforder FROM olist_order_dataset a
INNER JOIN olist_order_customer_dataset b ON a.customer_id = b.customer_id
WHERE strftime('%Y%m',a.order_purchase_timestamp) BETWEEN '201701' AND '201808'
GROUP BY 1
ORDER by 2 DESC

CREATE VIEW v_customer_order_value_by_state 
AS 
SELECT b.customer_state, sum(c.price) as valueoforder FROM olist_order_dataset a
INNER JOIN olist_order_customer_dataset b ON a.customer_id = b.customer_id
INNER JOIN olist_order_items_dataset c ON a.order_id = c.order_id
WHERE strftime('%Y%m',a.order_purchase_timestamp) BETWEEN '201701' AND '201808'
GROUP BY 1
ORDER by 2 DESC

CREATE VIEW v_payment_type_yearly
AS
SELECT b.payment_type, 
SUM(CASE WHEN strftime('%Y',a.order_purchase_timestamp)='2017' THEN 1 ELSE 0 END) AS Order2017, 
SUM(CASE WHEN strftime('%Y',a.order_purchase_timestamp)='2018' THEN 1 ELSE 0 END) AS Order2018 
FROM olist_order_dataset a INNER JOIN olist_order_payments_dataset b ON a.order_id = b.order_id
WHERE b.payment_value > 0 AND strftime('%Y%m',a.order_purchase_timestamp) BETWEEN '201701' AND '201808'
GROUP by 1

CREATE VIEW v_new_customer_addition
AS
SELECT strftime('%Y',firstorder) as year, strftime('%m',firstorder) as month,count(customer_unique_id) as newcustomer FROM (
select a.customer_unique_id, min(b.order_purchase_timestamp) as firstorder FROM olist_order_customer_dataset  a
INNER JOIN olist_order_dataset b ON a.customer_id = b.customer_id
WHERE strftime('%Y%m',b.order_purchase_timestamp) BETWEEN '201701' AND '201808'
GROUP by 1 ) Y
GROUP by 1,2

CREATE VIEW v_customer_review_statistic
AS
SELECT CASE review_score
		 WHEN 1 THEN 'Very dissatisfied'
		 WHEN 2 THEN 'Dissatisfied'
		 WHEN 3 THEN 'Neither satisfied nor dissatisfied'
		 WHEN 4 THEN 'Satisfied'
		 WHEN 5 THEN 'Very satisfied'
	END as satisfaction, 
count(review_score) FROM olist_order_reviews_dataset a 
INNER JOIN olist_order_dataset b ON b.order_id = a.order_id
WHERE strftime('%Y%m',b.order_purchase_timestamp) BETWEEN '201701' AND '201808'
GROUP by 1
ORDER by review_score

CREATE VIEW v_ontime_delivery_statistic
AS
SELECT SUM(CASE WHEN order_delivered_customer_date <= order_estimated_delivery_date THEN 1 ELSE 0 END) as ontimedelivery, 
SUM(CASE WHEN order_delivered_customer_date > order_estimated_delivery_date THEN 1 ELSE 0 END) as latedelivery 
FROM olist_order_dataset b
WHERE strftime('%Y%m',b.order_purchase_timestamp) BETWEEN '201701' AND '201808'
AND order_status = 'delivered'

CREATE VIEW v_repeat_order_statistic
AS
SELECT sum(CASE WHEN numberoforder > 1 THEN 1 ELSE 0 END) as repeatorder,
SUM(CASE WHEN numberoforder = 1 THEN 1 ELSE 0 END) as norepeatorder FROM (
SELECT a.customer_unique_id, count(order_id) as numberoforder FROM olist_order_dataset b
INNER JOIN olist_order_customer_dataset  a ON a.customer_id = b.customer_id
WHERE strftime('%Y%m',b.order_purchase_timestamp) BETWEEN '201701' AND '201808'
GROUP BY 1 )
