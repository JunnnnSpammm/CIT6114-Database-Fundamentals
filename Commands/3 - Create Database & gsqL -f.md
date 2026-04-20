## "docker cp" to transfer SQL file to openGauss with create & insert

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

# Print working directory: /home/omm
pwd

# Make new directory: /home/omm/dbfnd
mkdir dbfnd 

# List the contents within /home/omm to affirm directory dbfnd created
ls
```

### 3. In Windows File Explorer, create a folder of "D:\bin\bookdb"
Within D:\bin\bookdb, create the following two text files of lab02stud.sql, and lab03insert.sql.

```sql
-- lab02stud.sql
CREATE TABLE student(
  student_id INT NOT NULL, 
  name         VARCHAR(30) NOT NULL,
  age   INT NULL, 
  gender         CHAR(1) NOT NULL,
  PRIMARY KEY(student_id)
);
CREATE TABLE course( 
  course_code   CHAR(7) NOT NULL,
  course_name  VARCHAR(20) NOT NULL, 
  credit INT NOT NULL,   
  PRIMARY KEY(course_code)
);
```

```sql
-- lab03insert.sql, student: Lab03
INSERT INTO student (student_id, name, age, gender) VALUES (100, 'Abu', 20, 'M');
INSERT INTO student (student_id, name, age, gender) VALUES (101, 'Ali', 25, 'M');
INSERT INTO student VALUES (102, 'Aminah', 22, 'F');

-- course: Lab02
INSERT INTO course values ('SAK3100','Programming',4);
INSERT INTO course values ('SAK3304','Computer',4);
INSERT INTO course values ('MTK3200','Algebra',4);
INSERT INTO course values ('MGT2102','Business',2);
```

### 4. In another second Windows command prompt
```powershell
docker cp D:\bin\bookdb\lab02stud.sql opengauss:/home/omm/dbfnd
docker cp D:\bin\bookdb\lab03insert.sql opengauss:/home/omm/dbfnd
```

1. In Docker Desktop, at right-pane “Actions”, click the ‘three dots’ icon - circled below.
2. In the pop-up dialog, select “View details” menu item. Next, click “Files” tab. The transferred files appear in “/home/omm/dbfnd”.

### 5. At the previous first “omm” cmd prompt
```powershell
gsql -d ad1

CREATE DATABASE dbstud;
# It will take a while to create the database. Need to be patience :-).

\l     # List available databases
\q     # To quit openGauss

cd dbfnd
gsql -d dbstud -f lab02stud.sql
gsql -d dbstud -f lab03insert.sql
gsql -d dbstud -r                         # Connect to the database named ‘dbstud’
\dt                                       # Successful list of tables in database
```

```sql
SELECT * FROM course;                      -- Issue SQL statement terminated with semicolon (;)
SELECT * FROM student;                     -- Issue SQL statement end with (;)
SELECT COUNT(*) stud_count FROM student;   -- Issue SQL statement
```

## Lab02 Part B: DBMS [Database Management System] (Self-Learning)

```sql
-- create.sql
CREATE TABLE Table1(
  Code CHAR(7) NOT NULL,
  CourseName VARCHAR(20) NOT NULL,
  Credit INT NOT NULL,
  PRIMARY KEY(Code)
);
```

```sql
-- insert.sql
INSERT INTO Table1 (Code, CourseName, Credit) VALUES ('SAK3100', 'Programming', 4);
INSERT INTO Table1 (Code, CourseName, Credit) VALUES ('SAK3304', 'Computer', 4);
INSERT INTO Table1 (Code, CourseName, Credit) VALUES ('MTK3200', 'Algebra', 4);
INSERT INTO Table1 (Code, CourseName, Credit) VALUES ('MGT2102', 'Business', 2);
```

```powershell
docker exec -it opengauss bash
su - omm

mkdir course

docker cp D:\bin\bookdb\create.sql opengauss:/home/omm/course
docker cp D:\bin\bookdb\insert.sql opengauss:/home/omm/course

gsql -d ad1

CREATE DATABASE course;

\q

cd course
gsql -d dbstud -f create.sql
gsql -d dbstud -f insert.sql
gsql -d dbstud -r
```

```sql
SELECT * FROM Table1;
```

