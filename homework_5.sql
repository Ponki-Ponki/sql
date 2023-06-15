
USE lesson_4;
/*
1.
Создайте представление, в которое попадет информация о 
пользователях (имя, фамилия, город и пол), которые не старше 20 лет.
*/
CREATE OR REPLACE VIEW view_user AS 
SELECT 
	CONCAT(firstname,' ',lastname) as Name,
	hometown, 
	gender
FROM users u
JOIN profiles p ON u.id = p.user_id
WHERE TIMESTAMPDIFF(YEAR, birthday, NOW()) < 20
GROUP BY u.id;

SELECT * FROM view_user;


/*
2.
Найдите кол-во, отправленных сообщений каждым пользователем и 
выведите ранжированный список пользователь, указав имя и фамилию пользователя, 
количество отправленных сообщений и место в рейтинге (первое место 
у пользователя с максимальным количеством сообщений) . (используйте DENSE_RANK)
*/

SELECT 
	DENSE_RANK() OVER (ORDER BY COUNT(m.id) DESC) AS 'Top',
	COUNT(from_user_id) AS 'Count of message',
	CONCAT(firstname, ' ', lastname) AS Users
FROM users u
LEFT JOIN messages m ON u.id = m.from_user_id
GROUP BY u.id;




/*
3.
Выберите все сообщения, отсортируйте сообщения по возрастанию 
даты отправления (created_at) и найдите разницу дат отправления 
между соседними сообщениями, получившегося списка. (используйте LEAD или LAG)
*/
SELECT *,
	LEAD(created_at) OVER(ORDER BY created_at) AS lead_time,
	TIMESTAMPDIFF (MINUTE, created_at, LEAD(created_at) 
	OVER(ORDER BY created_at)) AS minute_lead_diff,
	LAG(created_at) OVER(ORDER BY created_at) AS lag_time,
	TIMESTAMPDIFF (MINUTE,  LAG(created_at) 
	OVER(ORDER BY created_at), created_at ) AS minute_lag_diff
FROM messages;

