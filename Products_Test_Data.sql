-- database
use dbas_test1;
-- table
create table products (
product_id int primary key,
product_name varchar(50) unique,
price decimal(3,2) not null
);
create table transactions (
transaction_id int auto_increment primary key,
amount decimal (5,2),
customer_id int,
foreign key (customer_id) references customers(customer_id)
);
create table customers (
customer_id int auto_increment primary key,
first_name varchar(50),
last_name varchar(50)
);
-- view
create view customer_infor as -- customer information
select first_name, last_name
from customers;
select * from customer_infor;
create view customer_emails as -- customer e-mail
select customer_email
from customers;
select * from customer_emails;
-- index
show indexes from customers;

create index last_name_idx
on customers(last_name);
create index last_first_name_idx
on customers(last_name, first_name);
-- insert
insert into products
values
(100, "Hamburger", 3.99),
(101, "Fries", 1.89),
(102, "Soda", 1.00),
(103, "Ice Cream", 1.49);
insert into transactions (amount, customer_id)
values
(4.99, 3), 
(2.89, 2),
(3.38, 3),
(4.99, 1);
insert into customers (first_name, last_name)
values
("Fred", "Fish"),
("Larry", "Lobster"),
("Bubble", "Bass");
insert into customers (first_name, last_name)
value
("Poppy", "Puff");
insert into transactions (amount, customer_id)
values (1.00, null);
insert into customers (first_name, last_name, customer_email)
value 
("Pearl", "Krabs", "PKrabs@gmail.com");
insert into transactions (amount, customer_id, order_date)
values
(2.49, 4, "2023-01-03"),
(5.48, null, "2023-01-03");
-- alter
alter table transactions
add constraint fk_customer
foreign key(customer_id) references customers(customer_id);
alter table transactions
auto_increment = 1000;
alter table customers
add column customer_email varchar(50);
alter table customers
drop index last_name_idx;
alter table transactions
add column order_date date;
-- update
update customers
set customer_email = "PPuff@gmail.com"
where customer_id = 4;
update transactions
set order_date = "2023-01-03"
where transaction_id = 1004;
-- select
select * from products;
select * from transactions;
select * from customers;

select sum(amount), order_date -- sum, max, min, count
from transactions
group by order_date;
select sum(amount), customer_id
from transactions
group by customer_id;
-- inner join
select * from transactions inner join customers
on transactions.customer_id = customers.customer_id;
-- left join
select * from transactions left join customers
on transactions.customer_id = customers.customer_id;
-- right join
select * from transactions right join customers
on transactions.customer_id = customers.customer_id;
-- order
select * from transactions
order by amount asc, customer_id desc;
-- function
select count(amount) as Count from transactions; -- Returns the number of records returned by a select query
select max(amount) as Maximum from transactions; -- Returns the maximum value in a set of values
select min(amount) as Mainimum from transactions; -- Returns the minimum value in a set of values
select avg(amount) as Average from transactions; -- Returns the average value of an expression
select sum(amount) as Total from transactions; -- Calculates the sum of a set of values
-- stored procedure
delimiter //
create procedure get_employee()
begin
select * from employees_hire; 
end //
delimiter ;

delimiter //
create procedure find_customer(in id int)
begin
select *
from customers
where customer_id = id;
end //
delimiter ;
call find_customer(1);

delimiter //
create procedure find_customer_name(in firstName varchar(50), lastName varchar(50))
begin
select *
from customers
where first_name = firstName and last_name = lastName;
end // 
delimiter ;
call find_customer_name("Fred", "Fish");

/*
alter table transactions
drop foreign key transactions_ibfk_1;
*/