#===update product_category_name pada olist_products_dataset jika product_category_name = NULL===
UPDATE olist_products_dataset SET product_category_name = 'outros categoria' WHERE product_category_name is NULL

#===update seller_city in olist_sellers_dataset===
UPDATE olist_sellers_dataset SET seller_city = 'rio de janeiro'  WHERE seller_city = '04482255'
UPDATE olist_sellers_dataset set seller_city = 'angra dos reis' WHERE seller_city = 'angra dos reis rj' and seller_zip_code_prefix = 23943;
UPDATE olist_sellers_dataset set seller_city = 'auriflama' WHERE seller_city = 'auriflama/sp' and seller_zip_code_prefix = 15350;
UPDATE olist_sellers_dataset set seller_city = 'balneario camboriu' WHERE seller_city = 'balenario camboriu' and seller_zip_code_prefix = 88330;
UPDATE olist_sellers_dataset set seller_city = 'barbacena' WHERE seller_city = 'barbacena/ minas gerais' and seller_zip_code_prefix = 36200;
UPDATE olist_sellers_dataset set seller_city = 'belo horizonte' WHERE seller_city = 'belo horizont' and seller_zip_code_prefix = 31255;
UPDATE olist_sellers_dataset set seller_city = 'brasilia' WHERE seller_city = 'brasilia df' and seller_zip_code_prefix = 71906;
UPDATE olist_sellers_dataset set seller_city = 'carapicuiba' WHERE seller_city = 'carapicuiba / sao paulo' and seller_zip_code_prefix = 6311;
UPDATE olist_sellers_dataset set seller_city = 'cariacica' WHERE seller_city = 'cariacica / es' and seller_zip_code_prefix = 29142;
UPDATE olist_sellers_dataset set seller_city = 'cascavel' WHERE seller_city = 'cascavael' and seller_zip_code_prefix = 85802;
UPDATE olist_sellers_dataset set seller_city = 'mogi das cruzes' WHERE seller_city = 'mogi das cruses' and seller_zip_code_prefix = 8710;
UPDATE olist_sellers_dataset set seller_city = 'mogi das cruzes' WHERE seller_city = 'mogi das cruzes / sp' and seller_zip_code_prefix = 8717;
UPDATE olist_sellers_dataset set seller_city = 'novo hamburgo' WHERE seller_city = 'novo hamburgo, rio grande do sul, brasil' and seller_zip_code_prefix = 93310;
UPDATE olist_sellers_dataset set seller_city = 'ribeirao preto' WHERE seller_city = 'ribeirao preto / sao paulo' and seller_zip_code_prefix = 14079;
UPDATE olist_sellers_dataset set seller_city = 'ribeirao preto' WHERE seller_city = 'ribeirao pretp' and seller_zip_code_prefix = 14027;
UPDATE olist_sellers_dataset set seller_city = 'rio de janeiro' WHERE seller_city = 'rio de janeiro / rio de janeiro' and seller_zip_code_prefix = 20081;
UPDATE olist_sellers_dataset set seller_city = 'rio de janeiro' WHERE seller_city = 'rio de janeiro \rio de janeiro' and seller_zip_code_prefix = 22050;
UPDATE olist_sellers_dataset set seller_city = 'rio de janeiro' WHERE seller_city = 'rio de janeiro, rio de janeiro, brasil' and seller_zip_code_prefix = 22793;
UPDATE olist_sellers_dataset set seller_city = 'santa barbara d''oeste' WHERE seller_city = 'santa barbara d oeste' and seller_zip_code_prefix = 13456;
UPDATE olist_sellers_dataset set seller_city = 'santa barbara d''oeste' WHERE seller_city = 'santa barbara d´oeste' and seller_zip_code_prefix = 13450;
UPDATE olist_sellers_dataset set seller_city = 'santo andre' WHERE seller_city = 'santo andre/sao paulo' and seller_zip_code_prefix = 9230;
UPDATE olist_sellers_dataset set seller_city = 'sao bernardo do campo' WHERE seller_city = 'sao bernardo do capo' and seller_zip_code_prefix = 9721;
UPDATE olist_sellers_dataset set seller_city = 'sao jose do rio preto' WHERE seller_city = 'sao jose do rio pret' and seller_zip_code_prefix = 15051;
UPDATE olist_sellers_dataset set seller_city = 'sao jose dos pinhais' WHERE seller_city = 'sao jose dos pinhas' and seller_zip_code_prefix = 83040;
UPDATE olist_sellers_dataset set seller_city = 'sao miguel d''oeste' WHERE seller_city = 'sao miguel do oeste' and seller_zip_code_prefix = 89900;
UPDATE olist_sellers_dataset set seller_city = 'sao paulo' WHERE seller_city = 'são paulo' and seller_zip_code_prefix = 4557;
UPDATE olist_sellers_dataset set seller_city = 'sao paulo' WHERE seller_city = 'sao paulo - sp' and seller_zip_code_prefix = 5353;
UPDATE olist_sellers_dataset set seller_city = 'sao paulo' WHERE seller_city = 'sao paulo - sp' and seller_zip_code_prefix = 4130;
UPDATE olist_sellers_dataset set seller_city = 'sao paulo' WHERE seller_city = 'sao paulo - sp' and seller_zip_code_prefix = 4007;
UPDATE olist_sellers_dataset set seller_city = 'sao paulo' WHERE seller_city = 'sao paulo / sao paulo' and seller_zip_code_prefix = 3407;
UPDATE olist_sellers_dataset set seller_city = 'sao paulo' WHERE seller_city = 'sao paulo sp' and seller_zip_code_prefix = 1207;
UPDATE olist_sellers_dataset set seller_city = 'sao paulo' WHERE seller_city = 'sao paulop' and seller_zip_code_prefix = 3581;
UPDATE olist_sellers_dataset set seller_city = 'sao paulo' WHERE seller_city = 'sao pauo' and seller_zip_code_prefix = 2051;
UPDATE olist_sellers_dataset set seller_city = 'braganca paulista' WHERE seller_city = 'sp' and seller_zip_code_prefix = 12903;
UPDATE olist_sellers_dataset set seller_city = 'sao paulo' WHERE seller_city = 'sp' and seller_zip_code_prefix = 4776;
UPDATE olist_sellers_dataset set seller_city = 'aracatuba' WHERE seller_city = 'sp' and seller_zip_code_prefix = 16021;
UPDATE olist_sellers_dataset set seller_city = 'sao paulo' WHERE seller_city = 'sp' and seller_zip_code_prefix = 5141;
UPDATE olist_sellers_dataset set seller_city = 'sao paulo' WHERE seller_city = 'sp / sp' and seller_zip_code_prefix = 3363;
UPDATE olist_sellers_dataset set seller_city = 'taboao da serra' WHERE seller_city = 'tabao da serra' and seller_zip_code_prefix = 6764;
UPDATE olist_sellers_dataset set seller_city = 'guarulhos' WHERE seller_city = 'garulhos' and seller_zip_code_prefix = 7077;
UPDATE olist_sellers_dataset set seller_city = 'lages' WHERE seller_city = 'lages - sc' and seller_zip_code_prefix = 88501;
UPDATE olist_sellers_dataset set seller_city = 'maua' WHERE seller_city = 'maua/sao paulo' and seller_zip_code_prefix = 9380;
UPDATE olist_sellers_dataset set seller_city = 'porto ferreira' WHERE seller_city = 'portoferreira' and seller_zip_code_prefix = 13660;
UPDATE olist_sellers_dataset set seller_city = 'ribeirao preto' WHERE seller_city = 'riberao preto' and seller_zip_code_prefix = 14085;
UPDATE olist_sellers_dataset set seller_city = 'santo andre' WHERE seller_city = 'sando andre' and seller_zip_code_prefix = 9190;
UPDATE olist_sellers_dataset set seller_city = 'sao jose do rio pardo' WHERE seller_city = 'scao jose do rio pardo' and seller_zip_code_prefix = 13720;
UPDATE olist_sellers_dataset set seller_city = 'maringa' WHERE seller_city = 'vendas@creditparts.com.br' and seller_zip_code_prefix = 87025;

#===Update customer_city in olist_order_customer_dataset===
UPDATE olist_order_customer_dataset set customer_city = 'alagoinhas' WHERE customer_city = 'alagoinha' and customer_zip_code_prefix = 58390;
UPDATE olist_order_customer_dataset set customer_city = 'arraial d''ajuda' WHERE customer_city = 'arraial d ajuda' and customer_zip_code_prefix = 45816;
UPDATE olist_order_customer_dataset set customer_city = 'bataipora' WHERE customer_city = 'bataypora' and customer_zip_code_prefix = 79760;
UPDATE olist_order_customer_dataset set customer_city = 'brasopolis' WHERE customer_city = 'brazopolis' and customer_zip_code_prefix = 37530;
UPDATE olist_order_customer_dataset set customer_city = 'dias d''avila' WHERE customer_city = 'dias d avila' and customer_zip_code_prefix = 42850;
UPDATE olist_order_customer_dataset set customer_city = 'estrela d''oeste' WHERE customer_city = 'estrela d oeste' and customer_zip_code_prefix = 15650;
UPDATE olist_order_customer_dataset set customer_city = 'palmeira d''oeste' WHERE customer_city = 'palmeira d oeste' and customer_zip_code_prefix = 15720;
UPDATE olist_order_customer_dataset set customer_city = 'paraty' WHERE customer_city = 'parati' and customer_zip_code_prefix = 23970;
UPDATE olist_order_customer_dataset set customer_city = 'piumhi' WHERE customer_city = 'piumhii' and customer_zip_code_prefix = 37925;
UPDATE olist_order_customer_dataset set customer_city = 'santa barbara d''oeste' WHERE customer_city = 'santa barbara d oeste' and customer_zip_code_prefix = 13450;
UPDATE olist_order_customer_dataset set customer_city = 'santa barbara d''oeste' WHERE customer_city = 'santa barbara d oeste' and customer_zip_code_prefix = 13454;
UPDATE olist_order_customer_dataset set customer_city = 'santa barbara d''oeste' WHERE customer_city = 'santa barbara d oeste' and customer_zip_code_prefix = 13453;
UPDATE olist_order_customer_dataset set customer_city = 'sao jorge d''oeste' WHERE customer_city = 'sao jorge do oeste' and customer_zip_code_prefix = 85575;

#===Update product_category_name_translation to accomodate olist_products_dataset record that no have product category translation===
INSERT INTO product_category_name_translation values (71,'outros categoria','others');
INSERT INTO product_category_name_translation values (72,'portateis_cozinha_e_preparadores_de_alimentos','portable kitchen food preparers');
INSERT INTO product_category_name_translation values (73,'pc_gamer','PC gamer');

#===Delete order without items===
DELETE FROM olist_order_dataset
WHERE order_id not in (SELECT DISTINCT order_id FROM olist_order_items_dataset)

#===Delete payments without order===
DELETE FROM olist_order_payments_dataset WHERE order_id NOT in (
SELECT order_id FROM olist_order_dataset)

#===Delete review without order===
DELETE FROM olist_order_reviews_dataset WHERE order_id NOT in (
SELECT order_id FROM olist_order_dataset)

#===Delete customer without order===
DELETE FROM olist_order_customer_dataset WHERE customer_id NOT in (
SELECT customer_id FROM olist_order_dataset)

#===Delete order item without order===
DELETE FROM olist_order_items_dataset WHERE order_id NOT in (
SELECT order_id FROM olist_order_dataset)

#===Delete order without payment or total payment equal zero ===
DELETE FROM olist_order_dataset
WHERE order_id in (SELECT order_id FROM olist_order_payments_dataset GROUP by order_id HAVING sum(payment_value)=0)

DELETE FROM olist_order_dataset
WHERE order_id not in (SELECT DISTINCT order_id FROM olist_order_payments_dataset)