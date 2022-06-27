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

//Найдите производителей ПК с процессором не менее 450 Мгц. Вывести: Maker
select maker from Product join PC on Product.model=PC.model where speed>=450 group by maker

//Найдите модели принтеров, имеющих самую высокую цену. Вывести: model, price
select model, price from Printer where price = (select max(price) from Printer)

//Найдите среднюю скорость ПК.
select avg(speed) from PC

//Найдите среднюю скорость ПК-блокнотов, цена которых превышает 1000 дол.
select avg(speed) from Laptop where price>1000

//Найдите среднюю скорость ПК, выпущенных производителем A.
select avg(speed) from PC join Product on Product.model=PC.model where maker='A'

//Найдите класс, имя и страну для кораблей из таблицы Ships, имеющих не менее 10 орудий.
select Ships.class, Ships.name, Classes.country from Ships join Classes on Classes.class=Ships.class where numGuns>=10

//Найдите размеры жестких дисков, совпадающих у двух и более PC. Вывести: HD
select hd from PC group by hd having count (*)>=2

//Найдите пары моделей PC, имеющих одинаковые скорость и RAM. В результате каждая пара указывается только один раз, т.е. (i,j), но не (j,i), Порядок вывода: модель с большим номером, модель с меньшим номером, скорость и RAM.
select distinct pc1.model, pc2.model, pc1.speed, pc1.ram from pc pc1, pc pc2 where pc1.speed=pc2.speed and pc1.ram=pc2.ram and pc1.model>pc2.model

//Найдите модели ПК-блокнотов, скорость которых меньше скорости каждого из ПК.
Вывести: type, model, speed
select distinct type, Laptop.model, speed from laptop join Product on Product.model=Laptop.model where speed<ALL (select speed from PC)

//Найдите производителей самых дешевых цветных принтеров. Вывести: maker, price
select Product.maker, Printer.price from Printer join Product on Product.model=Printer.model where price = (select min(price) from Printer where color='y') and color='y' group by maker, price

//Для каждого производителя, имеющего модели в таблице Laptop, найдите средний размер экрана выпускаемых им ПК-блокнотов.
Вывести: maker, средний размер экрана.
select maker, avg(screen) as Avg_screen from Laptop join Product on Product.model=Laptop.model group by maker

//Найдите производителей, выпускающих по меньшей мере три различных модели ПК. Вывести: Maker, число моделей ПК.
select maker, count(model) as Count_Model from Product where type='PC' group by maker having count(model)>=3

//Найдите максимальную цену ПК, выпускаемых каждым производителем, у которого есть модели в таблице PC.
Вывести: maker, максимальная цена.
select Product.maker, max(PC.price) from PC join Product on Product.model=PC.model group by maker

//Для каждого значения скорости ПК, превышающего 600 МГц, определите среднюю цену ПК с такой же скоростью. Вывести: speed, средняя цена.
select speed, avg(price) from PC where speed>600 group by speed

//Найдите производителей, которые производили бы как ПК
со скоростью не менее 750 МГц, так и ПК-блокноты со скоростью не менее 750 МГц.
Вывести: Maker
select maker from Product join PC on Product.model=PC.model where speed>=750
intersect 
select maker from Product join Laptop on Product.model=Laptop.model where speed>=750

//Перечислите номера моделей любых типов, имеющих самую высокую цену по всей имеющейся в базе данных продукции.
with this_table as 
(
SELECT pc.model, price FROM pc join product on pc.model = pc.model
UNION
SELECT laptop.model, price FROM laptop join product on product.model = laptop.model
UNION
SELECT model, price FROM printer
)
SELECT model FROM (
select * from this_table
) this_table_1 WHERE price = (
select max(price) from this_table
)

//Найдите производителей принтеров, которые производят ПК с наименьшим объемом RAM и с самым быстрым процессором среди всех ПК, имеющих наименьший объем RAM. Вывести: Maker
Select  distinct maker from product where maker in ( select maker from product join pc on product.model=pc.model where maker IN ( select maker from product where (type ='printer') and ram =(select min(ram) from pc ) and speed =(select max(speed) from pc where ram= (select min(ram) from pc ))))

//Найдите среднюю цену ПК и ПК-блокнотов, выпущенных производителем A (латинская буква). Вывести: одна общая средняя цена.
Select avg(price) as AVG_price from(
select price from pc where model in
(select model from product where maker='a' and
type='pc')
union all
select price from laptop where model in
(select model from product where maker='a' and
type='laptop')
) as p

//Найдите средний размер диска ПК каждого из тех производителей, которые выпускают и принтеры. Вывести: maker, средний размер HD.
select maker, avg(hd) from PC join Product on Product.model=PC.model where maker in (select maker from product where type='printer') group by maker

//Используя таблицу Product, определить количество производителей, выпускающих по одной модели.
select count (maker) from 
(select maker from product group by maker having count(model)=1) t

//Для классов кораблей, калибр орудий которых не менее 16 дюймов, укажите класс и страну.
select class, country from classes where bore>=16

