-- INNER JOIN
SELECT customer.first_name, customer.last_name, "order".order_date, "order".amount
FROM customer
INNER JOIN "order"
ON customer.customer_id = "order".customer_id;

SELECT * FROM customer;
SELECT * FROM "order";

-- LEFT JOIN
SELECT first_name, last_name, order_date, amount
FROM customer
LEFT JOIN "order"
ON customer.customer_id = "order".customer_id;

-- RIGHT JOIN
SELECT first_name, last_name, order_date, amount
FROM customer
RIGHT JOIN "order"
ON customer.customer_id = "order".customer_id;

-- FULL OUTER JOIN
SELECT first_name, last_name, order_date, amount
FROM "order"
FULL OUTER JOIN customer
ON customer.customer_id = "order".customer_id;

-- LEFT JOIN ONLY NULL
SELECT first_name, last_name, order_date, amount
FROM customer
LEFT JOIN "order"
ON customer.customer_id = "order".customer_id
WHERE "order".customer_id IS NULL;