
CREATE TABLE Customers (
CustomerID int PRIMARY KEY,
Name varchar(20) NOT NULL,
Suburb varchar(20),
Birthday Date)

CREATE TABLE Food (
FoodID int PRIMARY KEY,
Item VARCHAR(20),
Category VARCHAR(20),
ItemPrice REAL)

CREATE TABLE Purchases (
PurchaseID int IDENTITY(1,1) PRIMARY KEY,
CustomerID int NOT NULL, 
FoodID int NOT NULL,
Quantity int,
PurchaseDate Date NOT NULL,
FOREIGN KEY (CustomerID) REFERENCES Customers (CustomerID),
FOREIGN KEY (FoodID) REFERENCES Food (FoodID))


insert into Customers values (11,'Chewbacca','Hillcrest','1930-11-28')
insert into Customers values (12,'Darth Sidious','Silverdale','1952-12-12')
insert into Customers values (13,'Darth Vader','Peachgrove','1946-10-17')
insert into Customers values (14,'Han Solo ','Hillcrest','1967-08-08')
insert into Customers values (15,'Jabba the Hutt','Hillcrest','1805-01-01')
insert into Customers values (16,'Luke Skywalker','Peachgrove','1965-08-26')
insert into Customers values (17,'Obi-Wan Kenobi','Chartwell','1942-06-02')
insert into Customers values (18,'Padme Amidala','Riverlea','1972-11-22')
insert into Customers values (19,'Princess Leia','Chartwell','1965-08-26')
insert into Customers values (20,'Qui-Gon Jinn','Riverlea','1943-02-06')
insert into Customers values (21,'Senator Palpatine','Silverdale','1957-07-07')
insert into Customers values (22,'Yoda','Hillcrest','1005-03-02')

insert into Food values (41,'apple','fruit',1)
insert into Food values (42,'orange','fruit',1)
insert into Food values (43,'banana','fruit',1)
insert into Food values (44,'feijoa','fruit',1)
insert into Food values (45,'mango','fruit',3)
insert into Food values (46,'mince pie','savory',4)
insert into Food values (47,'steak pie','savory',4)
insert into Food values (48,'fish pie','savory',5)
insert into Food values (49,'sausage roll','savory',2)
insert into Food values (50,'corn beef','sandwhich',4)
insert into Food values (51,'ham','sandwhich',3)
insert into Food values (52,'egg and cheeze','sandwhich',4)
insert into Food values (53,'chicken','sandwhich',3)
insert into Food values (54,'chocolate fish','sweet',1)
insert into Food values (55,'peanut slab','sweet',2)
insert into Food values (56,'crunchie','sweet',1)
insert into Food values (57,'flake','sweet',1)
insert into Food values (58,'jaffa','sweet',2)

insert into Purchases values (11,41,4,'2015-4-6')
insert into Purchases values (12,41,1,'2015-4-7')
insert into Purchases values (14,50,2,'2015-4-7')
insert into Purchases values (14,51,1,'2015-4-7')
insert into Purchases values (13,56,2,'2015-4-7')
insert into Purchases values (14,41,3,'2015-4-8')
insert into Purchases values (14,49,1,'2015-4-8')
insert into Purchases values (12,52,1,'2015-4-8')
insert into Purchases values (15,54,6,'2015-4-8')
insert into Purchases values (13,57,1,'2015-4-8')
insert into Purchases values (21,41,2,'2015-4-9')
insert into Purchases values (12,49,1,'2015-4-9')
insert into Purchases values (18,52,2,'2015-4-9')
insert into Purchases values (15,54,7,'2015-4-9')
insert into Purchases values (13,57,1,'2015-4-9')
insert into Purchases values (21,41,2,'2015-4-10')
insert into Purchases values (19,48,1,'2015-4-10')
insert into Purchases values (19,52,2,'2015-4-10')
insert into Purchases values (16,53,1,'2015-4-10')
insert into Purchases values (15,54,4,'2015-4-10')
insert into Purchases values (11,42,2,'2015-4-13')
insert into Purchases values (20,47,1,'2015-4-13')
insert into Purchases values (15,54,5,'2015-4-13')
insert into Purchases values (13,55,2,'2015-4-13')
insert into Purchases values (19,42,2,'2015-4-14')
insert into Purchases values (12,47,1,'2015-4-14')
insert into Purchases values (15,54,8,'2015-4-14')
insert into Purchases values (19,55,3,'2015-4-14')
insert into Purchases values (13,57,4,'2015-4-14')
insert into Purchases values (11,43,3,'2015-4-15')
insert into Purchases values (20,46,1,'2015-4-15')
insert into Purchases values (11,44,10,'2015-4-16')
insert into Purchases values (16,46,2,'2015-4-16')
insert into Purchases values (11,45,2,'2015-4-17')
insert into Purchases values (16,45,2,'2015-4-17')
insert into Purchases values (12,51,2,'2015-4-20')

select * from Customers
select * from Food
Select * from Purchases

--Name:Bruce Tan
--ID:1260430

--Q1
select Name from Customers where CustomerID in (
	select CustomerID from Customers where LEFT(Name,1) = 'p')

--Q2
Select Item from Food where FoodID in (
	select FoodID from Food where Category = 'fruit')

--Q3
Select ItemPrice as cost from Food where ItemPrice = (
	select Max(ItemPrice) from Food)

--Q4
Select sum(Quantity) as total from Purchases

--Q5
Select Name, Birthday from Customers where Birthday = (
	select max(Birthday) from Customers)
or Birthday = (
	select Min(Birthday) from Customers)

--Q6
Select Item as item from Food where FoodID not in(
	select FoodID from Purchases)

--Q7
Select Name from Customers where CustomerID in (
	select distinct CustomerID from Purchases where (PurchaseDate >= '2015-04-16') and (PurchaseDate <= '2015-04-20'))

--Q8

select c.Suburb, sum(a.sold) as 'Total Sold'
from (
	select CustomerID,sum(quantity) as sold
	from Purchases
	group by CustomerID) as a
	,Customers as c
where c.CustomerID= a.CustomerID
group by c.Suburb
order by 'Total Sold' desc


--Q9
select f.item as item, a.sold as Sold
from (
	select FoodID,sum(quantity) as sold
	from Purchases
	where FoodID in (select FoodID from Food where Category = 'sweet')
	group by FoodID) as a
	,Food as f
where f.FoodID= a.FoodID
order by Sold desc

--Q10
select c.Name
from (
	select distinct CustomerID 
	from Purchases 
	where FoodID in	(select FoodID from Food where Item like '%pie%'))as a
	,Customers as c
where c.CustomerID = a.CustomerID

--Q11 (Bonus)
select datediff(day,a.minPur,b.maxPur) as Days
from
	(select Min(PurchaseDate) as minPur
	from Purchases 
	where CustomerID = (select CustomerID from Customers where Name = 'Qui-Gon Jinn')) as a
	,
	(select Max(PurchaseDate) as maxPur
	from Purchases 
	where CustomerID = (select CustomerID from Customers where Name = 'Qui-Gon Jinn')) as b

