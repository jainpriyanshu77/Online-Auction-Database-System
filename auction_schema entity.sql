List of all SQL Queries used in our database --

SQL Query for creating database ---
	
CREATE DATABASE "Online Art Gallery and Auction Platform";


SQL Queries for creating all tables --
	
Users

CREATE TABLE Users (
    UserID INT PRIMARY KEY AUTO_INCREMENT,
    UserName VARCHAR(50) NOT NULL,
    Email VARCHAR(50) UNIQUE NOT NULL,
    Password VARCHAR(255) NOT NULL,
    UserType ENUM('Buyer', 'Seller', 'Admin') NOT NULL,
    RegistrationDate DATE NOT NULL
);
Categories

CREATE TABLE Categories (
    CategoryID INT PRIMARY KEY AUTO_INCREMENT,
    CategoryName VARCHAR(50) NOT NULL
);
Items

CREATE TABLE Items (
    ItemID INT PRIMARY KEY AUTO_INCREMENT,
    SellerID INT NOT NULL,
    CategoryID INT NOT NULL,
    ItemName VARCHAR(100) NOT NULL,
    StartingPrice DECIMAL(10, 2) NOT NULL,
    StartDate DATE NOT NULL,
    EndDate DATE NOT NULL,
    Status ENUM('Active', 'Sold', 'Expired') NOT NULL,
    FOREIGN KEY (SellerID) REFERENCES Users(UserID),
    FOREIGN KEY (CategoryID) REFERENCES Categories(CategoryID)
);
Bids

CREATE TABLE Bids (
    BidID INT PRIMARY KEY AUTO_INCREMENT,
    ItemID INT NOT NULL,
    UserID INT NOT NULL,
    BidAmount DECIMAL(10, 2) NOT NULL,
    BidTime DATETIME NOT NULL,
    FOREIGN KEY (ItemID) REFERENCES Items(ItemID),
    FOREIGN KEY (UserID) REFERENCES Users(UserID)
);
Payments

CREATE TABLE Payments (
    PaymentID INT PRIMARY KEY AUTO_INCREMENT,
    UserID INT NOT NULL,
    ItemID INT NOT NULL,
    Amount DECIMAL(10, 2) NOT NULL,
    PaymentDate DATE NOT NULL,
    FOREIGN KEY (UserID) REFERENCES Users(UserID),
    FOREIGN KEY (ItemID) REFERENCES Items(ItemID)
);
Reviews

CREATE TABLE Reviews (
    ReviewID INT PRIMARY KEY AUTO_INCREMENT,
    ReviewerID INT NOT NULL,
    ReviewedUserID INT NOT NULL,
    Rating INT CHECK (Rating BETWEEN 1 AND 5) NOT NULL,
    ReviewText TEXT,
    ReviewDate DATE NOT NULL,
    FOREIGN KEY (ReviewerID) REFERENCES Users(UserID),
    FOREIGN KEY (ReviewedUserID) REFERENCES Users(UserID)
);
Watchlist

CREATE TABLE Watchlist (
    WatchlistID INT PRIMARY KEY AUTO_INCREMENT,
    UserID INT NOT NULL,
    ItemID INT NOT NULL,
    AddedDate DATE NOT NULL,
    FOREIGN KEY (UserID) REFERENCES Users(UserID),
    FOREIGN KEY (ItemID) REFERENCES Items(ItemID)
);
Transactions

CREATE TABLE Transactions (
    TransactionID INT PRIMARY KEY AUTO_INCREMENT,
    ItemID INT NOT NULL,
    BuyerID INT NOT NULL,
    SellerID INT NOT NULL,
    TransactionDate DATE NOT NULL,
    FinalPrice DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (ItemID) REFERENCES Items(ItemID),
    FOREIGN KEY (BuyerID) REFERENCES Users(UserID),
    FOREIGN KEY (SellerID) REFERENCES Users(UserID)
);
Buyers

CREATE TABLE Buyers (
    BuyerID INT PRIMARY KEY,
    PreferredPaymentMethod VARCHAR(50) NOT NULL,
    FOREIGN KEY (BuyerID) REFERENCES Users(UserID)
);
Sellers

CREATE TABLE Sellers (
    SellerID INT PRIMARY KEY,
    StoreName VARCHAR(100) NOT NULL,
    FOREIGN KEY (SellerID) REFERENCES Users(UserID)
);


SQL Queries To Insert data in various tables---

INSERT INTO Users (UserID, UserName, Email, Password, UserType, RegistrationDate) VALUES
(1, 'John Doe', 'john.doe@gmail.com', 'password123', 'Buyer', '2024-01-15'),
(2, 'Jane Smith', 'jane.smith@gmail.com', 'securepassword', 'Seller', '2024-02-10'),
(3, 'Michael Brown', 'michael.brown@gmail.com', 'mike2024', 'Buyer', '2024-03-05'),
(4, 'Emily Davis', 'emily.davis@gmail.com', 'emilyd123', 'Seller', '2024-03-12'),
(5, 'Matthew Wilson', 'matthew.wilson@gmail.com', 'wilsonmatt', 'Buyer', '2024-04-01'),
(6, 'Olivia Taylor', 'olivia.taylor@gmail.com', 'livpassword', 'Seller', '2024-04-17'),
(7, 'James Anderson', 'james.anderson@gmail.com', 'jamesand123', 'Buyer', '2024-05-21'),
(8, 'Sophia Martinez', 'sophia.martinez@gmail.com', 'sophiamart', 'Seller', '2024-06-10'),
(9, 'Benjamin Thomas', 'benjamin.thomas@gmail.com', 'benthomas', 'Buyer', '2024-07-25'),
(10, 'Isabella Garcia', 'isabella.garcia@gmail.com', 'isabellag2024', 'Seller', '2024-08-15'),
(11, 'William Clark', 'william.clark@gmail.com', 'willclark', 'Buyer', '2024-09-30'),
(12, 'Mia Lewis', 'mia.lewis@gmail.com', 'mialewis123', 'Seller', '2024-10-10'),
(13, 'Alexander Lee', 'alexander.lee@gmail.com', 'alexlee2024', 'Buyer', '2024-11-22'),
(14, 'Amelia Walker', 'amelia.walker@gmail.com', 'ameliaw123', 'Seller', '2024-12-05'),
(15, 'Daniel Young', 'daniel.young@gmail.com', 'danyoung', 'Buyer', '2024-12-15'),
(16, 'Charlotte King', 'charlotte.king@gmail.com', 'charlottek', 'Seller', '2024-01-10'),
(17, 'Elijah Scott', 'elijah.scott@gmail.com', 'elijahs2024', 'Buyer', '2024-01-25'),
(18, 'Harper Adams', 'harper.adams@gmail.com', 'harperadam', 'Seller', '2024-02-08'),
(19, 'Sebastian Hill', 'sebastian.hill@gmail.com', 'sebhill2024', 'Buyer', '2024-02-20'),
(20, 'Ava Turner', 'ava.turner@gmail.com', 'avaturner123', 'Seller', '2024-03-01'),
(21, 'Lucas Nelson', 'lucas.nelson@gmail.com', 'lucas2024', 'Buyer', '2024-03-12'),
(22, 'Luna Carter', 'luna.carter@gmail.com', 'luna123', 'Seller', '2024-03-25'),
(23, 'Henry Mitchell', 'henry.mitchell@gmail.com', 'henrymit', 'Buyer', '2024-04-05'),
(24, 'Evelyn Perez', 'evelyn.perez@gmail.com', 'evelynp', 'Seller', '2024-04-15'),
(25, 'Jack Roberts', 'jack.roberts@gmail.com', 'jackrob', 'Buyer', '2024-05-01'),
(26, 'Abigail White', 'abigail.white@gmail.com', 'abigailw', 'Seller', '2024-05-20'),
(27, 'Aiden Harris', 'aiden.harris@gmail.com', 'aidenh', 'Buyer', '2024-06-05'),
(28, 'Ella Ramirez', 'ella.ramirez@gmail.com', 'ellar', 'Seller', '2024-06-18'),
(29, 'Samuel Gonzalez', 'samuel.gonzalez@gmail.com', 'samuelg', 'Buyer', '2024-07-10'),
(30, 'Grace Martinez', 'grace.martinez@gmail.com', 'gracemart', 'Seller', '2024-07-25'),
(31, 'Logan Hall', 'logan.hall@gmail.com', 'loganhall', 'Buyer', '2024-08-01'),
(32, 'Victoria Lopez', 'victoria.lopez@gmail.com', 'victorialopez', 'Seller', '2024-08-15'),
(33, 'David Allen', 'david.allen@gmail.com', 'davidallen', 'Buyer', '2024-09-01'),
(34, 'Scarlett Young', 'scarlett.young@gmail.com', 'scarlettyoung', 'Seller', '2024-09-15'),
(35, 'Isaac Hill', 'isaac.hill@gmail.com', 'isaachill', 'Buyer', '2024-10-05'),
(36, 'Penelope Nelson', 'penelope.nelson@gmail.com', 'penelopenel', 'Seller', '2024-10-20'),
(37, 'Owen Baker', 'owen.baker@gmail.com', 'owenbaker', 'Buyer', '2024-11-01'),
(38, 'Camila Adams', 'camila.adams@gmail.com', 'camilaadam', 'Seller', '2024-11-18'),
(39, 'Wyatt Scott', 'wyatt.scott@gmail.com', 'wyattscott', 'Buyer', '2024-12-01'),
(40, 'Zoe Turner', 'zoe.turner@gmail.com', 'zoeturner', 'Seller', '2024-12-20');

	
INSERT INTO user (user_id, city, country, phone_number)
VALUES
(1, 'São José dos Campos', 'Brazil', '+55-12-1234-5678'),
(2, 'Stuttgart', 'Germany', '+49-711-123456'),
(3, 'Montréal', 'Canada', '+1-514-987-6543'),
(4, 'Oslo', 'Norway', '+47-22-345678'),
(5, 'Prague', 'Czech Republic', '+420-222-345-678'),
(6, 'Prague', 'Czech Republic', '+420-333-456-789'),
(7, 'Vienna', 'Austria', '+43-1-23456'),
(8, 'Brussels', 'Belgium', '+32-2-345-6789'),
(9, 'Copenhagen', 'Denmark', '+45-12-345-678'),
(10, 'São Paulo', 'Brazil', '+55-11-98765-4321'),
(11, 'São Paulo', 'Brazil', '+55-11-8765-4321'),
(12, 'Rio de Janeiro', 'Brazil', '+55-21-7654-3210'),
(13, 'Brasília', 'Brazil', '+55-61-6543-2109'),
(14, 'Edmonton', 'Canada', '+1-780-543-2109'),
(15, 'Vancouver', 'Canada', '+1-604-432-1098'),
(16, 'Mountain View', 'USA', '+1-650-321-0987'),
(17, 'Redmond', 'USA', '+1-425-876-5432'),
(18, 'New York', 'USA', '+1-212-765-4321'),
(19, 'Cupertino', 'USA', '+1-408-234-5678'),
(20, 'Mountain View', 'USA', '+1-650-987-6543'),
(21, 'Reno', 'USA', '+1-775-321-0987'),
(22, 'Orlando', 'USA', '+1-407-876-5432'),
(23, 'Boston', 'USA', '+1-617-765-4321'),
(24, 'Chicago', 'USA', '+1-312-234-5678'),
(25, 'Madison', 'USA', '+1-608-987-6543'),
(26, 'Fort Worth', 'USA', '+1-817-321-0987'),
(27, 'Tucson', 'USA', '+1-520-876-5432'),
(28, 'Salt Lake City', 'USA', '+1-801-765-4321'),
(29, 'Toronto', 'Canada', '+1-416-234-5678'),
(30, 'Ottawa', 'Canada', '+1-613-987-6543'),
(31, 'Halifax', 'Canada', '+1-902-321-0987'),
(32, 'Winnipeg', 'Canada', '+1-204-876-5432'),
(33, 'Yellowknife', 'Canada', '+1-867-765-4321'),
(34, 'Lisbon', 'Portugal', '+351-21-987-6543'),
(35, 'Porto', 'Portugal', '+351-22-876-5432'),
(36, 'Berlin', 'Germany', '+49-30-7654-3210'),
(37, 'Frankfurt', 'Germany', '+49-69-5432-1098'),
(38, 'Berlin', 'Germany', '+49-30-8765-4321'),
(39, 'Paris', 'France', '+33-1-4321-0987'),
(40, 'Madrid', 'Spain', '+34-91-876-5432');
	
INSERT INTO items (itemid, sellerid, categoryid, itemname, startingprice, startdate, enddate, status) VALUES
(31, 14, 1, 'Antique Clock', 500.00, '2024-08-17', '2024-09-01', 'Active'),
(32, 16, 2, 'Vintage Wine Bottle', 250.00, '2024-08-19', '2024-09-03', 'Sold'),
(33, 18, 3, 'First Edition Comic Book', 200.00, '2024-08-21', '2024-09-05', 'Expired'),
(34, 20, 4, 'Classic Motorcycle', 10000.00, '2024-08-23', '2024-09-07', 'Active'),
(35, 22, 5, 'Designer Shoes', 300.00, '2024-08-25', '2024-09-09', 'Sold'),
(36, 24, 6, 'Silver Bar', 1200.00, '2024-08-27', '2024-09-11', 'Active'),
(37, 26, 7, 'High-End Desktop PC', 1500.00, '2024-08-29', '2024-09-13', 'Expired'),
(38, 28, 8, 'Smartwatch', 250.00, '2024-08-31', '2024-09-15', 'Active'),
(39, 30, 9, 'Handmade Jewelry Box', 120.00, '2024-09-02', '2024-09-17', 'Sold'),
(40, 32, 10, 'Action Figure Collection', 400.00, '2024-09-04', '2024-09-19', 'Expired'),
(41, 34, 11, 'Vintage Movie Poster', 300.00, '2024-09-06', '2024-09-21', 'Active'),
(42, 36, 12, 'Signed Memorabilia', 800.00, '2024-09-08', '2024-09-23', 'Sold'),
(43, 38, 13, 'Luxury Perfume Set', 150.00, '2024-09-10', '2024-09-25', 'Expired'),
(44, 40, 14, 'Outdoor Patio Set', 500.00, '2024-09-12', '2024-09-27', 'Active'),
(45, 2, 15, 'Pearl Earrings', 1000.00, '2024-09-14', '2024-09-29', 'Sold'),
(46, 4, 16, 'Vintage Vinyl', 200.00, '2024-09-16', '2024-10-01', 'Expired'),
(47, 6, 17, 'Acoustic Guitar', 600.00, '2024-09-18', '2024-10-03', 'Active'),
(48, 8, 18, 'Pet Carrier', 40.00, '2024-09-20', '2024-10-05', 'Sold'),
(49, 10, 19, 'Porcelain Figurine', 90.00, '2024-09-22', '2024-10-07', 'Expired'),
(50, 12, 20, 'Lakefront Property', 300000.00, '2024-09-24', '2024-10-09', 'Active');


INSERT INTO Categories (CategoryID, CategoryName) VALUES 
(1, 'Art & Collectibles'),
(2, 'Antiques'),
(3, 'Books & Magazines'),
(4, 'Cars & Vehicles'),
(5, 'Clothing, Shoes & Accessories'),
(6, 'Coins & Paper Money'),
(7, 'Computers & Networking'),
(8, 'Consumer Electronics'),
(9, 'Crafts'),
(10, 'Dolls & Bears'),
(11, 'DVDs & Movies'),
(12, 'Entertainment Memorabilia'),
(13, 'Health & Beauty'),
(14, 'Home & Garden'),
(15, 'Jewelry & Watches'),
(16, 'Music'),
(17, 'Musical Instruments & Gear'),
(18, 'Pet Supplies'),
(19, 'Pottery & Glass'),
(20, 'Real Estate'),
(21, 'Specialty Services'),
(22, 'Sporting Goods'),
(23, 'Sports Mem, Cards & Fan Shop'),
(24, 'Stamps'),
(25, 'Tickets & Experiences'),
(26, 'Toys & Hobbies'),
(27, 'Travel'),
(28, 'Video Games & Consoles'),
(29, 'Vintage & Retro'),
(30, 'Everything Else');

AS I HAD ADDED MORE COLUMNS AFTER SOME TIME
	
INSERT INTO Categories (CategoryName)
VALUES 
('Architectural Salvage'),
('Art Supplies'),
('Baby Essentials'),
('Business & Industrial'),
('Cameras & Photo'),
('Cell Phones & Accessories'),
('Collectible Card Games'),
('Digital Art'),
('E-Books'),
('Educational Materials'),
('Environmental Products'),
('Fashion Accessories'),
('Food & Beverages'),
('Gaming Accessories'),
('Handcrafted Items'),
('Historical Memorabilia'),
('Holiday & Seasonal Décor'),
('Interior Design'),
('Meditation & Relaxation'),
('Vintage Electronics');


INSERT INTO categories (categoryid, categoryname) VALUES
(31, 'Furniture'),
(32, 'Handmade'),
(33, 'Household Appliances'),
(34, 'Industrial Equipment'),
(35, 'Lamps & Lighting'),
(36, 'Office Supplies'),
(37, 'Photography'),
(38, 'Souvenirs & Events'),
(39, 'Tools & Workshop Equipment'),
(40, 'Wedding Supplies');

INSERT INTO Buyers (BuyerID, PreferredPaymentMethod) VALUES
(1, 'Credit Card'),
(3, 'PayPal'),
(5, 'Bank Transfer'),
(7, 'Credit Card'),
(9, 'PayPal'),
(11, 'Credit Card'),
(13, 'Bank Transfer'),
(15, 'PayPal'),
(17, 'Credit Card'),
(19, 'Bank Transfer'),
(21, 'PayPal'),
(23, 'Credit Card'),
(25, 'Bank Transfer'),
(27, 'PayPal'),
(29, 'Credit Card'),
(31, 'Bank Transfer'),
(33, 'PayPal'),
(35, 'Credit Card'),
(37, 'Bank Transfer'),
(39, 'PayPal'),
(2, 'Credit Card'),
(4, 'PayPal'),
(6, 'Bank Transfer'),
(8, 'Credit Card'),
(10, 'PayPal'),
(12, 'Credit Card'),
(14, 'Bank Transfer'),
(16, 'PayPal'),
(18, 'Credit Card'),
(20, 'Bank Transfer');

INSERT INTO Sellers (SellerID, StoreName) VALUES
(2, 'Jane\'s Electronics'),
(4, 'Emily’s Furniture'),
(6, 'Olivia’s Bookstore'),
(8, 'Sophia’s Fashion'),
(10, 'Isabella’s Toy Store'),
(12, 'Mia’s Art Supplies'),
(14, 'Amelia’s Jewelry'),
(16, 'Charlotte’s Home Goods'),
(18, 'Harper’s Sports Gear'),
(20, 'Ava’s Pet Supplies'),
(22, 'Luna’s Music Shop'),
(24, 'Evelyn’s Kitchenware'),
(26, 'Abigail’s Outdoor Gear'),
(28, 'Ella’s Beauty Products'),
(30, 'Grace’s Garden Supplies'),
(32, 'Victoria’s Office Supplies'),
(34, 'Scarlett’s Auto Parts'),
(36, 'Penelope’s Health Store'),
(38, 'Camila’s Baby Boutique'),
(40, 'Zoe’s Tech Gadgets'),
(1, 'John\'s Car Shop'),
(3, 'Michael\'s Bike Store'),
(5, 'Matthew\'s Outdoor Store'),
(7, 'James\'s Music Corner'),
(9, 'Benjamin\'s Sports Store'),
(11, 'William\'s Book Haven'),
(13, 'Alexander\'s Art Gallery'),
(15, 'Daniel\'s Toy Emporium'),
(17, 'Elijah\'s Fashion Hub'),
(19, 'Sebastian\'s Furniture Outlet');

INSERT INTO Sellers (SellerID, StoreName) VALUES
(2, 'Jane''s Electronics'),
(4, 'Emily’s Furniture'),
(6, 'Olivia’s Bookstore'),
(8, 'Sophia’s Fashion'),
(10, 'Isabella’s Toy Store'),
(12, 'Mia’s Art Supplies'),
(14, 'Amelia’s Jewelry'),
(16, 'Charlotte’s Home Goods'),
(18, 'Harper’s Sports Gear'),
(20, 'Ava’s Pet Supplies'),
(22, 'Luna’s Music Shop'),
(24, 'Evelyn’s Kitchenware'),
(26, 'Abigail’s Outdoor Gear'),
(28, 'Ella’s Beauty Products'),
(30, 'Grace’s Garden Supplies'),
(32, 'Victoria’s Office Supplies'),
(34, 'Scarlett’s Auto Parts'),
(36, 'Penelope’s Health Store'),
(38, 'Camila’s Baby Boutique'),
(40, 'Zoe’s Tech Gadgets'),
(1, 'John''s Car Shop'),
(3, 'Michael''s Bike Store'),
(5, 'Matthew''s Outdoor Store'),
(7, 'James''s Music Corner'),
(9, 'Benjamin''s Sports Store'),
(11, 'William''s Book Haven'),
(13, 'Alexander''s Art Gallery'),
(15, 'Daniel''s Toy Emporium'),
(17, 'Elijah''s Fashion Hub'),
(19, 'Sebastian''s Furniture Outlet');

INSERT INTO Transactions (TransactionID, ItemID, BuyerID, SellerID, TransactionDate, FinalPrice) VALUES
(1, 1, 1, 2, '2024-01-23', 220.00),
(2, 2, 5, 4, '2024-02-18', 170.00),
(3, 3, 9, 6, '2024-03-13', 55.00),
(4, 4, 3, 8, '2024-04-01', 100.00),
(5, 5, 7, 10, '2024-05-15', 250.00),
(6, 6, 11, 12, '2024-06-05', 75.00),
(7, 7, 13, 14, '2024-07-19', 300.00),
(8, 8, 15, 16, '2024-08-25', 120.00),
(9, 9, 17, 18, '2024-09-13', 80.00),
(10, 10, 19, 20, '2024-10-10', 180.00),
(11, 11, 21, 22, '2024-11-01', 95.00),
(12, 12, 23, 24, '2024-12-05', 65.00),
(13, 13, 25, 26, '2024-01-15', 150.00),
(14, 14, 27, 28, '2024-02-10', 110.00),
(15, 15, 29, 30, '2024-03-01', 135.00),
(16, 16, 31, 32, '2024-04-12', 200.00),
(17, 17, 33, 34, '2024-05-07', 145.00),
(18, 18, 35, 36, '2024-06-18', 230.00),
(19, 19, 37, 38, '2024-07-25', 160.00),
(20, 20, 39, 40, '2024-08-15', 190.00),
(21, 21, 2, 1, '2024-09-05', 125.00),
(22, 22, 4, 3, '2024-10-20', 105.00),
(23, 23, 6, 5, '2024-11-12', 140.00),
(24, 24, 8, 7, '2024-12-04', 175.00),
(25, 25, 10, 9, '2024-01-28', 215.00),
(26, 26, 12, 11, '2024-02-19', 195.00),
(27, 27, 14, 13, '2024-03-10', 85.00),
(28, 28, 16, 15, '2024-04-21', 220.00),
(29, 29, 18, 17, '2024-05-13', 155.00),
(30, 30, 20, 19, '2024-06-17', 205.00);

INSERT INTO Items (ItemID, SellerID, CategoryID, ItemName, StartingPrice, StartDate, EndDate, Status) VALUES
(1, 2, 1, 'Vintage Painting', 150.00, '2024-06-01', '2024-06-15', 'Active'),
(2, 4, 2, 'Antique Vase', 300.00, '2024-06-05', '2024-06-20', 'Sold'),
(3, 6, 3, 'Rare Book', 50.00, '2024-06-10', '2024-06-25', 'Expired'),
(4, 8, 4, 'Classic Car Model', 5000.00, '2024-06-12', '2024-06-27', 'Active'),
(5, 10, 5, 'Designer Handbag', 200.00, '2024-06-15', '2024-06-30', 'Sold'),
(6, 12, 6, 'Gold Coin', 1000.00, '2024-06-18', '2024-07-03', 'Active'),
(7, 14, 7, 'Gaming Laptop', 1200.00, '2024-06-20', '2024-07-05', 'Expired'),
(8, 16, 8, 'Smartphone', 800.00, '2024-06-25', '2024-07-10', 'Active'),
(9, 18, 9, 'Handmade Quilt', 100.00, '2024-06-28', '2024-07-13', 'Sold'),
(10, 20, 10, 'Collectible Doll', 250.00, '2024-07-01', '2024-07-16', 'Expired'),
(11, 22, 11, 'Blu-ray Movie Collection', 80.00, '2024-07-03', '2024-07-18', 'Active'),
(12, 24, 12, 'Signed Movie Poster', 150.00, '2024-07-05', '2024-07-20', 'Sold'),
(13, 26, 13, 'Skincare Set', 60.00, '2024-07-08', '2024-07-23', 'Expired'),
(14, 28, 14, 'Garden Tools Set', 40.00, '2024-07-10', '2024-07-25', 'Active'),
(15, 30, 15, 'Diamond Necklace', 3000.00, '2024-07-12', '2024-07-27', 'Sold'),
(16, 32, 16, 'Vinyl Record Collection', 200.00, '2024-07-15', '2024-07-30', 'Expired'),
(17, 34, 17, 'Electric Guitar', 500.00, '2024-07-18', '2024-08-02', 'Active'),
(18, 36, 18, 'Pet Bed', 30.00, '2024-07-20', '2024-08-04', 'Sold'),
(19, 38, 19, 'Ceramic Bowl Set', 80.00, '2024-07-22', '2024-08-06', 'Expired'),
(20, 40, 20, 'Beachfront Property', 250000.00, '2024-07-25', '2024-08-09', 'Active'),
(21, 2, 21, 'Event Planning Service', 500.00, '2024-07-28', '2024-08-12', 'Sold'),
(22, 4, 22, 'Tennis Racket', 70.00, '2024-07-30', '2024-08-14', 'Expired'),
(23, 6, 23, 'Baseball Card', 150.00, '2024-08-01', '2024-08-16', 'Active'),
(24, 8, 24, 'Rare Stamp', 1000.00, '2024-08-03', '2024-08-18', 'Sold'),
(25, 10, 25, 'Concert Tickets', 300.00, '2024-08-05', '2024-08-20', 'Expired'),
(26, 12, 26, 'Vintage Toy Car', 75.00, '2024-08-07', '2024-08-22', 'Active'),
(27, 14, 27, 'Travel Voucher', 1000.00, '2024-08-10', '2024-08-25', 'Sold'),
(28, 16, 28, 'Video Game Console', 400.00, '2024-08-12', '2024-08-27', 'Expired'),
(29, 18, 29, 'Retro Sunglasses', 50.00, '2024-08-15', '2024-08-30', 'Active'),
(30, 


INSERT INTO Payments (PaymentID, UserID, ItemID, Amount, PaymentDate) VALUES
(1, 1, 2, 150.00, '2024-01-16'),
(2, 5, 5, 200.00, '2024-02-11'),
(3, 9, 8, 80.00, '2024-03-06'),
(4, 13, 12, 60.00, '2024-03-19'),
(5, 17, 14, 40.00, '2024-04-07'),
(6, 21, 17, 500.00, '2024-04-22'),
(7, 25, 20, 1000.00, '2024-05-05'),
(8, 29, 23, 70.00, '2024-05-18'),
(9, 33, 25, 150.00, '2024-06-01'),
(10, 37, 28, 400.00, '2024-06-14'),
(11, 2, 4, 300.00, '2024-06-26'),
(12, 6, 6, 1000.00, '2024-07-09'),
(13, 10, 10, 250.00, '2024-07-21'),
(14, 14, 15, 3000.00, '2024-08-03'),
(15, 18, 18, 30.00, '2024-08-16'),
(16, 22, 21, 500.00, '2024-08-29'),
(17, 26, 24, 1000.00, '2024-09-11'),
(18, 30, 27, 75.00, '2024-09-24'),
(19, 3, 1, 220.00, '2024-10-07'),
(20, 7, 3, 55.00, '2024-10-20'),
(21, 11, 7, 1200.00, '2024-11-02'),
(22, 15, 11, 80.00, '2024-11-15'),
(23, 19, 13, 60.00, '2024-11-28'),
(24, 23, 16, 40.00, '2024-12-11'),
(25, 27, 19, 100.00, '2024-12-24'),
(26, 31, 22, 150.00, '2025-01-06'),
(27, 35, 26, 300.00, '2025-01-19'),
(28, 4, 29, 500.00, '2025-02-01'),
(29, 8, 30, 1000.00, '2025-02-14'),
(30, 12, 5, 70.00, '2025-02-27');


INSERT INTO Reviews (ReviewID, ReviewerID, ReviewedUserID, Rating, ReviewText, ReviewDate) VALUES
(1, 1, 2, 5, 'Great seller!', '2024-01-24'),
(2, 5, 4, 4, 'Item as described.', '2024-02-19'),
(3, 9, 6, 3, 'Good but shipping was slow.', '2024-03-14'),
(4, 13, 8, 5, 'Excellent service!', '2024-03-25'),
(5, 17, 10, 4, 'Very satisfied with the purchase.', '2024-04-10'),
(6, 21, 12, 2, 'Product was damaged on arrival.', '2024-04-21'),
(7, 25, 14, 5, 'Highly recommend!', '2024-05-01'),
(8, 29, 16, 3, 'Okay experience.', '2024-05-15'),
(9, 33, 18, 4, 'Good value for money.', '2024-06-03'),
(10, 37, 20, 1, 'Terrible service!', '2024-06-18'),
(11, 2, 22, 5, 'Fast shipping!', '2024-06-29'),
(12, 6, 24, 3, 'Average experience.', '2024-07-10'),
(13, 10, 26, 4, 'Satisfied with the product.', '2024-07-25'),
(14, 14, 28, 2, 'Not as described.', '2024-08-05'),
(15, 18, 30, 5, 'Excellent product!', '2024-08-20'),
(16, 22, 3, 4, 'Very good transaction.', '2024-09-02'),
(17, 26, 5, 3, 'Could be better.', '2024-09-15'),
(18, 30, 7, 1, 'Very disappointed.', '2024-09-28'),
(19, 3, 9, 5, 'Fantastic seller!', '2024-10-10'),
(20, 7, 11, 2, 'Product was delayed.', '2024-10-24'),
(21, 11, 13, 4, 'Satisfied overall.', '2024-11-06'),
(22, 15, 15, 5, 'Highly recommend!', '2024-11-18'),
(23, 19, 17, 3, 'Just okay.', '2024-12-02'),
(24, 23, 19, 1, 'Will not buy again.', '2024-12-16'),
(25, 27, 21, 5, 'Very happy with the purchase!', '2024-12-29'),
(26, 31, 23, 2, 'Not satisfied.', '2025-01-12'),
(27, 35, 25, 4, 'Good product, bad service.', '2025-01-25'),
(28, 4, 27, 5, 'Perfect transaction.', '2025-02-06'),
(29, 8, 29, 3, 'Average quality.', '2025-02-19'),
(30, 12, 1, 4, 'Will buy again.', '2025-03-01');

INSERT INTO Watchlist (WatchlistID, UserID, ItemID, AddedDate) VALUES
(1, 1, 1, '2024-01-15'),
(2, 3, 2, '2024-02-10'),
(3, 5, 3, '2024-03-05'),
(4, 7, 4, '2024-04-01'),
(5, 9, 5, '2024-05-21'),
(6, 2, 6, '2024-06-10'),
(7, 4, 7, '2024-07-25'),
(8, 6, 8, '2024-08-15'),
(9, 8, 9, '2024-09-30'),
(10, 10, 10, '2024-10-10'),
(11, 11, 11, '2024-11-22'),
(12, 12, 12, '2024-12-05'),
(13, 13, 13, '2024-01-10'),
(14, 14, 14, '2024-01-25'),
(15, 15, 15, '2024-02-08'),
(16, 16, 16, '2024-02-20'),
(17, 17, 17, '2024-03-01'),
(18, 18, 18, '2024-03-12'),
(19, 19, 19, '2024-03-25'),
(20, 20, 20, '2024-04-05'),
(21, 21, 21, '2024-04-15'),
(22, 22, 22, '2024-05-01'),
(23, 23, 23, '2024-05-20'),
(24, 24, 24, '2024-06-05'),
(25, 25, 25, '2024-06-18'),
(26, 26, 26, '2024-07-10'),
(27, 27, 27, '2024-07-25'),
(28, 28, 28, '2024-08-01'),
(29, 29, 29, '2024-08-15'),
(30, 30, 30, '2024-09-01');


ALTER TABLE user
ADD COLUMN city VARCHAR(100),
ADD COLUMN country VARCHAR(100),
ADD COLUMN phone_number VARCHAR(20);


INSERT INTO Buyers (BuyerID, PreferredPaymentMethod) VALUES
(1, 'Credit Card'),
(3, 'PayPal'),
(5, 'Bank Transfer'),
(7, 'Credit Card'),
(9, 'PayPal');

INSERT INTO Transactions (TransactionID, ItemID, BuyerID, SellerID, TransactionDate, FinalPrice) VALUES
(1, 1, 1, 2, '2024-01-23', 220.00),
(2, 2, 5, 4, '2024-02-18', 170.00),
(3, 3, 9, 6, '2024-03-13', 55.00);

INSERT INTO Reviews (ReviewID, ReviewerID, ReviewedUserID, Rating, ReviewText, ReviewDate) VALUES
(1, 1, 2, 5, 'Great seller!', '2024-01-24'),
(2, 5, 4, 4, 'Item as described.', '2024-02-19'),
(3, 9, 6, 3, 'Good but shipping was slow.', '2024-03-14');


INSERT INTO Payments (PaymentID, UserID, ItemID, Amount, PaymentDate) VALUES
(1, 1, 1, 220.00, '2024-01-23'),
(2, 5, 2, 170.00, '2024-02-18'),
(3, 9, 3, 55.00, '2024-03-13');

INSERT INTO Bids (BidID, ItemID, UserID, BidAmount, BidTime) VALUES
(1, 1, 1, 210.00, '2024-01-16 10:00:00'),
(2, 1, 3, 220.00, '2024-01-17 14:00:00'),
(3, 2, 5, 160.00, '2024-02-11 11:00:00'),
(4, 2, 7, 170.00, '2024-02-12 15:00:00'),
(5, 3, 9, 55.00, '2024-03-06 09:00:00');

INSERT INTO Watchlist (UserID, ItemID, AddedDate) VALUES
(1, 1, '2023-01-01'),
(4, 2, '2023-02-01'),
(6, 3, '2023-03-01'),
(1, 4, '2023-04-01'),
(4, 5, '2023-05-01'),
(6, 6, '2023-06-01'),
(1, 7, '2023-07-01'),
(4, 8, '2023-08-01'),
(6, 9, '2023-09-01'),
(1, 10, '2023-10-01');

INSERT INTO Categories (CategoryName) VALUES
('Electronics'),
('Books'),
('Clothing'),
('Home & Kitchen'),
('Toys & Games'),
('Sports & Outdoors'),
('Beauty & Personal Care'),
('Health & Wellness'),
('Automotive'),
('Jewelry & Accessories');

INSERT INTO users (userid, username, email, usertype, registrationdate, city, phone_number) VALUES
(41, 'Ethan Wright', 'ethan.wright@gmail.com', 'Buyer', '2024-01-05', 'Amsterdam', '+31-20-123-4567'),
(42, 'Avery King', 'avery.king@gmail.com', 'Seller', '2024-01-15', 'Rotterdam', '+31-10-765-4321'),
(43, 'Mason Scott', 'mason.scott@gmail.com', 'Buyer', '2024-01-25', 'The Hague', '+31-70-234-5678'),
(44, 'Lily Campbell', 'lily.campbell@gmail.com', 'Seller', '2024-02-05', 'Utrecht', '+31-30-876-5432'),
(45, 'Logan Parker', 'logan.parker@gmail.com', 'Buyer', '2024-02-15', 'Eindhoven', '+31-40-321-0987'),
(46, 'Sophia Moore', 'sophia.moore@gmail.com', 'Seller', '2024-02-25', 'Groningen', '+31-50-987-6543'),
(47, 'Jackson Anderson', 'jackson.anderson@gmail.com', 'Buyer', '2024-03-05', 'Maastricht', '+31-43-543-2109'),
(48, 'Mila Hernandez', 'mila.hernandez@gmail.com', 'Seller', '2024-03-15', 'Breda', '+31-76-321-0987'),
(49, 'Noah Collins', 'noah.collins@gmail.com', 'Buyer', '2024-03-25', 'Tilburg', '+31-13-876-5432'),
(50, 'Layla Evans', 'layla.evans@gmail.com', 'Seller', '2024-04-05', 'Leiden', '+31-71-234-5678'),
(51, 'Lucas Robinson', 'lucas.robinson@gmail.com', 'Buyer', '2024-04-15', 'Alkmaar', '+31-72-987-6543'),
(52, 'Zoe Murphy', 'zoe.murphy@gmail.com', 'Seller', '2024-04-25', 'Haarlem', '+31-23-543-2109'),
(53, 'Henry Walker', 'henry.walker@gmail.com', 'Buyer', '2024-05-05', 'Arnhem', '+31-26-321-0987'),
(54, 'Emily Cox', 'emily.cox@gmail.com', 'Seller', '2024-05-15', 'Nijmegen', '+31-24-876-5432'),
(55, 'Benjamin James', 'benjamin.james@gmail.com', 'Buyer', '2024-05-25', 'Delft', '+31-15-234-5678'),
(56, 'Victoria Lee', 'victoria.lee@gmail


INSERT INTO items (itemid, sellerid, categoryid, itemname, startingprice, startdate, enddate, status) VALUES
(31, 14, 1, 'Antique Clock', 500.00, '2024-08-17', '2024-09-01', 'Active'),
(32, 16, 2, 'Vintage Wine Bottle', 250.00, '2024-08-19', '2024-09-03', 'Sold'),
(33, 18, 3, 'First Edition Comic Book', 200.00, '2024-08-21', '2024-09-05', 'Expired'),
(34, 20, 4, 'Classic Motorcycle', 10000.00, '2024-08-23', '2024-09-07', 'Active'),
(35, 22, 5, 'Designer Shoes', 300.00, '2024-08-25', '2024-09-09', 'Sold'),
(36, 24, 6, 'Silver Bar', 1200.00, '2024-08-27', '2024-09-11', 'Active'),
(37, 26, 7, 'High-End Desktop PC', 1500.00, '2024-08-29', '2024-09-13', 'Expired'),
(38, 28, 8, 'Smartwatch', 250.00, '2024-08-31', '2024-09-15', 'Active'),
(39, 30, 9, 'Handmade Jewelry Box', 120.00, '2024-09-02', '2024-09-17', 'Sold'),
(40, 32, 10, 'Action Figure Collection', 400.00, '2024-09-04', '2024-09-19', 'Expired'),
(41, 34, 11, 'Vintage Movie Poster', 300.00, '2024-09-06', '2024-09-21', 'Active'),
(42, 36, 12, 'Signed Memorabilia', 800.00, '2024-09-08', '2024-09-23', 'Sold'),
(43, 38, 13, 'Luxury Perfume Set', 150.00, '2024-09-10', '2024-09-25', 'Expired'),
(44, 40, 14, 'Outdoor Patio Set', 500.00, '2024-09-12', '2024-09-27', 'Active'),
(45, 2, 15, 'Pearl Earrings', 1000.00, '2024-09-14', '2024-09-29', 'Sold'),
(46, 4, 16, 'Vintage Vinyl', 200.00, '2024-09-16', '2024-10-01', 'Expired'),
(47, 6, 17, 'Acoustic Guitar', 600.00, '2024-09-18', '2024-10-03', 'Active'),
(48, 8, 18, 'Pet Carrier', 40.00, '2024-09-20', '2024-10-05', 'Sold'),
(49, 10, 19, 'Porcelain Figurine', 90.00, '2024-09-22', '2024-10-07', 'Expired'),
(50, 12, 20, 'Lakefront Property', 300000.00, '2024-09-24', '2024-10-09', 'Active');

INSERT INTO categories (categoryid, categoryname) VALUES
(31, 'Furniture'),
(32, 'Handmade'),
(33, 'Household Appliances'),
(34, 'Industrial Equipment'),
(35, 'Lamps & Lighting'),
(36, 'Office Supplies'),
(37, 'Photography'),
(38, 'Souvenirs & Events'),
(39, 'Tools & Workshop Equipment'),
(40, 'Wedding Supplies');


-- Add new columns
ALTER TABLE Users
    ADD COLUMN city VARCHAR(255),
    ADD COLUMN country VARCHAR(255),
    ADD COLUMN phone_number VARCHAR(20);

-- Remove password column
ALTER TABLE Users
    DROP COLUMN password;

-- Inserting 4 more "Acoustic Guitar" items
INSERT INTO Items (SellerID, CategoryID, ItemName, StartingPrice, StartDate, EndDate, Status)
VALUES
    (47, 17, 'Acoustic Guitar', 600.00, '2024-09-30', '2024-10-15', 'Active'),
    (47, 17, 'Acoustic Guitar', 600.00, '2024-09-30', '2024-10-15', 'Active'),
    (47, 17, 'Acoustic Guitar', 600.00, '2024-09-30', '2024-10-15', 'Active'),
    (47, 17, 'Acoustic Guitar', 600.00, '2024-09-30', '2024-10-15', 'Active');

-- Inserting 5 more "Gold Coin" items
INSERT INTO Items (SellerID, CategoryID, ItemName, StartingPrice, StartDate, EndDate, Status)
VALUES
    (73, 6, 'Gold Coin', 1000.00, '2024-10-01', '2024-10-16', 'Active'),
    (73, 6, 'Gold Coin', 1000.00, '2024-10-01', '2024-10-16', 'Active'),
    (73, 6, 'Gold Coin', 1000.00, '2024-10-01', '2024-10-16', 'Active'),
    (73, 6, 'Gold Coin', 1000.00, '2024-10-01', '2024-10-16', 'Active'),
    (73, 6, 'Gold Coin', 1000.00, '2024-10-01', '2024-10-16', 'Active');

-- Inserting 2 more "Silver Bar" items
INSERT INTO Items (SellerID, CategoryID, ItemName, StartingPrice, StartDate, EndDate, Status)
VALUES
    (36, 6, 'Silver Bar', 1200.00, '2024-10-03', '2024-10-18', 'Active'),
    (36, 6, 'Silver Bar', 1200.00, '2024-10-03', '2024-10-18', 'Active');

-- Inserting 4 more "Diamond Necklace" items
INSERT INTO Items (SellerID, CategoryID, ItemName, StartingPrice, StartDate, EndDate, Status)
VALUES
    (30, 15, 'Diamond Necklace', 3000.00, '2024-10-05', '2024-10-20', 'Active'),
    (30, 15, 'Diamond Necklace', 3000.00, '2024-10-05', '2024-10-20', 'Active'),
    (30, 15, 'Diamond Necklace', 3000.00, '2024-10-05', '2024-10-20', 'Active'),
    (30, 15, 'Diamond Necklace', 3000.00, '2024-10-05', '2024-10-20', 'Active');

-- Inserting 2 more "Luxury Perfume Set" items
INSERT INTO Items (SellerID, CategoryID, ItemName, StartingPrice, StartDate, EndDate, Status)
VALUES
    (38, 13, 'Luxury Perfume Set', 150.00, '2024-10-07', '2024-10-22', 'Active'),
    (38, 13, 'Luxury Perfume Set', 150.00, '2024-10-07', '2024-10-22', 'Active');

-- Antique Vase
INSERT INTO Bids (ItemID, UserID, BidAmount, BidTime)
VALUES (1, 1, 160.00, '2024-01-16 10:00:00');

-- Garden Tools Set (assuming 5 different bids)
INSERT INTO Bids (ItemID, UserID, BidAmount, BidTime)
VALUES
    (2, 5, 160.00, '2024-02-11 11:00:00'),
    (2, 7, 170.00, '2024-02-12 15:00:00'),
    (2, 9, 165.00, '2024-02-13 14:00:00'),
    (2, 11, 180.00, '2024-02-14 10:00:00'),
    (2, 13, 175.00, '2024-02-15 12:00:00');

-- Vintage Painting (assuming 6 different bids)
INSERT INTO Bids (ItemID, UserID, BidAmount, BidTime)
VALUES
    (3, 15, 55.00, '2024-03-06 09:00:00'),
    (3, 17, 60.00, '2024-03-07 10:00:00'),
    (3, 19, 65.00, '2024-03-08 11:00:00'),
    (3, 21, 70.00, '2024-03-09 12:00:00'),
    (3, 23, 75.00, '2024-03-10 13:00:00'),
    (3, 25, 80.00, '2024-03-11 14:00:00');

-- Blu-ray Movie Collection
INSERT INTO Bids (ItemID, UserID, BidAmount, BidTime)
VALUES (4, 27, 90.00, '2024-04-02 12:00:00');

-- Vinyl Record Collection (assuming 8 different bids)
INSERT INTO Bids (ItemID, UserID, BidAmount, BidTime)
VALUES
    (5, 29, 205.00, '2024-04-19 14:30:00'),
    (5, 31, 210.00, '2024-04-20 15:30:00'),
    (5, 33, 215.00, '2024-04-21 16:30:00'),
    (5, 35, 220.00, '2024-04-22 17:30:00'),
    (5, 37, 225.00, '2024-04-23 18:30:00'),
    (5, 39, 230.00, '2024-04-24 19:30:00'),
    (5, 41, 235.00, '2024-04-25 20:30:00'),
    (5, 43, 240.00, '2024-04-26 21:30:00');

-- Smartphone (assuming 4 different bids)
INSERT INTO Bids (ItemID, UserID, BidAmount, BidTime)
VALUES
    (6, 45, 900.00, '2024-05-22 16:00:00'),
    (6, 47, 910.00, '2024-05-23 17:00:00'),
    (6, 49, 920.00, '2024-05-24 18:00:00'),
    (6, 51, 930.00, '2024-05-25 19:00:00');

-- Skincare Set (assuming 5 different bids)
INSERT INTO Bids (ItemID, UserID, BidAmount, BidTime)
VALUES
    (7, 53, 220.00, '2024-06-11 18:30:00'),
    (7, 55, 225.00, '2024-06-12 19:30:00'),
    (7, 57, 230.00, '2024-06-13 20:30:00'),
    (7, 59, 235.00, '2024-06-14 21:30:00'),
    (7, 61, 240.00, '2024-06-15 22:30:00');

-- Gold Coin (assuming 30 different bids)
INSERT INTO Bids (ItemID, UserID, BidAmount, BidTime)
VALUES
    (8, 63, 1200.00, '2024-07-26 20:00:00'),
    (8, 65, 1210.00, '2024-07-27 21:00:00'),
    (8, 67, 1220.00, '2024-07-28 22:00:00'),
    (8, 69, 1230.00, '2024-07-29 23:00:00'),
    (8, 71, 1240.00, '2024-07-30 00:00:00'),
    (8, 73, 1250.00, '2024-07-31 01:00:00'),
    (8, 75, 1260.00, '2024-08-01 02:00:00'),
    (8, 77, 1270.00, '2024-08-02 03:00:00'),
    (8, 79, 1280.00, '2024-08-03 04:00:00'),
    (8, 81, 1290.00, '2024-08-04 05:00:00'),
    (8, 83, 1300.00, '2024-08-05 06:00:00'),
    (8, 85, 1310.00, '2024-08-06 07:00:00'),
    (8, 87, 1320.00, '2024-08-07 08:00:00'),
    (8, 89, 1330.00, '2024-08-08 09:00:00'),
    (8, 91, 1340.00, '2024-08-09 10:00:00'),
    (8, 93, 1350.00, '2024-08-10 11:00:00'),
    (8, 95, 1360.00, '2024-08-11 12:00:00'),
    (8, 97, 1370.00, '2024-08-12 13:00:00'),
    (8, 99, 1380.00, '2024-08-13 14:00:00'),
    (8, 101, 1390.00, '2024-08-14 15:00:00'),
    (8, 103, 1400.00, '2024-08-15 16:00:00'),
    (8, 105, 1410.00, '2024-08-16 17:00:00'),
    (8, 107, 1420.00, '2024-08-17 18:00:00'),
    (8, 109, 1430.00, '2024-08-18 19:00:00'),
    (8, 111, 1440.00, '2024-08-19 20:00:00'),
    (8, 113, 1450.00, '2024-08-20 21:00:00'),
    (8, 115, 1460.00, '2024-08-21 22:00:00'),
    (8, 117, 1470.00, '2024-08-22 23:00:00'),
    (8, 119, 1480.00, '2024-08-23 00:00:00'),
    (8, 121, 1490.00, '2024-08-24 01:00:00'),
    (8, 123, 1500.00, '2024-08-25 02:00:00');

-- Collectible Doll (assuming 4 different bids)
INSERT INTO Bids (ItemID, UserID, BidAmount, BidTime)
VALUES
    (9, 125, 270.00, '2024-09-16 12:00:00'),
    (9, 127, 275.00, '2024-09-17 13:00:00'),
    (9, 129, 280.00, '2024-09-18 14:00:00'),
    (9, 131, 285.00, '2024-09-19 15:00:00');

-- Another bid for Gold Coin with a different amount
INSERT INTO Bids (ItemID, UserID, BidAmount, BidTime)
VALUES (8, 133, 1100.00, '2024-09-20 16:00:00');

-- Example INSERT statements for the specified bids

-- Antique Vase
INSERT INTO Bids (ItemID, BidAmount, BuyerID)
VALUES (1, 160.00, 1);

-- Garden Tools Set (assuming 5 different bids)
INSERT INTO Bids (ItemID, BidAmount, BuyerID)
VALUES (2, 50.00, 2), (2, 55.00, 3), (2, 60.00, 4), (2, 45.00, 5), (2, 40.00, 6);

-- Vintage Painting (assuming 6 different bids)
INSERT INTO Bids (ItemID, BidAmount, BuyerID)
VALUES (3, 100.00, 7), (3, 110.00, 8), (3, 105.00, 9), (3, 115.00, 10), (3, 120.00, 11), (3, 125.00, 12);

-- Blu-ray Movie Collection
INSERT INTO Bids (ItemID, BidAmount, BuyerID)
VALUES (4, 90.00, 1);

-- Vinyl Record Collection (assuming 8 different bids)
INSERT INTO Bids (ItemID, BidAmount, BuyerID)
VALUES (5, 200.00, 2), (5, 205.00, 3), (5, 210.00, 4), (5, 215.00, 5), (5, 220.00, 6), (5, 225.00, 7), (5, 230.00, 8), (5, 235.00, 9);

-- Smartphone (assuming 4 different bids)
INSERT INTO Bids (ItemID, BidAmount, BuyerID)
VALUES (6, 900.00, 10), (6, 910.00, 11), (6, 920.00, 12), (6, 930.00, 13);

-- Skincare Set (assuming 5 different bids)
INSERT INTO Bids (ItemID, BidAmount, BuyerID)
VALUES (7, 220.00, 14), (7, 225.00, 15), (7, 230.00, 16), (7, 235.00, 17), (7, 240.00, 18);

-- Gold Coin (assuming 30 different bids)
INSERT INTO Bids (ItemID, BidAmount, BuyerID)
VALUES (8, 1200.00, 19), (8, 1210.00, 20), (8, 1220.00, 21), (8, 1230.00, 22), (8, 1240.00, 23),
       (8, 1250.00, 24), (8, 1260.00, 25), (8, 1270.00, 26), (8, 1280.00, 27), (8, 1290.00, 28),
       (8, 1300.00, 29), (8, 1310.00, 30), (8, 1320.00, 31), (8, 1330.00, 32), (8, 1340.00, 33),
       (8, 1350.00, 34), (8, 1360.00, 35), (8, 1370.00, 36), (8, 1380.00, 37), (8, 1390.00, 38),
       (8, 1400.00, 39), (8, 1410.00, 40), (8, 1420.00, 41), (8, 1430.00, 42), (8, 1440.00, 43),
       (8, 1450.00, 44), (8, 1460.00, 45), (8, 1470.00, 46), (8, 1480.00, 47), (8, 1490.00, 48);

-- Collectible Doll (assuming 4 different bids)
INSERT INTO Bids (ItemID, BidAmount, BuyerID)
VALUES (9, 270.00, 49), (9, 275.00, 50), (9, 280.00, 51), (9, 285.00, 52);

-- Another bid for Gold Coin with a different amount
INSERT INTO Bids (ItemID, BidAmount, BuyerID)
VALUES (8, 1100.00, 53);

