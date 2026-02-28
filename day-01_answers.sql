-- Day 1 Answers (PostgreSQL)
-- Assumes tables + data already exist (run day-01_questions.sql first)

-- A1
SELECT * FROM customers;

-- A2
SELECT full_name, city FROM customers;

-- A3
SELECT * FROM customers
WHERE city = 'Paris';

-- A4
SELECT * FROM customers
WHERE city IS NULL;

-- A5
SELECT * FROM orders
WHERE total_amount >= 50
ORDER BY order_date DESC;

-- A6
SELECT * FROM orders
WHERE status = 'delivered'
ORDER BY total_amount DESC;

-- A7
SELECT DISTINCT status FROM orders;

-- A8
SELECT * FROM orders
WHERE order_date BETWEEN '2026-02-10' AND '2026-02-20'
ORDER BY order_date;

-- A9
SELECT * FROM customers
WHERE full_name LIKE '%ha%';

-- A10
SELECT * FROM orders
WHERE status IN ('processing','delivered');

-- A11
SELECT order_id, total_amount * 1.2 AS total_with_tax
FROM orders;

-- A12
SELECT * FROM orders
ORDER BY total_amount DESC
LIMIT 2;

-- A13
SELECT * FROM payments
WHERE paid_date IS NULL;

-- A14
SELECT * FROM payments
WHERE method = 'card' AND amount > 0;
