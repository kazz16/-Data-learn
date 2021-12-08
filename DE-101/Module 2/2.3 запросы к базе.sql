/*Overview (обзор ключевых метрик) 
Total Sales, Total Profit, Profit Ratio, 
Profit per Order, Sales per Customer,Avg. Discount
Monthly Sales by Segment ( табличка и график)
Monthly Sales by Product Category (табличка и график)*/

select 
	round (sum (sales)) as "total_sale, $",
	round (sum (profit)) as "total_profit, $",
	round (sum(profit)/sum(sales)*100,2) as "profit_ratio, %",
	round (sum (profit) / count (distinct order_id)) as "total_profit_per_order, $",
	round (sum (sales) / count (distinct customer_id)) as "total_sales_per_customer, $",
	round (avg (discount)*100,2) as "average_discount, %"
from orders

-- Monthly Sales by Category
select 
    extract (month from (order_date)) as number_of_month,
	category,
	round (sum (sales)) as sales
from 
	orders 
group by  
	extract (month from (order_date)),
	category
	order by number_of_month

-- Monthly Sales by Segment

select 
	extract (month from (order_date)) as number_of_month,
	segment,
	round (sum (sales)) as sales
from 
	orders 
group by  
	extract (month from (order_date)),
	segment
	order by number_of_month

-- Sales by Product Category over time 

select
	category,
	round (sum (sales)) as "sales,$"
from 
	orders
group by
	category
	
-- Sales and Profit by Customer

select
	customer_name,
	round (sum (sales)) as "sale, $",
	round (sum (profit)) as "profit, $"
from
	orders
group by
	customer_name
order by
"sale, $" desc

-- Sales per region

select
	region,
	round (sum (sales)) as "sale, $"
from
	orders
group by
	region
order by
"sale, $" desc


	
	

	

