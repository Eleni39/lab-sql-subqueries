USE sakila;

-- Q1: How many copies of the film Hunchback Impossible exist in the inventory system?
SELECT title, COUNT(f.film_id) from film f
JOIN inventory i ON f.film_id = i.film_id
WHERE f.film_id = 'Hunchback Impossible'
GROUP BY title; -- why is this retuning zero results?

-- Q2: List all films whose length is longer than the average of all the films.
SELECT * FROM sakila.film 
WHERE length > (select avg(length) FROM sakila.film);

-- Q3: Use subqueries to display all actors who appear in the film Alone Trip.

  SELECT film_id FROM film
  WHERE title = 'Alone Trip'; -- break up the where statement to then put it into my subquerie. 

  SELECT actor_id FROM film_actor
  WHERE film_id = (SELECT film_id FROM film
  WHERE title = 'Alone Trip');
  
-- Q4: Sales have been lagging among young families, and you wish to target all family movies for a promotion.
-- Identify all movies categorized as family films.

SELECT * FROM category;

SELECT category_id FROM category;

SELECT name FROM category;

SELECT category_id FROM category
WHERE name = 'family';

  SELECT film_id FROM film_category;
  WHERE category = (SELECT category_id FROM category
  WHERE name = 'family'); -- I don't understand why this is giving me an error. 
  
  -- Q5: Get name and email from customers from Canada using subqueries. Do the same with joins.
  
  SELECT * FROM country
  WHERE country = 'Canada';
  
  SELECT first_name, last_name, email FROM custoemr where address_id IN
  (SELECT address_id FROM address WHERE city_id IN
   (SELECT city_id from city where country_id IN
   (SELECT country_id FROM country where country = 'Canada');
  
  -- I think i've messed something up with my parenthasis here..
  
  -- Joins
select c.customer_id, c.first_name, c.last_name, c.email, c.country from customer as c
join address as a on a.address_id = c.address_id
join city as c on c.city_id=a.city_id
join country as ct on c.country_id = ct.country_id
where coun.country = 'Canada';

-- I don't udnerstand why the 'c' alias won't work...
  

  
  
  


