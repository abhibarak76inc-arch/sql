-- Day 1 (PostgreSQL / OneCompiler)
-- Seed + Questions only (NO answers)

SET client_min_messages TO warning;

DROP TABLE IF EXISTS payments;
DROP TABLE IF EXISTS orders;
DROP TABLE IF EXISTS customers;

CREATE TABLE customers (
  customer_id INT PRIMARY KEY,
  full_name   TEXT NOT NULL,
  city        TEXT,
  signup_date DATE NOT NULL
);

CREATE TABLE orders (
  order_id     INT PRIMARY KEY,
  customer_id  INT NOT NULL REFERENCES customers(customer_id),
  order_date   DATE NOT NULL,
  status       TEXT NOT NULL,
  total_amount NUMERIC(10,2) NOT NULL
);

CREATE TABLE payments (
  payment_id INT PRIMARY KEY,
  order_id   INT NOT NULL REFERENCES orders(order_id),
  paid_date  DATE,
  method     TEXT,
  amount     NUMERIC(10,2) NOT NULL
);

INSERT INTO customers VALUES
(1,'Aarav Mehta','Paris','2025-10-10'),
(2,'Inaya Singh','Lyon','2025-11-03'),
(3,'Kabir Sharma',NULL,'2025-12-20'),
(4,'Zara Khan','Paris','2026-01-05');

INSERT INTO orders VALUES
(101,1,'2026-02-01','delivered',120.00),
(102,1,'2026-02-10','cancelled',80.00),
(103,2,'2026-02-11','delivered',55.50),
(104,3,'2026-02-15','processing',200.00),
(105,4,'2026-02-20','delivered',15.00);

INSERT INTO payments VALUES
(1001,101,'2026-02-02','card',120.00),
(1002,102,NULL,'card',0.00),
(1003,103,'2026-02-11','paypal',55.50),
(1004,105,'2026-02-20','card',15.00);

-- Sanity check (optional)
SELECT 'customers' AS table_name, COUNT(*) AS rows FROM customers
UNION ALL
SELECT 'orders', COUNT(*) FROM orders
UNION ALL
SELECT 'payments', COUNT(*) FROM payments;

-- =========================
-- QUESTIONS (solve below)
-- =========================

-- Q1: List all customers (all columns).

-- Q2: Show customer names and cities only.

-- Q3: List customers who are in Paris.

-- Q4: List customers whose city is unknown (NULL).

-- Q5: Show all orders with total_amount >= 50, newest first.

-- Q6: Show delivered orders only, ordered by total_amount descending.

-- Q7: Show distinct order statuses.

-- Q8: Show orders between '2026-02-10' and '2026-02-20' inclusive.

-- Q9: Show customers whose name contains 'ha'.

-- Q10: Show orders where status is in ('processing','delivered').

-- Q11: For each order, show order_id and total_amount * 1.2 as total_with_tax.

-- Q12: List top 2 highest-value orders.

-- Q13: Show payments that have no paid_date (NULL).

-- Q14: Show all card payments with amount > 0.
