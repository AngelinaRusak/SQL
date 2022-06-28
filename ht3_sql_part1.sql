//Таблица employees
   //Создать таблицу employees
    //- id. serial,  primary key,
    //- employee_name. Varchar(50), not null
Наполнить таблицу employee 70 строками.

create table employees (
    id serial primary key,
    employee_name varchar (50) unique not null
);

insert into employees(employee_name)
values ('James Butt'),
       ('Josephine Darakjy'),
       ('Art Venere'),
       ('Lenna Paprocki'),
       ('Donette Foller'),
       ('Simona Morasca'),
       ('Mitsue Tollner'),
       ('Leota Dilliard'),
('Sage Wieser'),
('Kris Marrier'),
('Minna Amigon'),
('Abel Maclead'),
('Kiley Caldarera'),
('Graciela Ruta'),
('Cammy	Albares'),
('Mattie Poquette'),
('Meaghan Garufi'),
('Gladys Rim'),
('Yuki Whobrey'),
('Fletcher Flosi'),
('Bette	Nicka'),
('Veronika Inouye'),
('Willard Kolmetz'),
('Maryann Royster'),
('Alisha Slusarski'),
('Allene Iturbide'),
('Chanel Caudy'),
('Ezekiel Chui'),
('Willow Kusko'),
('Bernardo Figeroa'),
('Ammie	Corrio'),
('Francine Vocelka'),
('Ernie	Stenseth'),
('Albina Glick'),
('Alishia Sergi'),
('Solange Shinko'),
('Jose Stockham'),
('Rozella Ostrosky'),
('Valentine Gillian'),
('Kati Rulapaugh'),
('Youlanda Schemmer'),
('Dyan Oldroyd'),
('Roxane Campain'),
('Lavera Perin'),
('Erick	Ferencz'),
('Fatima Saylors'),
('Jina Briddick'),
('Kanisha Waycott'),
('Emerson Bowley'),
('Blair	Malet'),
('Brock	Bolognia'),
('Lorrie Nestle'),
('Sabra	Uyetake'),
('Marjory Mastella'),
('Karl Klonowski'),
('Tonette Wenner'),
('Amber	Monarrez'),
('Shenika Seewald'),
('Delmy	Ahle'),
('Deeanna Juhas'),
('Blondell Pugh'),
('Jamal	Vanausdal'),
('Cecily Hollack'),
('Carmelina	Lindall'),
('Maurine Yglesias'),
('Tawna	Buvens'),
('Penney Weight'),
('Elly Morocco'),
('Ilene	Eroman'),
('Vallie Mondella'),
('Kallie Blackwood');


//Таблица salary
   //Создать таблицу salary
     //- id. Serial  primary key,
     //- monthly_salary. Int, not null
       //Наполнить таблицу salary 15 строками:
 - 1000
 - 1100
 - 1200
 - 1300
 - 1400
 - 1500
 - 1600
 - 1700
 - 1800
 - 1900
 - 2000
 - 2100
 - 2200
 - 2300
 - 2400
 - 2500
 
 create table salary (
    id serial primary key,
    monthly_salary int not null
);

insert into salary(monthly_salary)
values (1000),
       (1100),
       (1200),
       (1300),
       (1400),
       (1500),
       (1600),
       (1700),
       (1800),
       (1900),
       (2000),
       (2100),
       (2200),
       (2300),
       (2400),
       (2500);
 
 
 
 //Таблица employee_salary
//Создать таблицу employee_salary
//- id. Serial  primary key,
//- employee_id. Int, not null, unique
//- salary_id. Int, not null
//Наполнить таблицу employee_salary 40 строками:
//- в 10 строк из 40 вставить несуществующие employee_id


create table employee_salary (
    id serial primary key,
    employee_id int not null unique,
    salary_id int not null
);

insert into employee_salary(employee_id, salary_id)
values (1, 1),
       (2, 2),
       (3, 3),
       (4, 4),
       (5, 5),
       (6, 6),
       (7, 7),
       (8, 8),
       (9, 9),
       (10, 10),
       (11, 11),
       (12, 12),
       (13, 13),
       (14, 14),
       (15, 15),
       (16, 16),
       (17, 15),
       (18, 14),
       (19, 12),
       (20, 11),
       (21, 10),
       (22, 8),
       (23, 12),
       (24, 5),
       (25, 3),
       (26, 8),
       (27, 4),
       (28, 6),
       (29, 7),
       (80, 3),
       (81, 2),
       (82, 12),
       (83, 16),
       (84, 12),
       (85, 11),
       (86, 10),
       (87, 7),
       (88, 15),
       (89, 14),
       (90, 10);
       
       
//Таблица roles
//Создать таблицу roles
//- id. Serial  primary key,
//- role_name. int, not null, unique
//Поменять тип столба role_name с int на varchar(30)
//Наполнить таблицу roles 20 строками

create table roles(
id serial primary key,
role_name int not null unique);

alter table roles
alter column role_name type varchar(30);

insert into roles(role_name)
values ('Junior Python developer'),
('Middle Python developer'),
('Senior Python developer'),
('Junior Java developer'),
('Middle Java developer'),
('Senior Java developer'),
('Junior JavaScript developer'),
('Middle JavaScript developer'),
('Senior JavaScript developer'),
('Junior Manual QA engineer'),
('Middle Manual QA engineer'),
('Senior Manual QA engineer'),
('Project Manager'),
('Designer'),
('HR'),
('CEO'),
('Sales manager'),
('Junior Automation QA engineer'),
('Middle Automation QA engineer'),
('Senior Automation QA engineer');


//Таблица roles_employee
//Создать таблицу roles_employee
//- id. Serial  primary key,
//- employee_id. Int, not null, unique (внешний ключ для //таблицы employees, поле id)
//- role_id. Int, not null (внешний ключ для таблицы roles, поле id)
//Наполнить таблицу roles_employee 40 строками:

create table roles_employee(
id serial primary key,
employee_id int not null unique,
role_id int not null,
foreign key (employee_id)
references employees(id),
foreign key (role_id)
references roles(id)
);

insert into roles_employee (employee_id, role_id)
values (1, 1),
       (2, 2),
       (3, 3),
       (4, 4),
       (5, 5),
       (6, 6),
       (7, 7),
       (8, 8),
       (9, 9),
       (10, 10),
       (11, 11),
       (12, 12),
       (13, 13),
       (14, 14),
       (15, 15),
       (16, 16),
       (17, 17),
       (18, 18),
       (19, 19),
       (20, 20),
       (21, 1),
       (22, 2),
       (23, 3),
       (24, 4),
       (25, 5),
       (26, 6),
       (27, 7),
       (28, 8),
       (29, 9),
       (30, 10),
       (31, 11),
       (32, 12),
       (33, 13),
       (34, 14),
       (35, 15),
       (36, 16),
       (37, 17),
       (38, 18),
       (39, 19),
       (40, 20);