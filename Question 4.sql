SELECT COUNT(DISTINCT userID)
FROM i_user_login_logs
WHERE userId
IN (SELECT userId
  FROM i_user_login_logs
  GROUP BY userId
  HAVING COUNT( * ) >3
)