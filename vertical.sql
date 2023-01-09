Step 1 Connect to the systems user
Step 2 Open another terminal, connect to the systems user and alter the hr user using:

ALTER USER hr identified by hr ACCOUNT UNLOCK;
LOGIN TO USER hr 
connect 
username: hr
password: hr

a)VERTICAL FRAGMENTATION

Step 3 Create tables and insert values in both the users. 
i) Systems User:

CREATE TABLE emp_1(eno number(3) PRIMARY KEY, ename char(10), address varchar2(20));

INSERT INTO emp_1 VALUES(1, 'Soham', 'Ghatkopar east');
INSERT INTO emp_1 VALUES(2, 'Ethan', 'Santacruz city');
INSERT INTO emp_1 VALUES(3, 'Tasz', 'Domvivli gaav');
INSERT INTO emp_1 VALUES(4, 'Kuntal', 'mamledar missal');
INSERT INTO emp_1 VALUES(5, 'Siddhi', 'Alibaug');




ii) HR User: Do this in the terminal where u have logged in as HR

CREATE TABLE emp_2(eno number(3) PRIMARY KEY, email varchar2(20), salary number(7,2));

INSERT INTO emp_2 VALUES(1, 'sohamhegde@gmail.com',150);
INSERT INTO emp_2 VALUES(2, 'ethan@gmail.com',69);
INSERT INTO emp_2 VALUES(3, 'taszgaming@gmail.com',420);
INSERT INTO emp_2 VALUES(4, 'kuntalayir@gmail.com',69420);
INSERT INTO emp_2 VALUES(5, 'siddhi@gmail.com',0);  

Step 3: Commit on both the users using COMMIT; command

Step 4: Create a database link between systems and hr user. For that you have to fire the following query in the systems terminal
CREATE PUBLIC DATABASE LINK "prac_1" CONNECT TO hr IDENTIFIED BY hr USING 'XE';

Step 5:
1.	Find the salary of an employee where employee number is known.
SELECT salary FROM emp_2@prac_1 where eno = 1;                  

2.	Find the Email where the employee name is known.   
SELECT email FROM emp_2@prac_1 e2, emp_1 e1 WHERE e2.eno = e1.eno AND e1.ename = 'Tasz';       

3.	Find the employee name and Email where employee number is known.  
SELECT ename,email FROM emp_2@prac_1 e2, emp_1 e1 WHERE e1.eno = e2.eno AND e1.eno = 4;


4.	Find the employee name whose salary is = 69.
SELECT ename FROM emp_1 e1, emp_2@prac_1 e2 WHERE e1.eno = e2.eno AND e2.salary = 69