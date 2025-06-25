CREATE TABLE Students(
   StudentID Int PRIMARY KEY,
   Name varchar(20),
   Age INT,
   Email nvarchar(205) default
   'not_provided@example.com');

 
 --INSERT INTO
   INSERT INTO Students (StudentID,Name,Age,Email)
   VALUES
   (1,'Abhaya',20,'abhaya23@gmail.com'),
   (2,'Saloni',21,'saloni89@gmail.com'),
    (3,'Akash',19,'akash77@gmail.com'),
	(4,'Sai',22,default),
    (5,'Likun',null,null);

	
--UPDATE COMMAND
	UPDATE Students
	SET Age=20
	WHERE Name='Likun';

--DELETE COMMAND
	DELETE  FROM Students
	WHERE StudentID=2;