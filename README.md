# 🖥️ Beyond Borders: Books and More - Database Development

Welcome to the **Beyond Borders: Books and More** database project! This repository showcases the comprehensive work done to create a centralized master database for a fictional chain of bookstores based in California. The goal was to replace the existing vendor-based systems with a robust, scalable solution that covers all key business operations.

## 🛠️ Project Background
**Beyond Borders**, a chain of five bookstores, is undergoing a digital transformation. Under the leadership of their new CEO, the company is moving towards a centralized "world brain" database. This project forms the backbone of that transformation, laying out the framework to manage essential areas such as:

• **Books:** Manage book-related details, including inventory and sales.

•	**Sales:** Track and analyze sales transactions across all locations.

•	**Café:** Handle café operations, including menu items and sales.

•	**Staff:** Maintain employee records, shift hours, and payroll data.

The database also provides the foundation for potential future expansions into areas such as:

•	**Products, Publishers, and Vendors:** Detailed management of suppliers for books, music, movies, and merchandise.

•	**Music, Movies, and Merch:** Extend the inventory management system to these categories.

## 📊 Key Views & Analytics
To provide actionable insights, the database includes predefined views that offer a comprehensive look at the business:

•	**Store Inventory:** Keep track of the available stock at each store.

•	**Store Sales:** Monitor sales performance on a store-by-store basis.

•	**Company-Wide Sales/Stock Data:** Get an aggregated view of sales and stock levels across all locations.

•	**Employee Hours:** Record and analyze the working hours of employees.

•	**Weekly Store Profits:** Calculate weekly profits for each store by considering sales and staff costs

## 🪜 Project Structure
• **ER Diagram:** a visual representation of the database's structure. It defines the entities (such as Books, Sales, Café, and Staff) and the relationships between them, providing a clear blueprint of how data is organized and interconnected.

Created using the [ERDPlus Tool](https://erdplus.com/).

![Database ER Diagram](https://github.com/AyahIbrahim/database-development/blob/b54f044e959bdd5d40b926351e673f337554d3bb/Diagrams%20-%20ER%20%26%20Relation%20Schema/ER%20Diagram.png)

• **Relational Schema:** The relational schema translates the conceptual ER diagram into a practical database design. It outlines the tables, columns, and relationships in the database, ensuring that the structure is normalized and optimized for performance. The schema includes primary and foreign keys, as well as constraints, to maintain data integrity and consistency. 

![Database Relational Schema](https://github.com/AyahIbrahim/database-development/blob/b54f044e959bdd5d40b926351e673f337554d3bb/Diagrams%20-%20ER%20%26%20Relation%20Schema/Relational%20Schema.png)

• **SQL Scripts:** SQL code for creating tables, importing data, and generating views.

• **Mock Data:** Fictional data generated using [Mockaroo](https://www.mockaroo.com/) for creativity and testing purposes.

• **Documentation:** Detailed steps taken to complete each part of the project, along with challenges faced and solutions implemented.

## 💡 Challenges & Lessons Learned
Every project has its hurdles. Here are a few I overcame:

• **Data Integration Issues:** I had to ensure unique product IDs across categories—books, café items, movies, and music—to prevent data conflicts.

• **File Permissions:** I tackled permission errors during data imports by adjusting file locations.

## 🎯 Why This Matters
By centralizing data, Beyond Borders can:

• **Improve Operational Efficiency:** Real-time access to data helps in managing inventory and sales more effectively.

• **Enhance Customer Experience:** With better stock management, customers always find what they’re looking for.

• **Scale Seamlessly:** The database is built to accommodate future business needs.
