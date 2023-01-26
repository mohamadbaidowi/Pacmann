CREATE INDEX "ix_olist_order_dataset_order_id" ON "olist_order_dataset" ("order_id")

CREATE INDEX "ix_olist_order_items_dataset_order_id" ON "olist_order_items_dataset" ("order_id")

CREATE INDEX "ix_olist_order_payments_dataset_order_id" ON "olist_order_payments_dataset" ("order_id")

CREATE INDEX "ix_olist_order_reviews_dataset_order_id" ON "olist_order_reviews_dataset" ("order_id")

CREATE INDEX "ix_olist_products_dataset_product_id" ON "olist_products_dataset" ("product_id")

CREATE INDEX "ix_olist_order_items_dataset_product_id" ON "olist_order_items_dataset" ("product_id")

CREATE INDEX "ix_product_category_name_translation_product_category_name" ON "product_category_name_translation" ("product_category_name")

CREATE INDEX "ix_olist_products_dataset_product_category_name" ON "olist_products_dataset" ("product_category_name")

CREATE INDEX "ix_olist_order_customer_dataset_customer_id"ON "olist_order_customer_dataset" ("customer_id")

CREATE INDEX "ix_olist_sellers_dataset_seller_id"ON "olist_sellers_dataset" ("seller_id")

CREATE INDEX "ix_olist_order_dataset_customer_id" ON "olist_order_dataset" ("customer_id")

CREATE INDEX "ix_olist_order_items_dataset_seller_id" ON "olist_order_items_dataset" ("seller_id")

