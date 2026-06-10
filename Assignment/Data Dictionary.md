# Data Dictionary

## CUSTOMER

| ATTRIBUTE NAME | CONTENTS | TYPE | FORMAT | RANGE | REQUIRED | PK OR FK | FK REFERENCED TABLE |
| :--- | :--- | :--- | :--- | :--- | :--- | :--- | :--- |
| Customer_ID | Customer's ID | INT UNSIGNED | 9999 | 1-4,294,967,295 | Y | PK | |
| Customer_Name | Customer's name | VARCHAR(255) | Xxxxxxxxx | | Y | | |
| Email | Customer's email | VARCHAR(255) | xxxxxx@xxxxx.xxx | | Y | | |
| Phone Num | Customer's phone number | VARCHAR(50) | 012-34567890 | | | | |
| Hashed_Password | Account's encrypted password | VARCHAR(255) | xxxxxxxxx | | Y | | |
| Address | Customer's home address | TEXT | Xxxxxxxxx | | Y | | |

## RESTAURANT

| ATTRIBUTE NAME | CONTENTS | TYPE | FORMAT | RANGE | REQUIRED | PK OR FK | FK REFERENCED TABLE |
| :--- | :--- | :--- | :--- | :--- | :--- | :--- | :--- |
| Restaurant_ID | Restaurant's ID | INT UNSIGNED | 9999 | 1-4,294,967,295 | Y | PK | |
| Restaurant_Name | Restaurant's name | VARCHAR(255) | Xxxxxxxxxx | | Y | | |
| Address | Restaurant's address | TEXT | Xxxxxxxxxx | | Y | | |
| Description | Restaurant's description | TEXT | Xxxxxxxxxx | | | | |
| Opening_Hours | Restaurant's opening hours | VARCHAR(100) | hh:mm hh:mm | 00:00-24:00 | Y | | |
| Avg_Rating | Restaurant's average rating | DECIMAL(3, 2) | 5.00 | 1.00-5.00 | | | |

## RIDER

| ATTRIBUTE NAME | CONTENTS | TYPE | FORMAT | RANGE | REQUIRED | PK OR FK | FK REFERENCED TABLE |
| :--- | :--- | :--- | :--- | :--- | :--- | :--- | :--- |
| Rider_ID | Restaurant's ID | INT UNSIGNED | 9999 | 1-4,294,967,295 | Y | PK | |
| Rider_Name | Restaurant's name | VARCHAR(255) | Xxxxxxxxxx | | Y | | |
| Email | Restaurant's address | VARCHAR(255) | xxxxxx@xxxxx.xxx | | Y | | |
| Hashed_Password | Restaurant's description | VARCHAR(255) | Xxxxxxxxxx | | Y | | |
| Phone Num | Rider's phone number | VARCHAR(50) | 012-34567890 | | | | |
| Vehicle Plate | Rider's vehicle plate number | VARCHAR(20) | XXX 0000 | | | | |
| Vehicle_Type | Rider's vehicle type | VARCHAR(50) | Xxxxxxxxxx | | Y | | |
| Avg_Rating | Rider's average rating | DECIMAL(3, 2) | 5.00 | 1.00-5.00 | | | |

## FOOD

| ATTRIBUTE NAME | CONTENTS | TYPE | FORMAT | REQUIRED RANGE | PK OR FK | FK REFERENCED TABLE |
| :--- | :--- | :--- | :--- | :--- | :--- | :--- |
| Food ID | Food's ID | INT UNSIGNED | 9999 | 1-4,294,967,295 Y | PK | |
| Food_Name | Food's name | VARCHAR(255) | Xxxxxxxxxx | Y | | |

## MENU

| ATTRIBUTE NAME | CONTENTS | TYPE | FORMAT | RANGE | REQUIRED | PK OR FK | FK REFERENCED TABLE |
| :--- | :--- | :--- | :--- | :--- | :--- | :--- | :--- |
| Menu_ID | Menu's ID | INT UNSIGNED | 9999 | 1-4,294,967,295 | Y | PK | |
| Restaurant_ID | Restaurant's ID | INT UNSIGNED | 9999 | 1-4,294,967,295 | Y | FK | Restaurant_ID |
| Food ID | Food's ID | INT UNSIGNED | 9999 | 1-4,294,967,295 | Y | FK | Food ID |
| Price | Menu's price | DECIMAL(10, 2) | 9999.99 | 0.01- 99999999.99 | Y | | |

## PAYMENT_METHOD

| ATTRIBUTE NAME | CONTENTS | TYPE | FORMAT | RANGE | REQUIRED | PK OR FK | FK REFERENCED TABLE |
| :--- | :--- | :--- | :--- | :--- | :--- | :--- | :--- |
| Payment_Method_ID | Payment method's ID | INT UNSIGNED | 9999 | 1-4,294,967,295 | Y | PK | |
| Customer_ID | Customer's ID | INT UNSIGNED | 9999 | 1-4,294,967,295 | Y | FK | Customer_ID |
| PaymentMethod | Payment method's name | VARCHAR(100) | Xxxxxxxxxx | | Y | | |

## ORDER

| ATTRIBUTE NAME | CONTENTS | TYPE | FORMAT | RANGE | REQUIRED | PK OR FK | FK REFERENCED TABLE |
| :--- | :--- | :--- | :--- | :--- | :--- | :--- | :--- |
| Order_ID | Order's ID | INT UNSIGNED | 9999 | 1-4,294,967,295 | Y | PK | |
| Customer ID | Customer's ID | INT UNSIGNED | 9999 | 1-4,294,967,295 | Y | FK | Customer ID |
| Restaurant_ID | Restaurant's ID | INT UNSIGNED | 9999 | 1-4,294,967,295 | Y | FK | Restaurant ID |
| Rider_ID | Restaurant's ID | INT UNSIGNED | 9999 | 1-4,294,967,295 | Y | FK | Rider_ID |
| Payment_Method_ID | Payment method's ID | INT UNSIGNED | 9999 | 1-4,294,967,295 | Y | FK | Payment_Method_ID |
| Timestamp | Date and time when the order was made | DATETIME | YYYY-MM-DD HH:MM:SS | | Y | | |
| Order Status | Current order status | VARCHAR(15) | Xxxxxxxxxx | Preparing, in delivery, completed | Y | | |
| Total Food Price | Total price of this order | DECIMAL(10, 2) | 9999.99 | 0.01-99999999.99 | Y | | |
| Delivery_Fee | Delivery fee paid to rider | DECIMAL(10, 2) | 9999.99 | 0.01-99999999.99 | Y | | |

## ORDER_ITEM

| ATTRIBUTE NAME | CONTENTS | TYPE | FORMAT | RANGE | REQUIRED | PK OR FK | FK REFERENCED TABLE |
| :--- | :--- | :--- | :--- | :--- | :--- | :--- | :--- |
| Order_Item_ID | Order item's ID | INT UNSIGNED | 9999 | 1-4,294,967,295 | Y | PK | |
| Order_ID | Order's ID | INT UNSIGNED | 9999 | 1-4,294,967,295 | Y | PK, FK | Order_ID |
| Menu_ID | Menu's ID | INT UNSIGNED | 9999 | 1-4,294,967,295 | Y | FK | Menu ID |
| Quantity | Quantity ordered for this menu by the customer | INT UNSIGNED | 9 | 1-4,294,967,295 | Y | | |

## REVIEW

| ATTRIBUTE NAME | CONTENTS | TYPE | FORMAT | RANGE | REQUIRED | PK OR FK | FK REFERENCED TABLE |
| :--- | :--- | :--- | :--- | :--- | :--- | :--- | :--- |
| Review_ID | Review's ID | INT UNSIGNED | 9999 | 1-4,294,967,295 | Y | PK | |
| Order_ID | Order's ID | INT UNSIGNED | 9999 | 1-4,294,967,295 | Y | PK, FK | Order_ID |
| Comments | Comment for this review | TEXT | Xxxxxxxxxx | | | | |
| Restaurant_Rating | Stars given to the restaurant | INT UNSIGNED | 5 | 1-5 | Y | | |
| Rider_Rating | Stars given to the rider | INT UNSIGNED | 5 | 1-5 | Y | | |
| Review_Timestamp | Date and time when the order was made | DATETIME | YYYY-MM-DD HH:MM:SS | | Y | | |
