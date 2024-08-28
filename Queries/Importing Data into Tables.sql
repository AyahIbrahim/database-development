/*
Importing data from my flat files to the local tables created.
*/

-- Table 1: Cafes
Copy Cafes
FROM 'C:\Cafes.csv'
DELIMITER ','
CSV HEADER;

-- Table 2: Staff
Copy Staff
FROM 'C:\Staff.csv'
DELIMITER ','
CSV HEADER;

-- Table 3: Transactions
Copy Transactions
FROM 'C:\Transactions.csv'
DELIMITER ','
CSV HEADER;

-- Table 4: Shift_Hours
Copy Shift_Hours
FROM 'C:\Shift Hours.csv'
DELIMITER ','
CSV HEADER;

-- Table 5: Vendors
Copy Vendors
FROM 'C:\Vendors.csv'
DELIMITER ','
CSV HEADER;

-- Table 6: Products
Copy Products
FROM 'C:\Products.csv'
DELIMITER ','
CSV HEADER;

-- Table 7: Sale Items
Copy Sale_Items
FROM 'C:\Sale Items.csv'
DELIMITER ','
CSV HEADER;

-- Table 8: Cafe Items
Copy Cafe_Items
FROM 'C:\Cafe Items.csv'
DELIMITER ','
CSV HEADER;-- Table 9: Movie Items
Copy Movie_Items
FROM 'C:\Movie Items.csv'
DELIMITER ','
CSV HEADER;

-- Table 10: Music Items
Copy Music_Items
FROM 'C:\Music Items.csv'
DELIMITER ','
CSV HEADER;

-- Table 11: Publishers
Copy Publishers
FROM 'C:\Publishers.csv'
DELIMITER ','
CSV HEADER;

-- Table 12: Book Items
Copy Book_Items
FROM 'C:\Book Items.csv'
DELIMITER ','
CSV HEADER;