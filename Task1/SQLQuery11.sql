GO
USE dentist
GO
  CREATE TABLE Doctor ( 
   Id_d   INT              NOT NULL IDENTITY(1,1) PRIMARY KEY,
   secondName VARCHAR (20)     NOT NULL, 
   cabinetId  int not null,
  phone int  not null,
  dataLicence date not null
      );
 Create table uslygi (
	 kod_uslygi int NOT NULL IDENTITY(1,1) PRIMARY KEY,
	 namee char (20) not null,
	 price int not null,
	 Id_d int not null, constraint DoctorUslygi foreign key (Id_d) references Doctor(Id_d)
	 );
	 CREATE TABLE Priem( 
   Id_Priem   INT              NOT NULL IDENTITY(1,1) PRIMARY KEY,
   dataPriema date NOT NULL, 
   dataVypiski date NOT NULL, 
   kod_uslugi int not null, constraint PriemUslugi foreign key (kod_uslugi) references uslygi(kod_uslygi),
    Id_d  int not null, constraint PriemDoctor foreign key ( Id_d ) references Doctor( Id_d ),
	   );
	    
Create table Patient (
  passport_id   INT              NOT NULL IDENTITY(1,1) PRIMARY KEY,
   Namee VARCHAR (20)     NOT NULL, 
   date_born datetime not null,
   address VARCHAR (20) NOT NULL,
   diagnoz varchar (20) NOT NULL,
  Id_Priem int not null,constraint PriemPatient foreign key (Id_Priem) references Priem(Id_Priem),
   kod_uslugi int not null,constraint PatientUslugi foreign key (kod_uslugi) references uslygi(kod_uslygi)
   
   
 )
 

 
 /*1*/

 SELECT  * FROM Doctor where YEAR(dataLicence)>2000;

 /*2*/
 SELECT MAX(B.count) FROM
(SELECT  T.Id_d, count(*) as count FROM (
      SELECT Doctor.Id_d, Patient."Id_Priem", Priem."dataPriema" 
      FROM Doctor INNER JOIN uslygi ON Doctor.Id_d = uslygi.Id_d
	  INNER JOIN Priem ON uslygi.kod_uslygi = Priem.kod_uslugi
	  INNER JOIN Patient ON  Patient."Id_Priem" = Priem.Id_Priem
                 WHERE YEAR(Priem."dataPriema") = YEAR(GETDATE())
) AS T  GROUP BY T.Id_d, MONTH(T.dataPriema)) as B
GROUP BY B.Id_d

 /*3*/
 SELECT 
 c.passport_id
FROM
 Patient c
 JOIN Priem o ON c.Id_Priem = o.Id_Priem
GROUP BY
 c.passport_id, c.Namee
HAVING COUNT(c.passport_id) > 2;

