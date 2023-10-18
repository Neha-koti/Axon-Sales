use classicmodels;
select * from customers;
select * from employees;
select * from offices;
select * from orderdetails;
select * from orders;
select * from payments;
select * from productlines;
select * from products;

-- Total no.of Unique customers
SELECT COUNT(DISTINCT customerNumber) AS Unique_Customers FROM customers;

-- Total no.of products
SELECT COUNT(DISTINCT productCode) AS total_products FROM products;

-- Total no.of orders
SELECT COUNT(DISTINCT orderNumber) AS total_orders FROM orders;

-- Total  cost price
SELECT SUM(quantityOrdered * priceEach) AS CP FROM orderdetails;

-- Total Quantity ordered
SELECT SUM(quantityOrdered) AS Total_Quantity FROM orderdetails;

-- Total Selling Price
SELECT SUM(quantityOrdered * buyPrice) AS SP
FROM orderdetails o
JOIN products p ON o.productCode=p.productCode;

-- Total profit
SELECT 
    selling_price,
    cost_price,
    (selling_price - cost_price) AS Profit
FROM (
    SELECT 
        SUM(quantityordered * priceEach) AS selling_price,
        SUM(quantityordered * buyprice) AS cost_price
    FROM orderdetails 
    INNER JOIN products ON products.productcode=orderdetails.productCode
)Profit;

-- Total sales by product line
SELECT productLine, 
SUM(quantityordered * priceEach) AS Total_Sales
FROM orderdetails od
JOIN products p ON od.productCode = p.productCode
GROUP BY productLine
ORDER BY Total_Sales DESC;

-- Profit by Product Line
SELECT productLine, 
SUM(quantityordered * priceEach)-SUM(quantityordered * buyprice) as Profit
FROM orderdetails od
JOIN products p ON od.productCode = p.productCode
GROUP BY productLine
ORDER BY Profit DESC;

-- Top 5 Order count by Year and Month
SELECT LEFT(orderDate, 7) AS Year_Mon,
COUNT(DISTINCT ordl.orderNumber) AS Distinct_Orders 
FROM orders ord 
JOIN orderdetails ordl ON ord.orderNumber=ordl.orderNumber
GROUP BY Year_Mon
ORDER BY Distinct_Orders DESC
LIMIT 7;

-- Top 5 Total Sales by Year and Month
SELECT LEFT(orderDate, 7) AS Year_Mon,
SUM(quantityordered * priceEach) AS Total_Sales 
FROM orders ord 
JOIN orderdetails ordl ON ord.orderNumber=ordl.orderNumber
GROUP BY Year_Mon
ORDER BY Total_Sales DESC
LIMIT 5;


-- Top 5 Customers by Total Sales
SELECT customerName, 
SUM(quantityordered * priceEach) AS Total_Sales
FROM orders ord 
JOIN orderdetails ordl ON ord.orderNumber=ordl.orderNumber
JOIN customers c ON ord.customerNumber=c.customerNumber
GROUP BY customerName
ORDER BY Total_Sales DESC
LIMIT 5;

-- Bottom 5 Customers by Total Sales
SELECT customerName, 
SUM(quantityordered * priceEach) AS Total_Sales
FROM orders ord 
JOIN orderdetails ordl ON ord.orderNumber=ordl.orderNumber
JOIN customers c ON ord.customerNumber=c.customerNumber
GROUP BY customerName
ORDER BY Total_Sales
LIMIT 5;

-- Top 5 Customers by orders
SELECT customerName, 
count(DISTINCT orderNumber) AS Total_orders
FROM orders o 
JOIN customers c ON o.customerNumber=c.customerNumber
GROUP BY customerName
ORDER BY Total_orders DESC
LIMIT 5;

-- Bottom 5 Customers by orders
SELECT customerName, 
count(DISTINCT orderNumber) AS Total_orders
FROM orders o 
JOIN customers c ON o.customerNumber=c.customerNumber
GROUP BY customerName
ORDER BY Total_orders
LIMIT 5;

-- Top 5 Products by Total Sales
SELECT productName, 
SUM(quantityordered * priceEach) AS Total_Sales
FROM orders ord 
JOIN orderdetails ordl ON ord.orderNumber=ordl.orderNumber
JOIN customers c ON ord.customerNumber=c.customerNumber
JOIN products p ON ordl.productCode=p.productCode
GROUP BY productName
ORDER BY Total_Sales DESC
LIMIT 5;

-- Bottom 5 Products by Total Sales
SELECT productName, 
SUM(quantityordered * priceEach) AS Total_Sales
FROM orders ord 
JOIN orderdetails ordl ON ord.orderNumber=ordl.orderNumber
JOIN customers c ON ord.customerNumber=c.customerNumber
JOIN products p ON ordl.productCode=p.productCode
GROUP BY productName
ORDER BY Total_Sales
LIMIT 5;

-- Top 10 Employees with their order count
ALTER TABLE customers
CHANGE salesRepEmployeeNumber employeeNumber INT;

SELECT CONCAT(e.firstName, ' ', e.lastName) AS Employee_Name,
COUNT(ordl.orderNumber) AS Order_Count
FROM employees e 
JOIN customers c ON e.employeeNumber=c.employeeNumber
JOIN orders ord ON c.customerNumber=ord.customerNumber
JOIN orderdetails ordl ON ord.orderNumber=ordl.orderNumber
GROUP BY Employee_Name
ORDER BY Order_Count DESC
LIMIT 10;

-- Total Sales, Actual Sales, Quantity ordered by Country
SELECT country, 
COUNT(o.orderNumber) AS Quantity_Ordered,
SUM(quantityordered * priceEach) AS Total_Sales,
SUM(quantityordered * buyprice) AS Actual_Sales
FROM orderdetails o
JOIN products p ON o.productCode=p.productCode
JOIN orders ord ON o.orderNumber=ord.orderNumber
JOIN customers c ON ord.customerNumber=c.customerNumber
GROUP BY country
ORDER BY Quantity_Ordered DESC;
