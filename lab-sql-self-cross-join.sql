#Task 1
select 
count(*) as actors_pair,
fa1.film_id, 
fa1.actor_id as actor_id1, 
concat(a1.first_name, ' ', a1.last_name) as actor_name1, 
fa2.actor_id as actor_id2, 
concat(a2.first_name, ' ', a2.last_name) as actor_name2
from actor as a1
join film_actor as fa1
on a1.actor_id = fa1.actor_id
join film_actor as fa2
on fa1.actor_id <> fa2.actor_id
and fa1.actor_id < fa2.actor_id
and fa1.film_id = fa2.film_id
join actor as a2
on a2.actor_id = fa2.actor_id
group by actor_id1
order by actors_pair, actor_id1, actor_id2;
#Task 2  
select count(f1.title) as n_movies,
c1.customer_id as customer_1, c1.first_name, c1.last_name,
c2.customer_id as customer_2, c2.first_name, c2.last_name
from sakila.customer as c1
join sakila.rental as r1 on c1.customer_id = r1.customer_id
join sakila.inventory as i1 on r1.inventory_id=i1.inventory_id
join sakila.film as f1 on i1.film_id=f1.film_id
join sakila.inventory as i2 on i2.film_id=f1.film_id
join sakila.rental as r2 on i2.inventory_id =r2.inventory_id
join sakila.customer as c2 on r2.customer_id=c2.customer_id
where c1.customer_id>c2.customer_id
group by c1.customer_id, c1.first_name, c1.last_name, c2.customer_id, c2.first_name, c2.last_name
Having n_movies>3
order by n_movies desc;
#Task 3
select * from (select distinct actor_id, first_name, last_name from actor) as sub1
cross join (select distinct title from film) as sub2
order by actor_id;



select count(i1.film_id) as n_movies,
c1.customer_id as customer_1, c1.first_name, c1.last_name,
c2.customer_id as customer_2, c2.first_name, c2.last_name
from sakila.customer as c1
join sakila.rental as r1 on c1.customer_id = r1.customer_id
join sakila.inventory as i1 on r1.inventory_id=i1.inventory_id
join sakila.film as f1 on i1.film_id=f1.film_id
join sakila.inventory as i2 on i2.film_id=f1.film_id
join sakila.rental as r2 on i2.inventory_id =r2.inventory_id
join sakila.customer as c2 on r2.customer_id=c2.customer_id
where c1.customer_id>c2.customer_id
group by c1.customer_id, c1.first_name, c1.last_name, c2.customer_id, c2.first_name, c2.last_name
Having n_movies>3
order by n_movies desc;


select count(b1.film_id) as n_movies,
a1.customer_id as customer_1, a2.customer_id as customer_2
from sakila.rental as a1
left join sakila.inventory as b1 on a1.inventory_id=b1.inventory_id
left join sakila.inventory as b2 on b1.inventory_id=b2.inventory_id
left join sakila.rental as a2 on b1.inventory_id =a2.inventory_id
where a1.customer_id>a2.customer_id
group by a1.customer_id, a2.customer_id
Having n_movies>3
order by n_movies desc;

