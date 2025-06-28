select * from  customers where country="germany";
-- order by 
select * from customers order by score asc; 										
select * from customers order by country  asc ,score desc; -- nested sorting
select * from customers order by score  desc ,country asc; -- nested sorting

-- group by: combines rows with the same value aggregate a column by another column 
-- you must either specify the coloumn in select query must be there in end or either in the aggregate fun
select  country as customer_country,sum(score) as total_score from customers group by country;
-- having clause  : used to filter groups after aggregation mostly used with group by,aggregates like avg,min..etc
select id,country,score, avg(score) from customers where score!=0 group by country having avg(score)>430;
-- distinct -> don't often use distinct it is slow ,use only if necessary
-- after the select we write distinct keyword,acts like filter and only non-duplicate values  will be printed
select distinct country from customers;
-- TOP or limit -> restrict no.of rows returned, the query returnes based on the row numbers we use inside it.
select * from customers; -- here we just want 3 customers data there is no given condition so we use top
select * from customers limit 3;
select  * from customers order by score desc limit 3;
select  * from customers order by score asc limit 2;
-- static values using select you can add your own value apart from database using select 
select 'new Customer' as cus;
select id,first_name, 'New Customer' as cus from customers; -- here we are adding our own static values to existing table also 
-- inserting data from existing data table to another empty table 
-- copy data from customers table  and insert into persons table

select * from customers;
select * from person;


insert into person (id,person_name,birth_date,email)select id,first_name,null,'unknown' from customers; 

-- update 
update customers  set score=10 where id=5;
update customers set score=0,country='uk' where id=6;

-- delete 
delete from customers where id>5;

 -- trauncate is used to delte the data from the table maintaining its structure its way faster 
 truncate table person;
 
 
