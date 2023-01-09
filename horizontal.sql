2. Create a global conceptual schema Emp (Eno; Ename; Address; Email; Salary) and insert 5 records. Divide Emp into horizontal fragments on two different nodes. Fire the following queries:



1) Systems user
CREATE TABLE emp1(eno number(3) PRIMARY KEY, ename char(10), address varchar2(20), email varchar2(20),  salary number(7));

INSERT INTO emp1 VALUES(1, 'Soham', 'Ghatkopar east', 'sohamhegde@gmail.com',150);
INSERT INTO emp1 VALUES(2, 'Ethan', 'Santacruz city', 'ethan@gmail.com',69);
INSERT INTO emp1 VALUES(6, 'Shri', 'Dhobi Ghat', 'nidhin@gmail.com',69420);


2) hr user 

CREATE TABLE emp2(eno number(3) PRIMARY KEY, ename char(10), address varchar2(20), email varchar2(20),  salary number(7));

INSERT INTO emp2 VALUES(3, 'Tasz', 'Domvivli gaav', 'taszgaming@gmail.com',420);
INSERT INTO emp2 VALUES(4, 'Kuntal', 'mamledar missal', 'kuntalayir@gmail.com',69420);
INSERT INTO emp2 VALUES(5, 'Siddhi', 'Alibaug', 'siddhi@gmail.com',0);

Step 3: Commit on both the users using COMMIT; command

Step 4: Create a database link between systems and hr user. For that you have to fire the following query in the systems terminal

CREATE PUBLIC DATABASE LINK "prac_1" CONNECT TO hr IDENTIFIED BY hr USING 'XE';

STEP 5: Do all the queries 
1.	Find the salary of all employees.
SELECT salary FROM emp1 e1 UNION select salary FROM emp2@prac_1;

2.	Find the Email of all employees where salary = 69420
SELECT email FROM emp1 WHERE salary = 69420 UNION SELECT email FROM emp2@prac_1 WHERE salary = 69420;

3.	Find the employee name and Email where employee number is known.
SELECT ename FROM emp1 WHERE eno = 1 UNION SELECT ename FROM emp2@prac_1 WHERE eno = 4;

4.	Find the employee name and address where employee number is known
SELECT ename,address FROM emp1 WHERE eno = 6 UNION SELECT ename,address FROM emp2@prac_1 WHERE eno = 5;
