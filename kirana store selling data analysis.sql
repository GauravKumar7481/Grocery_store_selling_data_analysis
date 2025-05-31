create database sunil_kirana_store;

use sunil_kirana_store;
create table product_selling(
	Date date,
    Product_ID int primary key,
    Product_Name varchar(100),
    Units_Sold int,
    Unit_Price float,
    Cost_Price float
);

insert into product_selling
(Date, Product_ID, Product_Name, Units_Sold, Unit_Price, Cost_Price)
values
('2025-06-01', 101, "Onion", 9, 825, 800),
('2025-06-01', 105, "Potato", 4, 519.5, 499),
('2025-06-01', 106, "Wheat Floor", 5, 289, 285),
('2025-06-01', 102, "Rice", 1, 825, 820),
('2025-06-01', 103, "Moong Dal", 0, 985.8, 840),
('2025-06-01', 104, "Arhar Dal", 1, 750, 725),
('2025-06-01', 107, "Soap", 1, 25, 25),
('2025-06-01', 108, "ParleG Biscuit", 10, 10, 10),
('2025-06-01', 109, "Cream Biscuit", 4, 10, 10),
('2025-06-01', 110, "Fortune Oil", 7, 58.8, 55.5),
('2025-06-01', 111, "Nihar Hair Oil", 4, 20, 20),
('2025-06-01', 112, "Fortune Refine", 7, 98, 95),
('2025-06-01', 113, "Kurkure", 8, 10, 10),
('2025-06-01', 114, "Kurkure", 10, 5, 5),
('2025-06-01', 115, "Chips", 10, 10, 10),
('2025-06-01', 116, "Chips", 5, 20, 20),
('2025-06-01', 117, "Kabli Chana", 1, 455.5, 450),
('2025-06-01', 118, "Coca Cola", 17, 44, 41),
('2025-06-01', 119, "Soyabean", 2, 358, 355),
('2025-06-01', 120, "Bikaji Papad", 7, 51, 51),
('2025-06-01', 154, "Oyes", 14, 10, 10);


select * from product_selling;


create table customer(
	Customer_Name varchar(100),
    Customer_ID int,
    Product_ID int,
    Product_Purchased varchar(100),
    Units_Purchased int,
    Payment varchar(80),
    foreign key(Product_Id) references product_selling(Product_ID)
    on delete cascade
    on update cascade
);


INSERT INTO customer
(Customer_Name, Customer_ID, Product_ID, Product_Purchased, Units_Purchased, Payment)
VALUES
("Arun", 1, 101, "Onion", 1, "Online"),
("Ashok", 2, 105, "Potato", 2, "Cash"),
("Rajesh", 3, 107,"Soap", 1, "EMI"),
("Santosh", 5, 105, "Potato", 1, "Cash"),
("Santosh", 5, 101, "Onion", 1, "Online"),
("Sanjay", 4, 117, "Kabli Chana", 1, "Cash"),
("Purbey", 6, 115, "Chips", 4, "Cash"),
("Anil", 9, 109, "Cream Biscuit", 2, "Online"),
("Bhola", 8, 109, "Cream Biscuit", 8, "Cash");


select * from customer;




-- 1. How many products were sold on 2025-06-01?
select sum(Units_Sold)
from product_selling;

-- 2. What are the distinct product names sold and their counts?
select Product_ID, product_Name, units_sold
from product_selling;

-- 3. Which product had zero units sold?
select Product_Name, Units_Sold 
from product_selling
where Units_Sold = 0;

-- What is the total revenue generated on 2025-06-01?
SELECT SUM(Units_Sold * Unit_Price) AS Total_Revenue
FROM product_selling
WHERE Date = '2025-06-01';

-- Which product generated the highest revenue?
select Product_Name, Product_ID, Units_Sold, Unit_Price, (Units_Sold*Unit_Price) as highest_revenue
from product_selling
where Date = '2025-06-01'
order by highest_revenue desc
limit 1;

-- What is the total profit made on 2025-06-01?
select sum((Unit_Price - Cost_Price)*Units_Sold) as total_profit
from product_selling;

-- Which product was the most profitable?
select Product_Name, Product_ID, Units_Sold, Unit_Price, Cost_Price, (Unit_Price - Cost_Price)*Units_Sold as profit
from product_selling
where Date = '2025-06-01'
order by profit desc
limit 1;

-- Which product had the highest profit margin?
select Product_Name, Product_ID, Units_Sold, Unit_Price, Cost_Price, ((Unit_Price - Cost_Price)/Cost_Price) as highest_profit_margin
from product_selling
where Date = '2025-06-01'
order by highest_profit_margin desc
limit 1;

-- How many different products were sold?
select count(distinct Product_Name), count(distinct Product_ID)
from product_selling;

-- Which products have duplicate entries (e.g., same name but different IDs or prices)?
select Product_Name, count(Product_Name) as entry
from product_selling
group by Product_Name
having entry > 1;

-- Which product had the highest number of units sold?
select Product_Name, Product_ID, Units_Sold
from product_selling
order by Units_Sold desc
limit 1;

-- Which products are priced the same as their cost price (i.e., no profit)?
select Product_Name, Product_ID, Unit_Price, Cost_Price, (Unit_Price - Cost_Price) 
from product_selling
where Unit_Price = Cost_Price;

-- How many products had a selling price higher than their cost price?
select count(Product_ID)
from product_selling
where Unit_Price > Cost_Price;

-- How many products had a selling price less than or equal to the cost price?
select count(Product_ID)
from product_selling
where Unit_Price <= Cost_Price;

-- What is the average selling price of products?
select avg(Unit_Price)
from product_selling;

-- Which products sold more than 5 units?
select Product_Name, Product_ID
from product_selling
where Units_Sold > 5
order by Product_ID asc;

-- List all products whose unit price is greater than ₹100.
select Product_Name, Product_ID, Unit_Price
from product_selling
where Unit_Price > 100
order by Unit_Price asc;

-- After Discount of 5% 
select Product_Name, Product_ID, Unit_Price, (Unit_Price - 0.05*Unit_Price) as New_Unit_Price
from product_selling;

-- Inner Join------------- --
select *
from customer
inner join product_selling
on customer.Product_ID = product_selling.Product_ID;

-- Right Join------------- --
select * 
from customer
inner join product_selling
on Customer.Product_ID = product_selling.Product_ID;

-- Left Join------------- --
select * 
from customer
left join product_selling
on Customer.Product_ID = product_selling.Product_ID;

-- full Join------------- --
select * 
from customer
left join product_selling
on Customer.Product_ID = product_selling.Product_ID
union
select * 
from customer
right join product_selling
on Customer.Product_ID = product_selling.Product_ID;
