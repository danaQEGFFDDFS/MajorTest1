use dentist;
SELECT MAX(B.count) FROM
(SELECT  T.Id_d, count(*) as count FROM (
      SELECT Doctor.Id_d, Patient."Id_Priem", Priem."dataPriema" 
      FROM Doctor INNER JOIN uslygi ON Doctor.Id_d = uslygi.Id_d
	  INNER JOIN Priem ON uslygi.kod_uslygi = Priem.kod_uslugi
	  INNER JOIN Patient ON  Patient."Id_Priem" = Priem.Id_Priem
                 WHERE YEAR(Priem."dataPriema") = YEAR(GETDATE())
) AS T  GROUP BY T.Id_d, MONTH(T.dataPriema)) as B
GROUP BY B.Id_d


