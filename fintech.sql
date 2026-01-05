-- create table for csv data 


CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    city VARCHAR(50),
    join_date DATE
);
CREATE TABLE date (
    date DATE PRIMARY KEY,
    year INT,
    month INT,
    month_name VARCHAR(20)
);
CREATE TABLE transactions (
    transaction_id BIGINT PRIMARY KEY,
    customer_id INT,
    transaction_date DATE,
    amount INT,
    status VARCHAR(10),
    payment_type VARCHAR(10),
    merchant_category VARCHAR(30)
);

--select query for viewing data 

select*from customers;
select*from date;
select*from transactions;


SELECT COUNT(*) 
FROM transactions
WHERE amount <= 0;


UPDATE transactions
SET status = UPPER(status);


SELECT COUNT(*)
FROM transactions
WHERE transaction_date > '2025-12-31';

--high amount flags 

ALTER TABLE transactions
ADD COLUMN high_amount_flag BOOLEAN;

UPDATE transactions
SET high_amount_flag = 
    CASE 
        WHEN amount >= 30000 THEN TRUE
        ELSE FALSE
    END;



--customer transaction summary

CREATE VIEW v_customer_transaction_summary AS
SELECT
    ft.customer_id,
    COUNT(ft.transaction_id) AS total_transactions,
    SUM(CASE WHEN ft.status = 'SUCCESS' THEN ft.amount ELSE 0 END) AS total_success_amount,
    AVG(ft.amount) AS avg_transaction_amount,
    MAX(ft.transaction_date) AS last_transaction_date,
    SUM(CASE WHEN ft.high_amount_flag = TRUE THEN 1 ELSE 0 END) AS high_amount_txn_count
FROM transactions ft
GROUP BY ft.customer_id;
select*from v_customer_transaction_summary;	

--monthly transaction behave 

CREATE VIEW v_monthly_transaction_behavior AS
SELECT
    d.year,
    d.month,
    d.month_name,
    COUNT(ft.transaction_id) AS total_transactions,
    SUM(ft.amount) AS total_amount,
    AVG(ft.amount) AS avg_transaction_amount,
    SUM(CASE WHEN ft.status = 'FAILED' THEN 1 ELSE 0 END) AS failed_transactions
FROM transactions ft
JOIN date d
    ON ft.transaction_date = d.date
GROUP BY d.year, d.month, d.month_name
ORDER BY d.month;
select*from  v_monthly_transaction_behavior;


--customer value risk 


CREATE VIEW v_customer_value_risk_segmentation AS
SELECT
    c.customer_id,
    c.city,
    COUNT(ft.transaction_id) AS txn_count,
    SUM(ft.amount) AS total_amount,
    AVG(ft.amount) AS avg_amount,
    SUM(CASE WHEN ft.status = 'FAILED' THEN 1 ELSE 0 END) AS failed_txn_count,
    SUM(CASE WHEN ft.high_amount_flag = TRUE THEN 1 ELSE 0 END) AS high_amount_txn_count,

    CASE
        WHEN SUM(ft.amount) >= 150000 AND COUNT(ft.transaction_id) >= 20 THEN 'HIGH VALUE'
        WHEN SUM(ft.amount) BETWEEN 50000 AND 149999 THEN 'MEDIUM VALUE'
        ELSE 'LOW VALUE'
    END AS customer_value_segment,

    CASE
        WHEN SUM(CASE WHEN ft.high_amount_flag = TRUE THEN 1 ELSE 0 END) >= 3
             OR SUM(CASE WHEN ft.status = 'FAILED' THEN 1 ELSE 0 END) >= 5
        THEN 'RISK PRONE'
        ELSE 'NORMAL'
    END AS risk_segment

FROM transactions ft
JOIN customers c
    ON ft.customer_id = c.customer_id
GROUP BY c.customer_id, c.city;
select*from v_customer_value_risk_segmentation;

Removed outdated files after project refactor




