SELECT i_users.username, i_users.emailaddress
FROM users INNER JOIN login ON users.userId = i_user_login_logs.userId
WHERE i_users.userid NOT IN (
SELECT userId
FROM i_users
WHERE username='Administrator')
GROUP BY i_users.username
HAVING COUNT (i_user_login_logs.userId) = (
SELECT MAX(y.cnt)
  FROM (SELECT userId as userId, COUNT(userId) AS cnt
          FROM i_user_login_logs
	   GROUP BY userId) y)