-- Multi-Table Query Practice

-- Display the ProductName and CategoryName for all products in the database. Shows 77 records.

select P.productname, C.categoryname
from product as P
join  
category as C
on P.Categoryid = C.Id;

-- Display the order Id and shipper CompanyName for all orders placed before August 9 2012. Shows 429 records.

select O.Id, S.Companyname, O.OrderDate 
from [Order] as O
join 
Shipper as S
On 
O.ShipVia = S.Id
where O.OrderDate < '2012-09-12'
order by O.OrderDate asc

-- Display the name and quantity of the products ordered in order with Id 10251. Sort by ProductName. Shows 3 records.

select P.ProductName, O.Quantity 
from OrderDetail as O
Join 
Product as P
On 
P.Id = O.ProductId 
where O.orderId = 10251
order by P.ProductName;

-- Display the OrderID, Customer's Company Name and the employee's LastName for every order. All columns should be labeled clearly. Displays 16,789 records.

select O.Id as "Order ID", C.CompanyName as "Company Name", E.LastName as "Last Name" 
from 
[Order] as O
Join 
Customer as C
On 
O.CustomerId = C.Id
Join 
Employee as E 
On 
O.EmployeeId = E.Id;