
CREATE TABLE IF NOT EXISTS public.products (
    product_id SERIAL PRIMARY KEY,
    product_name VARCHAR,
    price DECIMAL
); 

CREATE TABLE IF NOT EXISTS public.shops (
    shop_name VARCHAR PRIMARY KEY,
    shop_table VARCHAR
); 

COPY shops
FROM '/docker-entrypoint-initdb.d/data/shops.csv'
DELIMITER ';'
ENCODING 'UTF8'
CSV HEADER;

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

COPY products
FROM '/docker-entrypoint-initdb.d/data/products.csv'
DELIMITER ';'
ENCODING 'UTF8'
CSV HEADER;

COPY shop_dns
FROM '/docker-entrypoint-initdb.d/data/shop_dns.csv'
DELIMITER ';'
ENCODING 'UTF8'
CSV HEADER;

COPY shop_mvideo
FROM '/docker-entrypoint-initdb.d/data/shop_mvideo.csv'
DELIMITER ';'
ENCODING 'UTF8'
CSV HEADER;

COPY shop_sitilink
FROM '/docker-entrypoint-initdb.d/data/shop_sitilink.csv'
DELIMITER ';'
ENCODING 'UTF8'
CSV HEADER;

COPY plan
FROM '/docker-entrypoint-initdb.d/data/plan.csv'
DELIMITER ';'
ENCODING 'UTF8'
CSV HEADER;