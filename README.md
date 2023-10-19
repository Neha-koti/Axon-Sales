# Axon Sales
 Axon Retailer Sales Dashboard Project
Axon is a small company, which is a retailer selling classic cars, is facing issues in managing and analyzing their sales data. We need to manage and analyze their sales data and create sales reports for better decision-making. Given dataset named “Classicmodels” contains 8 Tables. This dataset contains information about Customers, Employees, Products, Order details. We need to use Business Intelligence (BI) tools like Microsoft PowerBI and SQL for this project. First, we need to load these files into MySQL and using few queries we can retrieve some meaningful insights. Later we load this sql file into PowerBI and do data cleaning and data transformation. And then create interactive Sales dashboards in PowerBI and retrieve meaningful insights and sales reports through which Axon company can make better decision-making.
Tools Used : MySQL, PowerBI

We have 8 Tables namely:
•	Customers: stores customer’s data (13 columns, customerNumber -> primary key)
•	Products: stores a list of scale model cars (9 columns, productCode -> Primary key)
•	ProductLines: stores a list of product line categories (4 columns, productLine -> Primary key)
•	Orders: stores sales orders placed by customers (7 columns, orderNumber, productCode-> Primary keys)
•	OrderDetails: stores sales order line items for each sales order (5 columns, orderNumber-> Primary key)
•	Payments: stores payments made by customers based on their accounts (4 columns, customerNumber, checkNumber -> Primary keys)
•	Employees: stores all employee information as well as the organization structure such as who reports to whom (8 columns, employeeNumber -> primary key)
•	Offices: stores sales office data (9 columns, officeCode -> Primary key)

Files Description:

### 1. Sales.sql:
It is a sql file. Import this file it into MySQL workbench and run it. It creates a New schema namely "classicmodels" which contains 8 tables mentioned above. This file is providd by Odin school, Hyderabad, India.

### 2. Axon Sales Dashboard.pdf 
It is a pdf file which contains complete documentation about the project.

 ### 3.AxonSales.sql:
It is a sql file which contains few sql queries and we can cross check these results with powerbi results.

 ### 4.CapestoneProject-Sales-Dashboard.pbix:
It is a powerBI file which contains dynamic dashboards of the above dataset.