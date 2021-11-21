# Lab | SQL Join

#In this lab, you will be using the [Sakila](https://dev.mysql.com/doc/sakila/en/) database of movie rentals.
use sakila;
### Instructions

#1. List number of films per `category`.
select * from sakila.category; # just to check out the table
select * from sakila.film_category; # just to check out the table
#solution:
select count(film_id) as 'Number of Films', f.category_id, name from sakila.film_category as f left join sakila.category as c 
on f.category_id=c.category_id
group by category_id;


#2. Display the first and last names, as well as the address, of each staff member.
select * from sakila.staff;
select * from sakila.address;
select * from sakila.city;
select st.first_name, st.last_name, a.address, c.city from sakila.staff as st join sakila.address  as a using(address_id) join sakila.city as c
using(city_id) ;


#3. Display the total amount rung up by each staff member in August of 2005.
select * from sakila.payment;
select sum(amount), p.staff_id, first_name, last_name from sakila.payment as p join sakila.staff  as st using(staff_id)
where payment_date like '2005-06-%'
group by p.staff_id;

#4. List each film and the number of actors who are listed for that film.
select * from sakila.film_actor;
select * from sakila.film;
select title, count(actor_id) as 'numbers of actors/actresses' from sakila.film  as f join sakila.film_actor  as fa using(film_id)
group by fa.film_id;

#5. Using the tables `payment` and `customer` and the JOIN command, list the total paid by each customer. List the customers alphabetically 
#by last name.
select * from sakila.payment;
select * from sakila.customer;
select last_name, first_name, sum(amount) as 'total amount paid' from sakila.customer as c join sakila.payment as p using(customer_id)
group by customer_id
order by last_name;

