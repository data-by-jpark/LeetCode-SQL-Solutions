# 🚀 LeetCode SQL Solutions

Welcome to my SQL practice repository! This project documents my journey through the **LeetCode SQL 50** study plan. As an aspiring Data Analyst, I am using these challenges to master data retrieval, complex joins, and advanced analytical functions.

## 📊 Progress Overview
I am currently working through the **SQL 50** list to build a solid foundation in relational database management.

| # | Section | Problem | Title | Difficulty | Key Concept | Solution | Status |
| :--- | :--- | :--- | :--- | :--- | :--- | :--- | :--- |
| 1 | **Select** | 1757 | Recyclable and Low Fat Products | Easy | `WHERE` (Multiple Conditions) | [View Code](./Select/1757-recyclable-and-low-fat-products.sql) | 🟢 Done |
| 2 | **Select** | 584 | Find Customer Referee | Easy | `IS NULL` / `Handling NULLs` | [View Code](./Select/584-find-customer-referee.sql) | 🟢 Done |
| 3 | **Select** | 595 | Big Countries | Easy | `WHERE` with `OR` Logic | [View Code](./Select/595-big-countries.sql) | 🟢 Done |
| 4 | **Basic Joins** | 1378 | Replace Employee ID With Unique Identifier | Easy | `LEFT JOIN` | [Link]() | ⚪ Todo |
| 5 | **Aggregates** | 1075 | Project Employees I | Easy | `AVG()` / `ROUND()` | [Link]() | ⚪ Todo |
| 6 | **Sorting** | 619 | Biggest Single Number | Easy | `GROUP BY` / `HAVING` | [Link]() | ⚪ Todo |

---

## 📂 Repository Structure
The solutions are organized by the core SQL concepts tested:

* **`/Select`**: Basic data filtering and column selection.
* **`/Basic-Joins`**: Combining data from multiple tables (Inner, Left, Right).
* **`/Aggregates`**: Summarizing data using `GROUP BY`, `SUM`, `AVG`, and `COUNT`.
* **`/Advanced-Select`**: Window functions, subqueries, and complex logic.

---

## 🛠️ Tech Stack
* **Dialect:** MySQL
* **Tools:** LeetCode, VS Code, Git/GitHub
* **Key Concepts:** Data Cleaning, Joins, CTEs, Window Functions

---

## 📈 Featured Solution
### [1757. Recyclable and Low Fat Products](./Select/1757-recyclable-and-low-fat-products.sql)
**Concept:** Basic Filtering (`WHERE` clause with multiple conditions).
```sql
SELECT product_id 
FROM Products 
WHERE low_fats = 'Y' AND recyclable = 'Y';
```

---

## 📬 Contact & Portfolio
**Jihye Jay Park** Aspiring Data Analyst | Toronto, ON

* **LinkedIn**: [Link to your LinkedIn]

* **Portfolio**: [Link to your portfolio site or main GitHub profile]