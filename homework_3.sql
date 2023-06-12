USE lesson_3;

SELECT * FROM staff;

/*1. 
Отсортируйте данные по полю заработная плата (salary) 
в порядке: убывания; возрастания
*/
select * from staff 
order by salary ASC;
select * from staff 
order by salary desc;

/*
2.
Выведите 5 максимальных заработных плат (salary)
*/
select * from staff 
order by salary desc
LIMIT 5;

/*
3.
Посчитайте суммарную зарплату (salary) по каждой специальности (роst)
*/
select post, avg(salary)
from staff
group by post;


/*
4.
Найдите кол-во сотрудников с специальностью (post) «Рабочий» в возрасте от 24 до 49 лет включительно.
*/
select count(post) from staff where post="Рабочий" and age<50 and age>23;

/*
5.
 Найдите количество специальностей
*/

select count(distinct post) from staff;

/*
6.
Выведите специальности, у которых средний возраст сотрудников меньше 30 лет
*/

select post, avg(age) as age 
from staff
group by post
having age<30;