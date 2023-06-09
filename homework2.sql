USE lesson_1;
/*
№1. Используя операторы языка SQL, 
создайте табличку “sales”. Заполните ее данными.
*/
CREATE TABLE sales 
 (
 id SERIAL PRIMARY KEY,
 order_date DATE NOT NULL,
 count_product INT NOT NULL
 );
 
 INSERT INTO sales (order_date,count_product)
 VALUES 
 ('2022-01-01',156),
 ('2022-01-02',180),
 ('2022-01-03',21),
 ('2022-01-04',124),
 ('2022-01-05',341);
 
/*
№2 Для данных таблицы “sales” укажите тип заказа в зависимости от 
кол-ва : меньше 100 - Маленький заказ; от 100 до 300 - Средний заказ; 
больше 300 - Большой заказ.
*/

SELECT 
	id AS 'id заказа',
	CASE 
		WHEN count_product < 100 THEN 'Маленький заказ'
		WHEN count_product > 100 AND count_product < 300 THEN 'Средний заказ'
		WHEN count_product > 100 THEN 'Большой заказ'
	END AS 'Тип заказа'	
FROM sales;


/*№4. Создайте таблицу “orders”, заполните ее значениями. 
Выберите все заказы. В зависимости от поля order_status
 выведите столбец full_order_status: OPEN – «Order is in open state» ;
 CLOSED - «Order is closed»; CANCELLED - «Order is cancelled»
*/

CREATE TABLE orders 
 (
 id SERIAL PRIMARY KEY,
 employee_id VARCHAR(50) NOT NULL,
 amount DOUBLE NOT NULL,
 order_status VARCHAR(20) NOT NULL
 );
 
 INSERT INTO orders (employee_id,amount,order_status)
 VALUES 
 ('e03',15.00,'OPEN'),
 ('e01',25.50,'OPEN'), 
 ('e05',100.70,'CLOSED'),
 ('e02',22.18,'OPEN'), 
 ('e04',9.50,'CANCELLED');
 
 
SELECT 
	id AS 'id заказа',
    employee_id,
    amount,
	CASE order_status
		WHEN 'OPEN' THEN 'Order is in open state'
		WHEN 'CLOSED' THEN 'Order is closed'
		WHEN 'CANCELLED' THEN 'Order is cancelled'
	END AS 'full_order_status'	
FROM orders;


