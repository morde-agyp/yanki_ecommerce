DROP TABLE IF EXISTS yanki.payment_method CASCADE;

CREATE TABLE yanki.payment_method(
    Order_ID UUID PRIMARY KEY,
    Payment_Method TEXT,
    Transaction_Status TEXT,
    FOREIGN KEY (Order_ID) REFERENCES yanki.orders(Order_ID) 
    );