select * from hr.emp;
select ename as name, sal as salary from emp;
select distinct deptno from emp ;
select ename as name, sal as salary from emp order by sal desc; 
select * from hr.products;
select prod_id, vend_id, prod_name from hr.products;
select * from hr.vendors;
select * from hr.products;
select distinct vend_id from hr.products;
select distinct vend_id, prod_price from hr.products order by vend_id asc ;
select * from emp; 
select EMPNO as employee_no, ename as name, job from emp where hiredate >'1981-05-01' and job not in ('MANAGER','CLERK');
select * from departments;
select * from employees;
select * from employees where email = null;
select * from employees where last_name like 'H%';
select * from employees where job_id like 'AC\_%';
select first_name, last_name, job_id, hire_date from employees where job_id not like 'AC%' order by hire_date, job_id asc ;
select * from employees;
select employee_id, first_name, last_name, salary, department_id from employees order by salary desc, department_id asc, employee_id asc;
select * from employees order by 11;
select * from emp;
select ename, ifnull(sal,0) as salary, ifnull(comm,0) as comm, sal+ifnull(comm,0) as total_salary from emp;
select concat(first_name,' ',last_name) as name from employees;
select concat('EMP ID: ',empno,', name is ',ifnull(ename,'no_one'),' and total_sal is $', ifnull(sal,0)+ifnull(comm,0)) as summary from emp;
select length(ename) from emp;
select substring(ename,5) from emp;
select * from employees;
select concat(substring(phone_NUMBER,1, length(phone_NUMBER)-3),'XXX') as number from employees;
select replace(phone_NUMBER, substring(phone_NUMBER,-3),'XXX') as number from employees;
select concat(first_name, ' ',substring(last_name, length(last_name)-2),'**') as name from employees;
select substring(phone_NUMBER,-3) from employees;

select prod_name, prod_price from products where prod_price = 2.50 order by prod_name desc;
select * from orderitems where order_num = 20009;
select * from orderitems;
select prod_id, order_item, item_price from orderitems where item_price >=10;
select prod_id, order_item, item_price from orderitems order by item_price asc;
select * from orders where cust_id <>10001;
select * from customers where cust_name ='Mouse House';
select cust_id, cust_name, cust_address from customers where cust_city = 'Columbus';
select * from customers where cust_email is null;
select * from customers where cust_email is not null;
select * from orderitems;
select prod_id, quantity from orderitems where item_price > 10 and order_num = 20009;
select order_num from orders where cust_id =10001 or cust_id = 10003;
select prod_name from products where prod_price >=5 and prod_price <=10;
select prod_name from products where prod_price between 5 and 10;
select * from products;
select prod_id, vend_id, prod_price from products where prod_price >10 and (vend_id = 1002 or vend_id = 1003);
select * from orders;
select * from orders where cust_id not in (10001,10003,10004);
select * from orders where cust_id in (10001,10003,10004);
select * from vendors;
select vend_id from vendors where vend_country = 'USA';
select * from products where vend_id in(1001,1002,1003,1004);
select * from products where prod_id like 'ANV0%';
select prod_desc from products where prod_name like '%anvil%';
select prod_price * 13,prod_price * 13 div 50,prod_price * 13 mod 50 from products;
select concat('Total price is : $',round(prod_price*13),'');

select * from customers;
select concat(cust_name, '(',cust_country,')' ) as name_with_city from customers;
select concat(rtrim(cust_name), '(',rtrim(cust_country),')') from customers;
select concat(rtrim(cust_name), '(',rtrim(cust_country),')') as customers_title from customers;
select concat(rtrim(cust_name), '(',rtrim(cust_country),')') as 'customers title' from customers;
select ltrim(rtrim('abcde'));
select * from products;
select prod_id, left(prod_name,10) from products where prod_name like 'Jet%';
select substring(prod_id,2,2) as 'prod_id 2nd 3rd letter', prod_name, prod_desc from products;  
select length(prod_name) as 'length of prod name', prod_name from products order by 1 desc;
select prod_id, upper(prod_name) as 'prod_name', prod_desc from products;
select * from vendors;
select vend_name, vend_address, vend_city from vendors where vend_name like 'A%';
select upper(substring(vend_name,1,6)) from vendors;
select round(rand()*10) as random;
select row_number() over(order by vend_name desc), vend_name from vendors;

select * from products;
select (prod_price*13) as total_price, 
case when(prod_price*13>1000) then (concat('$',round(prod_price*13*0.5)))
     when(prod_price*13>500) then (concat('$',round(prod_price*13*0.7)))
     when(prod_price*13>100) then (concat('$',round(prod_price*13*0.9)))
     else concat('$',round(prod_price*13*1))
      end as price from products;
      
select * from employees;
select employee_id from employees where adddate(hire_date, interval 30 year) <= curdate();       
select employee_id, concat(first_name,' ',last_name) as employee_name,hire_date from employees where substring(hire_date,1,4)+substring(curdate(),3,2) = substring(curdate(),1,4);
select employee_id, concat(first_name,' ',last_name) as employee_name,hire_date from employees where extract(year from hire_date) like '199%';
select employee_id, concat(first_name,' ',last_name) as employee_name,hire_date from employees where timestampdiff(year, hire_date, curdate()) = 25;
select adddate(last_day(curdate()),1);
select employee_id, hire_date, last_day(adddate(hire_date, interval 1 month)) as sp from employees;
select convert(employee_id,char) from employees;
select date_format(hire_date, '%a %M-%e,%Y') from employees; 
select * from employees where hire_date <= str_to_date('2000-12-31','%Y-%c-%e');
select now();
select curtime();
select curdate();
select * from orders;
select order_num, order_date from orders;
select order_num, quarter(order_date) as 'quarter_date' from orders;
select order_num, dayofyear(order_date) from orders;
select order_num, monthname(order_date) from orders;
select cust_id, order_num from orders where order_date='2005-10-08';
select cust_id, order_num from orders where datediff(order_date,'2005-10-08')=0;

select * from orders; 
select * from orderitems;
select * from orders inner join orderitems on orders.order_num = orderitems.order_num;
select order_num, sum(quantity*item_price) as totalprice from orderitems group by order_num;
select max(sal), min(sal), count(ifnull(sal,0)), avg(sal), sum(ifnull(sal,0)+ifnull(comm,0)) from emp;
select * from emp;
select * from products;
select count(prod_id) from products;
select count(vend_id) from products;
select count(distinct(vend_id)) from products;
select * from customers;
select  count(*)-count(cust_email) from customers;
select avg(prod_price) from products;
select * from orderitems;
select avg(item_price*quantity) from orderitems;
select avg(item_price*quantity) from orderitems where order_num = 20005;
select max(item_price) from orderitems where order_num = 20005;
select min(item_price) from orderitems where order_num = 20005;
select sum(item_price*quantity) from orderitems where order_num = 20005;
select max(distinct prod_price) from products;
select max(prod_price) from products;
select min(distinct prod_price) from products;
select min(prod_price) from products;
select * from orders;
select * from orderitems;
select max(order_num) from orderitems where prod_id = 'FB';
select month(order_date), year(order_date) from orders where order_num = 20009;
select min(order_num) from orderitems where prod_id = 'FB';
select month(order_date), year(order_date) from orders where order_num = 20005;
select dayofyear(order_date) from orders where order_num = 20005;
select min(order_num) from orderitems where prod_id = 'FB';
select max(order_num) from orderitems where prod_id = 'FB';
select order_date from orders where order_num = '20005';
select order_date from orders where order_num = '20009';
select * from emp;
select count(*),mgr from emp group by mgr;
select * from employees;
select max(ifnull(salary,0)), avg(ifnull(salary,0)), min(ifnull(salary,0)), sum(ifnull(salary,0)),products department_id from employees group by department_id;
select * from products;

select * from products;
select vend_id,count(vend_id) from products group by vend_id;
select vend_id,avg(prod_price) from products group by vend_id;
select vend_id, avg(prod_price) from products group by vend_id having avg(prod_price)>10;
select vend_id, count(vend_id) from products where prod_price >= 10 group by vend_id having count(vend_id)>2;
select order_num, count(*) as order_item from orderitems group by order_num;
select order_num as 'order number', count(*) as order_item from orderitems group by order_num;
select vend_id, avg(prod_price) as avg_prod_price from products group by vend_id having avg(prod_price)>10 order by avg_prod_price desc;
select vend_id, count(*) as num_prods from products where prod_price>=10 group by vend_id having count(*)>=2;
select (select dayofyear(order_date) from orders where order_num = (select max(order_num) from orderitems where prod_id = 'FB'))-(select dayofyear(order_date) from orders where order_num = (select min(order_num) from orderitems where prod_id = 'FB'));




select * from countries;
select employee_id, first_name, job_title, department_name, city, country_name, max_salary from employees
join jobs on employees.job_id = jobs.job_id
join departments on employees.department_id = departments.department_id
join locations on departments.location_id = locations.location_id
join countries on locations.country_id = countries.country_id;

select * from emp;
select * from dept;
select ename, dname, loc from emp
join dept on emp.deptno = dept.deptno;

select emp.deptno, max(sal), min(sal),sum(sal),avg(sal), count(*) from emp 
join dept on emp.deptno = dept.deptno
group by emp.deptno, dept.deptno;

select * from employees, departments;
select e.department_id, d.department_name, max(salary), min(salary), sum(salary), avg(salary), count(*) from employees e
join departments d on e.department_id = d.department_id
group by d.department_name;

select emp.ename, emp.job, dept.deptno, dept.dname from emp
join dept on emp.deptno = dept.deptno
where emp.job in ('manager', 'president');

select emp.ename, emp.sal, salgrade.grade from emp
join salgrade 
where emp.sal between salgrade.losal and salgrade.hisal;

select e.empno, e.ename from emp e
join emp manager on e.MGR = manager.EMPNO;
select * from emp;

select * from products, orderitems;
select * from products p
join orderitems o on p.prod_id = o.prod_id;

select vendors.vend_id, vend_name, prod_name, prod_price from products, vendors
where products.vend_id = vendors.vend_id
and prod_name = 'Detonator';

select * from vendors, products;
select prod_id, v.vend_id, prod_name from vendors v
join products p on v.vend_id = p.vend_id
where vend_country = 'USA'
order by v.vend_id;

select * from customers, orders;
select customers.cust_id, cust_name from customers
join orders on customers.cust_id = orders.cust_id
where (datediff(order_date, '2005-09-01')<=30);

select * from customers, orders, orderitems;
select cust_name, cust_contact, cust_email from customers c
join orders o on c.cust_id = o.cust_id
join orderitems oi on o.order_num = oi.order_num
where prod_id = 'TNT2';

select * from employees;
select employee_id from employees e
left join departments d on e.department_id = d.department_id
order by employee_id;

select p.vend_id, vend_name, prod_name, prod_price from products p
join vendors v on p.vend_id = v.vend_id
where prod_name = 'Detonator';

select * from products, orderitems;
select prod_name, p.prod_id, quantity from products p
left join orderitems o on p.prod_id = o.prod_id;

select customers.cust_id, orders.order_num from customers
left join orders on customers.cust_id = orders.cust_id;
select customers.cust_id, orders.order_num from orders
right join customers on orders.cust_id = customers.cust_id;

select * from vendors, products;
select prod_id, prod_name, prod_price, prod_desc, vend_country, v.vend_id from vendors v
left join products p on v.vend_id = p.vend_id
where v.vend_country ='USA';

select * from dept;
insert into dept(deptno, dname, loc)
values(80,'ACCOUNTING','USA');

select * from emp;
create table manager0719 (
EMPNO decimal(4,0),
name varchar(10),
salary decimal(7,2),
hiredate date);

insert into manager0719(EMPNO, name, salary, hiredate)
values(9999, 'Peter', 17000, curdate());
select * from manager0719;
delete from manager0719 where EMPNO=9999;

insert into manager0719
select empno, ename, sal, hiredate from emp
where job = 'MANAGER';

update manager0719
set salary = salary*0.95
where empno = 9999;

select * from vendors;
desc vendors;
insert into vendors(vend_id, vend_name)
values (1008, 'Cherry');
select * from products;
insert into products(prod_id, vend_id, prod_name, prod_price, prod_desc)
values ('JP3000', '1008', 'JPTNT', 200, 'New Product');

select * from emp;
alter table emp add(
instagram varchar(100));
desc emp;
alter table emp modify sal decimal(9,2);
alter table emp change column salary SALARY decimal(10,2);
alter table emp change column instagram INSTAGRAM varchar(50);
alter table emp drop INSTAGRAM;

create table Customer(
CID decimal(20) not null,
CName varchar(50) not null,
Phone decimal(10) not null,
City varchar(50),
Country varchar(50),
Email varchar(50) not null,
Credit_Limit decimal(50) not null);
desc Customer;
select * from Customer;
insert into Customer(CID,CName,Phone,City,Country,Email,Credit_Limit)
value(1,'llc','123456','cali','USA','123@gmail.com','100');

create table Orderss(
OID decimal(20) not null,
CID decimal(20) not null,
Orderdate datetime(6) not null,
shipdate datetime(6) not null,
Order_status text(100));
desc Orderss;
select * from Orderss;
insert into Orderss(OID,CID,Orderdate,shipdate,Order_status)
value(1,1,'2021-07-22','2021-07-23','ready to be shipped');

create table Order_detail(
OdID decimal(20) not null,
OID decimal(20) not null,
PId decimal(20) not null,
City varchar(20) not null,
Price decimal(20) not null);
desc Order_detail;
select * from Order_detail;
insert into Order_detail(OdID,OID,PId,City,Price)
value(1,1,1,'cali',100);

create view customer_report as
select CName,c.CID,o.OID,Orderdate,shipdate,od.City,price from Customer c
join Orderss o on c.CID = o.CID
join Order_detail od on o.OID = od.OID;

select * from customer_report;