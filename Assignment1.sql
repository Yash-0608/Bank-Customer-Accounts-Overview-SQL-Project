-- New Database
create database Assignment;
use Assignment;

-- Adding all Tables

CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    CustomerName VARCHAR(100) Unique,
    PhoneNo VARCHAR(15) Unique,
    City VARCHAR(50),
    AccountType VARCHAR(20),
    AccountNo INT Unique
);

INSERT INTO Customers VALUES
(1, 'Rahul Sharma', '9876543210', 'Pune', 'Savings',1001),
(2, 'Sneha Patil', '9988776655', 'Mumbai', 'Current',1002),
(3, 'Aman Verma', '9123456780', 'Nagpur', 'Savings',1003),
(4, 'Priya Singh', '9012345678', 'Delhi', 'Current',1004),
(5, 'Karan Mehta', '9871203456', 'Hyderabad', 'Savings',1005),
(6, 'Neha Joshi', '9988001122', 'Pune', 'Current',1006),
(7, 'Rohit Kumar', '9765432109', 'Bangalore', 'Savings',1007),
(8, 'Pooja Sharma', '9876540001', 'Chennai', 'Savings',1008),
(9, 'Vivek Shah', '9001122334', 'Ahmedabad', 'Current',1009),
(10, 'Anjali Verma', '9988771100', 'Jaipur', 'Savings',1010);

select * from Customers;

CREATE TABLE Accounts (
    AccountID INT PRIMARY KEY,
    CustomerID INT,
    Balance DECIMAL(12,2),
    OpenDate DATE,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

INSERT INTO Accounts VALUES
(1001, 1, 55000, '2025-01-10'),
(1002, 2, 120000, '2024-11-20'),
(1003, 3, 35000, '2025-03-15'),
(1004, 4, 98000, '2025-02-01'),
(1005, 5, 75000, '2025-01-25'),
(1006, 6, 150000, '2024-12-18'),
(1007, 7, 42000, '2025-04-10'),
(1008, 8, 88000, '2025-05-05'),
(1009, 9, 200000, '2024-09-30'),
(1010, 10, 67000, '2025-03-22');

select * from Accounts;

CREATE TABLE Transactions (
    TransactionID INT PRIMARY KEY,
    AccountID INT,
    TransactionType VARCHAR(20),
    Amount DECIMAL(12,2),
    TransactionDate DATE,
    FOREIGN KEY (AccountID) REFERENCES Accounts(AccountID)
);

INSERT INTO Transactions VALUES
(1, 1001, 'Deposit', 10000, '2026-06-01'),
(2, 1001, 'Withdraw', 5000, '2026-06-02'),
(3, 1002, 'Deposit', 25000, '2026-06-02'),
(4, 1003, 'Withdraw', 3000, '2026-06-03'),
(5, 1004, 'Deposit', 15000, '2026-06-04'),
(6, 1005, 'Deposit', 12000, '2026-06-05'),
(7, 1006, 'Withdraw', 7000, '2026-06-05'),
(8, 1007, 'Deposit', 9000, '2026-06-06'),
(9, 1008, 'Withdraw', 4500, '2026-06-06'),
(10, 1009, 'Deposit', 30000, '2026-06-07'),
(11, 1010, 'Withdraw', 2000, '2026-06-07'),
(12, 1002, 'Withdraw', 10000, '2026-06-08'),
(13, 1003, 'Deposit', 5000, '2026-06-08'),
(14, 1005, 'Withdraw', 3500, '2026-06-09'),
(15, 1007, 'Deposit', 15000, '2026-06-09');

select * from Transactions;

CREATE TABLE Loans (
    LoanID INT PRIMARY KEY,
    CustomerID INT,
    LoanAmount DECIMAL(12,2),
    LoanType VARCHAR(50),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

INSERT INTO Loans VALUES
(1, 1, 500000, 'Home Loan'),
(2, 2, 200000, 'Car Loan'),
(3, 4, 100000, 'Education Loan'),
(4, 5, 300000, 'Business Loan'),
(5, 6, 150000, 'Personal Loan'),
(6, 8, 250000, 'Home Loan'),
(7, 9, 400000, 'Business Loan'),
(8, 10, 180000, 'Car Loan');

select * from Loans;

-- Question 1 :  Display customer names, account numbers, and account balances using INNER JOIN.

SELECT c.CustomerName,a.AccountID,a.Balance
FROM Customers c
INNER JOIN Accounts a
ON c.CustomerID = a.CustomerID;

-- Question2 : Find the top 3 customers with the highest account balances.

SELECT TOP 3 c.CustomerName,a.AccountID,a.Balance
FROM Customers c
INNER JOIN Accounts a
ON c.CustomerID = a.CustomerID
ORDER BY a.Balance DESC;

-- Question 3 : Show all customers who have taken loans along with loan amount and loan type.

SELECT c.CustomerName,l.LoanAmount,l.LoanType
FROM Customers c
INNER JOIN Loans l
ON c.CustomerID = l.CustomerID;

-- Question 4 : Find the total deposited amount and total withdrawn amount separately.

SELECT TransactionType, SUM(Amount) as Total_Amount
FROM Transactions
GROUP BY TransactionType;

-- Question 5 : Display customer-wise total transaction amount using GROUP BY.

SELECT c.CustomerName,SUM(t.Amount) AS TotalTransactionAmount
FROM Customers c JOIN Accounts a
ON c.CustomerID = a.CustomerID JOIN Transactions t
ON a.AccountID = t.AccountID
GROUP BY c.CustomerName;

--Question 6 : Find customers whose balances are greater than the average bank balance.

SELECT c.customername , a.balance
FROM Customers c JOIN Accounts a 
ON c.CustomerID = a.CustomerID
WHERE a.balance > (SELECT AVG(balance) FROM Accounts);

-- Question 7 : Show the highest transaction amount performed by each customer

SELECT c.customername , MAX(t.amount) as MAX_ammount
FROM Customers c JOIN ACCOUNTS a 
ON c.CustomerID = a.CustomerID JOIN Transactions t
ON a.AccountID = t.AccountID
GROUP BY c.CustomerName;

-- Question 8 : Display all customers who have not taken any loans using LEFT JOIN.

SELECT c.CustomerName
FROM Customers c LEFT JOIN Loans l
ON c.CustomerID = l.CustomerID
WHERE l.CustomerID IS NULL;

-- Question 9 : Find the total number of transactions performed by each customer.

SELECT c.customername , COUNT(t.transactionid) as Total_Transactions
FROM Customers c JOIN Accounts a
ON c.CustomerID = a.CustomerID JOIN Transactions t
ON a.AccountID = t.AccountID
GROUP BY c.customername;

-- Question 10 : Rank customers based on their account balances using RANK() window function.

SELECT c.CustomerName,a.Balance,
RANK() OVER (ORDER BY a.Balance DESC) AS Balance_Rank
FROM Customers c
JOIN Accounts a
ON c.CustomerID = a.CustomerID;

-- Question 11 : Display dense ranking of customers according to balance using DENSE_RANK()

SELECT c.CustomerName, a.Balance,
DENSE_RANK() OVER (ORDER BY a.Balance DESC) AS Dense_Rank
FROM Customers c
JOIN Accounts a
ON c.CustomerID = a.CustomerID;

--Question 12 : Show previous transaction amount using LAG() function.

SELECT TransactionID,TransactionDate,Amount,
LAG(Amount) OVER (ORDER BY TransactionDate) AS Previous_Amount
FROM Transactions;

--Question 13 : Show next transaction amount using LEAD() function.

SELECT TransactionID,TransactionDate,Amount,
LEAD(Amount) OVER (ORDER BY TransactionDate) AS Next_Amount
FROM Transactions;

-- Question 14 :  Calculate running total of transaction amounts using SUM() OVER()

SELECT TransactionID,TransactionDate,Amount,
SUM(Amount) OVER (ORDER BY TransactionDate) AS Running_Total
FROM Transactions;

-- Question 15 : Find the second highest account balance using subquery or window function.

SELECT MAX(Balance) AS Second_Highest_Balance
FROM Accounts
WHERE Balance < (
    SELECT MAX(Balance)
    FROM Accounts
);

-- Question 16 : Find customers who performed more than 2 transactions

SELECT c.CustomerName,COUNT(t.TransactionID) AS Total_Transactions
FROM Customers c
JOIN Accounts a
ON c.CustomerID = a.CustomerID
JOIN Transactions t
ON a.AccountID = t.AccountID
GROUP BY c.CustomerName
HAVING COUNT(t.TransactionID) > 2;

-- Question 17 : Display customer-wise minimum and maximum transaction amounts.

SELECT c.CustomerName,MIN(t.Amount) AS Min_Transaction,MAX(t.Amount) AS Max_Transaction
FROM Customers c JOIN Accounts a
ON c.CustomerID = a.CustomerID
JOIN Transactions t
ON a.AccountID = t.AccountID
GROUP BY c.CustomerName;