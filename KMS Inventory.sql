create database [Kultra Mega Stores Inventory]
----Table-----

select * from [KMS Sql Case Study]

-----1--which product category had the highest Sales 


select top 1 Product_Category, SUM (Sales) as [Total Sales] from [KMS Sql Case Study]
Group by Product_Category 
Order by [Total Sales] desc
 

 -----2---what are the Top 3 and Bottom 3 Region in terms of Sales----

select top 3 Region, sum(Sales) as [Total Sales] from [KMS Sql Case Study]
Group by Region
Order by [Total Sales] desc 

select top 3 Region, sum(Sales) as [Total Sales] from [KMS Sql Case Study]
Group by Region
Order by [Total Sales] asc 
   
-----3--- what were the Total Sales of Appliance in Ontario

select Region, sum(Sales) as [Total Sales of Appliance] from [KMS Sql Case Study]
where Province = 'Ontario'
And Product_Sub_Category = 'Appliances'
group by Region


-----4---- Advice the managment of KMS on what to do to increase the revenue from the bottom 10 customers

select top 10 Customer_Name,  sum(Sales) as [Total Sales] from [KMS Sql Case Study]
Group by Customer_Name
Order by [Total Sales] asc 
   
   

-----5--KMS incurred the Most Shipping Cost using which Shipping method

select Ship_Mode, sum(Shipping_Cost) as Total_Shipping_Cost from [KMS Sql Case Study]
Group by Ship_Mode
Order by Total_Shipping_Cost  desc 
 

---6--- who are the most Valuable Customers and what Products or Services do they typically purchase----

select [Customer_Name], Sum(Sales) as Total_Sales, Product_Category from [KMS Sql Case Study]  
Group by Product_Category, Customer_Name
Order by Total_Sales desc



----7-----Which small business customer had the highest sales-----

select Customer_Name, Sales  from [KMS Sql Case Study]
where Customer_Segment = 'Small Business'  
Order by Sales desc 


-----8---Which Corporate customer placed the most number of orders in 2009-2012

select Customer_Name, Order_Quantity from [KMS Sql Case Study]
Where Customer_Segment = 'Corporate'
and Order_Date between  '2009-01-01' and '2012-12-31'
 Order by Order_Quantity desc


------9--Which customer was the most profitable one 

select Customer_Name, Profit from [KMS Sql Case Study]
Order by Profit desc


-------UNION----------

Select * from dbo.[KMS Sql Case Study]
Join Order_Status
on dbo.[KMS Sql Case Study].Order_ID = Order_Status.Order_ID 




------10---Which customer returned items and what segiment do they belong to
Select * from 
Join Order_Status
ON dbo.[KMS Sql Case Study].Order_ID = Order_ID
WHERE Status = 'Returned';


------11--- if the delivery truck is the most economical but the slowest and shipping method and the Express Air is the fastest but the most expensive one, do you think the company appropriately spent shipping costs base on the order of priority
Filter for returned orders
returned_orders = order_status_df[order_status_df["Status"] == "Returned"]

Merge with main dataset to get customer info
returned_customers = pd.merge(
    returned_orders,
    kms_sql_case_df,
    on="Order ID",
    how="inner"
)[["Order ID", "Customer Name", "Customer Segment"]].drop_duplicates()

returned_customers.head(10)  # Show the first 10 returned customers and their segments




