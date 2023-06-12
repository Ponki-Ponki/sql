 USE lesson_4;
 
 /*
 1. 
 Подсчитать общее количество лайков, которые получили пользователи младше 12 лет.
 */
SELECT 
	COUNT(*) AS 'Общее кол-во лайков'
FROM likes
WHERE user_id IN (
	SELECT user_id 
	FROM profiles
	WHERE TIMESTAMPDIFF(YEAR, birthday, NOW()) < 12);
	

/*
 2. Определить кто больше поставил лайков (всего): мужчины или женщины.
*/

SELECT CASE (gender)
	WHEN 'm' THEN 'М'
	WHEN 'f' THEN 'Ж'
    END AS 'Пол', COUNT(*) as 'Кол-во лайков'
FROM profiles p 
JOIN likes l 
WHERE l.user_id = p.user_id
GROUP BY gender 
LIMIT 1; 


/* 
3. Вывести всех пользователей, которые не отправляли сообщения.
*/

SELECT DISTINCT CONCAT(firstname, ' ', lastname) AS 'Не отправляли сообщения'
FROM users u
WHERE NOT EXISTS (
	SELECT from_user_id
	FROM messages m
	WHERE u.id = m.from_user_id
);

