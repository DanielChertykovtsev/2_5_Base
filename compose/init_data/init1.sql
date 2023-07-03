
CREATE TABLE IF NOT EXISTS public.products (
    product_id SERIAL PRIMARY KEY,
    product_name VARCHAR,
    price DECIMAL
); 

CREATE TABLE IF NOT EXISTS public.shops (
    shop_name VARCHAR PRIMARY KEY,
    shop_table VARCHAR
); 


CREATE TABLE IF NOT EXISTS public.plan (
    ID SERIAL PRIMARY KEY,
    shop_name VARCHAR,
    product_id INTEGER,
    plan_cnt INTEGER,
    plan_date DATE,
    FOREIGN KEY (shop_name) REFERENCES shops (shop_name) ON DELETE SET NULL,
    FOREIGN KEY (product_id) REFERENCES products (product_id) ON DELETE SET NULL
); 

CREATE TABLE IF NOT EXISTS public.shop_dns (
    ID SERIAL PRIMARY KEY,
    date DATE,
    product_id INTEGER NOT NULL,
    sales_cnt INTEGER,
    FOREIGN KEY (product_id) REFERENCES products (product_id) ON DELETE SET NULL
); 

CREATE TABLE IF NOT EXISTS public.shop_sitilink (
    ID SERIAL PRIMARY KEY,
    date DATE,
    product_id INTEGER NOT NULL,
    sales_cnt INTEGER,
    FOREIGN KEY (product_id) REFERENCES products (product_id) ON DELETE SET NULL
); 

CREATE TABLE IF NOT EXISTS public.shop_mvideo (
    ID SERIAL PRIMARY KEY,
    date DATE,
    product_id INTEGER NOT NULL,
    sales_cnt INTEGER,
    FOREIGN KEY (product_id) REFERENCES products (product_id) ON DELETE SET NULL
); 

COPY shops
FROM '/docker-entrypoint-initdb.d/data/init_shops.csv'
DELIMITER ';'
ENCODING 'UTF8'
CSV HEADER;

COPY products
FROM '/docker-entrypoint-initdb.d/data/init_products.csv'
DELIMITER ';'
ENCODING 'UTF8'
CSV HEADER;

COPY shop_dns(date, product_id, sales_cnt)
FROM '/docker-entrypoint-initdb.d/data/init_shop_dns.csv'
DELIMITER ';'
ENCODING 'UTF8'
CSV HEADER;

COPY shop_mvideo(date, product_id, sales_cnt)
FROM '/docker-entrypoint-initdb.d/data/init_shop_mvideo.csv'
DELIMITER ';'
ENCODING 'UTF8'
CSV HEADER;

COPY shop_sitilink(date, product_id, sales_cnt)
FROM '/docker-entrypoint-initdb.d/data/init_shop_sitilink.csv'
DELIMITER ';'
ENCODING 'UTF8'
CSV HEADER;

COPY plan (shop_name, product_id, plan_cnt, plan_date)
FROM '/docker-entrypoint-initdb.d/data/init_plan.csv'
DELIMITER ';'
ENCODING 'UTF8'
CSV HEADER;