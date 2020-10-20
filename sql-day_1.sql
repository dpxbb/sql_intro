-- Hello World SQL Query, SELECT all records from actor table 
SELECT * 
FROM actor;

-- Query for First_name and last_name in the actor table anything that happens to be at the bottom will always pull up 
SELECT first_name, last_name
FROM actor; 

-- Query for a fisrt name that equals Nick using the LIKE clause with WHERE clause
-- Query for a first_name that equals Nick

SELECT first_name, last_name 
FROM actor
WHERE first_name = 'Nick'; 

-- Query for a first_name that is equal to Nick using the LIKE and WHERE clauses 

SELECT first_name, last_name
FROM actor
WHERE first_name LIKE 'Nick'; 

-- Query for all first_name data with a J using the LIKE and WHERE clauses -- using the wildcard 
SELECT first_name, actor_id
FROM actor 
WHERE first_name LIKE 'J%'; 

-- Query for all first_name data that starts with K and has 2 letters after using LIKE and WHERE clauses -- using underscore
SELECT first_name, actor_id
FROM actor
WHERE first_name LIKE 'K__';

-- Query for all first_name data that starts with a K and ends with th 
-- using the LIKE and WHERE clauses -- using BOTH wildcard AND underscore
SELECT first_name, last_name, actor_id
FROM actor
WHERE first_name LIKE 'K__%th'; 

-- Comparing operators are: 
-- Great than (>) -- Less Than (<)
-- Greater or Equal (>=) Less or Equal (<=)
-- Not Equal (<>) 

-- Explore data with SELECT ALL Query (Specific to changing into new table)
SELECT *
FROM payment; 

-- Query for data that shows customers who paid an ammount GREATER than $2
SELECT customer_id, amount
FROM payment 
WHERE amount > 2.00; 

-- QUERY for adata that shows customer who paid an ammount LESS than $7.99 
SELECT customer_id, amount
FROM payment
WHERE amount < 7.99;

-- QUERY for adata that shows customer who paid an ammount LESS than or EQUAL to $7.99 
SELECT customer_id, amount
FROM payment
WHERE amount <= 7.99;

-- Query for data that shows customers who paid an amount GREATER than or EQUAL to $2.00

SELECT customer_id, amount
FROM payment
WHERE amount >= 2.00
ORDER BY amount ASC; -- ASC means acending order

-- Query for data that shows customers who paid an amount BETWEEN $2.00 and $7.99 using BETWEEN with the AND caluse
SELECT customer_id, amount
FROM payment
WHERE amount BETWEEN 2.00 AND 7.99;

-- Query for data that shows customers who paid an amount NOT EQUAL to $0.00 
-- ordered in DESCENDING Orer
SELECT customer_id, amount
FROM payment
WHERE amount <>0.00
ORDER BY amount DESC; 

-- SQL Aggregations => SUM(), AVG(), COUNT(), MIN(), MAX()
-- Query to display sum of amounts payed that are greather than $5.99
SELECT SUM (amount)
FROM payment
WHERE amount > 5.99; 

-- Query to display average of amounts paid that are greater than $5.99
SELECT AVG (amount)
FROM payment
WHERE amount > 5.99; 

-- Query to display the cunt of DISTINCT amounts paid that are greater than $5.99
SELECT COUNT (DISTINCT amount)
FROM payment
WHERE amount > 5.99;

-- Query to display min amount greater than 7.00. Alias = as 
SELECT MIN(amount) as Min_Num_Payments
FROM payment 
WHERE amount > 7.99;

-- Query to display max amount greater than 7.99
SELECT MAX(amount) AS Max_Num_Payments
FROM payment
WHERE amount > 7.99;

-- Query to display all amounts (quick demo of groupby)
SELECT amount
FROM payment
WHERE amount = 10.99;

-- Query to dispplay different amounts grouped together and count the amounts
SELECT amount, COUNT(amount)
FROM payment
GROUP BY amount
ORDER BY amount;

-- Query to display customer_ids with the summed amounts for eaceh customer_id
SELECT customer_id, SUM (amount)
FROM payment
GROUP BY customer_id
ORDER BY customer_id DESC;

-- Query to display customer_ids with the summed amounts for eaceh customer_id -- separate example of a different way to use
-- Group by
SELECT customer_id, amount
FROM payment
GROUP BY customer_id, amount
ORDER BY customer_id DESC;

-- Query to explore the data inside of the customer table
SELECT *
FROM customer;

-- Query to display customer_ids that show up more than 5 times
-- Grouping by the customer's email
SELECT COUNT(customer_id), email
FROM customer
WHERE email LIKE 'j__.w%'
GROUP BY email
HAVING COUNT(customer_id) > 0;

-- REVIEW
-- EX. PROBLEM -- which film-raing do we have the most of (film table?)
-- SELECT * from the table to start (always) to see what kind of dat you are working with 
SELECT rating, COUNT(rating)
FROM film
GROUP BY rating
ORDER BY COUNT(rating) DESC;

-- more review
SELECT * 
FROM city;

-- TONIGHT'S HOMEWORK BELOW 
-- Question 1 -- 2 Actors wtih the name Wahlberg 
SELECT first_name, last_name
FROM actor
WHERE last_name LIKE 'Wahlberg';

-- Question 2. How many payments were made between $3.99 and $5.99?
SELECT customer_id, amount
FROM payment
WHERE amount BETWEEN 3.99 AND 5.99;

-- Question 3. What film does the store have most of? (search in inventory)
SELECT film_id, COUNT(film_id)
FROM inventory
GROUP BY film_id
ORDER BY COUNT(film_id) DESC;

-- Question 4. How many customers have the last name "William"? 
-- Answer: No customers with the last name "Willaim"
SELECT last_name
FROM customer
WHERE last_name LIKE 'William%';

-- Question 5. What store employee (get the id) sold the most rentals?
SELECT staff_id, COUNT(staff_id)
FROM rental
GROUP BY staff_id;

-- Question 6. How many different district names are there?
SELECT district, COUNT(district)
FROM address
GROUP BY district
ORDER BY COUNT(district) DESC;

-- Question 7. What film has the most actors in it? (use film_actor table and get film_id)
SELECT film_id, COUNT(film_id)
FROM film_actor
GROUP BY film_id
ORDER BY COUNT(film_id) DESC;

-- Question 8. From store_id1, how many customers have a last name ending with 'es'? (use customer table)
SELECT last_name
FROM customer
WHERE last_name LIKE '___%es';

-- Question 9. How many amounts (4.99, 5.99, etc.) had a number of rental above 250 for customers with ids between 380 and 430? 
-- (use group by and having >250)

SELECT customer_id, amount
FROM payment
WHERE customer_id BETWEEN 380 AND 430;


-- Question 10. Within the film table, how many rating categories are there? And what rating has the most movies in total?
SELECT rating, COUNT(rating)
FROM film
GROUP BY rating
ORDER BY COUNT(rating) DESC;