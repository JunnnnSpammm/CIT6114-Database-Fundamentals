### 1. Enter the following data into Excel.

|     Month        |     Campaign    |     City                |     Cost        |     Sales      |     Profit       |
|------------------|-----------------|-------------------------|-----------------|----------------|------------------|
|     January      |     Digi        |     KUALA LUMPUR        |     1000000     |     2000000    |     1000000      |
|     February     |     Celcom      |     JOHOR BAHRU         |     200000      |     300000     |     100000       |
|     March        |     Hot Link    |     IPOH                |     555555      |     7777777    |     7222222      |
|     April        |     Red Fone    |     CYBERJAYA           |     2000000     |     5000000    |     3000000      |
|     May          |     Vodafone    |     KUCHING             |     30000       |     500000     |     470000       |
|     June         |     AT and T    |     KOTA KINABALU       |     10000       |     200000     |     190000       |
|     July         |     Docomo      |     SHAH ALAM           |     777777      |     555555     |     -222222      |
|     August       |     EuroTel     |     PUTRAJAYA           |     25000       |     1234567    |     1209567      |
|     September    |     Maxis       |     KUALA TERENGGANU    |     200000      |     8888888    |     8688888      |
|     October      |     Jaring      |     KUALA KANGSAR       |     80000       |     250000     |     170000       |
|     November     |     Streamxy    |     SEPANG              |     111111      |     99999      |     -11112       |
|     December     |     Linksys     |     GEORGE TOWN         |     23232323    |     150000     |     -23082323    |

### 2. Go to “Insert” tab and click at the “PivotTable”. Select the option “PivotTable”.

### 3. You should see the dialog box below. Click “OK” button.

### 4. After clicking the “OK” button, you should see the figure below.

### 5. Drag “City” followed by “Month” to the “Row Labels” column. Identify the changes to the excel table on the left.

### 6. Drag the “Add Campaign” to the “Column Labels”. See the results.

| Sum of Profit    | Column   Labels |        |         |         |         |          |        |           |         |          |          |          |             |
|------------------|-----------------|--------|---------|---------|---------|----------|--------|-----------|---------|----------|----------|----------|-------------|
| Row Labels       | AT and T        | Celcom | Digi    | Docomo  | EuroTel | Hot Link | Jaring | Linksys   | Maxis   | Red Fone | Streamxy | Vodafone | Grand Total |
| January          |                 |        | 1000000 |         |         |          |        |           |         |          |          |          | 1000000     |
| KUALA LUMPUR     |                 |        | 1000000 |         |         |          |        |           |         |          |          |          | 1000000     |
| February         |                 | 100000 |         |         |         |          |        |           |         |          |          |          | 100000      |
| JOHOR BAHRU      |                 | 100000 |         |         |         |          |        |           |         |          |          |          | 100000      |
| March            |                 |        |         |         |         | 7222222  |        |           |         |          |          |          | 7222222     |
| IPOH             |                 |        |         |         |         | 7222222  |        |           |         |          |          |          | 7222222     |
| April            |                 |        |         |         |         |          |        |           |         | 3000000  |          |          | 3000000     |
| CYBERJAYA        |                 |        |         |         |         |          |        |           |         | 3000000  |          |          | 3000000     |
| May              |                 |        |         |         |         |          |        |           |         |          |          | 470000   | 470000      |
| KUCHING          |                 |        |         |         |         |          |        |           |         |          |          | 470000   | 470000      |
| June             | 190000          |        |         |         |         |          |        |           |         |          |          |          | 190000      |
| KOTA KINABALU    | 190000          |        |         |         |         |          |        |           |         |          |          |          | 190000      |
| July             |                 |        |         | -222222 |         |          |        |           |         |          |          |          | -222222     |
| SHAH ALAM        |                 |        |         | -222222 |         |          |        |           |         |          |          |          | -222222     |
| August           |                 |        |         |         | 1209567 |          |        |           |         |          |          |          | 1209567     |
| PUTRAJAYA        |                 |        |         |         | 1209567 |          |        |           |         |          |          |          | 1209567     |
| September        |                 |        |         |         |         |          |        |           | 8688888 |          |          |          | 8688888     |
| KUALA TERENGGANU |                 |        |         |         |         |          |        |           | 8688888 |          |          |          | 8688888     |
| October          |                 |        |         |         |         |          | 170000 |           |         |          |          |          | 170000      |
| KUALA KANGSAR    |                 |        |         |         |         |          | 170000 |           |         |          |          |          | 170000      |
| November         |                 |        |         |         |         |          |        |           |         |          | -11112   |          | -11112      |
| SEPANG           |                 |        |         |         |         |          |        |           |         |          | -11112   |          | -11112      |
| December         |                 |        |         |         |         |          |        | -23082323 |         |          |          |          | -23082323   |
| GEORGE TOWN      |                 |        |         |         |         |          |        | -23082323 |         |          |          |          | -23082323   |
| Grand Total      | 190000          | 100000 | 1000000 | -222222 | 1209567 | 7222222  | 170000 | -23082323 | 8688888 | 3000000  | -11112   | 470000   | -1264980    |

### 7. Experiment with the different combinations to get the result below:

| Row Labels  | Sum of Profit |
|-------------|---------------|
| January     | 1000000       |
| February    | 100000        |
| March       | 7222222       |
| April       | 3000000       |
| May         | 470000        |
| June        | 190000        |
| July        | -222222       |
| August      | 1209567       |
| September   | 8688888       |
| October     | 170000        |
| November    | -11112        |
| December    | -23082323     |
| Grand Total | -1264980      |

| Row Labels       | Sum of Profit |
|------------------|---------------|
| CYBERJAYA        | 3000000       |
| GEORGE TOWN      | -23082323     |
| IPOH             | 7222222       |
| JOHOR BAHRU      | 100000        |
| KOTA KINABALU    | 190000        |
| KUALA KANGSAR    | 170000        |
| KUALA LUMPUR     | 1000000       |
| KUALA TERENGGANU | 8688888       |
| KUCHING          | 470000        |
| PUTRAJAYA        | 1209567       |
| SEPANG           | -11112        |
| SHAH ALAM        | -222222       |
| Grand Total      | -1264980      |

| Row Labels       | Sum of Profit | Sum of Resulting Sales |
|------------------|---------------|------------------------|
| CYBERJAYA        | 3000000       | 5000000                |
| GEORGE TOWN      | -23082323     | 150000                 |
| IPOH             | 7222222       | 7777777                |
| JOHOR BAHRU      | 100000        | 300000                 |
| KOTA KINABALU    | 190000        | 200000                 |
| KUALA KANGSAR    | 170000        | 250000                 |
| KUALA LUMPUR     | 1000000       | 2000000                |
| KUALA TERENGGANU | 8688888       | 8888888                |
| KUCHING          | 470000        | 500000                 |
| PUTRAJAYA        | 1209567       | 1234567                |
| SEPANG           | -11112        | 99999                  |
| SHAH ALAM        | -222222       | 555555                 |
| Grand Total      | -1264980      | 26956786               |
