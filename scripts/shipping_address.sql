DROP TABLE IF EXISTS yanki.shipping_address CASCADE;

   CREATE TABLE yanki.shipping_address(
    Shipping_id INTEGER PRIMARY KEY,
    Customer_ID UUID,
    Shipping_Address TEXT,
    City TEXT,
    State TEXT,   
    Country TEXT,
    Postal_Code INTEGER,
    FOREIGN KEY (Customer_ID) REFERENCES yanki.customers(Customer_ID) 
    );