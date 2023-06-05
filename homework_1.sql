/* Задача 1
Создайте таблицу с мобильными телефонами, используя графический интерфейс. Заполните БД данными
*/
-- создание таблиц
CREATE TABLE phone(
	id INT AUTO_INCREMENT NOT NULL PRIMARY KEY, 
	product_name VARCHAR(100) NOT NULL, 
	manufacturer VARCHAR (45) NOT NULL,
	product_count INT,
    price INT
);
-- наполнение нужными данными
INSERT INTO phone (product_name, manufacturer, product_count, price)
VALUES 
('iPhone X', 'Apple', 3, 76000),
('iPhone 8', 'Apple', 2, 51000),
('Galaxy S9', 'Samsung', 2, 56000),
('Galaxy S8', 'Samsung', 1, 41000),
('P20 Pro', 'Huawei', 5, 36000);

/* Задача 2
Выведите название, производителя и цену для товаров, количество которых превышает 2
*/
-- выборки данных
select product_name, manufacturer, price from phone
where product_count > 2;

/* Задача 3
Выведите весь ассортимент товаров марки “Samsung”
*/
select product_name, manufacturer, product_count, price from phone
where manufacturer = 'Samsung';

/* Задача 4
4.1. Товары, в которых есть упоминание "Iphone"
4.2. Товары, в которых есть упоминание "Samsung"
4.3.  Товары, в которых есть ЦИФРЫ
4.4.  Товары, в которых есть ЦИФРА "8"  
*/

select product_name, manufacturer, product_count, price from phone
where product_name like '%Iphone%' or manufacturer like '%Iphone%';

select product_name, manufacturer, product_count, price from phone
where product_name like '%Samsung%' or manufacturer like '%Samsung%';

select product_name, manufacturer, product_count, price from phone
where product_name like '%[0-9]%';

select product_name, manufacturer, product_count, price from phone
where product_name like '%8%';