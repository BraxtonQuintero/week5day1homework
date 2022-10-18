-- Question 1 'How many actors are there with the last name ‘Wahlberg’?'
SELECT COUNT(*) 
FROM actor
WHERE last_name = 'Wahlberg';

-- Question 2 'How many payments were made between $3.99 and $5.99?'
SELECT count(*)
FROM payment 
WHERE amount BETWEEN 3.99 AND 5.99;

-- Question 3 'What films have exactly 7 copies? (search in inventory)'
SELECT count(*)
FROM inventory 
WHERE film_id = 7;

-- Question 4 'How many customers have the first name ‘Willie’?'
SELECT COUNT(*) 
FROM customer
WHERE first_name = 'Willie';


-- Question 5 'What store employee (get the id) sold the most rentals (use the rental table)?'
SELECT max(staff_id)
FROM rental;

-- Question 6 'How many unique district names are there?'
SELECT count(DISTINCT district)
FROM address;

-- Question 7 'What film has the most actors in it? (use film_actor table and get film_id)'
SELECT count(actor_id), film_id 
FROM film_actor
GROUP BY film_id
ORDER BY count(actor_id) DESC; 

-- Question 8 'From store_id 1, how many customers have a last name ending with ‘es’? (use customer table)'
SELECT count(store_id)
FROM customer
WHERE store_id = 1 AND last_name LIKE '%es';


-- Question 9 'How many payment amounts (4.99, 5.99, etc.) had a number of rentals above 250 for customers 
-- with ids between 380 and 430? (use group by and having > 250)'
SELECT amount, count(customer_id) 
FROM payment
WHERE amount <= 4.99 AND customer_id BETWEEN 380 AND 430
GROUP BY amount
HAVING COUNT(customer_id) >= 250

-- Question 10 'Within the film table, how many rating categories are there? And what rating has the most
-- movies total?'

SELECT DISTINCT rating, count(film_id)
FROM film 
GROUP BY rating 
ORDER BY count (film_id) DESC;