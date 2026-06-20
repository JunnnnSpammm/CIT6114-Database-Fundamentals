# Assignment Milestone 2 (10%) and Presentation (10%)
## Title: Food Delivery & Restaurant Management System (FoodRush)

## 1. CORRECTED AND NORMALIZED ERD

<img width="630" height="561" src="https://github.com/user-attachments/assets/d759dbae-235b-4829-9e04-96aae1ef6254" />

## 2. DATA DICTIONARY

### CUSTOMER
| ATTRIBUTE NAME  | CONTENTS                     | TYPE         | FORMAT           | RANGE           | REQUIRED | PK OR FK | FK REFERENCED TABLE |
|-----------------|------------------------------|--------------|------------------|-----------------|----------|----------|---------------------|
| Customer_ID     | Customer's ID                | SERIAL       | 9999             | 1-2,147,483,647 | Y        | PK       |                     |
| Customer_Name   | Customer's name              | VARCHAR(255) | Xxxxxxxxx        |                 | Y        |          |                     |
| Email           | Customer's email             | VARCHAR(255) | xxxxxx@xxxxx.xxx |                 | Y        |          |                     |
| Phone Num       | Customer's phone number      | VARCHAR(50)  | 012-34567890     |                 |          |          |                     |
| Hashed_Password | Account's encrypted password | VARCHAR(255) | xxxxxxxxx        |                 | Y        |          |                     |
| Address         | Customer's home address      | TEXT         | Xxxxxxxxx        |                 | Y        |          |                     |

### RESTAURANT
| ATTRIBUTE NAME  | CONTENTS                    | TYPE          | FORMAT      | RANGE           | REQUIRED | PK OR FK | FK REFERENCED TABLE |
|-----------------|-----------------------------|---------------|-------------|-----------------|----------|----------|---------------------|
| Restaurant_ID   | Restaurant's ID             | SERIAL        | 9999        | 1-2,147,483,647 | Y        | PK       |                     |
| Restaurant_Name | Restaurant's name           | VARCHAR(255)  | Xxxxxxxxxx  |                 | Y        |          |                     |
| Address         | Restaurant's address        | TEXT          | Xxxxxxxxxx  |                 | Y        |          |                     |
| Description     | Restaurant's description    | TEXT          | Xxxxxxxxxx  |                 |          |          |                     |
| Opening_Hours   | Restaurant's opening hours  | VARCHAR(100)  | hh:mm hh:mm | 00:00-24:00     | Y        |          |                     |
| Avg_Rating      | Restaurant's average rating | DECIMAL(3, 2) | 5.00        | 0.00-5.00       |          |          |                     |

### RIDER
| ATTRIBUTE NAME  | CONTENTS                     | TYPE          | FORMAT           | RANGE           | REQUIRED | PK OR FK | FK REFERENCED TABLE |
|-----------------|------------------------------|---------------|------------------|-----------------|----------|----------|---------------------|
| Rider_ID        | Restaurant's ID              | SERIAL        | 9999             | 1-2,147,483,647 | Y        | PK       |                     |
| Rider_Name      | Restaurant's name            | VARCHAR(255)  | Xxxxxxxxxx       |                 | Y        |          |                     |
| Email           | Restaurant's address         | VARCHAR(255)  | xxxxxx@xxxxx.xxx |                 | Y        |          |                     |
| Hashed_Password | Restaurant's description     | VARCHAR(255)  | Xxxxxxxxxx       |                 | Y        |          |                     |
| Phone Num       | Rider's phone number         | VARCHAR(50)   | 012-34567890     |                 |          |          |                     |
| Vehicle Plate   | Rider's vehicle plate number | VARCHAR(20)   | XXX 0000         |                 |          |          |                     |
| Vehicle_Type    | Rider's vehicle type         | VARCHAR(50)   | Xxxxxxxxxx       |                 | Y        |          |                     |
| Avg_Rating      | Rider's average rating       | DECIMAL(3, 2) | 5.00             | 0.00-5.00       |          |          |                     |

### FOOD
| ATTRIBUTE NAME | CONTENTS    | TYPE         | FORMAT     | RANGE           | REQUIRED  | PK OR FK | FK REFERENCED TABLE |
|----------------|-------------|--------------|------------|-----------------|-----------|----------|---------------------|
| Food_ID        | Food's ID   | SERIAL       | 9999       | 1-2,147,483,647 | Y         | PK       |                     |
| Food_Name      | Food's name | VARCHAR(255) | Xxxxxxxxxx |                 | Y         |          |                     |

### MENU
| ATTRIBUTE NAME | CONTENTS        | TYPE           | FORMAT  | RANGE             | REQUIRED | PK OR FK | FK REFERENCED TABLE |
|----------------|-----------------|----------------|---------|-------------------|----------|----------|---------------------|
| Menu_ID        | Menu's ID       | SERIAL         | 9999    | 1-2,147,483,647   | Y        | PK       |                     |
| Restaurant_ID  | Restaurant's ID | INT            | 9999    | 1-2,147,483,647   | Y        | FK       | Restaurant_ID       |
| Food_ID        | Food's ID       | INT            | 9999    | 1-2,147,483,647   | Y        | FK       | Food ID             |
| Price          | Menu's price    | DECIMAL(10, 2) | 9999.99 | 0.01- 99999999.99 | Y        |          |                     |

### PAYMENT_METHOD
| ATTRIBUTE NAME    | CONTENTS              | TYPE         | FORMAT     | RANGE           | REQUIRED | PK OR FK | FK REFERENCED TABLE |
|-------------------|-----------------------|--------------|------------|-----------------|----------|----------|---------------------|
| Payment_Method_ID | Payment method's ID   | SERIAL       | 9999       | 1-2,147,483,647 | Y        | PK       |                     |
| Customer_ID       | Customer's ID         | INT          | 9999       | 1-2,147,483,647 | Y        | FK       | Customer_ID         |
| PaymentMethod     | Payment method's name | VARCHAR(100) | Xxxxxxxxxx |                 | Y        |          |                     |

### ORDER
| ATTRIBUTE NAME    | CONTENTS                              | TYPE           | FORMAT              | RANGE                             | REQUIRED | PK OR FK | FK REFERENCED TABLE |
|-------------------|---------------------------------------|----------------|---------------------|-----------------------------------|----------|----------|---------------------|
| Order_ID          | Order's ID                            | SERIAL         | 9999                | 1-2,147,483,647                   | Y        | PK       |                     |
| Customer ID       | Customer's ID                         | INT            | 9999                | 1-2,147,483,647                   | Y        | FK       | Customer ID         |
| Restaurant_ID     | Restaurant's ID                       | INT            | 9999                | 1-2,147,483,647                   | Y        | FK       | Restaurant ID       |
| Rider_ID          | Restaurant's ID                       | INT            | 9999                | 1-2,147,483,647                   | Y        | FK       | Rider_ID            |
| Payment_Method_ID | Payment method's ID                   | INT            | 9999                | 1-2,147,483,647                   | Y        | FK       | Payment_Method_ID   |
| Timestamp         | Date and time when the order was made | DATETIME       | YYYY-MM-DD HH:MM:SS |                                   | Y        |          |                     |
| Order Status      | Current order status                  | VARCHAR(15)    | Xxxxxxxxxx          | Preparing, in delivery, completed | Y        |          |                     |
| Total Food Price  | Total price of this order             | DECIMAL(10, 2) | 9999.99             | 0.01-99999999.99                  | Y        |          |                     |
| Delivery_Fee      | Delivery fee paid to rider            | DECIMAL(10, 2) | 9999.99             | 0.01-99999999.99                  | Y        |          |                     |

### ORDER_ITEM
| ATTRIBUTE NAME | CONTENTS                                       | TYPE   | FORMAT | RANGE           | REQUIRED | PK OR FK | FK REFERENCED TABLE |
|----------------|------------------------------------------------|--------|--------|-----------------|----------|----------|---------------------|
| Order_Item_ID  | Order item's ID                                | SERIAL | 9999   | 1-2,147,483,647 | Y        | PK       |                     |
| Order_ID       | Order's ID                                     | INT    | 9999   | 1-2,147,483,647 | Y        | PK, FK   | Order_ID            |
| Menu_ID        | Menu's ID                                      | INT    | 9999   | 1-2,147,483,647 | Y        | FK       | Menu ID             |
| Quantity       | Quantity ordered for this menu by the customer | INT    | 9      | 1-2,147,483,647 | Y        |          |                     |

### REVIEW
| ATTRIBUTE NAME    | CONTENTS                              | TYPE     | FORMAT              | RANGE           | REQUIRED | PK OR FK | FK REFERENCED TABLE |
|-------------------|---------------------------------------|----------|---------------------|-----------------|----------|----------|---------------------|
| Review_ID         | Review's ID                           | SERIAL   | 9999                | 1-2,147,483,647 | Y        | PK       |                     |
| Order_ID          | Order's ID                            | INT      | 9999                | 1-2,147,483,647 | Y        | PK, FK   | Order_ID            |
| Comments          | Comment for this review               | TEXT     | Xxxxxxxxxx          |                 |          |          |                     |
| Restaurant_Rating | Stars given to the restaurant         | INT      | 5                   | 1-5             | Y        |          |                     |
| Rider_Rating      | Stars given to the rider              | INT      | 5                   | 1-5             | Y        |          |                     |
| Review_Timestamp  | Date and time when the order was made | DATETIME | YYYY-MM-DD HH:MM:SS |                 | Y        |          |                     |

## 3. CREATION OF TABLES

```sql
CREATE TABLE CUSTOMER (
    Customer_ID SERIAL PRIMARY KEY,
    Customer_Name VARCHAR(255) NOT NULL,
    Email VARCHAR(255) NOT NULL UNIQUE,
    Phone_Num VARCHAR(50),
    Hashed_Password VARCHAR(255) NOT NULL,
    Address TEXT NOT NULL
);

CREATE TABLE RESTAURANT (
    Restaurant_ID SERIAL PRIMARY KEY,
    Restaurant_Name VARCHAR(255) NOT NULL,
    Address TEXT NOT NULL,
    Description TEXT,
    Opening_Hours VARCHAR(100) NOT NULL,
    Avg_Rating DECIMAL(3, 2)
);

CREATE TABLE RIDER (
    Rider_ID SERIAL PRIMARY KEY,
    Rider_Name VARCHAR(255) NOT NULL,
    Email VARCHAR(255) NOT NULL UNIQUE,
    Hashed_Password VARCHAR(255) NOT NULL,
    Phone_Num VARCHAR(50),
    Vehicle_Plate VARCHAR(20),
    Vehicle_Type VARCHAR(50) NOT NULL,
    Avg_Rating DECIMAL(3, 2)
);

CREATE TABLE FOOD (
    Food_ID SERIAL PRIMARY KEY,
    Food_Name VARCHAR(255) NOT NULL
);

CREATE TABLE MENU (
    Menu_ID SERIAL PRIMARY KEY,
    Restaurant_ID INT NOT NULL,
    Food_ID INT NOT NULL,
    Price DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (Restaurant_ID) REFERENCES RESTAURANT(Restaurant_ID) ON DELETE CASCADE,
    FOREIGN KEY (Food_ID) REFERENCES FOOD(Food_ID) ON DELETE CASCADE
);

CREATE TABLE PAYMENT_METHOD (
    Payment_Method_ID SERIAL PRIMARY KEY,
    Customer_ID INT NOT NULL,
    PaymentMethod VARCHAR(100) NOT NULL,
    FOREIGN KEY (Customer_ID) REFERENCES CUSTOMER(Customer_ID) ON DELETE CASCADE
);

CREATE TABLE ORDERS (
    Order_ID SERIAL PRIMARY KEY,
    Customer_ID INT NOT NULL,
    Restaurant_ID INT NOT NULL,
    Rider_ID INT NOT NULL,
    Payment_Method_ID INT NOT NULL,
    Timestamp TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    Order_Status VARCHAR(15) NOT NULL DEFAULT 'preparing' CHECK (Order_Status IN ('preparing', 'in delivery', 'completed')),
    Total_Food_Price DECIMAL(10, 2) NOT NULL,
    Delivery_Fee DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (Customer_ID) REFERENCES CUSTOMER(Customer_ID) ON DELETE RESTRICT,
    FOREIGN KEY (Restaurant_ID) REFERENCES RESTAURANT(Restaurant_ID) ON DELETE RESTRICT,
    FOREIGN KEY (Rider_ID) REFERENCES RIDER(Rider_ID) ON DELETE RESTRICT,
    FOREIGN KEY (Payment_Method_ID) REFERENCES PAYMENT_METHOD(Payment_Method_ID) ON DELETE RESTRICT
);

CREATE TABLE ORDER_ITEM (
    Order_Item_ID SERIAL PRIMARY KEY,
    Order_ID INT NOT NULL,
    Menu_ID INT NOT NULL,
    Quantity INT NOT NULL CHECK (Quantity > 0),
    FOREIGN KEY (Order_ID) REFERENCES ORDERS(Order_ID) ON DELETE CASCADE,
    FOREIGN KEY (Menu_ID) REFERENCES MENU(Menu_ID) ON DELETE CASCADE
);

CREATE TABLE REVIEW (
    Review_ID SERIAL PRIMARY KEY,
    Order_ID INT NOT NULL,
    Comments TEXT,
    Restaurant_Rating INT NOT NULL CHECK (Restaurant_Rating BETWEEN 1 AND 5),
    Rider_Rating INT NOT NULL CHECK (Rider_Rating BETWEEN 1 AND 5),
    Review_Timestamp TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (Order_ID) REFERENCES ORDERS(Order_ID) ON DELETE RESTRICT
);
```

## 4. DATA INSERTION

```sql
-- Customer
INSERT INTO CUSTOMER (Customer_Name, Email, Phone_Num, Hashed_Password, Address) VALUES ('Alice Smith', 'alice@mail.com', '011-1234567', '$2y$10$Yg6DSfMEOE24IbNFlIt0nuGkRqkR9XkOfFhCTY.ZkR9.MOGFjXFd.', '14, Jalan Hormoni, Kuala Lumpur');
INSERT INTO CUSTOMER (Customer_Name, Email, Phone_Num, Hashed_Password, Address) VALUES ('Chong Jun Jet', 'chong@mail.com', '013-2345678', '$2y$10$jEKF0NV.WyT2kEA/NpQbt.Zf5ciWvBGBbzy8DrSrRiiUHCnrwX2Xm', 'A15-20-01, Condominium Seri Maya, Sri Petaling');
INSERT INTO CUSTOMER (Customer_Name, Email, Phone_Num, Hashed_Password, Address) VALUES ('Tengku Zaiful', 'tengku@mail.com', '013-3456789', '$2y$10$UxztvrbJ1r9.D.alogpG.O1kN4I6QVdVlafW2R54YavllWygpEmcS', '3, Jalan Setiawangsa, Setiawangsa');
INSERT INTO CUSTOMER (Customer_Name, Email, Phone_Num, Hashed_Password, Address) VALUES ('Lee Kar Sheng', 'karsheng@mail.com', '017-4567890', '$2y$10$dzb9JnaTFCOoImR6fR4gAu0LhbBTo0tLxvZxcnGGp28xWEZqWoaGK', '45, Jalan Madani, Taman Melati');
INSERT INTO CUSTOMER (Customer_Name, Email, Phone_Num, Hashed_Password, Address) VALUES ('June Ting', 'june@mail.com', '012-5678901', '$2y$10$ax3q9Yuz2E7SiW/hE0GKougoIGeHmgCKILVC.OjyfEZ0g3GCfsxEC', '4, Jalan Chee Chong Kat, Ampang');
INSERT INTO CUSTOMER (Customer_Name, Email, Phone_Num, Hashed_Password, Address) VALUES ('Mohd Aizat', 'aizat@mail.com', '015-6789012', '$2y$10$8jy2n0kkqR.KSC9bslmDUOELW5nWE.H0cXYbCs80hS7P4v8rOv6He', 'B05-10, Condominium Serene, Cheras');
INSERT INTO CUSTOMER (Customer_Name, Email, Phone_Num, Hashed_Password, Address) VALUES ('Siti Aminah', 'siti@mail.com', '019-7654321', '$2y$10$eE9h/8Uf.gR5.rK2oX7mO.89G5y3v7bN8M9xK6zP1qW2e3r4t5y6u', '12, Jalan Keramat, Kuala Lumpur');
INSERT INTO CUSTOMER (Customer_Name, Email, Phone_Num, Hashed_Password, Address) VALUES ('Ravin Kumar', 'ravin@mail.com', '016-9876543', '$2y$10$wR8f/7Tdg5.eE1wQ9xOlP.76H4u2b8vN7M8xK5zP0qW1e2r3t4y5u', '55, Jalan Gasing, Petaling Jaya');
INSERT INTO CUSTOMER (Customer_Name, Email, Phone_Num, Hashed_Password, Address) VALUES ('Aaron Ting', 'aaron@mail.com', '014-3456781', '$2y$10$qT7g/6Yhd4.rR0wE8xNkO.65J3u1b7vN6M7xK4zP9qW0e1r2t3y4u', 'C-10-3, Kiara Designer Suites, Mont Kiara');
INSERT INTO CUSTOMER (Customer_Name, Email, Phone_Num, Hashed_Password, Address) VALUES ('Muhammad Faiz', 'faiz@mail.com', '011-87654321', '$2y$10$yU6h/5Ujg3.tT9wW7xMjN.54K2u0b6vN5M6xK3zP8qW9e0r1t2y3u', '22, Jalan Pinang, KLCC');

-- Restaurant
INSERT INTO RESTAURANT (Restaurant_Name, Address, Description, Opening_Hours) VALUES ('Old Taste Kopitiam', '10, Edusphere, Cyberjaya', 'Kopitiam with cheap and delicious food.', '5:00 - 23:30');
INSERT INTO RESTAURANT (Restaurant_Name, Address, Description, Opening_Hours) VALUES ('Hainam Kopitiam', '12, Jalan SS15, Subang Jaya', 'Kopitiam pack with local Malaysian cuisine.', '10:00 - 22:00');
INSERT INTO RESTAURANT (Restaurant_Name, Address, Description, Opening_Hours) VALUES ('Mamak Pokok Penang', '12, Jalan Puteri 2, Bandar Puteri', 'Cheap and delicious Mamak food.', '12:30 - 21:30');
INSERT INTO RESTAURANT (Restaurant_Name, Address, Description, Opening_Hours) VALUES ('Nasi Kandar Pelita', '2, Jalan Telawi 5, Bangsar', 'Famous Penang style Nasi Kandar.', '00:00 - 23:59');
INSERT INTO RESTAURANT (Restaurant_Name, Address, Description, Opening_Hours) VALUES ('Ah Keong Bak Kut Teh', '45, Jalan Radin Bagus, Sri Petaling', 'Authentic herbal claypot Bak Kut Teh.', '16:00 - 22:00');
INSERT INTO RESTAURANT (Restaurant_Name, Address, Description, Opening_Hours) VALUES ('Little Penang Cafe', 'Lot G-43, Mid Valley Megamall', 'Classic Nyonya and Penang delights.', '10:00 - 22:00');
INSERT INTO RESTAURANT (Restaurant_Name, Address, Description, Opening_Hours) VALUES ('Sari Ratu Prima', '34, Jalan Bukit Bintang', 'Premium Indonesian Nasi Padang.', '11:00 - 21:00');
INSERT INTO RESTAURANT (Restaurant_Name, Address, Description, Opening_Hours) VALUES ('Burger Lab Subang', '3, Jalan SS15/4D, Subang Jaya', 'Juicy gourmet charcoal bun burgers.', '11:00 - 22:15');
INSERT INTO RESTAURANT (Restaurant_Name, Address, Description, Opening_Hours) VALUES ('Ding Tai Fung', 'Lot L6, Pavilion Kuala Lumpur', 'World famous Xiaolongbao and noodles.', '11:00 - 21:30');
INSERT INTO RESTAURANT (Restaurant_Name, Address, Description, Opening_Hours) VALUES ('Thaqwa Mamak Bistro', '15, Jalan Plumbum 7/7, Shah Alam', 'Late night local hangout spot.', '06:00 - 02:00');

-- Rider
INSERT INTO RIDER (Rider_Name, Email, Hashed_Password, Phone_Num, Vehicle_Plate, Vehicle_Type) VALUES ('Jane Doe', 'jane.rider@mail.com', '$2y$10$G4v/X1/ztBMqYgLtIzMGBOdAFPABWPHE3MExFPXPOuE93LhEmFXKC', '011-66531356', 'ABC-5678', 'Red Axie');
INSERT INTO RIDER (Rider_Name, Email, Hashed_Password, Phone_Num, Vehicle_Type) VALUES ('Leong Mei Hou', 'leong.rider@mail.com', '$2y$10$d9h4F.fHY4kTHlh9mMkIsuiUhsNb0tkSfg3ppZkGoK4lRrxj5l8xi', '016-4453456', 'Bicycle');
INSERT INTO RIDER (Rider_Name, Email, Hashed_Password, Phone_Num, Vehicle_Plate, Vehicle_Type) VALUES ('Ahmad Firdaus', 'ahmad.rider@mail.com', '$2y$10$b5y7N8m9K0xP1qW2e3r4t5y6u7i8o9p0a1s2d3f4g5h6j7k8l9z0x', '019-2233445', 'WXY-1234', 'Yamaha Y15');
INSERT INTO RIDER (Rider_Name, Email, Hashed_Password, Phone_Num, Vehicle_Plate, Vehicle_Type) VALUES ('Yong Kai Ting', 'yong.rider@mail.com', '$2y$10$v2b3n4m5j6k7l8q1w2e3r4t5y6u7i8o9p0a1s2d3f4g5h6j7k8l9z', '012-9988776', 'VAA-8888', 'Honda Wave');
INSERT INTO RIDER (Rider_Name, Email, Hashed_Password, Phone_Num, Vehicle_Plate, Vehicle_Type) VALUES ('Muthu Arumugam', 'muthu.rider@mail.com', '$2y$10$q1w2e3r4t5y6u7i8o9p0a1s2d3f4g5h6j7k8l9z0x1c2v3b4n5m6j', '017-5544332', 'BMS-4321', 'Modenas Kriss');
INSERT INTO RIDER (Rider_Name, Email, Hashed_Password, Phone_Num, Vehicle_Type) VALUES ('Siti Nurhaliza', 'siti.rider@mail.com', '$2y$10$z1x2c3v4b5n6m7j8k9l0q1w2e3r4t5y6u7i8o9p0a1s2d3f4g5h6j', '011-5543219', 'Bicycle');
INSERT INTO RIDER (Rider_Name, Email, Hashed_Password, Phone_Num, Vehicle_Plate, Vehicle_Type) VALUES ('Chao Zi Yang', 'chao.rider@mail.com', '$2y$10$a1s2d3f4g5h6j7k8l9z0x1c2v3b4n5m6j7k8l9q1w2e3r4t5y6u7i', '018-7766554', 'KCC-9191', 'Yamaha LC135');
INSERT INTO RIDER (Rider_Name, Email, Hashed_Password, Phone_Num, Vehicle_Plate, Vehicle_Type) VALUES ('Daniel Hafiz', 'daniel.rider@mail.com', '$2y$10$1w2e3r4t5y6u7i8o9p0a1s2d3f4g5h6j7k8l9z0x1c2v3b4n5m6j7', '013-4433221', 'PJJ-7070', 'Honda RS150');
INSERT INTO RIDER (Rider_Name, Email, Hashed_Password, Phone_Num, Vehicle_Plate, Vehicle_Type) VALUES ('Joan Ting', 'joan.rider@mail.com', '$2y$10$8k9l0q1w2e3r4t5y6u7i8o9p0a1s2d3f4g5h6j7k8l9z0x1c2v3b4', '016-2244668', 'MDD-3344', 'Sym Bonus');
INSERT INTO RIDER (Rider_Name, Email, Hashed_Password, Phone_Num, Vehicle_Type) VALUES ('Hazim Azmi', 'hazim.rider@mail.com', '$2y$10$e3r4t5y6u7i8o9p0a1s2d3f4g5h6j7k8l9z0x1c2v3b4n5m6j7k8l', '015-9911223', 'Electric Scooter');

-- Food
INSERT INTO FOOD (Food_Name) VALUES ('Pan Mee');
INSERT INTO FOOD (Food_Name) VALUES ('Cheeseburger');
INSERT INTO FOOD (Food_Name) VALUES ('Chicken Rice');
INSERT INTO FOOD (Food_Name) VALUES ('Roti Canai');
INSERT INTO FOOD (Food_Name) VALUES ('Sarawak Laksa');
INSERT INTO FOOD (Food_Name) VALUES ('Penang Laksa');
INSERT INTO FOOD (Food_Name) VALUES ('Nasi Lemak Ayam Goreng');
INSERT INTO FOOD (Food_Name) VALUES ('Char Kway Teow');
INSERT INTO FOOD (Food_Name) VALUES ('Mee Goreng Mamak');
INSERT INTO FOOD (Food_Name) VALUES ('Teh Tarik');

-- Menu
INSERT INTO MENU (Restaurant_ID, Food_ID, Price) VALUES (1, 1, 9.00); 
INSERT INTO MENU (Restaurant_ID, Food_ID, Price) VALUES (1, 2, 5.50); 
INSERT INTO MENU (Restaurant_ID, Food_ID, Price) VALUES (1, 5, 12.00); 
INSERT INTO MENU (Restaurant_ID, Food_ID, Price) VALUES (1, 6, 12.00); 
INSERT INTO MENU (Restaurant_ID, Food_ID, Price) VALUES (2, 3, 8.50); 
INSERT INTO MENU (Restaurant_ID, Food_ID, Price) VALUES (2, 5, 11.50); 
INSERT INTO MENU (Restaurant_ID, Food_ID, Price) VALUES (2, 6, 12.00); 
INSERT INTO MENU (Restaurant_ID, Food_ID, Price) VALUES (3, 2, 7.50); 
INSERT INTO MENU (Restaurant_ID, Food_ID, Price) VALUES (3, 4, 3.00); 
INSERT INTO MENU (Restaurant_ID, Food_ID, Price) VALUES (3, 6, 10.00); 
INSERT INTO MENU (Restaurant_ID, Food_ID, Price) VALUES (4, 7, 14.50);
INSERT INTO MENU (Restaurant_ID, Food_ID, Price) VALUES (4, 10, 3.50);
INSERT INTO MENU (Restaurant_ID, Food_ID, Price) VALUES (5, 9, 9.00);
INSERT INTO MENU (Restaurant_ID, Food_ID, Price) VALUES (6, 8, 13.00);
INSERT INTO MENU (Restaurant_ID, Food_ID, Price) VALUES (6, 10, 4.00);
INSERT INTO MENU (Restaurant_ID, Food_ID, Price) VALUES (7, 7, 18.00); 
INSERT INTO MENU (Restaurant_ID, Food_ID, Price) VALUES (8, 2, 18.50);
INSERT INTO MENU (Restaurant_ID, Food_ID, Price) VALUES (9, 1, 15.00);
INSERT INTO MENU (Restaurant_ID, Food_ID, Price) VALUES (10, 9, 7.50); 
INSERT INTO MENU (Restaurant_ID, Food_ID, Price) VALUES (10, 10, 2.50);

-- Payment Method
INSERT INTO PAYMENT_METHOD (Customer_ID, PaymentMethod) VALUES (1, 'Cash on Delivery');
INSERT INTO PAYMENT_METHOD (Customer_ID, PaymentMethod) VALUES (2, 'Visa');
INSERT INTO PAYMENT_METHOD (Customer_ID, PaymentMethod) VALUES (2, 'Touch n Go');
INSERT INTO PAYMENT_METHOD (Customer_ID, PaymentMethod) VALUES (3, 'Visa');
INSERT INTO PAYMENT_METHOD (Customer_ID, PaymentMethod) VALUES (3, 'Touch n Go');
INSERT INTO PAYMENT_METHOD (Customer_ID, PaymentMethod) VALUES (4, 'Mastercard');
INSERT INTO PAYMENT_METHOD (Customer_ID, PaymentMethod) VALUES (4, 'Cash on Delivery');
INSERT INTO PAYMENT_METHOD (Customer_ID, PaymentMethod) VALUES (5, 'Touch n Go');
INSERT INTO PAYMENT_METHOD (Customer_ID, PaymentMethod) VALUES (5, 'Maybank');
INSERT INTO PAYMENT_METHOD (Customer_ID, PaymentMethod) VALUES (6, 'Mastercard');
INSERT INTO PAYMENT_METHOD (Customer_ID, PaymentMethod) VALUES (7, 'Touch n Go');
INSERT INTO PAYMENT_METHOD (Customer_ID, PaymentMethod) VALUES (8, 'Visa');
INSERT INTO PAYMENT_METHOD (Customer_ID, PaymentMethod) VALUES (9, 'GrabPay');
INSERT INTO PAYMENT_METHOD (Customer_ID, PaymentMethod) VALUES (10, 'Maybank');

-- Order
INSERT INTO ORDERS (Customer_ID, Restaurant_ID, Rider_ID, Payment_Method_ID, Timestamp, Order_Status, Total_Food_Price, Delivery_Fee) VALUES (1, 3, 2, 1, '2026-06-06 12:30:00', 'completed', 10.50, 6.90);
INSERT INTO ORDERS (Customer_ID, Restaurant_ID, Rider_ID, Payment_Method_ID, Timestamp, Order_Status, Total_Food_Price, Delivery_Fee) VALUES (3, 2, 3, 4, '2026-06-06 19:45:00', 'completed', 11.50, 5.90);
INSERT INTO ORDERS (Customer_ID, Restaurant_ID, Rider_ID, Payment_Method_ID, Timestamp, Order_Status, Total_Food_Price, Delivery_Fee) VALUES (4, 2, 3, 5, '2026-06-07 11:31:00', 'completed', 35.50, 5.50);
INSERT INTO ORDERS (Customer_ID, Restaurant_ID, Rider_ID, Payment_Method_ID, Timestamp, Order_Status, Total_Food_Price, Delivery_Fee) VALUES (2, 1, 2, 3, '2026-06-07 12:09:00', 'completed', 23.50, 6.00);
INSERT INTO ORDERS (Customer_ID, Restaurant_ID, Rider_ID, Payment_Method_ID, Timestamp, Order_Status, Total_Food_Price, Delivery_Fee) VALUES (3, 3, 2, 4, '2026-06-07 12:11:00', 'completed', 22.50, 6.20);
INSERT INTO ORDERS (Customer_ID, Restaurant_ID, Rider_ID, Payment_Method_ID, Timestamp, Order_Status, Total_Food_Price, Delivery_Fee) VALUES (5, 4, 4, 7, '2026-06-08 08:15:00', 'completed', 18.00, 4.50);
INSERT INTO ORDERS (Customer_ID, Restaurant_ID, Rider_ID, Payment_Method_ID, Timestamp, Order_Status, Total_Food_Price, Delivery_Fee) VALUES (7, 6, 5, 11, '2026-06-08 13:02:00', 'completed', 17.00, 5.00);
INSERT INTO ORDERS (Customer_ID, Restaurant_ID, Rider_ID, Payment_Method_ID, Timestamp, Order_Status, Total_Food_Price, Delivery_Fee) VALUES (8, 8, 6, 12, '2026-06-09 19:10:00', 'completed', 18.50, 7.00);
INSERT INTO ORDERS (Customer_ID, Restaurant_ID, Rider_ID, Payment_Method_ID, Timestamp, Order_Status, Total_Food_Price, Delivery_Fee) VALUES (9, 10, 7, 13, '2026-06-11 22:30:00', 'in delivery', 10.00, 3.50);
INSERT INTO ORDERS (Customer_ID, Restaurant_ID, Rider_ID, Payment_Method_ID, Timestamp, Order_Status, Total_Food_Price, Delivery_Fee) VALUES (2, 7, 2, 3, '2026-06-11 22:50:00', 'preparing', 18.00, 6.00);

-- Order Item
INSERT INTO ORDER_ITEM (Order_ID, Menu_ID, Quantity) VALUES (1, 8, 1);
INSERT INTO ORDER_ITEM (Order_ID, Menu_ID, Quantity) VALUES (1, 9, 1);
INSERT INTO ORDER_ITEM (Order_ID, Menu_ID, Quantity) VALUES (2, 5, 1);
INSERT INTO ORDER_ITEM (Order_ID, Menu_ID, Quantity) VALUES (3, 6, 1);
INSERT INTO ORDER_ITEM (Order_ID, Menu_ID, Quantity) VALUES (3, 7, 2);
INSERT INTO ORDER_ITEM (Order_ID, Menu_ID, Quantity) VALUES (4, 1, 2);
INSERT INTO ORDER_ITEM (Order_ID, Menu_ID, Quantity) VALUES (4, 2, 1);
INSERT INTO ORDER_ITEM (Order_ID, Menu_ID, Quantity) VALUES (5, 8, 3);
INSERT INTO ORDER_ITEM (Order_ID, Menu_ID, Quantity) VALUES (6, 11, 1);
INSERT INTO ORDER_ITEM (Order_ID, Menu_ID, Quantity) VALUES (6, 12, 1);
INSERT INTO ORDER_ITEM (Order_ID, Menu_ID, Quantity) VALUES (7, 14, 1);
INSERT INTO ORDER_ITEM (Order_ID, Menu_ID, Quantity) VALUES (7, 15, 1);
INSERT INTO ORDER_ITEM (Order_ID, Menu_ID, Quantity) VALUES (8, 17, 1);
INSERT INTO ORDER_ITEM (Order_ID, Menu_ID, Quantity) VALUES (9, 19, 1);
INSERT INTO ORDER_ITEM (Order_ID, Menu_ID, Quantity) VALUES (9, 20, 1);
INSERT INTO ORDER_ITEM (Order_ID, Menu_ID, Quantity) VALUES (10, 16, 1);
INSERT INTO ORDER_ITEM (Order_ID, Menu_ID, Quantity) VALUES (2, 6, 1);
INSERT INTO ORDER_ITEM (Order_ID, Menu_ID, Quantity) VALUES (4, 5, 1);
INSERT INTO ORDER_ITEM (Order_ID, Menu_ID, Quantity) VALUES (5, 9, 2);
INSERT INTO ORDER_ITEM (Order_ID, Menu_ID, Quantity) VALUES (8, 20, 2);

-- Review
INSERT INTO REVIEW (Order_ID, Comments, Restaurant_Rating, Rider_Rating, Review_Timestamp) VALUES (1, 'Awesome Food!', 4, 3, '2026-06-06 13:00:00');
INSERT INTO REVIEW (Order_ID, Comments, Restaurant_Rating, Rider_Rating, Review_Timestamp) VALUES (2, 'Fast delivery.', 4, 3, '2026-06-06 20:00:00');
INSERT INTO REVIEW (Order_ID, Comments, Restaurant_Rating, Rider_Rating, Review_Timestamp) VALUES (3, 'Food was cold but acceptable.', 3, 4, '2026-06-07 12:30:00');
INSERT INTO REVIEW (Order_ID, Comments, Restaurant_Rating, Rider_Rating, Review_Timestamp) VALUES (4, 'Great portions!', 5, 5, '2026-06-07 13:00:00');
INSERT INTO REVIEW (Order_ID, Comments, Restaurant_Rating, Rider_Rating, Review_Timestamp) VALUES (5, 'A bit slow on the preparation.', 3, 4, '2026-06-07 13:15:00');
INSERT INTO REVIEW (Order_ID, Comments, Restaurant_Rating, Rider_Rating, Review_Timestamp) VALUES (6, 'Best nasi lemak in town.', 5, 4, '2026-06-08 09:00:00');
INSERT INTO REVIEW (Order_ID, Comments, Restaurant_Rating, Rider_Rating, Review_Timestamp) VALUES (7, 'Char kway teow had great wok hei.', 4, 5, '2026-06-08 14:00:00');
INSERT INTO REVIEW (Order_ID, Comments, Restaurant_Rating, Rider_Rating, Review_Timestamp) VALUES (8, 'The burger slab was amazing!', 5, 4, '2026-06-09 20:15:00');
```

## 5. Data Manipulation with SQL:
### i. At least one aggregate function (count, max, min, avg, sum)
#### Purpose
Analyses overall business volume and typical customer spending patterns at different order stages (Order_Status). By grouping the transactions, it uses five aggregate functions (COUNT, SUM, A VG, MIN, MAX) to track active cash flow, evaluate the average cost of an order, and pinpoint the cheapest and most expensive purchases made on the platform.

#### SQL Code
```sql
SELECT
  Order_Status,
  COUNT(Order_ID) AS Total_Orders_Processed,
  SUM(Total_Food_Price) AS Gross_Food_Revenue,
  SUM(Total_Food_Price + Delivery_Fee) AS Gross_Platform_Volume,
  AVG(Total_Food_Price) AS Average_Order_Value,
  MIN(Total_Food_Price) AS Minimum_Order_Value,
  MAX(Total_Food_Price) AS Maximum_Order_Value
FROM ORDERS
GROUP BY Order_Status;
```

#### Output
| order_status | total_orders_processed | gross_food_revenue | gross_platform_volume | average_order_value | minimum_order_value | maximum_order_value |
| --- | --- | --- | --- | --- | --- | --- |
| preparing | 1 | 18 | 24 | 18 | 18 | 18 |
| in delivery | 1 | 10 | 13.5 | 10 | 10 | 10 |
| completed | 8 | 157 | 204 | 19.625 | 10.5 | 35.5 |

### ii. At least one query with a group by and having clauses
#### Purpose
Tracks high-volume menu items and exceptional item-level sales performance across different merchants. By grouping via individual restaurants and their dishes, it uses the SUM aggregate to calculate total units sold, applying a minimum order quantity (HA VING > 2) to isolate most wanted food from slow-moving dishes and pinpoint the most influential menu drivers on the platform.

#### SQL Code
```sql
SELECT
  r.Restaurant_Name,
  f.Food_Name,
  SUM(oi.Quantity) AS Total_Quantity_Ordered
FROM
  ORDER_ITEM oi
JOIN
  MENU m ON oi.Menu_ID = m.Menu_ID
JOIN
  FOOD f ON m.Food_ID = f.Food_ID
JOIN
  RESTAURANT r ON m.Restaurant_ID = r.Restaurant_ID
GROUP BY
  r.Restaurant_Name,
  f.Food_Name
HAVING
  SUM(oi.Quantity) > 2
ORDER BY
  r.Restaurant_Name ASC,
  Total_Quantity_Ordered DESC;
```

#### Output
| restaurant_name | food_name | total_quantity_ordered |
| --- | --- | --- |
| Mamak Pokok Penang | Cheeseburger | 4 |
| Mamak Pokok Penang | Roti Canai | 3 |
| Thaqwa Mamak Bistro | Teh Tarik | 3 |

### iii. Trigger
#### Purpose
Automatically updates the avg_rating column in the RESTAURANT table and RIDER table instantly on every insert in the REVIEW table.

#### SQL Code
```sql
CREATE OR REPLACE FUNCTION update_averages_after_review()
RETURNS TRIGGER AS $$
DECLARE
  v_restaurant_id INT;
  v_rider_id INT;
  v_restaurant_avg DECIMAL(3, 2);
  v_rider_avg DECIMAL(3, 2);
BEGIN
  SELECT Restaurant_ID, Rider_ID
  INTO v_restaurant_id, v_rider_id
  FROM ORDERS
  WHERE Order_ID = NEW.Order_ID;

  IF v_restaurant_id IS NOT NULL THEN
    SELECT ROUND(AVG(Restaurant_Rating), 2) INTO v_restaurant_avg
    FROM REVIEW r
    JOIN ORDERS o ON r.Order_ID = o.Order_ID
    WHERE o.Restaurant_ID = v_restaurant_id;

    UPDATE RESTAURANT
      SET Avg_Rating = COALESCE(v_restaurant_avg, 0.00)
      WHERE Restaurant_ID = v_restaurant_id;
  END IF;

  IF v_rider_id IS NOT NULL THEN
    SELECT ROUND(AVG(Rider_Rating), 2) INTO v_rider_avg
    FROM REVIEW r
    JOIN ORDERS o ON r.Order_ID = o.Order_ID
    WHERE o.Rider_ID = v_rider_id;

    UPDATE RIDER
      SET Avg_Rating = COALESCE(v_rider_avg, 0.00)
      WHERE Rider_ID = v_rider_id;
  END IF;

RETURN NEW;
END;
$$ LANGUAGE plpgsql;
```

#### Implementation and Output
```sql
CREATE TRIGGER trg_review_after_insert
AFTER INSERT ON REVIEW
FOR EACH ROW
EXECUTE FUNCTION update_averages_after_review();
```

#### Before
```sql
SELECT Restaurant_Name, Avg_Rating FROM RESTAURANT WHERE Restaurant_ID = 2;
```

| restaurant_name | avg_rating |
| --- | --- |
| Hainam Kopitiam | 3.5 |

#### Insertion to trigger the function update_restaurant_avg_rating()
```sql
INSERT INTO REVIEW (Order_ID, Comments, Restaurant_Rating, Rider_Rating)
VALUES (3, 'Best place to find comfort food', 5, 5);
```

#### After
```sql
SELECT Restaurant_Name, Avg_Rating FROM RESTAURANT WHERE Restaurant_ID = 2;
```

| restaurant_name | avg_rating |
| --- | --- |
| Hainam Kopitiam | 4 |

#### Calculation and Explanation
```sql
SELECT
  r.Restaurant_Name,
  o.Order_ID,
  o.Timestamp AS Order_Time,
  rev.Restaurant_Rating,
  rev.Comments
FROM
  REVIEW rev
JOIN
  ORDERS o ON rev.Order_ID = o.Order_ID
JOIN
  RESTAURANT r ON o.Restaurant_ID = r.Restaurant_ID
WHERE
  r.Restaurant_ID = 2;
```

| restaurant_name | order_id | order_time | restaurant_rating | comments |
| --- | --- | --- | --- | --- |
| Hainam Kopitiam | 2 | 2026-06-06 19:45:00.000 | 4 | Fast delivery. |
| Hainam Kopitiam | 3 | 2026-06-07 11:31:00.000 | 3 | Food was cold but acceptable. |
| Hainam Kopitiam | 3 | 2026-06-07 11:31:00.000 | 5 | Best place to find comfort food |

(4 + 3 + 5) / 3 = 4 (new avg_rating for ‘Hainam Kopitiam’ with Resturarant_ID = 2)

### iv. Stored Procedure
#### Purpose
Recalculates the riders average rating on their completed order reviews and updates their profile in the rider table in case of an error by inputting the riders ID.

#### SQL Code
```sql
CREATE OR REPLACE PROCEDURE PlaceSingleItemOrder(
  p_Customer_ID INT,
  p_Restaurant_ID INT,
  p_Rider_ID INT,
  p_Payment_Method_ID INT,
  p_Total_Food_Price DECIMAL(10,2),
  p_Delivery_Fee DECIMAL(10,2),
  p_Menu_ID INT,
  p_Quantity INT
)
LANGUAGE plpgsql
AS $$
DECLARE
  v_Payment_Valid INT := 0;
  v_New_Order_ID INT;
BEGIN
  – Checks if the payment method belongs to the customer
  SELECT COUNT(*) INTO v_Payment_Valid
  FROM PAYMENT_METHOD
  WHERE Payment_Method_ID = p_Payment_Method_ID AND Customer_ID = p_Customer_ID;

  – If it doesn't belong then throws error
  IF v_Payment_Valid = 0 THEN
    RAISE EXCEPTION 'Invalid Payment Method for this customer.';
  END IF;

  – Inserts Into order
  INSERT INTO ORDERS (
    Customer_ID, Restaurant_ID, Rider_ID, Payment_Method_ID, Timestamp, Order_Status, Total_Food_Price, Delivery_Fee
  ) VALUES (
    p_Customer_ID, p_Restaurant_ID, p_Rider_ID, p_Payment_Method_ID, NOW(), 'preparing', p_Total_Food_Price, p_Delivery_Fee
  )
  RETURNING Order_ID INTO v_New_Order_ID; -- Postgres cleanly captures serial IDs like this

  INSERT INTO ORDER_ITEM (Order_ID, Menu_ID, Quantity)
    VALUES (v_New_Order_ID, p_Menu_ID, p_Quantity);
END;
$$;
```

#### Before
```sql
SELECT * FROM ORDERS
ORDER BY Order_ID DESC
LIMIT 1;
```

| order_id | customer_id | restaurant_id | rider_id | payment_method_id | timestamp | order_status | total_food_price | delivery_fee |
| --- | --- | --- | --- | --- | --- | --- | --- | --- |
| 10 | 2 | 7 | 2 | 3 | 2026-06-11 22:50:00.000 | preparing | 18 | 6 |

#### Insertion of New Data
```sql
CALL PlaceSingleItemOrder(2, 1, 2, 3, 18.00, 6.00, 1, 2);
```

#### After
```sql
SELECT * FROM ORDERS
ORDER BY Order_ID DESC
LIMIT 1;
```

| order_id | customer_id | restaurant_id | rider_id | payment_method_id | timestamp | order_status | total_food_price | delivery_fee |
| --- | --- | --- | --- | --- | --- | --- | --- | --- |
| 11 | 2 | 1 | 2 | 3 | 2026-06-15 14:51:14.519 | preparing | 18 | 6 |

### Bonus
Error Handling where Payment Method does not belong to Customer

```sql
CALL PlaceSingleItemOrder(
  1,     -- Customer_ID (Alice)
  1,
  2,
  3,     -- Payment_Method_ID (Belongs to Chong)
  18.00,
  6.00,
  1,
  2
);
```
#### Output
`SQL Error [P0001]: [127.0.0.1:46562/ocalhost/127.0.0.1:5432] ERROR: Invalid Payment Method for this ustomer.`

### v. View
#### Purpose
Create a view v_active_delivery_monitor to only retrieve all the information related to the active deliveries conveniently.

#### SQL Code
```sql
SELECT
CREATE OR REPLACE VIEW v_active_delivery_monitor AS
  o.Order_ID,
  o.Timestamp AS Order_Placed_Time,
  o.Order_Status,
  r.Restaurant_Name,
  r.Address AS Restaurant_Pickup_Address,
  rd.Rider_Name,
  rd.Vehicle_Type,
  rd.Vehicle_Plate,
  c.Customer_Name,
  c.Address AS Customer_Delivery_Address
FROM
  ORDERS o
JOIN
  RESTAURANT r ON o.Restaurant_ID = r.Restaurant_ID
JOIN
  RIDER rd ON o.Rider_ID = rd.Rider_ID
JOIN
  CUSTOMER c ON o.Customer_ID = c.Customer_ID
WHERE
  o.Order_Status IN ('preparing', 'in delivery');
```

#### Output
```sql
SELECT * FROM v_active_delivery_monitor;
```

| order_id | order_placed_time | order_status | restaurant_name | restaurant_pickup_address | rider_name | vehicle_type | vehicle_plate | customer_name | customer_delivery_address |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
| 9 | 2026-06-11 22:30:00.000 | in delivery | Thaqwa Mamak Bistro | 15, Jalan Plumbum 7/7, Shah Alam | Chao Zi Yang | Yamaha LC135 | KCC-9191 | Aaron Ting | C-10-3, Kiara Designer Suites, Mont Kiara |
| 10 | 2026-06-11 22:50:00.000 | preparing | Sari Ratu Prima | 34, Jalan Bukit Bintang | Leong Mei Hou | Bicycle | [NULL] | Chong Jun Jet | A15-20-01, Condominium Seri Maya, Sri Petaling |

### vi. Subqueries/nested queries
#### Purpose
Identifies the top five restaurants on the platform by filtering through ratings. By filtering through the average ratings of each restaurant and limiting to the top 5, it allows customers to select the best of the best restaurants in the platform to ensure customers have a pleasant experience with their order.

#### SQL Code
```sql
SELECT
  Restaurant_Name,
  Avg_Rating
FROM
  RESTAURANT
WHERE
  Avg_Rating > (
    SELECT AVG(Avg_Rating)
    FROM RESTAURANT
  )
ORDER BY
  Avg_Rating DESC
  LIMIT 5;
```

#### Output
| restaurant_name | avg_rating |
| --- | --- |
| Old Taste Kopitiam | 5 |
| Nasi Kandar Pelita | 5 |
| Burger Lab Subang | 5 |
| Little Penang Cafe | 4 |
| Hainam Kopitiam | 3.67 |

### vii. At least two queries not covered in lecture/tutorial such as display the top n records, concatenate strings, etc.
#### Purpose
Retrieves every rider’s details of their most recently completed delivery. The LATERAL keyword allows subqueries inside JOIN to be able to “see” ri.Rider_ID, which is in the RIDER ri table outside of ORDERS o table.

#### SQL Code
```sql
SELECT
  ri.Rider_Name,
  ri.Vehicle_Type,
  latest_order.Timestamp AS Last_Delivery_Time,
  latest_order.Total_Food_Price AS Last_Order_Value,
  latest_order.Delivery_Fee AS Last_Fee_Earned
FROM RIDER ri
CROSS JOIN LATERAL (
  SELECT o.Timestamp, o.Total_Food_Price, o.Delivery_Fee
  FROM ORDERS o
  WHERE o.Rider_ID = ri.Rider_ID AND o.Order_Status = 'completed'
  ORDER BY o.Timestamp DESC
  LIMIT 1
) latest_order;
```

#### Output
| rider_name | vehicle_type | last_delivery_time | last_order_value | last_fee_earned |
| --- | --- | --- | --- | --- |
| Leong Mei Hou | Bicycle | 2026-06-07 12:11:00.000 | 22.5 | 6.2 |
| Ahmad Firdaus | Yamaha Y15 | 2026-06-07 11:31:00.000 | 35.5 | 5.5 |
| Yong Kai Ting | Honda Wave | 2026-06-08 08:15:00.000 | 18 | 4.5 |
| Muthu Arumugam | Modenas Kriss | 2026-06-08 13:02:00.000 | 17 | 5 |
| Siti Nurhaliza | Bicycle | 2026-06-09 19:10:00.000 | 18.5 | 7 |

#### Purpose
Displays each rider’s completed deliveries, active deliveries and total earnings using the modern FILTER clause to easily count and sum different order statuses at the exact same time.

#### SQL Code
```sql
SELECT
  ri.Rider_Name,
  COUNT(o.Order_ID) FILTER (WHERE o.Order_Status = 'completed') AS Completed_Deliveries,
  COUNT(o.Order_ID) FILTER (WHERE o.Order_Status IN ('preparing', 'in delivery')) AS Active_Deliveries,
  SUM(o.Delivery_Fee) FILTER (WHERE o.Order_Status = 'completed') AS Total_Earned_Fees
FROM RIDER ri
LEFT JOIN ORDERS o ON ri.Rider_ID = o.Rider_ID
GROUP BY ri.Rider_ID, ri.Rider_Name;
```

#### Output
| rider_name | completed_deliveries | active_deliveries | total_earned_fees |
| --- | --- | --- | --- |
| Yong Kai Ting | 1 | 0 | 4.5 |
| Joan Ting | 0 | 0 | [NULL] |
| Hazim Azmi | 0 | 0 | [NULL] |
| Chao Zi Yang | 0 | 1 | [NULL] |
| Jane Doe | 0 | 0 | [NULL] |
| Daniel Hafiz | 0 | 0 | [NULL] |
| Leong Mei Hou | 3 | 1 | 19.1 |
| Siti Nurhaliza | 1 | 0 | 7 |
| Ahmad Firdaus | 2 | 0 | 11.4 |
| Muthu Arumugam | 1 | 0 | 5 |

#### Purpose
Displays each restaurant's total revenue, total orders, and overall platform revenue and orders using ROLLUP to count each group and count the total at the same time.

#### SQL Code
```sql
SELECT
  COALESCE(r.Restaurant_Name, 'TOTAL') AS Restaurant_Name,
  SUM(o.Total_Food_Price) AS Total_Revenue,
  COUNT(o.Order_ID) AS Total_Orders
FROM ORDERS o
JOIN RESTAURANT r ON o.Restaurant_ID = r.Restaurant_ID
GROUP BY ROLLUP(r.Restaurant_Name)
ORDER BY Total_Revenue ASC NULLS LAST;
```

#### Output
| restaurant_name | total_revenue | total_orders |
| --- | --- | --- |
| Thaqwa Mamak Bistro | 10 | 1 |
| Little Penang Cafe | 17 | 1 |
| Nasi Kandar Pelita | 18 | 1 |
| Sari Ratu Prima | 18 | 1 |
| Burger Lab Subang | 18.5 | 1 |
| Mamak Pokok Penang | 33 | 2 |
| Old Taste Kopitiam | 41.5 | 2 |
| Hainam Kopitiam | 47 | 2 |
| TOTAL | 203 | 11 |

#### Purpose
Displays each rider's peak/off peak hour deliveries and average earned per delivery using WHERE EXTRACT to extract the hours from the timestamp and search for on or off peak deliveries.

#### SQL Code
```sql
SELECT
  ri.Rider_Name,
  COUNT(o.Order_ID) FILTER (
    WHERE EXTRACT(HOUR FROM o.Timestamp) IN (11, 12, 13, 17, 18, 19, 20)
  ) AS Peak_Hour_Deliveries,
  COUNT(o.Order_ID) FILTER (
    WHERE EXTRACT(HOUR FROM o.Timestamp) NOT IN (11, 12, 13, 17, 18, 19, 20)
  ) AS Off_Peak_Deliveries,
  COALESCE(
    ROUND(
      SUM(o.Delivery_Fee) FILTER (WHERE o.Order_Status = 'completed') / NULLIF(COUNT(o.Order_ID) FILTER (WHERE o.Order_Status = 'completed'), 0),
      2
    ),
    0
  ) AS Avg_Earned_Per_Delivery
FROM RIDER ri
LEFT JOIN ORDERS o ON ri.Rider_ID = o.Rider_ID
GROUP BY ri.Rider_ID, ri.Rider_Name
ORDER BY Peak_Hour_Deliveries DESC;
```

#### Output
| rider_name | peak_hour_deliveries | off_peak_deliveries | avg_earned_per_delivery |
| --- | --- | --- | --- |
| Leong Mei Hou | 3 | 2 | 6.37 |
| Ahmad Firdaus | 2 | 0 | 5.7 |
| Muthu Arumugam | 1 | 0 | 5 |
| Siti Nurhaliza | 1 | 0 | 7 |
| Daniel Hafiz | 0 | 0 | 0 |
| Hazim Azmi | 0 | 0 | 0 |
| Chao Zi Yang | 0 | 1 | 0 |
| Joan Ting | 0 | 0 | 0 |
| Yong Kai Ting | 0 | 1 | 4.5 |
| Jane Doe | 0 | 0 | 0 |
