//Найдите номер модели, скорость и размер жесткого диска для всех ПК стоимостью менее 500 дол. Вывести: model, speed и hd 
select model, speed, hd from PC where Price<500;

//Найдите производителей принтеров. Вывести: maker
select distinct maker from Product where type='Printer'

//Найдите номер модели, объем памяти и размеры экранов ПК-блокнотов, цена которых превышает 1000 дол.
select model, ram, screen from Laptop where price>1000;

//Найдите все записи таблицы Printer для цветных принтеров.
select * from Printer where color='y';

//Найдите номер модели, скорость и размер жесткого диска ПК, имеющих 12x или 24x CD и цену менее 600 дол.
select model, speed, hd from PC where cd in ('12x', '24x') and price<600;

//Для каждого производителя, выпускающего ПК-блокноты c объёмом жесткого диска не менее 10 Гбайт, найти скорости таких ПК-блокнотов. Вывод: производитель, скорость.
SELECT maker, speed FROM Laptop JOIN Product ON Product.model = Laptop.model WHERE hd >=10 GROUP BY maker, speed;

//Найдите номера моделей и цены всех имеющихся в продаже продуктов (любого типа) производителя B (латинская буква).
select PC.model, PC.price from PC join Product on PC.model=Product.model where maker='B'
union 
select Laptop.model, Laptop.price from Laptop join Product on Laptop.model=Product.model where maker='B'
union 
select Printer.model, Printer.price from Printer join Product on Printer.model=Product.model where maker='B'

//Найдите производителя, выпускающего ПК, но не ПК-блокноты.
select maker from Product where type='PC'
except 
select maker from Product where type='Laptop'

