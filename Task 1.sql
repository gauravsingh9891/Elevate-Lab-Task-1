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
	Command to Create "User" Table(Entity). This Table contains following columns(attribute)
		- UserID (PK)
		- Name
		- Email
		- Password
		- Phone
		- Address
*/

Create Table User
(
 UserId int Primary Key Identity(1,1),
 Name varchar(50) Not Null,
 Email varchar(50),
 Password varchar(20),
 Phone char(10) Not Null,
 Address varchar(100) Not Null
)


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
 Price Money Not Null,
 Category Varchar(30),
 ImageURL varchar(Max) Not Null
)

/*
	Command to Create "Order" Table(Entity). This Table contains following columns(attribute)
		- OrderID (PK)
		- UserID (FK)
		- OrderData
		- Status
		- TotalAmout
*/

Create Table Order
(
  OrderId int Primary Key identity(20200,1),
  UserId int references User(UserID),
  OrderDate Date Default Getdate(),
  Status varchar(15) Not Null,
  TotalAmount Money Default 0
)

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
  OrderID int references Order(OrderID),
  ProductID int references  Product(ProductID),
  Quantity smallint default 0,
  UnitPrice Money default 0
)

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
 OrderId int references Order(OrderId),
 PaymentDate Date Default GetDate() ,
 Amount money default 0,
 PaymentMethod varchar(30) Not Null,
 PaymentStatus varchar(20) Not Null
)

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
  UserId int references User(UserId),
  ProductId int references Product(ProductId),
  Rating tinyint,
  Comment Text,
  ReviewDate Date Default Getdate()
)