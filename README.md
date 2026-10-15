# Banking Customer Accounts — SQL Analytics Project

A SQL Server portfolio project that uses relational banking-style data to answer customer, account, transaction, and loan questions. The project includes **17 SQL queries** covering common reporting and analytical patterns.

## Project Overview

The script creates four related tables:

- `Customers` — customer and account profile information
- `Accounts` — account balances and opening dates
- `Transactions` — transaction types, amounts, and dates
- `Loans` — loan amounts and categories

The project is designed to demonstrate how SQL can turn structured records into answers to practical business questions.

## Technology

- Microsoft SQL Server
- SQL Server Management Studio (SSMS)
- T-SQL

## SQL Concepts Demonstrated

- `INNER JOIN` and `LEFT JOIN`
- `GROUP BY`, `HAVING`, and aggregate functions
- Subqueries and filtering against calculated values
- Ranking with `RANK()` and `DENSE_RANK()`
- Window functions including `LAG()` and `LEAD()`
- Running totals and transaction analysis

## Example Business Questions

- Which customers have the highest account balances?
- What are the total deposited and withdrawn amounts by transaction type?
- Which customers have taken loans?
- Which customers have not taken a loan?
- How much transaction activity is associated with each customer?
- How do customers rank by balance or transaction activity?

## How to Run

1. Install [SQL Server](https://www.microsoft.com/sql-server) and [SQL Server Management Studio](https://learn.microsoft.com/sql/ssms/download-sql-server-management-studio-ssms) if needed.
2. Clone or download this repository.
3. Open `Assignment1.sql` in SSMS.
4. Execute the script using a SQL Server connection with permission to create a database. The script creates and selects a database named `Assignment`, creates the tables, inserts sample records, and runs the queries.
5. Review the result grids for each query.

> **Note:** The script creates a database called `Assignment`. If that name is already in use, change the database name near the top of the script before running it. Run this script only in a development or learning SQL Server environment.

## Repository Contents

| File | Purpose |
|---|---|
| `Assignment1.sql` | Database setup, sample records, and SQL queries |
| `SQL Mini Project.pdf` | Project write-up |

## Data Note

This repository contains sample records intended for a learning project. It is not a production banking database and should not be used for real financial decisions.

## Skills Highlighted

**SQL · Relational Data · Data Analysis · Business Reporting · Query Design · Analytical Thinking**

## Author

**Yash Takalkar**  
[LinkedIn](https://www.linkedin.com/in/yash-takalkar-5a364a284/) · [GitHub](https://github.com/Yash-0608)
