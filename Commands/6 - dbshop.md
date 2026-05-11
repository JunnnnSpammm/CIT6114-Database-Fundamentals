## Create a new database dbshop. Next create the above tables (clearly define the primary and foreign keys).

### 1. In Windows File Explorer, create a folder of “D:\bin\bookdb”.
Within D:\bin\bookdb, create the following two text files of lab06createinv.sql and lab06insert.sql.

```sql
-- lab06createinv.sql
create table Buyer
(BuyerID DECIMAL(10) not null,
BuyerName VARCHAR(30),
BuyerPhone VARCHAR(11),
BuyerStatus VARCHAR(10),
primary key (BuyerID)
);

create table Item
(ItemID DECIMAL(10) not null,  
ItemName VARCHAR(50),
ItemType VARCHAR(20),
ItemPrice DECIMAL(10,2),
ItemBal DECIMAL(5),   
primary key (ItemID)
);

create table Sales
(SalesID DECIMAL(10) not null,
SalesName VARCHAR(50),
SalesPhone VARCHAR(11),
primary key (SalesID)
);

create table Invoice
(InvoiceID DECIMAL(10) not null,
InvoiceDate date,
BuyerID DECIMAL(10),
InvoiceQty DECIMAL(10),
ItemID DECIMAL(10),
SalesID DECIMAL(10),
primary key (InvoiceID),
foreign key (BuyerID) references Buyer, 
foreign key (ItemID) references Item,
foreign key (SalesID) references Sales
);
```

```sql
-- lab06insert.sql

insert into Sales values (56523,'Florence', '60135698231');
insert into Sales values (23598,'Zelda', '60125479563');
insert into Sales values (98665,'Clarry', '60148597965');
insert into Sales values (13579,'Nasri', '60195624664');
insert into Sales values (68595,'Arshavin', '60168462649');

insert into Item values (659,'LCD Monitor', 'Computer', 900.99, 50);
insert into Item values (965,'Pen', 'Stationary', 1.64, 3);
insert into Item values (855,'Printer', 'Computer', 300.55, 1);

insert into Item values (698,'Fan', 'Electrical', 86.11, 4);
insert into Item values (598,'Rubber', 'Stationary', 0.63, 98);
insert into Item values (456,'Hardisc', 'Computer', 250.81, 2);
insert into Item values (879,'Pen Drive', 'Computer', 98.65, 78);
insert into Item values (989,'Nokia Phone', 'Electrical', 980.21, 100);
insert into Item values (888,'Camera', 'Electrical', 1230.36, 8);

insert into Buyer values (1,'Jerremy', '60125689766', 'Active');
insert into Buyer values (2,'Cech', '60135695469', 'Not Active');
insert into Buyer values (3,'Meluda', '60191346876', 'Active');
insert into Buyer values (4,'Jessica', '60168954615', 'Active');
insert into Buyer values (5,'Toure', '60136546586', 'Not Active');
insert into Buyer values (6,'Jesmon', '60145226569', 'Active');
insert into Buyer values (7,'Torres', '60125469788', 'Active');
insert into Buyer values (8,'Martin', '60135468798', 'Not Active');
insert into Buyer values (9,'Taylor', '60124659789', 'Active');

insert into Invoice values (10010,'2008-12-15', 1, 2, 659, 68595);
insert into Invoice values (10011,'2006-01-13', 3, 26, 879, 56523);
insert into Invoice values (10012,'2008-03-06', 4, 8, 989, 23598);
insert into Invoice values (10013,'2007-10-28', 1, 10, 965, 13579);
insert into Invoice values (10014,'2008-05-16', 7, 6, 888, 98665);
insert into Invoice values (10015,'2008-12-01', 6, 1, 456, 13579);
insert into Invoice values (10016,'2008-12-03', 3, 7, 659, 98665);
```
### 2. At Windows desktop, double click DockerDesktop icon. Click “Start” button for ‘opengauss’ 
In Windows command prompt (“cmd”),

```powershell
# Start the existing container
docker start opengauss

# Verify it's running
docker ps

docker cp D:\bin\bookdb\lab06createinv.sql opengauss:/home/omm/dbfnd
docker cp D:\bin\bookdb\lab06insert.sql opengauss:/home/omm/dbfnd
```

### 3. In Docker Desktop,

1. At right-pane “Actions”, click the ‘three dots’ icon - circled below.
2. In the pop-up dialog, select “View details” menu item. Next, click “Files” tab. The transferred files appear in “/home/omm/dbfnd”.

### 4. In the Windows command prompt,
```powershell
docker exec -it opengauss bash

# Change from root to omm user
su - omm
gsql

# It will take a while to create the database. Need to be patience :-).
CREATE DATABASE dbshop;

\l      # List available databases
\q      # To quit openGauss

cd dbfnd
gsql -d dbshop -f lab06createinv.sql
gsql -d dbshop -f lab06insert.sql
gsql -d dbshop -r  # Connect to the database named ‘dbshop’

# Successful list of tables in database
\dt

# Issue SQL statement terminated with semicolon (;)
SELECT * FROM Sales;
SELECT * FROM Invoice;
SELECT * FROM Buyer;
SELECT * FROM Item;
```

### 5. In DBeaver, Ctrl+Shift+N for New Database Connection.
1. Choose openGauss, click Next.
2. Change the Database to the new database name: i.e. ad1. Enter the password you have provided during openGauss installation

> Database/Schema: dbshop
> 
> host: localhost (referring to your openGauss server ip)
> 
> port: 5432
> 
> Username: ogc
> 
> Password: 'Zxcv@123'

3. Click “Test Connection” button.

### In DBeaver left pane

1. Right-click “dbshop” database icon, and click “Connect” pop-up item. Next, at “Select Data Source” drop-down-list icon, select “dbshop” database.
2. In DBeaver, select ‘SQL Editor’ menu, follow by “Open SQL console” menu item.
3. In the console, put in all the following SQL statements. Highlight each line and press “Ctrl + Enter” to execute each line individually:

```sql
select BuyerName, BuyerPhone from Buyer order by BuyerName;
select SalesName from Buyer, Invoice, Sales where Buyer.BuyerID = Invoice.BuyerID and Sales.SalesID = Invoice.SalesID and Buyer.BuyerName = 'Jerremy';
select SalesName, SalesPhone from Invoice, Sales, Item where Sales.SalesID = Invoice.SalesID and InvoiceDate BETWEEN '2008-12-01' AND '2008-12-31' and Item.ItemType ='Computer' and Item.ItemID = Invoice.ItemID;
select ItemName, ItemPrice, ItemBal, ItemPrice*ItemBal as TotalValue from Item WHERE ItemType NOT IN ('Computer');
select BuyerName from buyer where buyerphone LIKE '6013%';
```

**Note:** In DBeaver, another alternative is clicking ‘SQL Editor > Execute SQL query’ to execute each SQL script separately.

**Important:** If unable to view the data, please perform the following commands in previous first “omm” cmd prompt:

```sql
-- Grant all standard privileges on existing tables
GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA public TO ogc;

-- Grant privileges on sequences (needed for SERIAL columns)
GRANT ALL PRIVILEGES ON ALL SEQUENCES IN SCHEMA public TO ogc;

-- Optional: make future tables/sequences automatically granted
ALTER DEFAULT PRIVILEGES IN SCHEMA public GRANT ALL PRIVILEGES ON TABLES TO ogc;
ALTER DEFAULT PRIVILEGES IN SCHEMA public GRANT ALL PRIVILEGES ON SEQUENCES TO ogc;
```

### Stop Docker
```powershell
# To quit openGauss
\q
exit
exit

# At cmd prompt, stop the container
docker stop opengauss

# Verify it is stopped
docker ps -a   # Status should show: Exited (0) Have fun.
```
