## Drop, Create, Alter, and Insert

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
gsql -d dbstud

# Issue SQL statement end with (;)
select * from course where credit = 4;
select course_name from course where course_code = 'SAK3304';

# Quit openGauss
\q
```

### 3. In Windows File Explorer, navigate to the folder of “D:\bin\bookdb”.
Within D:\bin\bookdb, create the following three text files of lab04drop.sql, lab04enrolcreate.sql, and lab04insertdata.sql.

```sql
-- lab04drop.sql - remove previous two standalone tables of student & course
DROP TABLE IF EXISTS enrol CASCADE;
DROP TABLE IF EXISTS student CASCADE;
DROP TABLE IF EXISTS course CASCADE;
```

```sql
-- lab04enrolcreate.sql - create student & course tables with enrol many to many relation (using ogc in DBeaver)
CREATE TABLE student(
  student_id INT NOT NULL, 
  name VARCHAR(30) NOT NULL,
  age INT NULL, 
  gender CHAR(1) NOT NULL,
  CONSTRAINT pk_student PRIMARY KEY(student_id)
);

CREATE TABLE course( 
  course_code CHAR(7) NOT NULL,
  course_name VARCHAR(20) NOT NULL, 
  credit INT NOT NULL,   
  CONSTRAINT pk_course PRIMARY KEY(course_code)
);

CREATE TABLE enrol (
  stud_id INT NOT NULL,
  crs_code CHAR(7) NOT NULL,
  PRIMARY KEY(stud_id, crs_code)
);

ALTER TABLE enrol ADD CONSTRAINT fk_enrol_stud_id FOREIGN KEY(stud_id)
REFERENCES student(student_id);

ALTER TABLE enrol ADD CONSTRAINT fk_enrol_crs_code FOREIGN KEY(crs_code)
REFERENCES course(course_code);
```

```sql
-- lab04insertdata.sql. insert student data: Lab03
INSERT INTO student (student_id, name, age, gender) VALUES (100, 'Abu', 20, 'M');
INSERT INTO student (student_id, name, age, gender) VALUES (101, 'Ali', 25, 'M');
INSERT INTO student (student_id, name, age, gender) VALUES (102, 'Aminah', 22, 'F');

-- course: Lab04
INSERT INTO course values ('TCP1101','Programming',4);
INSERT INTO course values ('TIS1001','Computer',4);
INSERT INTO course values ('TMT1001','Algebra',4);
INSERT INTO course values ('MGT2102','Business',2);

-- enrol: Lab04
INSERT INTO enrol values (100,'TCP1101');
INSERT INTO enrol values (101,'TCP1101');
INSERT INTO enrol values (102,'TCP1101');
INSERT INTO enrol values (100,'TIS1001');
INSERT INTO enrol values (100,'TMT1001');
INSERT INTO enrol values (101,'TIS1001');
```

### 4. In another second Windows command prompt
```powershell
docker cp D:\bin\bookdb\lab04drop.sql opengauss:/home/omm/dbfnd
docker cp D:\bin\bookdb\lab04enrolcreate.sql opengauss:/home/omm/dbfnd
docker cp D:\bin\bookdb\lab04insertdata.sql opengauss:/home/omm/dbfnd
```

1. In Docker Desktop, at right-pane “Actions”, click the ‘three dots’ icon - circled below.
2. In the pop-up dialog, select “View details” menu item. Next, click “Files” tab. The transferred files appear in “/home/omm/dbfnd”.

### 5. At the previous first “omm” cmd prompt
```powershell
cd dbfnd

gsql -d dbstud -f lab04drop.sql
gsql -d dbstud -f lab04enrolcreate.sql
gsql -d dbstud -f lab04insertdata.sql
gsql -d dbstud -r                       # Connect to the database named ‘dbstud’
```

```sql
SELECT * FROM course WHERE credit = 4;                         -- Issue SQL statement end with (;)
SELECT course_name FROM course WHERE course_code = 'TCP1101';
```

```powershell
# To quit openGauss
\q
```

### 6. In Windows File Explorer, navigate to the folder of D:\bin\dbeaver.
1. Search for dbeaver.exe.
2. Double click “dbeaver.exe” to launch dbeaver.

### 7. In DBeaver, Ctrl+Shift+N for New Database Connection.
1. Choose openGauss, click Next.
2. Click “Connection details (name, type, …)” button. [Another alternative: In ‘Connection Settings’ dialog box – left pane, select “General” menu item].
3. In ‘Connection configuration’ dialog box, change the ‘Connection name’ text field to the new database name: i.e. dbstud.
4. In ‘General connection settings’ dialog box, click “Back” button.

> Database/Schema: dbstud
> 
> host: localhost (referring to your openGauss server ip)
> 
> port: 5432
> 
> Username: ogc
> 
> Password: 'Zxcv@123'

5. Click “Test Connection” button.
6. Click Finish if is Connected.

### 8. In DBeaver app - ‘Database Navigator’ left pane,
1. Expand “dbstud > public” and right-click to select “View Diagram”.
2. Right click the ER Diagram and select “Notation > Crow’s Foot”.
3. Right click “dbstud > public > Tables” and select "Refresh” to show all relationships.

### 9. Entity-Relationship Diagram (ERD) from https://app.quickdatabasediagrams.com/#/ 
1. At this website, click “Import > MySQL/MariaDB
2. Next, select “D:\SbHo\bookdb\lab04enrolcreate.sql

```dbml
student
--
student_id INT PK
name VARCHAR(20)
age INT
gender CHAR(1)

course
--
course_code CHAR(7) PK
course_name VARCHAR(20)
credit INT

enrol
--
stud_id INT FK >- student.student_id
crs_code CHAR(7) FK >- course.course_code
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
