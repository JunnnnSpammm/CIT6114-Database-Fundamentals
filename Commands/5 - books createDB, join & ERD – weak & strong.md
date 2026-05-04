## Use DBeaver to put in multiple lines of SQL script

### 1. At Windows desktop, double click DockerDesktop icon. Click “Start” button for ‘opengauss’
```powershell
# Start the existing container
docker start opengauss

# Verify it's running
docker ps
```

### 2. In the first Windows command prompt
```powershell
docker exec -it opengauss bash

# Change from root to omm user
su - omm
gsql -d dbstud -r

# Issue SQL statement end with (;)
select * from course where credit = 4;
select course_name from course where course_code = 'TCP1101';
```

### 3. In Windows File Explorer, navigate to the folder of “D:\bin\bookdb”.
Within D:\bin\bookdb, create the following two text files of lab05drop.sql, and lab05enrolcreate.sql.

```sql
-- lab05drop.sql - remove previous two standalone tables of student & course
DROP TABLE IF EXISTS enrol CASCADE;
DROP TABLE IF EXISTS course CASCADE;
DROP TABLE IF EXISTS student CASCADE;
```

```sql
-- lab05enrolcreate.sql - create student & course tables with enrol many to many relation
CREATE TABLE student (
    student_id SERIAL NOT NULL,
    name VARCHAR(30) NOT NULL,
    age INT NULL,
    gender CHAR(1) NOT NULL,
    PRIMARY KEY (student_id)
);

CREATE TABLE course( 
  course_code   CHAR(7) NOT NULL,
  course_name  VARCHAR(20) NOT NULL, 
  credit INT NOT NULL,   
  PRIMARY KEY(course_code)
);

CREATE TABLE enrol (
    stud_id INT  NOT NULL ,
    crs_code CHAR(7)  NOT NULL, 
	PRIMARY KEY(stud_id, crs_code),
	CONSTRAINT fk_stud 
		FOREIGN KEY(stud_id) 
		REFERENCES student(student_id) ON DELETE CASCADE, 
	CONSTRAINT fk_course 
		FOREIGN KEY(crs_code) 
		REFERENCES course(course_code)
);
```

### 4. In another second Windows command prompt
```powershell
docker cp D:\bin\bookdb\lab05drop.sql opengauss:/home/omm/dbfnd
docker cp D:\bin\bookdb\lab05enrolcreate.sql opengauss:/home/omm/dbfnd
```

1. In Docker Desktop, at right-pane “Actions”, click the ‘three dots’ icon - circled below.
2. In the pop-up dialog, select “View details” menu item. Next, click “Files” tab. The transferred files appear in “/home/omm/dbfnd”.

### 5. At the previous first “omm” cmd prompt
```powershell
\l     # List available databases
\q     # To quit openGauss prompt

cd dbfnd

gsql -d dbstud -f lab05drop.sql
gsql -d dbstud -f lab05enrolcreate.sql
gsql -d dbstud -f lab04insertdata.sql
gsql -d dbstud -r                       # Connect to the database named ‘dbstud’
```

```sql
select * from course where credit = 4;                       -- Issue SQL statement end with (;)
```

### 6. In Windows File Explorer, navigate to the folder of D:\bin\dbeaver.
1. Search for dbeaver.exe.
2. Double click “dbeaver.exe” to launch dbeaver.
3. In DBeaver, select ‘SQL Editor’ menu. Next, click “Open SQL console” menu item, and put in the following SQL script:

```sql
SELECT 
    c.course_name, 
    s.name, 
    s.gender
FROM 
    course c
INNER JOIN enrol e 
    ON e.crs_code = c.course_code
INNER JOIN student s 
    ON s.student_id = e.stud_id
ORDER BY 
    c.course_name;
```

4. . In DBeaver, click ‘SQL Editor > Execute SQL query’ to execute the multiple lines of SQL script.

> **Note1:** Tut3Q3vii. Each table must have an attribute (PK) or a combination of attributes (composite key) that uniquely identifies each row, as appeared in “dbStud” database: ‘enrol’ association table with PRIMARY KEY(stud_id, crs_code) indirectly denote many to many relationship between student and course tables. Furthermore, for the following “books” database in the subsequent pages: ‘book_authors’ association table has PRIMARY KEY(book_id, author_id), which indirectly represent many to many relationship between books and authors table.

## Creating Another Database of “books”

### 7. In Windows File Explorer, navigate to the folder of “D:\bin\bookdb”.
Within D:\bin\bookdb, create the following three files:

```sql
-- D:\bin\bookdb\create.sql
CREATE TABLE publishers(
  publisher_id SERIAL NOT NULL,
  name         VARCHAR(255) NOT NULL,
  PRIMARY KEY(publisher_id)
);
CREATE TABLE authors( 
  author_id   SERIAL NOT NULL,
  first_name  VARCHAR(100) NOT NULL,
  middle_name VARCHAR(50) NULL, 
  last_name   VARCHAR(100) NULL,
  PRIMARY KEY(author_id)
);
CREATE TABLE books(
  book_id        SERIAL NOT NULL,
  title          VARCHAR(255) NOT NULL,
  total_pages    INT NULL, 
  rating         DECIMAL(4, 2) NULL, 
  isbn           VARCHAR(13) NULL, 
  published_date DATE, 
  publisher_id   INT NULL, 
  PRIMARY KEY(book_id),
  CONSTRAINT fk_publisher 
    FOREIGN KEY(publisher_id) 
    REFERENCES publishers(publisher_id)
);
CREATE TABLE book_authors (
  book_id   INT NOT NULL, 
  author_id INT NOT NULL, 
  PRIMARY KEY(book_id, author_id), 
  CONSTRAINT fk_book 
    FOREIGN KEY(book_id) 
    REFERENCES books(book_id) ON DELETE CASCADE, 
  CONSTRAINT fk_author 
    FOREIGN KEY(author_id) 
    REFERENCES authors(author_id) ON DELETE CASCADE
);
CREATE TABLE genres (
  genre_id  SERIAL NOT NULL,
  genre     VARCHAR(255) NOT NULL, 
  parent_id INT NULL, 
  PRIMARY KEY(genre_id),
  CONSTRAINT fk_parent 
    FOREIGN KEY(parent_id) REFERENCES genres(genre_id)
);
CREATE TABLE book_genres(
  book_id  INT NOT NULL, 
  genre_id INT NOT NULL, 
  PRIMARY KEY(book_id, genre_id), 
  CONSTRAINT fk_book_genre
    FOREIGN KEY(book_id) 
    REFERENCES books(book_id) ON DELETE CASCADE, 
  CONSTRAINT fk_genre_book
    FOREIGN KEY(genre_id) 
    REFERENCES genres(genre_id) ON DELETE CASCADE
);
```

```sql
-- data.sql - found in /Commands
```

```sql
-- drop.sql - remove previous tables starting with dependencies towards standalone
DROP TABLE IF EXISTS book_genres CASCADE;
DROP TABLE IF EXISTS book_authors CASCADE;
DROP TABLE IF EXISTS genres CASCADE;
DROP TABLE IF EXISTS books CASCADE;
DROP TABLE IF EXISTS authors CASCADE;
DROP TABLE IF EXISTS publishers CASCADE;
```

### 8. In the second Windows command prompt,
```powershell
docker cp D:\bin\bookdb\create.sql opengauss:/home/omm/dbfnd
docker cp D:\bin\bookdb\data.sql opengauss:/home/omm/dbfnd
docker cp D:\bin\bookdb\drop.sql opengauss:/home/omm/dbfnd
```

1. In Docker Desktop, at right-pane “Actions”, click the ‘three dots’ icon - circled below.
2. In the pop-up dialog, select “View details” menu item. Next, click “Files” tab. The transferred files appear in “/home/omm/dbfnd”.

### 9. At the previous first “omm” cmd prompt,

```powershell
CREATE DATABASE books;
\l                       # List available databases
\q                       # To quit openGauss prompt

gsql -d books -f create.sql
gsql -d books -f data.sql
gsql -d dbstud -r                       # Connect to the database named ‘dbstud’

GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA public TO ogc;            -- Grant all standard privileges on existing tables
GRANT ALL PRIVILEGES ON ALL SEQUENCES IN SCHEMA public TO ogc;         -- Grant privileges on sequences (needed for SERIAL columns)
ALTER DEFAULT PRIVILEGES IN SCHEMA public GRANT ALL PRIVILEGES ON TABLES TO ogc;
ALTER DEFAULT PRIVILEGES IN SCHEMA public GRANT ALL PRIVILEGES ON SEQUENCES TO ogc;

\dt
```

1. In DBeaver ‘Database Navigator’ left-pane, right-click the object name of ‘ad1’ and select “Edit Connection”.
2. Change Database/Schema: books.
3. Next, click “Driver Settings” button. Change default database: books.
4. In ‘Connection Settings’ dialog box – left pane, select “General” menu item.
5. In ‘Connection configuration’ dialog box, change the ‘Connection name’ text field to the new database name: i.e. books.
6. Click “Test Connection” button. 9f. Click Finish if is Connected.

## 10. In DBeaver, select ‘SQL Editor’ menu.

1. Next, click “Open SQL console” menu item twice.
2. At each SQL console, put in each of the following SQL scripts separately:

```sql
SELECT 
    b.title, 
    a.first_name, 
    a.last_name
FROM 
    books b
INNER JOIN book_authors ba 
    ON ba.book_id = b.book_id
INNER JOIN authors a 
    ON a.author_id = ba.author_id
ORDER BY 
    b.title;
```

```sql
SELECT 
    b.title, 
    p.name, 
    b.publisher_id, 
    p.publisher_id
FROM 
    books b
INNER JOIN publishers p 
    ON p.publisher_id = b.publisher_id
ORDER BY 
    b.title;
```

> Reference: https://www.db2tutorial.com/db2-basics/db2-inner-join/

3. In DBeaver > “Select Data Source” drop-down-list icon, select “books” database.
4. Next, click ‘SQL Editor > Execute SQL query’ to execute each SQL script separately.

### 11. In DBeaver ‘Database Navigator’ left pane, expand “books > public > Tables” and right-click to select “View Diagram”.

1. Right click the ER Diagram and select “Notation > Crow’s Foot”.
2. Right click “books > public > Tables” and select "Refresh” to show all relationships.

> Note2: ERD generated by DBeaver cardinality (1..n) or (0..n) & (1) or (0) are just randomized.
 
> The original “books” ERD: https://www.db2tutorial.com/getting-started/db2-sample-database/. This original ERD cardinality [0..N] is failed to be auto-generated in DBeaver. DBeaver always show [1..N] instead. [Furthermore, from previous rerun of lab05enrolcreate.sql, there is no difference on the generated ERD by DBeaver between lab04enrolcreate.sql & lab05enrolcreate.sql].
 
> Note3. Difference between weak relationship association, and strong identifying relationship:

### 12. In DBeaver > “Select Data Source” drop-down-list icon, select “ad1” database.

```sql
DROP TABLE IF EXISTS Department CASCADE;
DROP TABLE IF EXISTS Employee CASCADE;
-- Eg1a: The dashed line relationship between Department and Employee is non-identifying relationship 
-- (also called a weak association), 
-- Create a table named Department
CREATE TABLE Department (
    DepartmentID INT PRIMARY KEY,
    DeptName VARCHAR(100)
);
-- DepartmentID in Employee is a foreign key referencing Department.
-- The child table has a foreign key referencing the parent’s primary key, but does not include it in its own PK.
-- Why? Because EmployeeID alone identifies an employee; DepartmentID is not part of the PK. 
-- Example: Employee references DepartmentID from Department, but EmployeeID alone is its PK.
CREATE TABLE Employee (
    EmployeeID INT PRIMARY KEY,
    Name VARCHAR(100),
    DepartmentID INT,
    FOREIGN KEY (DepartmentID) REFERENCES Department(DepartmentID)
);
```

```sql
-- Eg1b: identifying relationship (solid line) in openGauss SQL
-- Order table as the parent. OrderItem table as the child.
-- The child's primary key includes the parent’s primary key → Identifying relationship (solid line in ERD).
DROP TABLE IF EXISTS Orders CASCADE;
DROP TABLE IF EXISTS OrderItem CASCADE;
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    OrderDate DATE
);
-- Why Solid Line? OrderItem cannot exist without Orders.
-- The PK of OrderItem is (OrderID, ItemID), so the parent’s PK (OrderID) is part of the child's PK.
-- This makes the relationship identifying, shown as a solid line in ERD.
CREATE TABLE OrderItem (
    OrderID INT,
    ItemID INT,
    ProductName VARCHAR(100),
    Quantity INT,
    PRIMARY KEY (OrderID, ItemID),  -- Composite PK includes parent PK
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID)
);
```

1. Right click the ER Diagram and select “Notation > Crow’s Foot”.

```powershell
# To quit openGauss
\q
exit
exit

# The docker server is stopping.
docker stop opengauss

# Verify it is stopped
docker ps -a   # Status should show: Exited (0) Have fun.
```
