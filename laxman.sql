create database pr_1;

use pr_1;

create table Customers(
CustomerID int primary key,
Name varchar(25) not null,
Email text,
Address text
);

select * from Customers;

insert into Customers values(1,"Alice","alice123@gmail.com","Ahmedabad"),(2,"Laxman","laxman234@gmail.com","Delhi"),(3,"virendra","virendra45@gmail.com","Bihar"),(4,"Tushar","tushar19@gmail.com","Banglore"),(5,"Dhruv","dhruv33@gmail.com","Mumbai");

select * from Customers;

update Customers set Address="Rajasthan" where CustomerID=1;


select * from Customers;

delete from Customers where CustomerID=3;

select * from Customers;

select * from Customers where Name="Alice";


create table Orders(
OrderID int primary key,
CustomerID int unique not null,
OrderDate Date,
TotalAmount int
);

select * from Orders;

insert into Orders values(101,1,"2026-08-21",590),(102,2,"2026-07-13",955),(103,3,"2026-08-26",1160),(104,4,"2026-08-02",5900),(105,5,"2026-09-01",239);

select * from Orders;

select * from Orders where CustomerID=3;


update Orders set TotalAmount=4850 where OrderID=104;

select * from Orders;

delete from Orders where OrderID=102;

select * from Orders;

select * from Orders where OrderDate between (select concat(year(current_date()),"-",month(current_date())-1,"-",day(current_date())))  and current_date();

select max(TotalAmount),min(TotalAmount),avg(TotalAmount) from Orders;


create table Products(
ProductID int primary key,
ProductName varchar(30) not null,
Price float not null,
Stock int not null
);

insert into Products values(151,"Watch",799.00,3),(172,"Mobile",12000.00,0),(199,"Bag",670.00,5),(123,"TV",23000.00,2),(147,"Laptop",89999.00,7);

select * from Products;

select * from Products
order by Price desc;

update Products set Price=19999.00 where ProductName="TV";

select * from Products;

delete from Products where Stock=0;

select * from Products;

select * from Products
where Price between 500 and 2000;

select * from Products
where price=(select max(price) from Products) or price=(select min(price) from Products) ;

create table OrderDetails(
OrderDetailID int primary key,
OrderID int not null,
ProductID int not null,
Quantity int not null,
SubTotal int not null
);

select * from OrderDetails;

insert into OrderDetails values(1,101,201,2,1000),(2,101,202,1,500),(3,102,201,3,1500),(4,103,203,2,800),(5,104,202,4,2000);

select * from OrderDetails;

select * from OrderDetails 
where OrderDetailID=3;

select sum(SubTotal) as Total_revenue from OrderDetails;

select * from OrderDetails;

select ProductID,sum(Quantity) from OrderDetails
group by ProductID
order by  sum(Quantity) desc; 

select count(ProductID) from OrderDetails
where ProductID=202;

select * from OrderDetails;