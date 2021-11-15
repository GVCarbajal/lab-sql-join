use sakila;

-- List number of films per category.

select name, count(film_id) n_films from category c
join film_category f on c.category_id = f.category_id
group by f.category_id;


-- Display the first and last names, as well as the address, of each staff member.

select first_name, last_name, address, district, city, country, postal_code from staff s
join address a on s.address_id = a.address_id
join city c on a.city_id = c.city_id
join country p on c.country_id = p.country_id;


-- Display the total amount rung up by each staff member in August of 2005.

select first_name, last_name, sum(amount) collected_in_august from staff s
join payment p on s.staff_id = p.staff_id
where month(p.payment_date) = 8 and year(p.payment_date) = 2005
group by s.staff_id;


-- List each film and the number of actors who are listed for that film.

select title, count(actor_id) total_actors from film f
join film_actor a on f.film_id = a.film_id
group by f.film_id order by total_actors desc;


/* Using the tables payment and customer and the JOIN command, list the total paid by each customer. 
List the customers alphabetically by last name. */

select last_name, first_name, sum(amount) total_paid from customer c
join payment p on c.customer_id = p.customer_id
group by c.customer_id order by last_name asc;