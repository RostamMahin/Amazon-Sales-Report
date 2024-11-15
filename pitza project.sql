-- --(1) Retrieve the total number of orders placed.
select count(order_id) from order_details;

-- (2)Calculate the total revenue generated from pizza sales.
SELECT 
    SUM(order_details.quantity * pizzas.price) AS total_revenue
FROM
    pizzas
        JOIN
    order_details ON pizzas.pizza_id = order_details.pizza_id;

-- (3) identify the highest-priced pizza

select pizza_types.name , pizzas.price
from pizzas
join pizza_types on pizza_types.pizza_type_id = pizzas.pizza_type_id
order by pizzas.price desc
limit 1;

select pizza_types.name ,pizzas.price
from pizzas join pizza_types 
on pizzas.pizza_type_id = pizza_types.pizza_type_id
where pizzas.price = (select max(price) from pizzas);  -- The Greek Pizza	35.95

-- (4)Identify the most common pizza size ordered.
SELECT  
    p.size, SUM(od.quantity) AS total_ordered
FROM
    order_details AS od
        JOIN
    pizzas AS p ON od.pizza_id = p.pizza_id
GROUP BY p.size
ORDER BY total_ordered DESC;

-- (5)List the top 5 most ordered pizza types along with their quantities.

select p.name , od.quantity as most_common_pizzas
from pizza_types as p join order_details as od 
on p.pizza_id = od.pizza_id
group by p.name 
order by most_common_pizzas desc ;

select pt.name, SUM(od.quantity) AS total_quantity
FROM order_details od
JOIN pizzas p ON od.pizza_id = p.pizza_id
JOIN pizza_types pt ON p.pizza_type_id = pt.pizza_type_id
GROUP BY pt.name
ORDER BY total_quantity DESC
LIMIT 5;

-- (6) total quantity of each pizza type orderd 
select pt.name , sum(od.quantity) as Q_of_each_pizza
from pizzas as p 
join order_details as od on p.pizza_id = od.pizza_id
join pizza_types as pt on pt.pizza_type_id = p.pizza_type_id
group by pt.name ;

-- (7)Average Quantity Ordered per Pizza Type
select pt.name , avg(od.quantity) as avg_quantity
from pizzas as p
 join order_details as od on p.pizza_id = od.pizza_id
 join pizza_types as pt on p.pizza_type_id = pt.pizza_type_id
group by pt.name;

-- (8)Total Revenue Generated by Each Pizza Type
select pt.name,sum( od.quantity * p.price) as TRBEPT
from pizzas as p
join order_details as od on p.pizza_id = od.pizza_id
join pizza_types as pt on p.pizza_type_id = pt.pizza_type_id 
group by pt.name;

-- (9)Pizza Types with More Than 5 Total Orders
select p.pizza_type_id , od.order_id as result
from pizzas as p join order_details as od 
on p.pizza_id = od.pizza_id
order by result limit 5; -- wrong 

SELECT pt.name, COUNT(od.order_id) AS total_orders
FROM pizzas AS p
JOIN order_details AS od ON p.pizza_id = od.pizza_id
JOIN pizza_types AS pt ON p.pizza_type_id = pt.pizza_type_id
GROUP BY pt.name
HAVING COUNT(od.order_id) > 1000
order by total_orders asc ;


-- (10) Maximum Quantity Ordered for Each Pizza Type
select pt.name , max(od.quantity) as max_quantity 
from pizzas as p 
join order_details as od on p.pizza_id = od.pizza_id
join pizza_types as pt on p.pizza_type_id = pt.pizza_type_id
group by name  -- here its over 
order by max_quantity desc ;

-- (11) top 5 pizzas which has highest revenue 
select pt.name ,sum(p.price * od.quantity) as result
from pizzas as p
join order_details as od on p.pizza_id = od.pizza_id
join pizza_types as pt on pt.pizza_type_id =p.pizza_type_id
group by pt.name 
order by result desc limit 5;

-- INTERMEDIATE 
-- Join the necessary tables to find the total quantity of each pizza category ordered.
select pt.name , sum(od.quantity) as result 
from pizzas as p 
join order_details as od on p.pizza_id = od.pizza_id
join pizza_types as pt on p.pizza_type_id = pt.pizza_type_id
group by pt.name ;

select 