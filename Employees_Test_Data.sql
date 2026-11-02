-- database
use dbas_test;
-- table
create table employees_hire (
employee_id int auto_increment not null primary key,
first_name varchar(50),
last_name varchar(50),
hourly_rate decimal(5,2),
hire_date date
);
create table calendar (
calendar_date date,
calendar_time time,
calendar_datetime datetime
);
-- view
create view employee_attendance as
select first_name, last_name
from employees_hire;
select * from employee_attendance;
/*
select * from employee_attendance 
order by last_name asc;
*/

-- insert
insert into calendar
values(current_date(), current_time(), now());
insert into employees_hire (first_name, last_name, hourly_rate, hire_date)
values
("Eugene", "Krabs", 25.50, "2023-01-02"),
("Squidward", "Tentacles", 15.00, "2023-01-03"),
("Spongebob", "Spuarepants", 12.50, "2023-01-04"),
("Patrick", "Star", 12.50, "2023-01-05"),
("Sandy", "Cheeks", 17.25, "2023-01-06");
insert into employees_hire (first_name, last_name)
value
("Sheldon", "Plankton");
insert into employees_hire (first_name, last_name, hourly_rate, hire_date) 
value 
("Larry", "Lobster", 10.00, "2023-01-07");
-- select
select * from employees_hire; 
select * from calendar;
select * from employees_hire
where employee_job = "Cashier" or employee_job = "Fry cook";
select * from employees_hire
where not employee_job = "Manager";
select * from employees_hire
where hire_date between "2023-01-04" and "2023-01-07";
select * from employees_hire
order by last_name desc;
-- function
select concat(first_name," ", last_name) as full_name from employees_hire; -- Adds two or more strings together
-- update
update employees_hire
set hourly_rate = 10.50, hire_date = "2023-01-07"
where employee_id = 6;
update employees_hire
set employee_job = "Body builder"
where employee_id = 7;
-- alter
alter table employees_hire
add constraint unique (first_name, last_name); -- unique
alter table employees_hire
add constraint check_hourly_rate check (hourly_rate >= 10.00); -- check
alter table employees_hire
add column employee_job varchar(25) after hourly_rate;

/*
select * from employees_hire; -- * (all)
select last_name, first_name from employees_hire; -- change order
select * from employees_hire where employee_id = 3; -- specific column
select * from employees_hire where first_name = "Spongebob"; 
select * from employees_hire where hourly_rate >= 15;
select * from employees_hire where hire_date <= "2023-01-03";
select * from employees_hire where employee_id != 1; -- not
select * from employees_hire where hire_date is null; -- null
select first_name, last_name from employees_hire;
select * from employees_hire where hire_date not null;
*/