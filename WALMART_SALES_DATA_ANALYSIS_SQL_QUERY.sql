CREATE DATABASE SALESDATAWALMART;
USE SALESDATAWALMART;
CREATE TABLE IF NOT EXISTS sales (
invoice_id VARCHAR(30) NOT NULL PRIMARY KEY,
branch VARCHAR(5) NOT NULL,
city VARCHAR(30) NOT NULL,
customer_type VARCHAR(30) NOT NULL, gender VARCHAR(10) NOT NULL,
product_line VARCHAR(100) NOT NULL,
unit_price DECIMAL(10, 2) NOT NULL,
quantity INT NOT NULL,
VAT FLOAT(6, 4) NOT NULL,
total DECIMAL(12, 4) NOT NULL,
date DATETIME NOT NULL,
time TIME NOT NULL,
payment_method VARCHAR(15) NOT NULL,
cogs DECIMAL(10, 2) NOT NULL,
gross_margin_pct FLOAT(11, 9),
gross_income DECIMAL(12, 4) NOT NULL,
rating FLOAT(2, 1)
);

--------------------------------------------------------------------------------------------------------------------------------
-------------------------------------- FEATURE ENGINEERING ----------------------------------------------------------------------
select 
time
(case
when time between "00:00:00" and "12:00:00" then "morning"
when time between "12:00:01" and "16:00:00" then "afternoon"
else "evening"
end
) as time_of_date
from sales;

alter table sales add column time_of_day varchar(20);
update sales 
set time_of_day =(
case
when time between "00:00:00" and "12:00:00" then "morning"
when time between "12:00:01" and "16:00:00" then "afternoon"
else "evening"
end
);
SET SQL_SAFE_UPDATES = 0; 

-- day_name --
select date,
dayname(date)
from sales;

alter table sales add column day_name varchar(10);
update sales
set day_name = dayname(date);

-- month_name-- 
select date,
monthname(date)
from sales;

alter table sales add column month_name varchar(10);
update sales
set month_name = monthname(date);

-- ------------------------------------------------------------------------------------------------------------------------------------------------------------


-- -------------------------------------------------------------------------------------------------------------------------------------------------------------
-- ------------------------------------------------------------ GENERIC -----------------------------------------------------------------------------------------
-- HOW MANY CITIES DOES THE DATA HAVE?
select distinct city from sales;

-- IN WHICH CITY IS EACH BRANCH?
Select distinct city, branch from sales;

-- -------------------------------------------------------------------------------------------------------------------------------------------------------------
-- ------------------------------------------------------------ PRODUCT-----------------------------------------------------------------------------------
-- HOW MANY UNIQUE PRODUCT LINE DOES THAT DATA HAVE?
select count(distinct product_line)from sales;

-- WHAT IS THE MOST COMMON PAYMENT METHOD?
select payment_method, count(payment_method) from sales group by payment_method order by count(payment_method) desc;

-- WHAT IS THE MOST SELLING PRODUCT LINE?
select product_line, count(product_line) from sales group by product_line order by count(product_line) desc;

-- WHAT IS THE TOTAL REVENUE BY MONTH?
select month_name, sum(total) from sales group by month_name order by sum(total) desc;

-- WHAT MONTH HAD THE LARGEST COGS?
select month_name as month, sum(cogs) from sales group by month_name order by sum(cogs) desc;

-- WHICH PRODUCT LINE HAD THE LARGEST Revenue?
select product_line, sum(total) from sales group by product_line order by sum(total) desc;

-- WHAT IS THE CITY WITH THE LARGEST REVENUE?
select city, sum(total) as largest_revenue from sales group by city order by largest_revenue desc limit 1;

-- WHAT PRODUCT LINE HAD THE LARGEST VAT?
select product_line, avg(vat) from sales group by product_line order by avg(vat) desc limit 1;

-- WHICH BRANCH SOLD MORE PRODUCTS THAN AVERAGE PRODUCT SOLD?
select branch, sum(quantity) from sales group by branch having sum(quantity)> (select avg(quantity) from sales);

-- WHAT IS THE MOST COMMON PRODUCT LINE BY GENDER?
select gender, product_line, count(gender) from sales group by gender, product_line order by count(gender) desc;

-- WHAT IS THE AVERAGE RATING OF EACH PRODUCT LINE?
select product_line, round(avg(rating),2) from sales group by product_line order by avg(rating) desc;

-- -------------------------------------------------------------------------------------------------------------------------------------------------------------
-- ------------------------------------------------------------ SALES -----------------------------------------------------------------------------------------

-- NUMBER OF SALES MADE IN EACH TIME OF THE DAY PER WEEKDAY--
select time_of_day, count(time_of_day) from sales where day_name= "monday" group by time_of_day order by count(time_of_day) asc;

-- WHICH OF THE CUSTOMER TYPE BRINGS THE MOST REVENUE?
select customer_type, sum(total) as tot_revenue from sales group by customer_type order by tot_revenue desc;

-- WHICH CITY HAS THE LARGEST TAX PERCENT OR VAT?
select city, avg(vat) from sales group by city order by avg(vat) desc;

-- WHICH CUSTOMER TYPE PAYS THE MOST VAT?
select customer_type, avg(vat) from sales group by customer_type order by avg(vat) desc;


-- -------------------------------------------------------------------------------------------------------------------------------------------------------------
-- ------------------------------------------------------------ CUSTOMER -----------------------------------------------------------------------------------------

-- HOW MANY UNIQUE CUSTOMER TYPES DOES THE DATA HAVE?
select distinct customer_type from sales;

-- HOW MANY UNIQUE PAYMENT METHODS DOES THE DATA HAVE?
select distinct payment_method from sales;

-- WHAT IS THE MOST COMMON CUSTOMER TYPE?
select customer_type, count(*) from sales group by customer_type order by count(*) desc;

-- WHICH CUSTOMER TYPE BUYS THE MOST?
select customer_type, count(quantity) from sales group by customer_type order by count(quantity) desc;

-- WHAT IS THE GENDER OF MOST OF THE CUSTOMERS?
select gender, count(gender) from sales group by gender order by count(gender) desc;

-- WHAT IS THE GENDER DISTRIBUTION PER BRANCH?
select branch, gender, count(gender) from sales group by branch, gender order by count(gender) desc;

-- which time of the day do customers give the most ratings?
select time_of_day, avg(rating) from sales group by time_of_day order by avg(rating) desc;

-- which time of the day do customers give the most ratings per branch?
select time_of_day, branch, avg(rating) from sales  group by time_of_day, branch order by avg(rating) desc;

-- WHICH DAY OF THE WEEK HAS THE BEST AVG RATING?
select day_name, avg(rating) from sales group by day_name order by avg(rating) desc limit 1;

-- WHICH DAY OF THE WEEK HAS THE BEST AVG RATING PER BRANCH?
select day_name, avg(rating) from sales where branch= "c" group by day_name order by avg(rating) desc;



























































