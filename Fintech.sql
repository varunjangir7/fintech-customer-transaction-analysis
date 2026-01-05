CREATE TABLE transactions (
    transaction_id INT,
    customer_id INT,
    transaction_date DATE,
    amount DECIMAL(10,2),
    status VARCHAR(50),
    payment_type VARCHAR(50),
    merchant_category VARCHAR(100)
);
CREATE TABLE customers (
    customer_id INT,
    city VARCHAR(100),
    join_date DATE
);
CREATE TABLE date (
    date DATE,
    year INT,
    month INT,
    month_name VARCHAR(20)
);
select*from transactions;

SELECT COUNT(*) FROM transactions;
SELECT COUNT(*) FROM customers;
SELECT COUNT(*) FROM date;


CREATE VIEW vw_transactions AS
SELECT
    t.transaction_id,
    t.customer_id,
    c.city,
    c.join_date,
    t.transaction_date,
    d.year,
    d.month,
    d.month_name,
    t.amount,
    t.status,
    t.payment_type,
    t.merchant_category
FROM transactions t
LEFT JOIN customers c
    ON t.customer_id = c.customer_id
LEFT JOIN date d
    ON t.transaction_date = d.date;

CREATE VIEW vw_customers AS
SELECT
    customer_id,
    city,
    join_date
FROM customers;


CREATE VIEW vw_raw_date AS
SELECT
    date,
    year,
    month,
    month_name
FROM date;


CREATE VIEW customer_transaction_behavior AS
SELECT
    t.customer_id,
    COUNT(t.transaction_id) AS total_transactions,
    SUM(t.amount) AS total_amount,
    AVG(t.amount) AS avg_transaction_amount,
    MAX(t.transaction_date) AS last_transaction_date
FROM vw_transactions t
GROUP BY t.customer_id;


SELECT *
FROM customer_transaction_behavior
LIMIT 10;

CREATE VIEW customer_value_risk AS
SELECT
    b.customer_id,
    b.total_transactions,
    b.total_amount,
    b.avg_transaction_amount,
    b.last_transaction_date,

    CASE
        WHEN b.total_amount >= (
            SELECT PERCENTILE_CONT(0.75)
            WITHIN GROUP (ORDER BY total_amount)
            FROM customer_transaction_behavior
        ) THEN 'High Value'
        WHEN b.total_amount >= (
            SELECT PERCENTILE_CONT(0.25)
            WITHIN GROUP (ORDER BY total_amount)
            FROM customer_transaction_behavior
        ) THEN 'Medium Value'
        ELSE 'Low Value'
    END AS customer_value_segment,

    CASE
        WHEN CURRENT_DATE - b.last_transaction_date <= 30 THEN 'Active'
        WHEN CURRENT_DATE - b.last_transaction_date BETWEEN 31 AND 90 THEN 'At Risk'
        ELSE 'Dormant'
    END AS customer_risk_segment

FROM customer_transaction_behavior b;

SELECT customer_value_segment, customer_risk_segment, COUNT(*) 
FROM customer_value_risk
GROUP BY customer_value_segment, customer_risk_segment;




