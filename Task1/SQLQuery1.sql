
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
   kod_uslugi int not null, constraint PriemUslugi foreign key (kod_uslugi) references uslygi(kod_uslygi)
   );
 
  
Create table Patient (
  passport_id   INT              NOT NULL IDENTITY(1,1) PRIMARY KEY,
   Namee VARCHAR (20)     NOT NULL, 
   date_born datetime not null,
   address VARCHAR (20) NOT NULL,
   diagnoz varchar (20) NOT NULL,
   Id_priem int not null,constraint PatientPriem foreign key (Id_Priem) references Priem(Id_priem),
   kod_uslugi int not null,constraint PatientUslugi foreign key (kod_uslugi) references uslygi(kod_uslygi)
   
   
 )




   
  

 


