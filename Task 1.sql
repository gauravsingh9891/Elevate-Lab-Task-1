/* 
	I designed & Created a database for E-Commerce Site. In this there are 7 Modules & each module
	same as Entity(Table) and each Entity has property(attributes). Those Entity are:
	1. User
	2. Product
	3. Order
	4. OrderItem
	5. Payment
	6. Category
	7. Review
*/

--Command For Database Creation.
Create Database ECommDB

--Command to Use Database
Use ECommDB

/*
	Command to Create "Users" Table(Entity). This Table contains following columns(attribute)
		- UserID (PK)
		- Name
		- Email
		- Password
		- Phone
		- Address
*/

Create Table Users
(
 UserId int Primary Key Identity(1,1),
 Name varchar(50) Not Null,
 Email varchar(50),
 Password varchar(20) Not Null CHECK(LEN(Password)>=6),
 Phone Varchar(12) Unique Not Null,
 Address varchar(100) Not Null
)

--Allow  multiple nulls into unique Email column but, if data is enter in it,  it will be unique
Create Unique Index Ind_Emailid ON Users(Email) Where Email Is Not Null

--Command for View the Table
Select * from Users

/*
	Command to Create "Product" Table(Entity). This Table contains following columns(attribute)
		- ProductID (PK)
		- Name
		- Description
		- Price
		- Category
		- StockQuantity
		- ImageURL
*/

Create Table Product
(
 ProductId int Primary Key Identity(1010,1),
 Name Varchar(60) Not Null,
 Description Text,
 Price Money Check(Price>=0),
 Category Varchar(30) Unique Not Null,
 ImageURL varchar(Max) Not Null
)

--Command for View the Table
Select * from Product

/*
	Command to Create "Orders" Table(Entity). This Table contains following columns(attribute)
		- OrderID (PK)
		- UserID (FK)
		- OrderData
		- DeliveryDate
		- Status
		- TotalAmout
*/

Create Table Orders
(
  OrderId int Primary Key identity(20200,1),
  UserId int references Users(UserID) ON DELETE SET NULL,
  OrderDate Date Default Getdate(),
  DeliveryDate Date Not Null,
  Status varchar(30) Not Null,
  TotalAmount Money Check(TotalAmount>=0),
  Check(DeliveryDate>=OrderDate)
)

--Command for View the Table
Select * from Orders

/*
	Command to Create "OrderItem" Table(Entity). This Table contains following columns(attribute)
		- OrderItemID (PK)
		- OrderID (FK)
		- ProductID (FK)
		- Quantity
		- UnitPrice
*/

Create Table OrderItem
(
  OrderItemId int Primary Key Identity(30300,1),
  OrderID int references Orders(OrderID) ON DELETE SET NULL,
  ProductID int references  Product(ProductID) ON DELETE SET NULL,
  Quantity smallint Check(Quantity>=0),
  UnitPrice Money Check(UnitPrice>=0)
)

--Command for View the Table
Select * from OrderItem
/*
	Command to Create "Payment" Table(Entity). This Table contains following columns(attribute)
		- PaymentID (PK)
		- OrderID (FK)
		- PaymentDate
		- Amount
		- PaymentMethod
		- PaymentStatus
*/

Create Table Payment
(
 PaymentID int Primary Key identity(2100,1),
 OrderId int references Orders(OrderId) ON DELETE SET NULL,
 PaymentDate Date,
 Amount money Check(Amount>=0),
 PaymentMethod varchar(30),
 PaymentStatus varchar(20)
)

--Command for View the Table
select * from Payment



/*
	Command to Create "Category" Table(Entity). This Table contains following columns(attribute)
		- CategoryID (PK)
		- CategoryName 
*/

Create Table Category
(
  CategoryId int Primary Key Identity(1,1),
  CategoryName Varchar(40) Not Null
)

--Command for View the Table
select * from Category

/*
	Command to Create "Review" Table(Entity). This Table contains following columns(attribute)
		- ReviewID (PK)
		- UserID (FK)
		- ProductID (FK)
		- Rating
		- Comment
		- ReviewDate 
*/

Create Table Review
(
  ReviewID int Primary Key identity(1,1),
  UserId int references Users(UserId) ON DELETE SET NULL,
  ProductId int references Product(ProductId) ON DELETE SET NULL,
  Rating tinyint,
  Comment Text,
  ReviewDate Date default GetDate()
)

--Command for View the Table
select * from Review
