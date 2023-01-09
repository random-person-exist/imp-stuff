-- [A]Create a table tblEmp_Appnt, which stores the account number, name, and valid time say, recruitment date and retirement date. Insert 10 records and fire the following queries
   
-- a)	Find all the employees who join the company on 2/3/2001
-- b)	Find all the employees who will retired  on 2/3/2001

-- [B] Create a table tbl_shares, which stores the, name of company, number of shares, and price per share at transaction time. Insert 10 records and fire the following queries
   
-- a)	Find all the names of a company whose share price is more than Rs. 1000 at   2:21 P.M. 
-- b)  Find the name of company which has highest share price at 2.24 P.M.

CREATING TABLES
CREATE TABLE emp_data(emp_id number(5) PRIMARY KEY, emp_name char(10), join_date date, retire_date date);
INSERTING VALUES
INSERT INTO emp_data VALUES(1,'Soham',to_date(sysdate,'DD-MM-YYYY'), to_date('2-3-2039','DD-MM-YYYY'));
INSERT INTO emp_data VALUES(2,'Soha2',to_date('19-2-1980','DD-MM-YYYY'), to_date(sysdate,'DD-MM-YYYY'));
INSERT INTO emp_data VALUES(3,'Soha3',to_date(sysdate,'DD-MM-YYYY'), to_date('4-5-2040','DD-MM-YYYY'));
INSERT INTO emp_data VALUES(4,'Soha4',to_date('24-2-2001','DD-MM-YYYY'), to_date(sysdate,'DD-MM-YYYY'));
INSERT INTO emp_data VALUES(5,'Soha5',to_date(sysdate,'DD-MM-YYYY'), to_date('24-2-2039','DD-MM-YYYY'));
INSERT INTO emp_data VALUES(6,'Soha6',to_date(sysdate,'DD-MM-YYYY'), to_date('2-12-2069','DD-MM-YYYY'));
INSERT INTO emp_data VALUES(7,'Soha7',to_date('24-2-2001','DD-MM-YYYY'), to_date('2-3-2039','DD-MM-YYYY'));
INSERT INTO emp_data VALUES(8,'Soha8',to_date('24-3-2001','DD-MM-YYYY'), to_date('2-4-2039','DD-MM-YYYY'));
INSERT INTO emp_data VALUES(9,'Soha9',to_date('24-4-2001','DD-MM-YYYY'), to_date('2-5-2039','DD-MM-YYYY'));
INSERT INTO emp_data VALUES(10,'Soha10',to_date('24-5-2001','DD-MM-YYYY'), to_date('2-6-2039','DD-MM-YYYY'));

-- CREATING TABLES AND INSERTING DATA
    
alter session
set nls_date_format = 'HH24:MI';

CREATE TABLE share_det(cust_name varchar(10),no_shares number(10),cost number(10,2), time_of_tran date);
INSERT INTO share_det VALUES('Soha',10,1000,to_date(sysdate,'HH24:Mi'));
INSERT INTO share_det VALUES('Archut',10,1000,to_date(sysdate,'HH24:Mi'));
INSERT INTO share_det VALUES('Kuntal',10,1000,to_date(sysdate,'HH24:Mi'));
INSERT INTO share_det VALUES('Ethan',10,1000,to_date(sysdate,'HH24:Mi'));


QUERYING
1) Selecting employees going to retire on 2-3-2039
SELECT emp_name from emp_data where retire_date = to_date('2-3-2039','DD-MM-YYYY');

2) Select employees who have started in 24-2-2001
SELECT emp_name from emp_data where join_date = to_date('24-2-2001','DD-MM-YYYY');

3) Find all the names of a company whose share price is more than Rs. 900 at 15:49 A.M. 
SELECT cust_name FROM share_det where(no_shares*cost)>900 AND time_of_tran = to_date('15:49','HH24:Mi');

