SELECT 
 c.passport_id
FROM
 Patient c
 JOIN Priem o ON c.Id_Priem = o.Id_Priem
GROUP BY
 c.passport_id, c.Namee
HAVING COUNT(c.passport_id) > 2;