# Lab 2 Guide: Dbeaver, ogc (connect id), & gsqL cmd

## Lab2 Discussion

1. Define business rules and discuss the importance of business rule. Provide some examples.

Business rule is a brief, precise, unambiguous description of a policy, **procedure** or **principle** within an organization.
Business rules are important since they are used to (i) define **entities**, (ii) **attributes**, (iii) **relationships** and (iv) **constraints**, which form the basis for **data modeling**.
The following are some examples:
- A student can enroll up to a maximum of 4 subjects per semester. Each subject can be enrolled by **many** students.
- A client may sign many contracts, but each contract is signed by **one** and **only one** client.
- A sales representative may **write many** contracts, but each contract is handled by a sales representative.

2. Discuss entity integrity. Provide an example of entity integrity.

Entity integrity: **All tables** must have **primary key**; the primary key **cannot be null**. 
For example, in MMU, in the Student table, each student is uniquely identified by the studentID. Thus, the studentID is the primary key. All students must have the studentID when they enroll into the university.

3. A relational table is a two-dimensional table that composed of rows and columns. What are the key characteristics of a relational table?

    1. **Each table row (tuple)** represents a **single entity occurrence** within the entity set
    2. Each table **column** represents an **attribute**, and **each column** has a **distinct name**
    3. Each row/column intersection represents a single data value
    4. All values in a **column** must conform to the **same data format** (same data type)
    5. Each **column** has a specific range of values known as the **attribute** domain (e.g., gender – Female/Male,   specialization – Data Science, Games Development, Software Engineering)
    6. The order of the rows and columns is immaterial (not matter) to the DBMS
    7. Each table must have an attribute (PK) or a combination of attributes **(composite key)** that **uniquely identifies** each row

4. A data model is a simple representation of complex real-world data structures. Name the basic building blocks of a data model.

    1. **Entity** – is a person, place, thing or event about which data are collected (book – **thing**, customer – **person**, staff – person, rental – **event**)
    2. **Attribute** – a **characteristic** of an entity (book – bookid, booktitle, bookprice)
    3. **Relationship** – describes the **association** among entities (1:1, 1:M, M:N)
    4. **Constraint** – a **restriction** placed on data (e.g., Grade must be between A, B, C, D or F)

5. What is foreign key?  What is the purpose of having a foreign key?

**Foreign key** is the primary key of one table that has been placed into **another table** to create a **common** attribute/**link**.

6. Explain the THREE different types of relationship within relational database.

    1. 1:M relationship (one entity is related to many entity)
    2. 1:1 relationship (one entity is related to only one entity)
    3. M:N relationship (associations among two or more entities in which one occurrence of an entity is associated with **many occurrences** of a related entity)

7. Given the following two tables, what will be the results of these relational algebra operations?

**Table1**
| Code | CourseName | Credit |
| :--- | :--- | :--- |
| TCP1101 | Programming | 4 |
| TIS1001 | Computer | 4 |
| TMT1001 | Algebra | 4 |
| MGT2102 | Business | 2 |

**Table2**
| Code | CourseName | Credit |
| :--- | :--- | :--- |
| TMT1001 | Algebra | 4 |
| MGT2102 | Business | 2 |
| ECO4300 | Economic | 2 |

---

**(a) SELECT CourseName where credit is equal to 4 from Table1**

| CourseName |
| :--- |
| Programming |
| Computer |
| Algebra |

**(b) Table1 UNION Table2**

| Code | CourseName | Credit |
| :--- | :--- | :--- |
| TCP1101 | Programming | 4 |
| TIS1001 | Computer | 4 |
| TMT1001 | Algebra | 4 |
| MGT2102 | Business | 2 |
| ECO4300 | Economic | 2 |

**(c) Table1 DIFFERENT Table2**

| Code | CourseName | Credit |
| :--- | :--- | :--- |
| TCP1101 | Programming | 4 |
| TIS1001 | Computer | 4 |

**(d) Table1 INTERSECT Table2**

| Code | CourseName | Credit |
| :--- | :--- | :--- |
| TMT1001 | Algebra | 4 |
| MGT2102 | Business | 2 |

---

8. Given the following tables, what are the results of the following operations?

**Table A**
| StudID | LecID |
| :--- | :--- |
| S1 | L1 |
| S1 | L2 |
| S1 | L3 |
| S1 | L4 |
| S2 | L1 |
| S2 | L2 |
| S3 | L2 |
| S4 | L2 |
| S4 | L4 |

**Table B1**
| LecID |
| :--- |
| L2 |

**Table B2**
| LecID |
| :--- |
| L2 |
| L4 |

**Table B3**
| LecID |
| :--- |
| L1 |
| L2 |
| L4 |

---

**(a) A DIVIDE B1**

| StudID |
| :--- |
| S1 |
| S2 |
| S3 |
| S4 |

**(b) A DIVIDE B2**

| StudID |
| :--- |
| S1 |
| S4 |

**(c) A DIVIDE B3**

| StudID |
| :--- |
| S1 |
