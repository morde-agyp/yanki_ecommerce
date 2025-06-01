
DROP TABLE IF EXISTS yanki.customers CASCADE;

CREATE TABLE yanki.customers(
    Customer_ID UUID PRIMARY KEY,
    Customer_Name TEXT,
    Email TEXT,
    Phone_Number TEXT
);