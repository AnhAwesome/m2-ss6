create table categories (
    id int auto_increment,
    name varchar(255) not null,
    primary key (id)
);

create table products (
    id int auto_increment,
    name varchar(255) not null,
    price double not null,
    category_id int not null,
    primary key (id),
    foreign key (category_id) references categories(id)
);

insert into categories (name) values 
('laptop'), 
('phone');

insert into products (name, price, category_id) values
('asus rog', 25000000.00, 1),
('iphone 15', 22000000.00, 2),
('macbook air', 21000000.00, 1);

update products 
set price = 24000000.00 
where id = 1;

delete from products 
where id = 3;

select * from products 
order by price desc;

select c.name, count(p.id) 
from categories c 
left join products p on c.id = p.category_id 
group by c.id, c.name;

create table customers (
    id int auto_increment,
    name varchar(255) not null,
    email varchar(255) not null,
    primary key (id)
);

create table orders (
    id int auto_increment,
    customer_id int not null,
    order_date date not null,
    primary key (id),
    foreign key (customer_id) references customers(id)
);

create table order_details (
    order_id int not null,
    product_id int not null,
    quantity int not null,
    price double not null,
    primary key (order_id, product_id),
    foreign key (order_id) references orders(id),
    foreign key (product_id) references products(id)
);

insert into customers (name, email) values 
('nguyen van a', 'anguyen@email.com'),
('le thi b', 'ble@email.com');

select distinct c.* 
from customers c 
join orders o on c.id = o.customer_id;

select * 
from customers 
where id not in (select customer_id from orders);

select c.id, c.name, coalesce(sum(od.quantity * od.price), 0) as total_revenue 
from customers c 
left join orders o on c.id = o.customer_id 
left join order_details od on o.id = od.order_id 
group by c.id, c.name;

select distinct c.* 
from customers c 
join orders o on c.id = o.customer_id 
join order_details od on o.id = od.order_id 
where od.price = (select max(price) from products);

select * from products 
where price between 5000000 and 15000000;

select * from products 
where product_name like '%pro%';

select category_id, avg(price) 
from products 
group by category_id;

select * from products 
where price > (select avg(price) from products);

select * from products p 
where price = (select min(price) from products where category_id = p.category_id);
