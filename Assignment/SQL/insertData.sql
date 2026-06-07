-- Customer
INSERT INTO CUSTOMER (Customer_Name, Email, Phone_Num, Hashed_Password, Address) VALUES ('Alice Smith', 'alice@mail.com', '011-1234567', '$2y$10$Yg6DSfMEOE24IbNFlIt0nuGkRqkR9XkOfFhCTY.ZkR9.MOGFjXFd.', '14, Jalan Hormoni, Kuala Lumpur');
INSERT INTO CUSTOMER (Customer_Name, Email, Phone_Num, Hashed_Password, Address) VALUES ('Chong Jun Jet', 'chong@mail.com', '013-2345678', '$2y$10$jEKF0NV.WyT2kEA/NpQbt.Zf5ciWvBGBbzy8DrSrRiiUHCnrwX2Xm', 'A15-20-01, Condominium Seri Maya, Sri Petaling');
INSERT INTO CUSTOMER (Customer_Name, Email, Phone_Num, Hashed_Password, Address) VALUES ('Tengku Zaiful', 'tengku@mail.com', '013-3456789', '$2y$10$UxztvrbJ1r9.D.alogpG.O1kN4I6QVdVlafW2R54YavllWygpEmcS', '3, Jalan Setiawangsa, Setiawangsa');
INSERT INTO CUSTOMER (Customer_Name, Email, Phone_Num, Hashed_Password, Address) VALUES ('Lee Kar Sheng', 'karsheng@mail.com', '017-4567890', '$2y$10$dzb9JnaTFCOoImR6fR4gAu0LhbBTo0tLxvZxcnGGp28xWEZqWoaGK', '45, Jalan Madani, Taman Melati');
INSERT INTO CUSTOMER (Customer_Name, Email, Phone_Num, Hashed_Password, Address) VALUES ('June Ting', 'june@mail.com', '012-5678901', '$2y$10$ax3q9Yuz2E7SiW/hE0GKougoIGeHmgCKILVC.OjyfEZ0g3GCfsxEC', '4, Jalan Chee Chong Kat, Ampang');
INSERT INTO CUSTOMER (Customer_Name, Email, Phone_Num, Hashed_Password, Address) VALUES ('Mohd Aizat', 'aizat@mail.com', '015-6789012', '$2y$10$8jy2n0kkqR.KSC9bslmDUOELW5nWE.H0cXYbCs80hS7P4v8rOv6He', 'B05-10, Condominium Serene, Cheras');

-- Restaurant
INSERT INTO RESTAURANT (Restaurant_Name, Address, Description, Opening_Hours) VALUES ('Old Taste Kopitiam', '10, Edusphere, Cyberjaya', 'Kopitiam with cheap and delicious food.', '5:00 - 23:30');
INSERT INTO RESTAURANT (Restaurant_Name, Address, Description, Opening_Hours, Avg_Rating) VALUES ('Hainam Kopitiam', '12, Jalan SS15, Subang Jaya', 'Kopitiam pack with local Malaysian cuisine.', '10:00 - 22:00', 4);
INSERT INTO RESTAURANT (Restaurant_Name, Address, Description, Opening_Hours, Avg_Rating) VALUES ('Mamak Pokok Penang', '12, Jalan Puteri 2, Bandar Puteri', 'Cheap and delicious Mamak food.', '12:30 - 21:30', 4);

-- Rider
INSERT INTO RIDER (Rider_Name, Email, Hashed_Password, Phone_Num, Vehicle_Plate, Vehicle_Type, Avg_Rating) VALUES ('Jane Doe', 'jane.rider@mail.com', '$2y$10$G4v/X1/ztBMqYgLtIzMGBOdAFPABWPHE3MExFPXPOuE93LhEmFXKC', '011-66531356', 'ABC-5678', 'Red Axie', 3);
INSERT INTO RIDER (Rider_Name, Email, Hashed_Password, Phone_Num, Vehicle_Type, Avg_Rating) VALUES ('Leong Mei Hou', 'leong.rider@mail.com', '$2y$10$d9h4F.fHY4kTHlh9mMkIsuiUhsNb0tkSfg3ppZkGoK4lRrxj5l8xi', '016-4453456', 'Bicycle', 3);

-- Food
INSERT INTO FOOD (Food_Name) VALUES ('Pan Mee');
INSERT INTO FOOD (Food_Name) VALUES ('Cheeseburger');
INSERT INTO FOOD (Food_Name) VALUES ('Chicken Rice');
INSERT INTO FOOD (Food_Name) VALUES ('Roti Canai');
INSERT INTO FOOD (Food_Name) VALUES ('Sarawak Laksa');
INSERT INTO FOOD (Food_Name) VALUES ('Penang Laksa');

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

-- Payment Method
INSERT INTO PAYMENT_METHOD (Customer_ID, PaymentMethod) VALUES (1, 'Cash on Delivery');
INSERT INTO PAYMENT_METHOD (Customer_ID, PaymentMethod) VALUES (2, 'Visa');
INSERT INTO PAYMENT_METHOD (Customer_ID, PaymentMethod) VALUES (2, 'Touch n Go');
INSERT INTO PAYMENT_METHOD (Customer_ID, PaymentMethod) VALUES (3, 'Visa');
INSERT INTO PAYMENT_METHOD (Customer_ID, PaymentMethod) VALUES (4, 'Mastercard');
INSERT INTO PAYMENT_METHOD (Customer_ID, PaymentMethod) VALUES (5, 'Touch n Go');
INSERT INTO PAYMENT_METHOD (Customer_ID, PaymentMethod) VALUES (5, 'Maybank');
INSERT INTO PAYMENT_METHOD (Customer_ID, PaymentMethod) VALUES (6, 'Mastercard');

-- Order
INSERT INTO `ORDER` (Customer_ID, Restaurant_ID, Rider_ID, Payment_Method_ID, Timestamp, Order_Status, Total_Food_Price, Delivery_Fee) VALUES (1, 3, 1, 1, '2026-06-06 12:30:00', 'completed', 10.50, 6.90);
INSERT INTO `ORDER` (Customer_ID, Restaurant_ID, Rider_ID, Payment_Method_ID, Timestamp, Order_Status, Total_Food_Price, Delivery_Fee) VALUES (3, 2, 2, 4, '2026-06-06 19:45:00', 'completed', 11.50, 5.90);
INSERT INTO `ORDER` (Customer_ID, Restaurant_ID, Rider_ID, Payment_Method_ID, Timestamp, Order_Status, Total_Food_Price, Delivery_Fee) VALUES (4, 2, 2, 5, '2026-06-07 11:31:00', 'in delivery', 35.50, 5.50);
INSERT INTO `ORDER` (Customer_ID, Restaurant_ID, Rider_ID, Payment_Method_ID, Timestamp, Order_Status, Total_Food_Price, Delivery_Fee) VALUES (2, 1, 1, 3, '2026-06-07 12:09:00', 'in delivery', 23.50, 6.00);
INSERT INTO `ORDER` (Customer_ID, Restaurant_ID, Rider_ID, Payment_Method_ID, Timestamp, Order_Status, Total_Food_Price, Delivery_Fee) VALUES (3, 3, 1, 4, '2026-06-07 12:11:00', 'preparing', 22.50, 6.20);

-- Order Item
INSERT INTO ORDER_ITEM (Order_ID, Menu_ID, Quantity) VALUES (1, 8, 1);
INSERT INTO ORDER_ITEM (Order_ID, Menu_ID, Quantity) VALUES (1, 9, 1);
INSERT INTO ORDER_ITEM (Order_ID, Menu_ID, Quantity) VALUES (2, 5, 1);
INSERT INTO ORDER_ITEM (Order_ID, Menu_ID, Quantity) VALUES (3, 6, 1);
INSERT INTO ORDER_ITEM (Order_ID, Menu_ID, Quantity) VALUES (3, 7, 2);
INSERT INTO ORDER_ITEM (Order_ID, Menu_ID, Quantity) VALUES (4, 1, 2);
INSERT INTO ORDER_ITEM (Order_ID, Menu_ID, Quantity) VALUES (4, 2, 1);
INSERT INTO ORDER_ITEM (Order_ID, Menu_ID, Quantity) VALUES (5, 8, 3);

-- Review
INSERT INTO REVIEW (Order_ID, Comments, Restaurant_Rating, Rider_Rating, Review_Timestamp) VALUES (1, 'Awesome Food!', 4, 3, '2026-06-06 13:00:00');
INSERT INTO REVIEW (Order_ID, Comments, Restaurant_Rating, Rider_Rating, Review_Timestamp) VALUES (2, 'Fast delivery.', 4, 3, '2026-06-06 20:00:00');
