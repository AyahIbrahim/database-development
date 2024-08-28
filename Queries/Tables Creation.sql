/*
Creation of Tables for Beyond Borders Database.
*/

-- Table 1: Cafes
CREATE TABLE Cafes (
 Store_ID VARCHAR(50) PRIMARY KEY,
 Address VARCHAR(200) NOT NULL
);

-- Table 2: Staff
CREATE TABLE Staff (
 Employee_ID VARCHAR(50) PRIMARY KEY,
 Name VARCHAR(50) NOT NULL,
 Job_Title VARCHAR(50) NOT NULL,
 Hire_Date DATE NOT NULL,
 Salary NUMERIC(10, 2) NOT NULL,
 Store_ID VARCHAR(50),
 FOREIGN KEY (Store_ID) REFERENCES Cafes(Store_ID)
);

-- Table 3: Transactions
CREATE TABLE Transactions (
 Sales_ID VARCHAR(255) PRIMARY KEY,
Date DATE NOT NULL,
 Total_Paid NUMERIC(10, 2) NOT NULL,
 Payment_Method VARCHAR(50) NOT NULL,
 Employee_ID VARCHAR(50),
 FOREIGN KEY (Employee_ID) REFERENCES Staff(Employee_ID)
);

-- Table 4: Shift_Hours
CREATE TABLE Shift_Hours (
 Shift_ID SERIAL PRIMARY KEY,
 Date DATE NOT NULL,
 Hours_Worked NUMERIC(10, 2) NOT NULL,
 Employee_ID VARCHAR(50),
 FOREIGN KEY (Employee_ID) REFERENCES Staff(Employee_ID)
);

-- Table 5: Vendors
CREATE TABLE Vendors (
 Vendor_ID SERIAL PRIMARY KEY,
 Name VARCHAR(255) NOT NULL,
 Phone_Number VARCHAR(50),
 Email VARCHAR(200)
);

-- Table 6: Products
CREATE TABLE Products (
 Product_ID VARCHAR(255) PRIMARY KEY,
 Unit_Price NUMERIC(10, 2) NOT NULL,
Stock INTEGER NOT NULL,
 Vendor_ID INTEGER,
 FOREIGN KEY (Vendor_ID) REFERENCES Vendors(Vendor_ID)
);

-- Table 7: Sale Items
CREATE TABLE Sale_Items (
 Sale_ItemsID SERIAL PRIMARY KEY,
Price NUMERIC(10, 2) NOT NULL,
 Quantity_Sold INTEGER NOT NULL,
 Sales_ID VARCHAR(255) REFERENCES Transactions(Sales_ID),
 Product_ID VARCHAR(255) REFERENCES Products(Product_ID)
);

-- Table 8: Cafe Items
CREATE TABLE Cafe_Items (
 Cafe_ItemID VARCHAR(255) PRIMARY KEY,
 Name TEXT NOT NULL,
 Calories INTEGER NOT NULL,
 Product_ID VARCHAR(255) REFERENCES Products(Product_ID)
);

-- Table 9: Movie Items
CREATE TABLE Movie_Items (
 Movie_ID SERIAL PRIMARY KEY,
 Title TEXT NOT NULL,
 Director_Name TEXT NOT NULL,
 Genre TEXT NOT NULL,
 Release_Date DATE NOT NULL,
 Product_ID VARCHAR(255) REFERENCES Products(Product_ID)
);

-- Table 10: Music Items
CREATE TABLE Music_Items (
 Music_ID SERIAL PRIMARY KEY,
 Title TEXT NOT NULL,
 Artist_Name TEXT NOT NULL,
 Product_ID VARCHAR(255) REFERENCES Products(Product_ID)
);

-- Table 11: Book Publishers
CREATE TABLE Publishers (
 Publisher_ID SERIAL PRIMARY KEY,
 Publisher_Name TEXT NOT NULL,
 Email TEXT NOT NULL
);-- Table 12: Book Items
CREATE TABLE Book_Items (
 Book_ID SERIAL PRIMARY KEY,
 ISBN VARCHAR(50) NOT NULL,
 Title TEXT NOT NULL,
 Author_Name TEXT NOT NULL,
 Genre TEXT NOT NULL,
 Publication_Date DATE NOT NULL,
 Product_ID VARCHAR(255) REFERENCES Products(Product_ID),
 Publisher_ID INTEGER REFERENCES Publishers(Publisher_ID)
);