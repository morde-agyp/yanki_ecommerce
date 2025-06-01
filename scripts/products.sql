DROP TABLE IF EXISTS yanki.products CASCADE;

CREATE TABLE yanki.products(
    Product_ID UUID PRIMARY KEY,
    Product_Name TEXT ,
    Brand TEXT ,
    Category TEXT,
    Price FLOAT
    );