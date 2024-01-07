**Walmart Sales Data Analysis**

**About**

This project intends to investigate Walmart sales data in order to determine top performing branches and items, sales trends of various products, and consumer behaviour. The goal is to research how to improve and optimise sales methods. The information was acquired from the Kaggle Walmart Sales Forecasting Competition.

**Purpose of the project**

The primary goal of this project is to acquire insight into Walmart's sales data in order to understand the various elements that influence sales in various branches.

**About data**

The dataset was obtained from the Kaggle Walmart Sales Forecasting Competition. This dataset contains sales transactions from three different branches of Walmart, respectively located in Mandalay, Yangon, and Naypyitaw. The data contains 17 columns and 1000 rows:

![image](https://github.com/Kanhiya31/Walmart_Sales_Data_Analysis_SQL_Queries/assets/155901883/4ac84d73-c087-4e30-98b6-c777125ba0a0)




**Analysis List**

**1.	Product Analysis**

Conduct analysis on the data to understand the different product lines, the product lines performing best, and the product lines that need to be improved.

**2.	Sales Analysis**

This analysis aims to answer the question of the sales trends of products. The result of this can help measure the effectiveness of each sales strategy the business applies and what modifications are needed to gain more sales.

**3.	Customer Analysis**

This analysis aims to uncover the different customer segments, purchase trends, and the profitability of each customer segment.

**Approach Used**

**1.	Data Wrangling:** The first stage is to analyze the data to ensure that NULL and missing values are recognized, and data replacement methods are used to replace missing or NULL values.
•	Create a database 
•	Create a table and Insert data.
•	Choose columns with null values. 
There are no null values in our database because specified NOT NULL for each field when we created the tables, therefore null values are filtered out.

**2.	Feature Engineering:** This will help use generate some new columns from existing ones.
   
•	**Add a new column named time_of_day** to give insight of sales in the Morning, Afternoon and Evening. This will help answer the question on which part of the day most sales are made.

•	**Add a new column named day_name** that contains the extracted days of the week on which the given transaction took place (Mon, Tue, Wed, Thur, Fri). This will help answer the question on which week of the day 
   each branch is busiest.

•	**Add a new column named month_name** that contains the extracted months of the year on which the given transaction took place (Jan, Feb, Mar). Help determine which month of the year has the most sales and 
   profit.

   
**Business Questions To Answer**

**Generic Question**

1.	How many unique cities does the data have?
2.	In which city is each branch?
   
**Product**

1.	How many unique product lines does the data have?
2.	What is the most common payment method?
3.	What is the most selling product line?
4.	What is the total revenue by month?
5.	What month had the largest COGS?
6.	What product line had the largest revenue?
7.	What is the city with the largest revenue?
8.	What product line had the largest VAT?
9.	Which branch sold more products than the average product sold?
10.	What is the most common product line by gender?
11.	What is the average rating of each product line?
    
**Sales**

1.	Number of sales made in each time of the day per weekday
2.	Which of the customer types brings the most revenue?
3.	Which city has the largest tax percent/ VAT (Value Added Tax)?
4.	Which customer type pays the most in VAT?
   
**Customer**

1.	How many unique customer types does the data have?
2.	How many unique payment methods does the data have?
3.	What is the most common customer type?
4.	Which customer type buys the most?
5.	What is the gender of most of the customers?
6.	What is the gender distribution per branch?
7.	Which time of the day do customers give most ratings?
8.	Which time of the day do customers give most ratings per branch?
9.	Which day fo the week has the best avg ratings?
10.	Which day of the week has the best average ratings per branch?

