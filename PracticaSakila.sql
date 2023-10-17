-- EJERCICIO 1:
SELECT actor_id, first_name as Nombre, last_Name as Apellido, last_update
FROM actor

-- EJERCICIO 2:
SELECT DISTINCT (customer_id), store_id, first_name
FROM customer

-- EJERCICIO 3:
SELECT *
FROM country
ORDER BY country ASC

SELECT * 
FROM customer
ORDER BY first_name ASC

-- EJERCICIO 4:
SELECT store_id as Tienda, first_name as Nombre, last_name as Apellido
FROM customer
ORDER BY last_name DESC

-- EJERCICO 5:
SELECT DISTINCT(amount)
FROM payment
ORDER BY amount DESC

SELECT DISTINCT(amount)
FROM payment
ORDER BY amount ASC

-- EJERCICIO 6:

SELECT *
FROM actor
WHERE first_name='DAN'

SELECT * 
FROM city
WHERE city='LONDON'

SELECT *
FROM city
WHERE country_id=101

SELECT *
FROM customer
WHERE store_id=1

-- EJERCICIO 7:

SELECT *
FROM inventory
WHERE film_id>60 

SELECT DISTINCT(amount)
FROM payment
WHERE amount<6

-- EJERCICIO 8:

SELECT *
FROM staff
WHERE staff_id <>2

SELECT *
FROM language
WHERE name <> 'German'

-- EJERCICIO 9:

SELECT description, release_year
FROM film
WHERE title='IMPACT ALADDIN'

-- EJERCICIO 10:

SELECT DISTINCT(amount)
FROM payment
WHERE amount>0.99
ORDER BY amount ASC

-- EJERCICIO 11:

SELECT *
FROM country
WHERE country='Algeria' AND country_id=2

-- EJERCICIO 12:
SELECT *
FROM country
WHERE country='Algeria' OR country_id=12

SELECT *
FROM language
WHERE language_id=1 OR name='German'

-- EJERCICIO 13:

SELECT *
FROM category
WHERE NOT name='Action'

SELECT DISTINCT(rating)
FROM film
WHERE NOT rating='PG'

SELECT DISTINCT(rating)
FROM film
WHERE NOT rating='R'

-- EJERCICIO 14:

SELECT *
FROM payment
WHERE customer_id=36 and amount>0.99 and staff_id=1

-- EJERCICIO 15:

SELECT *
FROM rental
WHERE NOT staff_id= 1 AND customer_id>250 AND inventory_id>100

-- EJERCICIO 16:

SELECT *
FROM customer
WHERE first_name IN ('MARY','PATRICIA')

-- EJERCICIO 17:

SELECT *
FROM film
WHERE special_features in ('Trailers', 'Trailers, Deleted Scenes') 
AND rating IN ('G','NG-17') 
AND length>50

-- EJERCICIO 18:

SELECT *
FROM category
WHERE name not in ('Action','Animation','Children')

-- EJERCICIO 19:

SELECT *
FROM film_text
WHERE title IN('ZORRO ARK', 'VIRGIN DAISY', 'UNITED PILOT')

-- EJERCICIO 20:

SELECT *
FROM city
WHERE city IN('Chiayi','Dongying','Fukuyama','Kilis')

-- EJERCICIO 21:

SELECT *
FROM rental
WHERE customer_id between 300 AND 400 
AND staff_id=1

-- EJERCICIO 22:

SELECT *
FROM payment
WHERE amount NOT between 2 AND 6

-- EJERCICIO 23: 

SELECT *
FROM payment
WHERE amount between 2.99 and 4.99
and staff_id = 2 
and customer_id IN(1,2)

-- EJERCICIO 24:

SELECT *
FROM address
WHERE city_id between 300 and 350

-- EJERCICIO 25:

SELECT *
FROM film
WHERE rental_rate BETWEEN 0.99 AND 2.99
AND length<=50 AND replacement_cost<20

-- EJERCICIO 26:

SELECT *
FROM actor
WHERE first_name like'A%' AND last_name like'B%'

-- EJERCICIO 27:
SELECT *
FROM actor
WHERE first_name LIKE '%A' AND last_name like '%R'

-- EJERCICIO 28:
SELECT *
FROM actor
WHERE first_name LIKE '%ME%' AND last_name LIKE '%RE%'

-- EJERCIIO 29:
SELECT *
FROM actor
WHERE first_name like 'C%N' AND last_name like'G%'

-- EJERCICIO 30:
SELECT *
FROM film
WHERE release_year='2006' and title like 'ALI%'

-- EJERCICIO 31:

SELECT *
FROM film f INNER JOIN language l ON f.language_id=l.language_id

-- EJERCICIO 32:

SELECT *
FROM address a INNER JOIN city c ON a.city_id=c.city_id

-- EJERCICIO 33:

SELECT *
FROM customer c RIGHT JOIN actor a ON c.last_name=a.last_name

-- EJERCICIO 34:

SELECT *
FROM customer c LEFT JOIN actor a ON c.last_name=a.last_name

-- EJERCICIO 35:

SELECT c.first_name, a.address, c.store_id
FROM (store s LEFT JOIN address a ON s.address_id=a.address_id) 
LEFT JOIN customer c ON s.address_id=c.address_id

-- EJERCICIO 36:

SELECT a.address, c.city, co.country
FROM (address a INNER JOIN city c ON a.city_id=c.city_id)
INNER JOIN country co ON (c.country_id=co.country_id)

-- EJERCICIO 37:

SELECT r.rental_id, s.first_name
FROM rental r INNER JOIN staff s ON r.staff_id=s.staff_id

-- EJERCICIO 38:

SELECT SUM(amount)
FROM payment

-- EJERCICIO 39:

SELECT inventory_id +film_id + store_id
FROM inventory

-- EJERCICIO 40:

SELECT count(*)
FROM actor

-- EJERCICIO 41:

SELECT AVG(amount)
FROM payment

-- EJERCICIO 42:

SELECT MAX(length)
FROM film

SELECT MIN(length)
FROM film

-- EJERCICIO 43:

SELECT count(rental_id)
FROM rental

-- EJERCICIO 44:

SELECT MAX(amount)
FROM payment

-- EJERCICIO 45:

SELECT last_name
FROM actor
GROUP BY last_name

SELECT last_name, COUNT(*)
FROM actor
GROUP BY last_name

-- EJERCICIO 46:

SELECT c.customer_id, c.first_name, c.last_name, SUM(p.amount)
FROM payment p INNER JOIN customer c ON p.customer_id=c.customer_id
GROUP BY c.customer_id, c.first_name, c.last_name


-- EJERCICIO 47:

SELECT customer_id, MAX(rental_date)
FROM rental
GROUP BY customer_id

-- EJERCICIO 48:

SELECT last_name, COUNT(*)
FROM actor
GROUP BY last_name

-- EJERCICIO 49: 

SELECT c.customer_id, c.last_name, c.first_name, SUM(p.amount)
FROM payment p INNER JOIN customer c ON p.customer_id=c.customer_id
GROUP BY c.customer_id, c.last_name, c.first_name
HAVING sum(p.amount)<100
ORDER BY sum(p.amount) DESC

-- EJERCICIO 50:

SELECT last_name, COUNT(*)
FROM actor
GROUP BY last_name
HAVING COUNT(*)>2

-- EJERCICIO 51:

SELECT *
FROM actor
WHERE first_name='Scarlett'

-- EJERCICIO 52:

SELECT *
FROM actor
WHERE last_name='Johansson'

-- EJERCICIO 53:

SELECT last_name, COUNT(*)
FROM actor
GROUP BY last_name

-- EJERCICIO 54:

SELECT last_name, COUNT(*)
FROM actor
GROUP BY last_name
HAVING COUNT(*)=1

-- EJERCICIO 55:

SELECT COUNT(first_name), first_name
FROM actor a INNER JOIN film_actor f ON a.actor_id=f.actor_id
GROUP BY first_name

-- EJERCICIO 56: 

SELECT *
FROM (film f INNER JOIN inventory i ON f.film_id=i.film_id) INNER JOIN store s ON s.store_id=i.store_id
 WHERE title='ACADEMY DINOSAUR' and i.store_id=1
