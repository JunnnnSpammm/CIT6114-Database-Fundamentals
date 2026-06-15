# Lab 10 Guide: Talent

## Part A: Concept

### 1. List down the phases in Database Life Cycle (DBLC) and briefly discuss the activities for each phase 

1. **Database Initial Study** - Analyze the company situation, define the system's objectives and scope, and define what the user requirements are.
2. **Database Design** - Create the conceptual, logical, and physical designs for the database to ensure it supports the company’s operations.
3. **Implementation and Loading** - Install the DBMS, create the actual database structures (tables, views, etc.), and populate/load the existing data into the new system.
4. **Testing and Evaluation** - Test the database for integrity, security, and performance. Fix any errors and fine-tune the system based on user feedback.
5. **Operation** - The database is officially considered operational. User queries and transactions are executed, and the system starts generating real-world reports.
6. **Maintenance and Evolution** - Perform regular backups, monitor system performance, implement security audits, and upgrade the system as new requirements arise.

### 2. List down the steps required in the development of an ER diagram

1. **Identify Entities:** Determine the core "things" or objects of interest (e.g., `Customer`, `Product`, `Order`) about which the system needs to store data.
2. **Identify Relationships:** Establish how these entities interact or connect with one another (e.g., a Customer *places* an Order).
3. **Determine Cardinalities and Connectivities:** Define the business rules regarding limits (e.g., one-to-many ($1:M$), many-to-many ($M:N$)) for each relationship.
4. **Identify Attributes:** List the specific traits or characteristics that describe each entity (e.g., `Customer_Name`, `Price`).
5. **Determine Primary Keys (PKs):** Choose the unique identifier for each entity to ensure data uniqueness.
6. **Draw and Review the Diagram:** Map everything out using standard notation (like Crow's Foot syntax) and refine it against user requirements to ensure accuracy.

### 3. What are the differences between data warehouse and data mart? 

| Feature | Data Warehouse (DW) | Data Mart |
| --- | --- | --- |
| **Scope** | Corporate/Enterprise-wide. It integrates data from all departments. | Decentralized/Sectional. It focuses on a single department or subject area. |
| **Target Audience** | Used by the entire organization (e.g., enterprise analysts, executives). | Used by specific teams (e.g., Marketing, Finance, Sales). |
| **Data Source** | Collects data from a wide variety of multiple, disparate operational systems. | Usually sources data from a single Data Warehouse or fewer operational sources. |
| **Size** | Massive (ranging from hundreds of Gigabytes to Terabytes/Petabytes). | Much smaller (typically less than 100 Gigabytes). |
| **Implementation Time** | Long and complex (months or even years to build). | Fast and straightforward (weeks to a few months). |
