-- window dfuncitons:
-- claculate the total sales amount for each order along with the individual product
-- sales. 

SELECT
	od.Order_ID,
	pd.Product_ID,
	pd.Price,
	pd.Product_name,
	od.Quantity,
	od.Total_Price,
	SUM(pd.Price * od.Quantity) OVER(PARTITION BY od.Order_ID) as total_sales_amt
FROM
	yanki.orders as od
JOIN
	yanki.products as pd ON od.Product_ID = pd.Product_ID

LIMIT 100;

-- CLACULATE THE RUNNING TOTAL PROCE FOR EACH ORDER
SELECT
	order_id,
	product_id,
	total_price,
	sum(total_price) OVER (ORDER BY order_id) as  running_total_price
FROM 
	yanki.orders;

-- rank products by their price within each category.
select
	product_id,
	product_name,
	brand,
	category,
	price,
	rank() over(partition by category order by price desc) as price_rank_by_category
from 
	yanki.products

-- rank customers by total amount spent
select 
	c.customer_id,
	c.customer_name,
	sum(total_price) as total_amt_spent,
	rank() over(order by sum(total_price) desc) as customer_rank
from 
	yanki.customers as c
join
	yanki.orders as od on c.customer_id = od.customer_id
group by 
	c.customer_id,
	c.customer_name;


-- rank products by their toatal sales amount;

select
	pd.product_id,
	pd.product_name,
	sum(od.quantity) as total_qty_sold,
	sum(od.total_price) as total_sales_amount,
	rank() over (order by sum(od.total_price) desc) as product_rank
from
	yanki.products as pd
join 
	yanki.orders as od on pd.product_id = od.product_id
group by
	pd.product_id,
	pd.product_name
;

-- rank orders by their total price

select
	*,
	rank() over (order by od.total_price desc) as most_bought
from 
	yanki.orders as od;

--categorize the orders based on the total price.

select
	order_id,
	total_price,
	case
		when total_price > 1000 then 'high'
		when total_price >= 500 and total_price < 1000 then 'medium'
		else 'low'
	end as price_category
from
	yanki.orders


-- classify customers by the number of orders they made

select
	c.customer_id,
	c.customer_name,
	Count(od.order_id) as num_orders,
	case
		when count(od.order_id) >= 10 then 'frequent'
		when count(od.order_id) >= 5 and count(od.order_id) < 10 then 'regular'
		else 'occasional'
	end as order_frequency
from
	yanki.customers as c
join
	yanki.orders as od on c.customer_id = od.customer_id
group by
	c.customer_id,
	c.customer_name;


-- classify products based on their prices.

select 
	product_id,
	product_name,
	price,
	case
		when price >= 500 then 'expensive'
		when price >= 100 then 'moderate'
		else 'affordable'
	end as price_category
from
	yanki.products;


-- inner join
-- retrieve customer etails alon with the products they ordered.
select
	c.customer_id,
	c.customer_name,
	c.email,
	c.phone_number,
	od.order_id,
	p.product_id,
	p.product_name,
	p.Brand,
	p.price,
	od.quantity,
	od.total_price
from
	yanki.customers as c
inner join
	yanki.orders as od on c.customer_id = od.customer_id
inner join
	yanki.products as p on od.product_id = p.product_id;

-- retrieve order details along with payment information.

select
	od.order_id,
	pm.payment_method,
	pm.transaction_status
from
	yanki.orders as od
inner join
	yanki.payment_method pm on od.order_id = pm.order_id;



-- inner join is when the tables match exactly
-- left join returns all data from left handside and matches that of the secod table
-- right join returns all data from right handside and matches that of the secod table



-- left join;
-- retrieve all customers along with their orers, even if they havent placed any orders.

select 
	c.customer_id,
	c.customer_name,
	c.email,
	c.phone_number,
	od.order_id,
	od.product_id,
	od.quantity,
	od.total_price
from
	yanki.customers as c
left join
	yanki.orders as od on c.customer_id = od.customer_id;

-- retrieve all orders along with product details, even if there are no rcorrespond products.

select
	od.order_id,
	od.customer_id,
	p.product_id,
	p.product_name,
	p.price,
	od.quantity,
	od.total_price
from
	yanki.orders as od
left join
	yanki.products as p on od.product_id = p.product_id;

-- right join
-- retireve all orer along with payment information, even if there a re no correaponding payment records.

select
	od.order_id,
	pm.payment_method,
	pm.transaction_status
from 
	yanki.orders as od
right join
	yanki.payment_method pm on od.order_id = pm.order_id;

-- retireve all products along with the orders, even if there are no correspiding orders.
select
	p.product_id,
	p.product_name,
	od.order_ID,
	od.quantity,
	od.total_price
from
	yanki.products as p
right join
	yanki.orders as od on p.product_id = od.product_id;

-- outer join
-- retrieve all customers along with their orders, including customer who have not placed any orders,
-- and  order

select
	c.customer_id,
	c.customer_name,
	c.email,
	c.phone_number,
	od.order_id,
	od.product_id,
	od.quantity,
	od.total_price
from
	yanki.customers c
full outer join
	yanki.orders as od on c.customer_id = od.customer_id;

-- retireve all orders alon g with payment information, including orders without corresponding
-- payment record and 

select
	od.order_id,
	pm.payment_method,
	pm.transaction_status
from
	yanki.orders as od
full outer join
	yanki.payment_method as pm on od.order_id = pm.order_id;


select * from yanki.payment_method limit 10;