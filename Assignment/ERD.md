```mermaid
erDiagram
    CUSTOMER ||--o{ ORDER : places
    CUSTOMER ||--|{ PAYMENT_METHOD : owns
    RESTAURANT ||--|{ MENU : makes
    FOOD ||--o{ MENU : contains
    RESTAURANT ||--o{ ORDER : prepares
    RIDER ||--o{ ORDER : delivers
    CUSTOMER ||--o{ REVIEW : writes
    ORDER ||--o| REVIEW : generates
    PAYMENT_METHOD ||--o{ ORDER : "pay using"
    ORDER ||--|{ ORDER_ITEM : contains
    MENU ||--o{ ORDER_ITEM : "ordered in"

    CUSTOMER {
        int Customer_ID PK
        string Customer_Name
        string Email
        string Phone_Num
        string Hashed_Password
        string Address
    }
    RESTAURANT {
        int Restaurant_ID PK
        string Restaurant_Name
        string Address
        string Description
        int Avg_Rating
    }
    RIDER {
        int Rider_ID PK
        string Rider_Name
        string Email
        string Hashed_Password
        string Phone_Num
        string Vehicle_Plate
        string Vehicle_Type
    }
    FOOD {
        int Food_ID PK
        string Food_Name
        float Price
    }
    MENU {
        int Menu_ID PK
        int Restaurant_ID FK
        int Food_ID FK
    }
    ORDER {
        int Order_ID PK
        int Customer_ID FK
        int Restaurant_ID FK
        int Rider_ID FK
        int Payment_Method_ID FK
        datetime Timestamp
    }
    REVIEW {
        int Review_ID PK
        int Customer_ID FK
        int Order_ID FK
        string Comments
        int User_Rating
    }
    PAYMENT_METHOD{
        int Payment_Method_ID PK
        int Customer_ID FK
        string PaymentMethod
    }
    ORDER_ITEM {
        int Order_ID FK, PK
        int Menu_ID FK, PK
        int Quantity
    }
