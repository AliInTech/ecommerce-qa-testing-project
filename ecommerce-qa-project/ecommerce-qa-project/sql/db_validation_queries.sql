-- =====================================================================
-- ShopEase E-Commerce — Database Validation Queries (QA Portfolio Project)
-- =====================================================================
-- These queries are written against a SIMPLIFIED SAMPLE SCHEMA representing
-- what a typical e-commerce backend would expose. Run the CREATE TABLE and
-- sample INSERT statements below first (on MySQL, PostgreSQL, or SQLite)
-- to actually execute and practice these validations yourself.
--
-- Purpose: show how a QA engineer validates that UI actions (add to cart,
-- place order, apply coupon, change stock) are correctly reflected at the
-- DATABASE level, not just on screen.
-- =====================================================================

-- ---------------------------------------------------------------------
-- SECTION 0: Sample Schema (run this first to try the queries yourself)
-- ---------------------------------------------------------------------

DROP TABLE IF EXISTS order_items;
DROP TABLE IF EXISTS orders;
DROP TABLE IF EXISTS cart_items;
DROP TABLE IF EXISTS coupons;
DROP TABLE IF EXISTS products;
DROP TABLE IF EXISTS users;

CREATE TABLE users (
    user_id        INT PRIMARY KEY,
    full_name      VARCHAR(100),
    email          VARCHAR(100) UNIQUE NOT NULL,
    password_hash  VARCHAR(255) NOT NULL,
    created_at     DATETIME
);

CREATE TABLE products (
    product_id     INT PRIMARY KEY,
    product_name   VARCHAR(150) NOT NULL,
    price          DECIMAL(10,2) NOT NULL,
    stock_quantity INT NOT NULL DEFAULT 0,
    category       VARCHAR(80)
);

CREATE TABLE coupons (
    coupon_id      INT PRIMARY KEY,
    code           VARCHAR(30) UNIQUE NOT NULL,
    discount_pct   DECIMAL(5,2),
    valid_from     DATE,
    valid_to       DATE,
    is_active      TINYINT(1) DEFAULT 1
);

CREATE TABLE cart_items (
    cart_item_id   INT PRIMARY KEY,
    user_id        INT NOT NULL,
    product_id     INT NOT NULL,
    quantity       INT NOT NULL,
    added_at       DATETIME,
    FOREIGN KEY (user_id) REFERENCES users(user_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

CREATE TABLE orders (
    order_id       INT PRIMARY KEY,
    user_id        INT NOT NULL,
    order_status   VARCHAR(30) NOT NULL,   -- Processing, Shipped, Delivered, Cancelled, Complete
    coupon_id      INT NULL,
    subtotal       DECIMAL(10,2) NOT NULL,
    discount       DECIMAL(10,2) DEFAULT 0,
    shipping_cost  DECIMAL(10,2) DEFAULT 0,
    total_amount   DECIMAL(10,2) NOT NULL,
    created_at     DATETIME,
    FOREIGN KEY (user_id) REFERENCES users(user_id),
    FOREIGN KEY (coupon_id) REFERENCES coupons(coupon_id)
);

CREATE TABLE order_items (
    order_item_id  INT PRIMARY KEY,
    order_id       INT NOT NULL,
    product_id     INT NOT NULL,
    quantity       INT NOT NULL,
    unit_price     DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

-- Sample data
INSERT INTO users VALUES
 (1,'Riya Sharma','riya.sharma+test1@mailinator.com','$2y$hash1','2026-10-01 10:00:00'),
 (2,'Arjun Mehta','arjun.mehta@mailinator.com','$2y$hash2','2026-10-02 11:30:00');

INSERT INTO products VALUES
 (101,'Apple Cinema 30"',1999.99,15,'Monitors'),
 (102,'iPhone',599.00,0,'Phones'),
 (103,'Samsung Galaxy Tab',329.50,25,'Tablets');

INSERT INTO coupons VALUES
 (1,'SAVE10',10.00,'2026-01-01','2026-12-31',1),
 (2,'EXPIRED2023',15.00,'2023-01-01','2023-12-31',0);

INSERT INTO cart_items VALUES
 (1,1,101,1,'2026-11-01 09:00:00'),
 (2,1,103,2,'2026-11-01 09:05:00');

INSERT INTO orders VALUES
 (5001,1,'Processing',1,2659.49,265.95,5.00,2398.54,'2026-11-02 14:00:00'),
 (5002,2,'Shipped',NULL,599.00,0,5.00,604.00,'2026-10-28 10:00:00'),
 (5003,1,'Complete',NULL,329.50,0,5.00,334.50,'2026-09-15 16:20:00');

INSERT INTO order_items VALUES
 (1,5001,101,1,1999.99),
 (2,5001,103,2,329.50),
 (3,5002,102,1,599.00),
 (4,5003,103,1,329.50);

-- =====================================================================
-- SECTION 1: Product / Catalog validation
-- =====================================================================

-- Q1: Verify an out-of-stock product (REQ-14) truly has zero stock in DB
--     (cross-check against UI showing "Out of Stock" for iPhone, product_id 102)
SELECT product_id, product_name, stock_quantity
FROM products
WHERE product_id = 102;
-- Expected: stock_quantity = 0

-- Q2: Find all products that are out of stock but might still be shown as
--     purchasable on the storefront (data integrity check feeding BUG-004)
SELECT product_id, product_name, stock_quantity
FROM products
WHERE stock_quantity = 0;

-- Q3: Verify product price shown in UI matches DB price exactly (2 decimal places)
SELECT product_id, product_name, price
FROM products
WHERE product_id = 101;

-- =====================================================================
-- SECTION 2: Cart validation
-- =====================================================================

-- Q4: Verify a user's cart contents and total match what the UI cart page shows
SELECT ci.cart_item_id, p.product_name, ci.quantity, p.price,
       (ci.quantity * p.price) AS line_total
FROM cart_items ci
JOIN products p ON p.product_id = ci.product_id
WHERE ci.user_id = 1;

-- Q5: Verify cart grand total (sum of all line totals for a user)
SELECT ci.user_id, SUM(ci.quantity * p.price) AS cart_grand_total
FROM cart_items ci
JOIN products p ON p.product_id = ci.product_id
WHERE ci.user_id = 1
GROUP BY ci.user_id;

-- Q6: Find any cart line with quantity 0 — data-integrity check feeding BUG-002
SELECT * FROM cart_items WHERE quantity <= 0;

-- =====================================================================
-- SECTION 3: Coupon validation
-- =====================================================================

-- Q7: Verify a coupon is currently valid (active + within date range) before
--     it should be accepted at checkout — feeds BUG-001 root-cause check
SELECT code, discount_pct, valid_from, valid_to, is_active,
       CASE
         WHEN is_active = 0 THEN 'INACTIVE'
         WHEN CURRENT_DATE NOT BETWEEN valid_from AND valid_to THEN 'EXPIRED'
         ELSE 'VALID'
       END AS coupon_status
FROM coupons
WHERE code = 'SAVE10';

-- Q8: Confirm the expired coupon used in BUG-001 is indeed flagged expired in DB
--     (proves it's an application-logic bug, not a data problem)
SELECT code, is_active, valid_to FROM coupons WHERE code = 'EXPIRED2023';

-- =====================================================================
-- SECTION 4: Order validation
-- =====================================================================

-- Q9: Verify order total = subtotal - discount + shipping_cost (REQ-34)
SELECT order_id,
       subtotal,
       discount,
       shipping_cost,
       total_amount,
       (subtotal - discount + shipping_cost) AS calculated_total,
       CASE WHEN total_amount = (subtotal - discount + shipping_cost)
            THEN 'MATCH' ELSE 'MISMATCH' END AS validation_result
FROM orders;

-- Q10: Verify order_items sum matches the order's subtotal
SELECT o.order_id, o.subtotal,
       SUM(oi.quantity * oi.unit_price) AS items_sum,
       CASE WHEN o.subtotal = SUM(oi.quantity * oi.unit_price)
            THEN 'MATCH' ELSE 'MISMATCH' END AS validation_result
FROM orders o
JOIN order_items oi ON oi.order_id = o.order_id
GROUP BY o.order_id, o.subtotal;

-- Q11: Find orders in a non-cancellable status that might still allow
--      cancellation in the UI (feeds BUG-016)
SELECT order_id, order_status
FROM orders
WHERE order_status IN ('Shipped','Delivered','Complete');

-- Q12: Verify a specific user's full order history (cross-check vs REQ-24 / TC_038)
SELECT order_id, order_status, total_amount, created_at
FROM orders
WHERE user_id = 1
ORDER BY created_at DESC;

-- Q13: Verify referential integrity — every order_item must belong to a real order
--      and a real product (basic data-integrity / smoke check)
SELECT oi.*
FROM order_items oi
LEFT JOIN orders o ON o.order_id = oi.order_id
LEFT JOIN products p ON p.product_id = oi.product_id
WHERE o.order_id IS NULL OR p.product_id IS NULL;
-- Expected: 0 rows returned

-- =====================================================================
-- SECTION 5: User / Account validation
-- =====================================================================

-- Q14: Verify no duplicate emails exist (REQ-02 — should be enforced at DB level too)
SELECT email, COUNT(*) AS cnt
FROM users
GROUP BY email
HAVING COUNT(*) > 1;
-- Expected: 0 rows returned

-- Q15: Verify passwords are never stored in plain text (NFR-04) —
--      sanity check that password_hash values look hashed, not plain
SELECT user_id, email, password_hash
FROM users
WHERE LENGTH(password_hash) < 20;   -- a real bcrypt/argon2 hash is much longer than this
-- Expected: 0 rows returned (any row here is a serious NFR-04 violation)

-- =====================================================================
-- How to run this yourself:
-- 1. Install a free DB (MySQL, PostgreSQL, or just use SQLite / an online
--    SQL sandbox like https://www.db-fiddle.com).
-- 2. Run SECTION 0 to create the schema and sample data.
-- 3. Run each SELECT individually, compare it against what you'd expect
--    the corresponding UI screen to show.
-- 4. When a query reveals a mismatch, log it as a bug using the same
--    format as bug_reports/bug_reports.xlsx.
-- =====================================================================
