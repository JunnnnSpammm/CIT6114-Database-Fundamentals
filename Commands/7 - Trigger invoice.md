## Lab 7 Guide: Trigger invoice

#### Note to student: This tutorial is based on the tables and values created in previous tutorial (i.e., Lab 6). Please ensure that you have created all the four tables and records are inserted before attempting Lab 7.

### 1. At Windows desktop, double click DockerDesktop icon. Click “Start” button for ‘opengauss’ 
In Windows command prompt (“cmd”),

```powershell
# Start the existing container
docker start opengauss

# Verify it's running
docker ps
```

### 2. In the Windows command prompt,
```powershell
# Change from root to omm user
docker exec -it opengauss bash
su - omm

gsql -d dbshop -r
\l     # List available databases
```

### 3. In DBeaver, highlight the following code fragment one by one. 
Right click and select “Execute > Execute SQL query” OR press “Ctrl + Enter” for shortcut to execute the fragment on the dbshop database.

### Part A
1. Write the SQL statement to add an additional column called “InvoicePrice” into the Invoice table.
```sql
ALTER table Invoice ADD InvoicePrice DECIMAL(7,2);
```

2. Update the newly created column InvoicePrice in to calculate the total amount each buyer has to pay for each purchase based on the item quantity purchased and the item unit price (obtained from the item table).
```sql
UPDATE Invoice
  SET InvoicePrice = InvoiceQty * (SELECT ItemPrice FROM Item
                                     WHERE Item.ItemID = Invoice.ItemID);
```

3. List the most expensive item name and price in the company inventory.
```sql
SELECT ItemName, ItemPrice FROM Item
  WHERE ItemPrice = (SELECT MAX(ItemPrice) FROM Item);
```

4. Show the total number of active buyers.
```sql
SELECT COUNT(*) FROM Buyer
  WHERE BuyerStatus = 'Active';
```

5. Display the total price amount of invoice which have the item quantity purchase more then or equals to 10.
```sql
SELECT SUM(InvoicePrice) FROM Invoice
  WHERE InvoiceQty >= 10;
```

6. The company has decided to increase the stock of each item by 5 for items with the type “Electrical”. Write the SQL statement to update each item price.
```sql
UPDATE Item SET ItemBal = ItemBal + 5
  WHERE ItemType = 'Electrical';

SELECT * FROM Item;
```

### Part B (Extra Question)
1. i.	Write the SQL statement to retrieve the SalesPerson name, Item name, and Buyer name for Item which have the price greater than the average item price.
```sql
SELECT s.SalesName, i.ItemName, b.BuyerName
  FROM Sales s, Item i, Buyer b, Invoice v
    WHERE s.SalesID = v.SalesID
      AND i.ItemID = v.ItemID
      AND b.BuyerID = v.BuyerID
      AND i.ItemPrice >= (SELECT AVG(ItemPrice) FROM item);
```

2. Write the SQL statement to display the BuyerName, BuyerPhone and Total_Price (generated as the result of the total for InvoicePrice) whom make a purchase in the month of March 2008.
```sql
-- Group by the remainder attribute in the select list
SELECT b.BuyerName, b.BuyerPhone, SUM(v.InvoicePrice) AS Total_Price
  FROM Buyer b, Invoice v
    WHERE b.buyerID = v.buyerID
      AND v.InvoiceDate between '2008-03-01' and '2008-03-31'
    GROUP BY b.BuyerName, BuyerPhone;
```

### Part C (Extra Question)
> Note: Students are encouraged to try Q1 and Q2 themselves once Lecture 7 is covered. https://www.db2tutorial.com/db2-trigger/db2-create-trigger/

1. Write the trigger so that when a buyer purchase an item, Item Price in invoice is automatically updated based on the respective Item Price. Create the trigger.

In DBeaver, run the following SQL statement:
```sql
SELECT * FROM Invoice;

DELETE FROM Invoice WHERE InvoiceID = 10018;
```

In Command Prompt/Powershell/Terminal, run the following SQL statement as omm (superuser) to create the `fInvPrice()` function.
```sql
CREATE OR REPLACE FUNCTION fInvPrice() 
RETURNS trigger 
LANGUAGE plpgsql 
AS $$ 
BEGIN 
    NEW.InvoicePrice := NEW.InvoiceQty * (SELECT ItemPrice FROM Item WHERE ItemID = NEW.ItemID); 
    RETURN NEW; 
END; 
$$;
```

In DBeaver, disconnect and reconnect back to dbshop database. The function created by superuser now would be available for ogc to use in creating the following trigger.
```sql
-- Create trigger Update_Invoice_Price to call the fInvPrice() function after insert
CREATE TRIGGER Update_Invoice_Price
  BEFORE INSERT ON Invoice
  FOR EACH ROW
  EXECUTE FUNCTION fInvPrice();
```

Verify that the trigger has been successfully created using the following SQL statement. The newly created trigger should be at the bottom of the table.
```sql
SELECT tgname, tgrelid::regclass, tgtype, tgargs FROM pg_trigger;
```

2. Create a new invoice again to test the created trigger in question 7 with the following information:-
    -	Invoice ID = 10018
    -	Buyer name is Martin
    -	Invoice Quantity = 2
    -	Date of invoice 26/01/2008
    -	Sales person in charge Zelda
    -	Item Purchase is Nokia Phone
    -	Invoice Price = NULL (the trigger in question 5 should automatically update this)

```sql
INSERT INTO Invoice VALUES (10018,'2008-01-26', 8, 2, 989, 23598, NULL);

SELECT * FROM INVOICE;

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
