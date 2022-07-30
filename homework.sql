
-- Question 1: List all customers that live in Texas
SELECT *
FROM customer
LEFT JOIN "address"
ON customer.address_id = "address".address_id
WHERE "address".district = 'Texas';


-- Question 2: All payments above $6.99 with customer's full name
SELECT CONCAT(first_name, ' ', last_name) AS full_name
FROM customer
LEFT JOIN payment
ON customer.customer_id = payment.customer_id
WHERE payment.amount > 6.99;


-- Question 3: Show all customers names who have made payments over $175(use subqueries)
SELECT CONCAT(first_name, ' ', last_name) AS full_name
FROM customer
WHERE customer_id IN (
	SELECT *, MAX(amount)
	FROM payment
	GROUP BY payment_id
	HAVING MAX(amount) > 175
);


-- Question 4: List all customers that live in Nepal (use the city table)
SELECT *
FROM customer
LEFT JOIN address
ON customer.address_id = address.address_id
LEFT JOIN city
ON address.city_id = city.city_id
LEFT JOIN country
ON city.country_id = country.country_id
WHERE country.country = 'Nepal';


-- question 5: Which staff member had the most transactions?
SELECT CONCAT(first_name, ' ', last_name) AS full_name, COUNT(*)
FROM staff
WHERE staff_id IN (
	SELECT staff_id
	FROM payment
)
GROUP BY staff_id
ORDER BY COUNT(*) DESC
LIMIT 1;


-- Question 6: How many movies of each rating are there?
SELECT rating, COUNT(rating)
FROM film
GROUP BY rating;


-- Question 7: Show all customers who have made a single payment above $6.99 (Use Subqueries)
SELECT *
FROM customer
WHERE customer_id IN (
	SELECT customer_id
	FROM payment
	GROUP BY customer_id
	HAVING MAX(amount) > 6.99
);


-- Question 8: How many free rentals did our stores giveaway?
SELECT COUNT(*)
FROM payment
WHERE amount = 0;