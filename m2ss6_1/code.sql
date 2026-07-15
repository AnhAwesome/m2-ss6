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
