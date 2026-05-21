## Lab 8 Guide: Trigger Function product

## Part A: SQL - Triggers

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
Right click and select “Execute > Execute SQL query” OR press “Ctrl + Enter” for shortcut to execute the fragment.

```sql
DROP TABLE IF EXISTS product;
DROP TABLE IF EXISTS product2;

-- Create table product
CREATE TABLE IF NOT EXISTS product (
    p_code VARCHAR(10) PRIMARY KEY NOT NULL,
    p_descript VARCHAR(30),
    p_onhand DECIMAL(5),
    p_min DECIMAL(5),
    p_price DECIMAL(7,2),
    p_discount DECIMAL(7,2),
    p_min_order DECIMAL(5),
    p_reorder DECIMAL(5)
);

-- Insert data into the product table
INSERT INTO product VALUES ('A0001', 'Book', 8, 5, 12.67, 0.00, 25, 0);
INSERT INTO product VALUES ('A0002', 'Pencil', 10,15,0.50, 0.05, 50, 0);
INSERT INTO product VALUES ('A0003', 'Ruler', 18, 12, 0.80, 0.00, 50, 0);
INSERT INTO product VALUES ('A0004', 'Eraser', 15, 8, 0.30, 0.00, 35, 0);
INSERT INTO product VALUES ('A0005', 'Pen', 23, 5, 1.20, 0.05, 25, 0);

-- examine the contents of the table
SELECT * FROM PRODUCT;
```

### 4. Enter the following commands to create a trigger.
> **Hint:** In DBeaver, highlight the following ‘create function’ code fragment. At the highlighted code fragment, and press “Ctrl + Enter”. Next, highlight ‘create trigger’ code fragment, and press “Ctrl + Enter”.

1. In Command Prompt/Powershell/Terminal, run the following SQL statement as omm (superuser) to create the fprod() function (at omm prompt).
```sql
CREATE or REPLACE FUNCTION fprod()
  RETURNS trigger
  LANGUAGE plpgsql AS
  $$
    BEGIN
      UPDATE product
        SET p_reorder = 1
          WHERE p_onhand <= p_min;
      RETURN NULL;
    END;
  $$;
```

2. In DBeaver, disconnect and reconnect back to dbshop database. The function created by superuser now would be available for ogc to use in creating the following trigger.
```sql
-- Create trigger reorder1 to call the fprod() function after insert
CREATE TRIGGER reorder1
  AFTER INSERT ON product
  FOR EACH ROW
  EXECUTE FUNCTION fprod();
```

3. Verify that the trigger has been successfully created using the following SQL statement. The newly created trigger should be at the bottom of the table.
```sql
SELECT tgname, tgrelid::regclass, tgtype, tgargs FROM pg_trigger;
```

4. Examine the contents of the table. Take note of the p_reorder column.
```sql
SELECT * FROM product;
```

**Note:** In case any mistakes made in the trigger creation, delete the trigger in the database by typing
```sql
DROP TRIGGER reorder1 ON product;
```

To delete the trigger function, type in the Command Prompt/Terminal as superuser (omm).
```sql
DROP FUNCTION fprod();
```

### 5. Insert the following record into the table:
```sql
Insert into product values ('A0006', 'Bag', 8, 10, 22.75, 0.05, 25, 0);
```

Examine the contents of the table.
```sql
SELECT * FROM product;
```

### 6. In database, you need to create different triggers for different events.
Create the following trigger for the same table.

```sql
-- Create trigger reorder2 to call the fprod function to update p_reorder
CREATE TRIGGER reorder2
  AFTER update of p_onhand, p_min ON product
  FOR EACH ROW
  EXECUTE PROCEDURE fprod();
```

### 7. Execute the following SQL to command to change the quantity on hand of item ‘A0001’:
```sql
Update product
   Set p_onhand = 4
   Where p_code = 'A0001';
```

Examine the contents of the table.
```sql
SELECT * FROM product;
```

### 8. Recreate the product table and name it as Product2:
```sql
-- Create table product2
CREATE TABLE IF NOT EXISTS product2 (
    p_code VARCHAR(10) PRIMARY KEY NOT NULL,
    p_descript VARCHAR(30),
    p_onhand DECIMAL(5),
    p_min DECIMAL(5),
    p_price DECIMAL(7,2),
    p_discount DECIMAL(7,2),
    p_min_order DECIMAL(5),
    p_reorder DECIMAL(5)
);
```

### 9. Insert the following records into Product2 table:
```sql
-- Insert data into product2 table
INSERT INTO product2 VALUES ('A0006', 'Book', 3, 6, 35.99, 0.00, 25, 0);
INSERT INTO product2 VALUES ('A0007', 'Case', 30, 10, 0.50, 0.00, 50, 0);
INSERT INTO product2 VALUES ('A0008', 'Ruler', 10, 12, 0.80, 0.00, 50, 0);
INSERT INTO product2 VALUES ('A0009', 'Staple', 15, 11, 0.80, 0.00, 50, 0);
```

### 10. Remove trigger reorder2. Rewrite the trigger as the following:
```sql
-- Drop existing trigger reorder2
DROP TRIGGER IF EXISTS reorder2 ON product2;

SELECT * FROM product2;
```

```sql
-- Create function to update p_reorder = 1
CREATE or REPLACE FUNCTION fprod2Case()
  RETURNS trigger
  LANGUAGE plpgsql AS
  $$
    BEGIN
      UPDATE product2
        SET p_reorder = CASE
          WHEN new.p_onhand > new.p_min THEN 0
          WHEN new.p_onhand <= new.p_min THEN 1
        END
          WHERE p_code = old.p_code;
      RETURN NULL;
    END;
  $$;
```

```sql
-- Create trigger reorder2 after update
CREATE TRIGGER reorder2
   AFTER UPDATE OF p_onhand, p_min ON product2
   FOR EACH row
   EXECUTE PROCEDURE fprod2Case();

SELECT tgname, tgrelid::regclass, tgtype, tgargs FROM pg_trigger;

SELECT * FROM PRODUCT2;
```

### 11. Execute the following SQL command to change the quantity on hand of item ‘A0007’.
```sql
-- Update product2 table
UPDATE product2
  SET p_onhand = 8
    WHERE p_code = 'A0007';
```

Examine the contents of the table.
```sql
SELECT * FROM product2;
```

### 12. This time execute another SQL command to change the p_min of item ‘A0007’.
```sql
UPDATE product2
  SET p_min = 7
    WHERE p_code = 'A0007';
```

Examine the contents of the table.
```sql
SELECT * FROM product2;
```

## Part B: Please use the Product table for the following exercises:

### 1. Remove the trigger reorder1 using the command ‘DROP TRIGGER reorder1 ON product;’
1. In DBeaver, run the following SQL to delete reorder1 trigger:
```sql
DROP TRIGGER IF EXISTS reorder1 ON product;
```

2. Run the following command in omm Prompt/Powershell/Terminal:
```sql
DROP FUNCTION IF EXISTS fprod() CASCADE;  # delete the previously defined fprod()

-- Create new fprod() function to update p_reorder = 1 after insert
CREATE or REPLACE FUNCTION fprod()
  RETURNS trigger
  LANGUAGE plpgsql AS
  $$
    BEGIN
      UPDATE product
        SET p_reorder = 1
          WHERE (p_onhand <= p_min)
            OR (p_onhand < p_min_order);
      RETURN NULL;
    END;
  $$;  
```

3. SQL statements (in DBeaver):
```sql
-- Create trigger reorder1 to call the fprod() function after insert
CREATE TRIGGER reorder1
  AFTER INSERT ON product
  FOR EACH ROW
  EXECUTE FUNCTION fprod();

SELECT * FROM PRODUCT ORDER BY p_code;

Insert into product values ('A0007', 'Bag', 15, 10, 22.75, 0.05, 12, 0);

SELECT * FROM PRODUCT ORDER BY p_code;
```

### 2. Create a new trigger that will set the discount of an item automatically when a new item record is inserted.
The discount is 0.05 for item price below 15.00 and discount is 0.10 for price 15.00 and above.

1. At omm prompt,
```sql
-- Create single SET function with case to update p_discount
CREATE or REPLACE FUNCTION fdiscntprod()
  RETURNS trigger
  LANGUAGE plpgsql AS
  $$
    BEGIN
      UPDATE product
        SET p_discount = CASE
          WHEN p_price < 15.00 THEN 0.05
          WHEN p_price >= 15.00 THEN 0.10
        END;
      RETURN NULL;
    END;
  $$;
```

2. Next, in DBeaver:
```sql
-- Create trigger setDiscount_after
CREATE TRIGGER setDiscount_after
  AFTER INSERT ON product
  FOR EACH ROW
  EXECUTE PROCEDURE fdiscntprod();

SELECT tgname, tgrelid::regclass, tgtype, tgargs FROM pg_trigger;

SELECT * FROM PRODUCT ORDER BY p_code;

INSERT INTO Product VALUES ('A0010', 'Calendar', 15, 11, 29.99, 0.00, 50, 0);

SELECT * FROM PRODUCT ORDER BY p_code;
```

3. In DBeaver:
```sql
SELECT * FROM PRODUCT ORDER BY p_code;
SELECT tgname, tgrelid::regclass, tgtype, tgargs FROM pg_trigger;
DROP TRIGGER IF EXISTS setdiscount_after ON product;
```

4. At omm prompt,
```sql
DROP FUNCTION IF EXISTS fdiscntprod();
```

5. In DBeaver:
```sql
SELECT tgname, tgrelid::regclass, tgtype, tgargs FROM pg_trigger;
```

6. At omm prompt,
```sql
-- Create function with two SET lines to update p_discount
CREATE or REPLACE FUNCTION fdiscntprod()
  RETURNS trigger
  LANGUAGE plpgsql AS
  $$
    BEGIN
      UPDATE product
        SET p_discount = 0.05 WHERE p_price < 15;
      UPDATE product
        SET p_discount = 0.10 WHERE p_price >= 15;
      RETURN NULL;
    END;
  $$;

-- Create trigger setDiscount_after
CREATE TRIGGER setDiscount_after
  AFTER INSERT ON product
  FOR EACH ROW
  EXECUTE FUNCTION fdiscntprod();
--[Important: Don't use syntax for ‘before event’ -> causes insert not working in OpenGauss]

SELECT tgname, tgrelid::regclass, tgtype, tgargs FROM pg_trigger;

SELECT * FROM PRODUCT ORDER BY p_code;
```

### 3. SQL statements (in DBeaver):
```sql
INSERT INTO Product VALUES ('A0011', 'Mask', 15, 11, 15.00, 0.00, 50, 0);

SELECT * FROM PRODUCT ORDER BY p_code;
```

### 4. At cmd prompt, Stop the container (graceful shutdown)
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
