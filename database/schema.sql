CREATE DATABASE Walmart;
USE Walmart;

-- 1. User Table
CREATE TABLE User (
    UserID INT AUTO_INCREMENT PRIMARY KEY,
    FirstName VARCHAR(255),
    LastName VARCHAR(255),
    Email VARCHAR(255) UNIQUE,
    PhoneNumber VARCHAR(20),
    Address TEXT,
    RegistrationDate DATETIME
);

-- 2. Search History Table
CREATE TABLE SearchHistory (
    SearchID INT AUTO_INCREMENT PRIMARY KEY,
    UserID INT,
    SearchTerm VARCHAR(255),
    SearchDate DATETIME,
    ResultsCount INT,
    FOREIGN KEY (UserID) REFERENCES User(UserID)
);

-- 3. Order History Table
CREATE TABLE OrderHistory (
    OrderID INT AUTO_INCREMENT PRIMARY KEY,
    UserID INT,
    OrderDate DATETIME,
    TotalAmount DECIMAL(10, 2),
    OrderStatus ENUM('Pending', 'Shipped', 'Delivered', 'Cancelled'),
    FOREIGN KEY (UserID) REFERENCES User(UserID)
);

-- 4. Order Items Table
CREATE TABLE OrderItems (
    OrderItemID INT AUTO_INCREMENT PRIMARY KEY,
    OrderID INT,
    ProductID INT,
    Quantity INT,
    UnitPrice DECIMAL(10, 2),
    FOREIGN KEY (OrderID) REFERENCES OrderHistory(OrderID),
    FOREIGN KEY (ProductID) REFERENCES Product(ProductID)
);

-- 5. Product Table
CREATE TABLE Product (
    ProductID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(255),
    Brand VARCHAR(255),
    Price DECIMAL(10, 2),
    Description TEXT,
    CategoryID INT,
    FOREIGN KEY (CategoryID) REFERENCES Category(CategoryID)
);

-- 6. Category Table
CREATE TABLE Category (
    CategoryID INT AUTO_INCREMENT PRIMARY KEY,
    CategoryName VARCHAR(255)
);

-- 7. Store Table
CREATE TABLE Store (
    StoreID INT AUTO_INCREMENT PRIMARY KEY,
    StoreName VARCHAR(255),
    Location VARCHAR(255),
    Latitude DECIMAL(9, 6),
    Longitude DECIMAL(9, 6)
);

-- 8. Product Location Table
CREATE TABLE ProductLocation (
    ProductLocationID INT AUTO_INCREMENT PRIMARY KEY,
    ProductID INT,
    StoreID INT,
    StockQuantity INT,
    FOREIGN KEY (ProductID) REFERENCES Product(ProductID),
    FOREIGN KEY (StoreID) REFERENCES Store(StoreID)
);

-- 9. Product Reviews Table
CREATE TABLE ProductReviews (
    ReviewID INT AUTO_INCREMENT PRIMARY KEY,
    ProductID INT,
    UserID INT,
    Rating INT CHECK (Rating BETWEEN 1 AND 5),
    ReviewText TEXT,
    ReviewDate DATETIME,
    FOREIGN KEY (ProductID) REFERENCES Product(ProductID),
    FOREIGN KEY (UserID) REFERENCES User(UserID)
);

-- 10. Wishlist Table
CREATE TABLE Wishlist (
    WishlistID INT AUTO_INCREMENT PRIMARY KEY,
    UserID INT,
    ProductID INT,
    DateAdded DATETIME,
    FOREIGN KEY (UserID) REFERENCES User(UserID),
    FOREIGN KEY (ProductID) REFERENCES Product(ProductID)
);

-- 11. FAQs Table
CREATE TABLE FAQs (
    FAQID INT AUTO_INCREMENT PRIMARY KEY,
    Question TEXT,
    Answer TEXT,
    Category VARCHAR(255)
);

-- 12. Customer Support Tickets Table
CREATE TABLE CustomerSupportTickets (
    TicketID INT AUTO_INCREMENT PRIMARY KEY,
    UserID INT,
    IssueDescription TEXT,
    Status ENUM('Open', 'In Progress', 'Resolved', 'Closed'),
    CreatedDate DATETIME,
    ResolvedDate DATETIME NULL,
    FOREIGN KEY (UserID) REFERENCES User(UserID)
);

-- 13. Shipping Information Table
CREATE TABLE ShippingInformation (
    ShippingID INT AUTO_INCREMENT PRIMARY KEY,
    ShippingMethod VARCHAR(255),
    Cost DECIMAL(10, 2),
    EstimatedDeliveryTime VARCHAR(255),
    AdditionalDetails TEXT
);

-- 14. Payment Information Table
CREATE TABLE PaymentInformation (
    PaymentID INT AUTO_INCREMENT PRIMARY KEY,
    OrderID INT,
    PaymentMethod ENUM('Credit Card', 'PayPal'),
    PaymentAmount DECIMAL(10, 2),
    PaymentStatus ENUM('Completed', 'Pending'),
    FOREIGN KEY (OrderID) REFERENCES OrderHistory(OrderID)
);

-- 15. Fashion Table
CREATE TABLE Fashion (
    FashionID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(255),
    Brand VARCHAR(255),
    Price DECIMAL(10, 2),
    Color VARCHAR(50),
    Size VARCHAR(50),
    Material VARCHAR(255),
    Style ENUM('Casual', 'Formal'),
    Pattern ENUM('Solid', 'Striped'),
    Season ENUM('Spring', 'Fall','Summer', 'Winter'),
    QuantityInStock INT,
    Description TEXT,
    CategoryID INT,
    FOREIGN KEY (CategoryID) REFERENCES Category(CategoryID)
);

-- 16. Groceries Table
CREATE TABLE Groceries (
    GroceryID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(255),
    Brand VARCHAR(255),
    Price DECIMAL(10, 2),
    QuantityInStock INT,
    ExpiryDate DATETIME,
    Weight DECIMAL(10, 2),
    Packaging ENUM('Box', 'Bag','Bottle','Package'),
    Organic BOOLEAN,
    NutritionalInfo TEXT,
    Description TEXT,
    CategoryID INT,
    FOREIGN KEY (CategoryID) REFERENCES Category(CategoryID)
);

-- 17. Stationery Table
CREATE TABLE Stationery (
    StationeryID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(255),
    Brand VARCHAR(255),
    Price DECIMAL(10, 2),
    QuantityInStock INT,
    Type VARCHAR(255),
    Material VARCHAR(255),
    Color VARCHAR(50),
    Size VARCHAR(50),
    PageCount INT,
    Description TEXT,
    CategoryID INT,
    FOREIGN KEY (CategoryID) REFERENCES Category(CategoryID)
);

-- 18. Games Table
CREATE TABLE Games (
    GameID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(255),
    Platform VARCHAR(255),
    Price DECIMAL(10, 2),
    Genre VARCHAR(255),
    ReleaseDate DATETIME,
    Rating VARCHAR(10),
    Developer VARCHAR(255),
    Publisher VARCHAR(255),
    Description TEXT,
    CategoryID INT,
    FOREIGN KEY (CategoryID) REFERENCES Category(CategoryID)
);

-- 19. Electronics Table
CREATE TABLE Electronics (
    ElectronicsID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(255),
    Brand VARCHAR(255),
    Price DECIMAL(10, 2),
    ModelNumber VARCHAR(255),
    QuantityInStock INT,
    Specifications TEXT,
    WarrantyPeriod VARCHAR(50),
    PowerRequirements VARCHAR(50),
    Connectivity VARCHAR(50),
    Description TEXT,
    CategoryID INT,
    FOREIGN KEY (CategoryID) REFERENCES Category(CategoryID)
);

-- 20. Health and Wellness Table
CREATE TABLE HealthAndWellness (
    HealthWellnessID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(255),
    Brand VARCHAR(255),
    Price DECIMAL(10, 2),
    QuantityInStock INT,
    Type ENUM('Vitamin', 'Supplement'),
    ExpiryDate DATETIME,
    Dosage VARCHAR(255),
    Ingredients TEXT,
    HealthBenefits TEXT,
    Description TEXT,
    CategoryID INT,
    FOREIGN KEY (CategoryID) REFERENCES Category(CategoryID)
);

-- 21. Pets Table
CREATE TABLE Pets (
    PetID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(255),
    Brand VARCHAR(255),
    Price DECIMAL(10, 2),
    QuantityInStock INT,
    Type ENUM('Food', 'Toy', 'Accessory'),
    Size ENUM('Small', 'Large', 'Medium', 'Standard'),
    AnimalType VARCHAR(255),
    Ingredients TEXT,
    Description TEXT,
    CategoryID INT,
    FOREIGN KEY (CategoryID) REFERENCES Category(CategoryID)
);

-- 1. User Table
INSERT INTO User (FirstName, LastName, Email, PhoneNumber, Address, RegistrationDate) VALUES
('John', 'Doe', 'john.doe@example.com', '123-456-7890', '123 Elm Street, Springfield', NOW()),
('Jane', 'Smith', 'jane.smith@example.com',  '123-456-7891', '456 Oak Avenue, Springfield', NOW()),
('Alice', 'Johnson', 'alice.johnson@example.com','123-456-7892', '789 Pine Road, Springfield', NOW()),
('Bob', 'Brown', 'bob.brown@example.com', '123-456-7893', '321 Maple Street, Springfield', NOW()),
('Charlie', 'Davis', 'charlie.davis@example.com',  '123-456-7894', '654 Birch Lane, Springfield', NOW());

-- 2. Category Table (needed for other tables)
INSERT INTO Category (CategoryName) VALUES
('Clothing'),
('Electronics'),
('Groceries'),
('Stationery'),
('Games'),
('Health & Wellness'),
('Pets');

-- 3. Product Table
INSERT INTO Product (Name, Brand, Price, Description, CategoryID) VALUES
('T-Shirt', 'BrandA', 19.99, 'A comfortable cotton t-shirt.', 1),
('Laptop', 'BrandB', 899.99, 'A high-performance laptop.', 2),
('Milk', 'BrandC', 1.29, '1 liter of whole milk.', 3),
('Notebook', 'BrandD', 5.49, 'A durable notebook for all your notes.', 4),
('Video Game', 'BrandE', 59.99, 'An exciting new video game.', 5);

-- 4. Store Table
INSERT INTO Store (StoreName, Location, Latitude, Longitude) VALUES
('Store A', '123 Main Street, Springfield', 39.7817, -89.6501),
('Store B', '456 Elm Street, Springfield', 39.7818, -89.6502),
('Store C', '789 Oak Avenue, Springfield', 39.7819, -89.6503),
('Store D', '321 Pine Road, Springfield', 39.7820, -89.6504),
('Store E', '654 Maple Lane, Springfield', 39.7821, -89.6505);

-- 5. Product Location Table
INSERT INTO ProductLocation (ProductID, StoreID, StockQuantity) VALUES
(1, 1, 100),
(2, 2, 50),
(3, 3, 200),
(4, 4, 75),
(5, 5, 30);

-- 6. Product Reviews Table
INSERT INTO ProductReviews (ProductID, UserID, Rating, ReviewText, ReviewDate) VALUES
(1, 1, 5, 'Great t-shirt, very comfortable!', NOW()),
(2, 2, 4, 'Good laptop but a bit expensive.', NOW()),
(3, 3, 3, 'Milk is okay, nothing special.', NOW()),
(4, 4, 5, 'The notebook is perfect for my needs.', NOW()),
(5, 5, 4, 'Fun game, but a bit short.', NOW());

-- 7. Wishlist Table
INSERT INTO Wishlist (UserID, ProductID, DateAdded) VALUES
(1, 2, NOW()),
(2, 1, NOW()),
(3, 5, NOW()),
(4, 4, NOW()),
(5, 3, NOW());

-- 8. Search History Table
INSERT INTO SearchHistory (UserID, SearchTerm, SearchDate, ResultsCount) VALUES
(1, 'T-Shirt', NOW(), 20),
(2, 'Laptop', NOW(), 15),
(3, 'Milk', NOW(), 30),
(4, 'Notebook', NOW(), 25),
(5, 'Video Game', NOW(), 10);

-- 9. Order History Table
INSERT INTO OrderHistory (UserID, OrderDate, TotalAmount, OrderStatus) VALUES
(1, NOW(), 19.99, 'Shipped'),
(2, NOW(), 899.99, 'Pending'),
(3, NOW(), 1.29, 'Delivered'),
(4, NOW(), 5.49, 'Cancelled'),
(5, NOW(), 59.99, 'Delivered');

-- 10. Order Items Table
INSERT INTO OrderItems (OrderID, ProductID, Quantity, UnitPrice) VALUES
(1, 1, 1, 19.99),
(2, 2, 1, 899.99),
(3, 3, 1, 1.29),
(4, 4, 1, 5.49),
(5, 5, 1, 59.99);

-- 11. FAQs Table
INSERT INTO FAQs (Question, Answer, Category) VALUES
('What is the return policy?', 'You can return items within 30 days of purchase.', 'General'),
('How can I track my order?', 'Use the tracking number provided in your confirmation email.', 'Order Tracking'),
('Do you offer international shipping?', 'Yes, we offer international shipping.', 'Shipping'),
('How can I contact customer support?', 'You can reach us via email or phone.', 'Contact'),
('What payment methods are accepted?', 'We accept credit cards, PayPal, and gift cards.', 'Payment');

-- 12. Customer Support Tickets Table
INSERT INTO CustomerSupportTickets (UserID, IssueDescription, Status, CreatedDate) VALUES
(1, 'Received the wrong item.', 'Open', NOW()),
(2, 'Laptop not working properly.', 'In Progress', NOW()),
(3, 'Milk carton was damaged.', 'Resolved', NOW()),
(4, 'Notebook pages are missing.', 'Closed', NOW()),
(5, 'Game did not start.', 'Open', NOW());

-- 13. Shipping Information Table
INSERT INTO ShippingInformation (ShippingMethod, Cost, EstimatedDeliveryTime, AdditionalDetails) VALUES
('Standard', 5.00, '5-7 Business Days', 'No additional details.'),
('Express', 15.00, '2-3 Business Days', 'Guaranteed delivery within 3 days.'),
('Overnight', 25.00, '1 Business Day', 'Delivery by the next business day.'),
('International', 50.00, '7-14 Business Days', 'Delivery times vary by destination.'),
('Same Day', 30.00, 'Same Day', 'Available for local deliveries only.');

-- 14. Payment Information Table
INSERT INTO PaymentInformation (OrderID, PaymentMethod, PaymentAmount, PaymentStatus) VALUES
(1, 'Credit Card', 19.99, 'Completed'),
(2, 'PayPal', 899.99, 'Pending'),
(3, 'Credit Card', 1.29, 'Completed'),
(4, 'Credit Card', 5.49, 'Completed'),
(5, 'PayPal', 59.99, 'Completed');

-- 15. Fashion Table
INSERT INTO Fashion (Name, Brand, Price, Color, Size, Material, Style, Pattern, Season, QuantityInStock, Description, CategoryID) VALUES
('Casual Shirt', 'BrandF', 29.99, 'Blue', 'L', 'Cotton', 'Casual', 'Solid', 'Summer', 50, 'A stylish casual shirt.', 1),
('Formal Suit', 'BrandG', 199.99, 'Black', 'M', 'Wool', 'Formal', 'Striped', 'Winter', 20, 'Elegant formal suit.', 1),
('Summer Dress', 'BrandH', 49.99, 'Red', 'S', 'Silk', 'Casual', 'Solid', 'Spring', 30, 'Light summer dress.', 1),
('Leather Jacket', 'BrandI', 149.99, 'Brown', 'XL', 'Leather', 'Casual', 'Solid', 'Fall', 15, 'Durable leather jacket.', 1),
('Winter Coat', 'BrandJ', 89.99, 'Grey', 'L', 'Polyester', 'Formal', 'Solid', 'Winter', 25, 'Warm winter coat.', 1);

-- 16. Groceries Table
INSERT INTO Groceries (Name, Brand, Price, QuantityInStock, ExpiryDate, Weight, Packaging, Organic, NutritionalInfo, Description, CategoryID) VALUES
('Apple', 'BrandK', 0.99, 100, '2024-09-30', 0.2, 'Bag', TRUE, '52 calories per 100g', 'Fresh red apple.', 3),
('Bread', 'BrandL', 2.49, 50, '2024-08-15', 0.5, 'Bag', FALSE, '250 calories per slice', 'Whole grain bread.', 3),
('Cheese', 'BrandM', 4.99, 25, '2024-10-01', 0.3, 'Box', FALSE, '400 calories per 100g', 'Aged cheddar cheese.', 3),
('Chicken Breast', 'BrandN', 5.99, 75, '2024-08-10', 0.5, 'Package', TRUE, '165 calories per 100g', 'Boneless chicken breast.', 3),
('Orange Juice', 'BrandO', 3.99, 40, '2024-08-20', 1.0, 'Bottle', FALSE, '45 calories per 100ml', 'Fresh orange juice.', 3);

-- 17. Stationery Table
INSERT INTO Stationery (Name, Brand, Price, QuantityInStock, Type, Material, Color, Size, PageCount, Description, CategoryID) VALUES
('Pen', 'BrandP', 1.49, 200, 'Ballpoint', 'Plastic', 'Blue', 'Medium', NULL, 'Smooth writing pen.', 4),
('Notebook', 'BrandQ', 3.99, 100, 'Spiral', 'Paper', 'Black', 'A4', 100, 'Spiral-bound notebook.', 4),
('Binder', 'BrandR', 4.99, 50, 'Ring', 'Plastic', 'Red', 'A4', NULL, 'Durable binder for documents.', 4),
('Pencil Case', 'BrandS', 2.99, 75, 'Zipper', 'Fabric', 'Green', 'Small', NULL, 'Canvas pencil case.', 4),
('Highlighter', 'BrandT', 1.99, 150, 'Marker', 'Plastic', 'Yellow', 'Standard', NULL, 'Bright highlighter marker.', 4);

-- 18. Games Table
INSERT INTO Games (Name, Platform, Price, Genre, ReleaseDate, Rating, Developer, Publisher, Description, CategoryID) VALUES
('Adventure Quest', 'PC', 29.99, 'Adventure', '2024-06-01', 'E', 'DevStudios', 'Publishers Inc.', 'An exciting adventure game.', 5),
('Puzzle Master', 'Console', 19.99, 'Puzzle', '2024-05-15', 'E', 'PuzzleMakers', 'Games Corp.', 'Challenging puzzle game.', 5),
('Racing Fury', 'PC', 39.99, 'Racing', '2024-07-10', 'T', 'RaceDev', 'Speed Publishers', 'Fast-paced racing game.', 5),
('Strategy World', 'Mobile', 9.99, 'Strategy', '2024-08-01', 'E', 'StratWorks', 'Mobile Games', 'Deep strategy game.', 5),
('Sports Champ', 'Console', 49.99, 'Sports', '2024-03-20', 'E', 'SportyDev', 'Play Publishers', 'Realistic sports simulation.', 5);

-- 19. Electronics Table
INSERT INTO Electronics (Name, Brand, Price, ModelNumber, QuantityInStock, Specifications, WarrantyPeriod, PowerRequirements, Connectivity, Description, CategoryID) VALUES
('Smartphone', 'BrandU', 499.99, 'SM123', 50, '8GB RAM, 128GB Storage', '2 Years', '5V', 'Wi-Fi, Bluetooth', 'Latest model smartphone.', 2),
('Headphones', 'BrandV', 89.99, 'HP456', 75, 'Noise Cancelling', '1 Year', 'USB-C', 'Bluetooth', 'High-quality wireless headphones.', 2),
('Smartwatch', 'BrandW', 199.99, 'SW789', 30, 'Heart Rate Monitor, GPS', '1 Year', 'USB-C', 'Bluetooth', 'Smartwatch with fitness tracking.', 2),
('Tablet', 'BrandX', 299.99, 'TB012', 40, '10-inch Screen, 64GB Storage', '1 Year', '5V', 'Wi-Fi, Bluetooth', 'Versatile tablet for work and play.', 2),
('Camera', 'BrandY', 899.99, 'CM345', 20, '24MP, 4K Video', '2 Years', 'AC 110V', 'Wi-Fi, Bluetooth', 'High-resolution digital camera.', 2);

-- 20. Health and Wellness Table
INSERT INTO HealthAndWellness (Name, Brand, Price, QuantityInStock, Type, ExpiryDate, Dosage, Ingredients, HealthBenefits, Description, CategoryID) VALUES
('Vitamin C', 'BrandZ', 9.99, 100, 'Vitamin', '2025-01-01', '1 tablet daily', 'Ascorbic Acid', 'Boosts immune system.', 'Essential vitamin C supplement.', 6),
('Omega-3 Fish Oil', 'BrandAA', 19.99, 75, 'Supplement', '2024-12-01', '2 capsules daily', 'Fish Oil', 'Supports heart health.', 'Omega-3 fatty acids supplement.', 6),
('Protein Powder', 'BrandBB', 29.99, 50, 'Supplement', '2024-11-01', '1 scoop daily', 'Whey Protein', 'Builds muscle mass.', 'High-quality protein powder.', 6),
('Multivitamins', 'BrandCC', 15.99, 100, 'Vitamin', '2025-02-01', '1 tablet daily', 'Various Vitamins', 'Supports overall health.', 'Complete multivitamin supplement.', 6),
('Probiotic', 'BrandDD', 14.99, 60, 'Supplement', '2024-10-01', '1 capsule daily', 'Lactobacillus', 'Improves digestive health.', 'Probiotic supplement for gut health.', 6);

-- 21. Pets Table
INSERT INTO Pets (Name, Brand, Price, QuantityInStock, Type, Size, AnimalType, Ingredients, Description, CategoryID) VALUES
('Dog Food', 'BrandEE', 29.99, 100, 'Food', 'Large', 'Dog', 'Chicken, Rice', 'Nutritious food for large dogs.', 7),
('Cat Toy', 'BrandFF', 9.99, 50, 'Toy', 'Small', 'Cat', 'Plastic', 'Interactive toy for cats.', 7),
('Dog Bed', 'BrandGG', 49.99, 30, 'Accessory', 'Large', 'Dog', 'Cotton', 'Comfortable bed for dogs.', 7),
('Cat Food', 'BrandHH', 24.99, 75, 'Food', 'Small', 'Cat', 'Fish, Rice', 'Healthy food for cats.', 7),
('Pet Shampoo', 'BrandII', 14.99, 60, 'Accessory', 'Standard', 'All', 'Natural Ingredients', 'Gentle shampoo for pets.', 7);
