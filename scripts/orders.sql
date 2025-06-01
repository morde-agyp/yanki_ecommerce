DROP TABLE IF EXISTS yanki.orders CASCADE;

CREATE TABLE yanki.orders(
    Order_ID UUID PRIMARY KEY,
    Customer_ID UUID,
    Product_ID UUID,
    Quantity INTEGER ,
    Total_Price FLOAT ,
    Order_Date DATE,
    FOREIGN KEY (Customer_ID) REFERENCES yanki.customers(Customer_ID) ,
    FOREIGN KEY (Product_ID) REFERENCES yanki.products(Product_ID) 
);