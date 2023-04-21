CREATE TABLE TEACHER(
TNO CHAR(10) PRIMARY KEY NOT NULL,
TNAME CHAR(20),
PHONE CHAR(20),
DEPT CHAR(20)
);

CREATE TABLE ADMIN(
NUMBER CHAR(20) PRIMARY KEY NOT NULL,
PWD CHAR(20) NOT NULL,
TNO CHAR(10) NOT NULL UNIQUE,
FOREIGN KEY(TNO) REFERENCES TEACHER(TNO)
ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE LAB(
LNO CHAR(10) PRIMARY KEY NOT NULL,
LNAME CHAR(20),
MAXNUM CHAR(20),
PURPOSE CHAR(20),
PHOTO LONGBLOB
);

 CREATE TABLE DEVICE(
 DNO CHAR(10) PRIMARY KEY NOT NULL,
 DNAME CHAR(20),
 LNO CHAR(10),
 FOREIGN KEY(LNO) REFERENCES LAB(LNO)
 ON DELETE CASCADE ON UPDATE CASCADE
 );

 CREATE TABLE BOOK(
 TNO CHAR(10) NOT NULL,
 LNO CHAR(10) NOT NULL,
 BEGINTIME TIMESTAMP NOT NULL,
 ENDTIME TIMESTAMP NOT NULL,
 USERNAME CHAR(20),
 PRIMARY KEY(TNO,LNO,BEGINTIME),
 FOREIGN KEY(TNO) REFERENCES TEACHER(TNO)
 ON DELETE CASCADE ON UPDATE CASCADE,
 FOREIGN KEY(LNO) REFERENCES LAB(LNO)
 ON DELETE CASCADE ON UPDATE CASCADE
 );

INSERT INTO TEACHER VALUES(1,'BILL',1362343332,'CS');
INSERT INTO TEACHER VALUES(2,'JACK',1387777677,'SE');
INSERT INTO TEACHER VALUES(3,'TOM',1382324343,'CN');
INSERT INTO TEACHER VALUES(4,'MARK',1387777677,'PE');

INSERT INTO ADMIN VALUES(12345,12345,1);
INSERT INTO ADMIN VALUES(23456,23456,2);
INSERT INTO ADMIN VALUES(34567,34567,3);
INSERT INTO ADMIN VALUES(45678,45678,4);

INSERT INTO LAB VALUES(11,'COMPUTER_LAB',70,'PROGRAMMING',LOAD_FILE("D:\javafile\test\src\computer_lab.jpg"));
INSERT INTO LAB VALUES(12,'PHYSICS_LAB',80,'STUDY',LOAD_FILE("D:\javafile\test\src\physics_lab.jpg"));

INSERT INTO DEVICE VALUES(21,'COMPUTER',11);
INSERT INTO DEVICE VALUES(22,'BALANCE',12);

INSERT INTO BOOK VALUES(1,11,'2022-12-01 09:00:00','2022-12-01 16:00:00','JHON');
INSERT INTO BOOK VALUES(2,12,'2022-12-03 10:00:00','2022-12-03 20:00:00','MARY');
INSERT INTO BOOK VALUES(2,12,'2022-12-01 10:00:00','2022-12-01 20:00:00','MARY');
INSERT INTO BOOK VALUES(2,11,'2022-12-01 17:00:00','2022-12-01 21:30:00','MARY');
INSERT INTO BOOK VALUES(1,12,'2022-12-04 12:00:00','2022-12-04 19:35:00','TONY');
INSERT INTO BOOK VALUES(4,11,'2022-12-06 13:00:00','2022-12-06 17:35:00','MARK');
INSERT INTO BOOK VALUES(3,11,'2022-12-05 12:00:00','2022-12-05 19:35:00','TOM');
