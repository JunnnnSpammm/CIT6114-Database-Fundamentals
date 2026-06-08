# Lab 9 Guide: 3NF Companion

## Part A: Discussion

1. What is normalization? What are the advantages of normalization?

Normalization is a process for evaluating and correcting table structures to minimize data redundancy. In another word, normalization is a process to re-assign attributes to the correct table.

**Advantages:**
1. Reduces data redundancy
2. Increases data integrity
3. Eliminate data anomalies (insert, update and delete)
4. Maximise data consistency

2. What is the normal form for the following table? Explain your answer.

|     Staff_ID      |     Staff_Name    |     Staff_Age    |     Course_Type    |     Hourly_Fees    |
|-------------------|-------------------|------------------|--------------------|--------------------|
|     x984562333    |     Patrick       |     24           |     IT             |     50             |
|     x159883489    |     Jessica       |     28           |     ENG            |     60             |
|     x889652783    |     Evon          |     23           |     IT             |     50             |
|     x456652673    |     Silvia        |     36           |     MGNT           |     30             |
|     x789734559    |     Terrance      |     32           |     ENG            |     60             |

The table is in 2NF, because there are no partial dependencies. 

However, it is not in 3NF, since it exhibits transitive dependency, where a non-key attribute (Hourly_Fees) is dependent on a non-key attribute (Course_Type)

3. Why in certain cases we need to perform de-normalization on database tables?

Because a normalized database may have excessive tables and relationships. This in turn requires more processing resulting in reduced system performance.

4. Given the initial dependency diagram as follows.

    1. Identify partial and transitive (if any) dependencies from the diagram.
    2. Then normalize the dependency diagram into 3NF.

<img width="470" height="130" alt="image" src="https://github.com/user-attachments/assets/f84e200d-31a7-4e05-8c51-e17dc01ed595" />

* **Second normal form (2NF)**
```
SUBJECT (SUB_ID, SUB_NAME)
STAFF (STAFF_ID, STAFF_NAME, STAFF_PHONE, JOB_TYPE, HOURLY_PAY)
STAFF_SUBJECT (SUB_ID, STAFF_ID, EVA_SCORE)
```

* **Third normal form (3NF)**
```
SUBJECT (SUB_ID, SUB_NAME)
STAFF (STAFF_ID, STAFF_NAME, STAFF_PHONE, JOB_TYPE)
STAFF_SUBJECT (SUB_ID, STAFF_ID, EVA_SCORE)
PAY (JOB_TYPE, HOURLY_PAY)
```

5. Demonstrate step-by-step on how to convert the figure below to 3NF.

* **Step 1:** Convert to 2NF (Remove **Partial** Dependency)
* **Step 2:** Convert to 3NF (Remove **Transitive** Dependency)
