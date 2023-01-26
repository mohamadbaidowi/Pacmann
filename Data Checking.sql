#===cek product_category_name di olist_products_dataset jika nilainya NULL===
SELECT * FROM olist_products_dataset WHERE product_category_name is NULL

#===cek customer_city beda meskipun customer_zip_code_prefix sama===
select a.customer_city,  a.customer_zip_code_prefix, b.customer_city, b.customer_zip_code_prefix
FROM (
SELECT DISTINCT customer_city, customer_zip_code_prefix FROM olist_order_customer_dataset
) a INNER JOIN (
SELECT DISTINCT customer_city, customer_zip_code_prefix FROM olist_order_customer_dataset
) b on a.customer_zip_code_prefix = b.customer_zip_code_prefix and a.customer_city <> b.customer_city
ORDER by a.customer_city

#===manual check===
SELECT DISTINCT customer_city, soundex(customer_city), customer_zip_code_prefix FROM olist_order_customer_dataset ORDER BY customer_city


#===cek seller_city beda meskipun seller_zip_code_prefix sama===
select a.seller_city, a.seller_zip_code_prefix, b.seller_city, b.seller_zip_code_prefix
FROM (
SELECT DISTINCT seller_city, seller_zip_code_prefix FROM olist_sellers_dataset
) a INNER JOIN (
SELECT DISTINCT seller_city, seller_zip_code_prefix FROM olist_sellers_dataset
) b on a.seller_zip_code_prefix = b.seller_zip_code_prefix and a.seller_city <> b.seller_city

#===manual check===
SELECT DISTINCT seller_city, soundex(seller_city), seller_zip_code_prefix FROM olist_sellers_dataset ORDER BY seller_city

#===check order without item===
SELECT * FROM olist_order_dataset
WHERE order_id not in (SELECT DISTINCT order_id FROM olist_order_items_dataset)

#===check payments refer to order without item===
SELECT  * FROM olist_order_payments_dataset WHERE order_id in (
SELECT order_id FROM olist_order_dataset
WHERE order_id not in (SELECT DISTINCT order_id FROM olist_order_items_dataset) )

#===check reviews refer to order without item===
SELECT *  FROM olist_order_reviews_dataset WHERE order_id in (
SELECT order_id FROM olist_order_dataset
WHERE order_id not in (SELECT DISTINCT order_id FROM olist_order_items_dataset) )

#===check product_category_name from olist_products_dataset that not in product_category_name_translation===
SELECT DISTINCT product_category_name FROM olist_products_dataset WHERE product_category_name not in (
SELECT product_category_name FROM product_category_name_translation)

#===check order without payment or total payment equal zero ===
SELECT * FROM olist_order_dataset
WHERE order_id in (SELECT order_id FROM olist_order_payments_dataset GROUP by order_id HAVING sum(payment_value)=0)
UNION
SELECT * FROM olist_order_dataset
WHERE order_id not in (SELECT DISTINCT order_id FROM olist_order_payments_dataset)
