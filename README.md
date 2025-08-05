# I have developed a Database Schema & ER Diagram of E-commerce System

	Tool Used
 	==========
   	Tool :- Microsoft SQL Server
   	ER-Diagram : SmartDraw Website to draw ER-Diagram

-> Basically this E-Commerce System containes following Entity(Module) with given set of attributes.


    1) Users
	      - UserID (PK)
	      - Name
	      - Email
	      - Password
	      - Phone
	      - Address
       
    2) Product
	      - ProductID (PK)
	      - Name
	      - Description
	      - Price
	      - Category
	      - StockQuantity
	      - ImageURL

    3) Orders
	      - OrderID (PK)
	      - UserID (FK)
	      - OrderDate
	      - DeliveryDate
	      - Status
	      - TotalAmount

    4) OrderItem
	      - OrderItemID (PK)
	      - OrderID (FK)
	      - ProductID (FK)
	      - Quantity
	      - UnitPrice

    5) Payment
	      - PaymentID (PK)
	      - OrderID (FK)
	      - PaymentDate
	      - Amount
	      - PaymentMethod
	      - PaymentStatus

    6) Category
	      - CategoryID (PK)
	      - CategoryName

    7) Review
	      - ReviewID (PK)
	      - UserID (FK)
	      - ProductID (FK)
	      - Rating
	      - Comment
	      - ReviewDate

-> I have attached screenshot of every entity schema and along with demo data in.

-> There is also and We-defined ER Diagram Screenshot also attached.
