//Section 1: MSSQL DB


// UC-1
mysql> CREATE DATABASE payroll_service
    -> ;
Query OK, 1 row affected (0.01 sec)

mysql> SHOW DATABASE;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'DATABASE' at line 1
mysql> SHOW DATABASES;
+--------------------+
| Database           |
+--------------------+
| book_shop          |
| information_schema |
| mysql              |
| payroll_service    |
| performance_schema |
| shirts_db          |
| sys                |
| temp               |
+--------------------+
8 rows in set (0.00 sec)

mysql> USE payroll_service;
Database changed


//UC-2
mysql> CREATE TABLE employee_payroll( id INT AUTO_INCREMENT PRIMARY KEY NOT NULL, name VARCHAR(50), salary DECIMAL(10,2) NOT NULL, start_date DATE NOT NULL );
Query OK, 0 rows affected (0.03 sec)

mysql> SHOW TABLES;
+---------------------------+
| Tables_in_payroll_service |
+---------------------------+
| employee_payroll          |
+---------------------------+
1 row in set (0.00 sec)

mysql> DESC employee_payroll;
+------------+---------------+------+-----+---------+----------------+
| Field      | Type          | Null | Key | Default | Extra          |
+------------+---------------+------+-----+---------+----------------+
| id         | int           | NO   | PRI | NULL    | auto_increment |
| name       | varchar(50)   | YES  |     | NULL    |                |
| salary     | decimal(10,2) | NO   |     | NULL    |                |
| start_date | date          | NO   |     | NULL    |                |
+------------+---------------+------+-----+---------+----------------+
4 rows in set (0.01 sec)


//UC-3
mysql> INSERT INTO employee_payroll (name, salary, start_date) VALUES('Bhuvan',10000000.00,'2025-05-11'),
    -> ('Ayush Nagar',1000000.00,'2025-05-12'),
    -> ('Ayush Nanda',2000000.00,'2025-05-13'),
    -> ('Abhi',1800000.00,'2025-05-11');
Query OK, 4 rows affected (0.01 sec)
Records: 4  Duplicates: 0  Warnings: 0


//UC-4
mysql> SELECT * FROM employee_payroll;
+----+-------------+-------------+------------+
| id | name        | salary      | start_date |
+----+-------------+-------------+------------+
|  1 | Bhuvan      | 10000000.00 | 2025-05-11 |
|  2 | Ayush Nagar |  1000000.00 | 2025-05-12 |
|  3 | Ayush Nanda |  2000000.00 | 2025-05-13 |
|  4 | Abhi        |  1800000.00 | 2025-05-11 |
+----+-------------+-------------+------------+
4 rows in set (0.00 sec)


//UC-5
mysql> SELECT salary FROM employee_payroll WHERE name = 'Bhuvan';
+-------------+
| salary      |
+-------------+
| 10000000.00 |
+-------------+
1 row in set (0.00 sec)


mysql> SELECT * FROM employee_payroll WHERE start_date BETWEEN CAST('2018-01-01' AS DATE) AND DATE(NOW());
Empty set (0.01 sec)

mysql> INSERT INTO employee_payroll (name, salary, start_date) VALUES('Aniket',120000.00,'2022-01-11');
Query OK, 1 row affected (0.00 sec)

mysql> SELECT * FROM employee_payroll WHERE start_date BETWEEN CAST('2018-01-01' AS DATE) AND DATE(NOW());
+----+--------+-----------+------------+
| id | name   | salary    | start_date |
+----+--------+-----------+------------+
|  5 | Aniket | 120000.00 | 2022-01-11 |
+----+--------+-----------+------------+
1 row in set (0.00 sec)

mysql> ALTER TABLE employee_payroll
    -> ADD gender VARCHAR(10) AFTER name;
Query OK, 0 rows affected (0.01 sec)
Records: 0  Duplicates: 0  Warnings: 0

// UC-6
mysql> UPDATE employee_payroll
    -> SET gender = 'F'
    -> WHERE name = 'Abhi';
Query OK, 1 row affected (0.00 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> UPDATE employee_payroll SET gender = 'M' WHERE name = 'Bhuvan';
Query OK, 1 row affected (0.01 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> UPDATE employee_payroll SET gender = 'M' WHERE name = 'Ayush' OR name = 'Aniket';
Query OK, 1 row affected (0.05 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> SHOW TABLES;
+---------------------------+
| Tables_in_payroll_service |
+---------------------------+
| employee_payroll          |
+---------------------------+
1 row in set (0.02 sec)

mysql> DESC employee_payroll;
+------------+---------------+------+-----+---------+----------------+
| Field      | Type          | Null | Key | Default | Extra          |
+------------+---------------+------+-----+---------+----------------+
| id         | int           | NO   | PRI | NULL    | auto_increment |
| name       | varchar(50)   | YES  |     | NULL    |                |
| gender     | varchar(10)   | YES  |     | NULL    |                |
| salary     | decimal(10,2) | NO   |     | NULL    |                |
| start_date | date          | NO   |     | NULL    |                |
+------------+---------------+------+-----+---------+----------------+
5 rows in set (0.01 sec)

mysql> SELECT * FROM employee_payroll;
+----+-------------+--------+-------------+------------+
| id | name        | gender | salary      | start_date |
+----+-------------+--------+-------------+------------+
|  1 | Bhuvan      | M      | 10000000.00 | 2025-05-11 |
|  2 | Ayush Nagar | NULL   |  1000000.00 | 2025-05-12 |
|  3 | Ayush Nanda | NULL   |  2000000.00 | 2025-05-13 |
|  4 | Abhi        | F      |  1800000.00 | 2025-05-11 |
|  5 | Aniket      | M      |   120000.00 | 2022-01-11 |
+----+-------------+--------+-------------+------------+
5 rows in set (0.00 sec)

mysql> UPDATE employee_payroll SET gender = 'M' WHERE name = 'Ayush Nanda' OR name = 'Aniket';
Query OK, 1 row affected (0.01 sec)
Rows matched: 2  Changed: 1  Warnings: 0

mysql> UPDATE employee_payroll SET gender = 'M' WHERE name = 'Ayush Nanda' AND name = 'Aniket';
Query OK, 0 rows affected (0.03 sec)
Rows matched: 0  Changed: 0  Warnings: 0

mysql> SELECT * FROM employee_payroll;
+----+-------------+--------+-------------+------------+
| id | name        | gender | salary      | start_date |
+----+-------------+--------+-------------+------------+
|  1 | Bhuvan      | M      | 10000000.00 | 2025-05-11 |
|  2 | Ayush Nagar | NULL   |  1000000.00 | 2025-05-12 |
|  3 | Ayush Nanda | M      |  2000000.00 | 2025-05-13 |
|  4 | Abhi        | F      |  1800000.00 | 2025-05-11 |
|  5 | Aniket      | M      |   120000.00 | 2022-01-11 |
+----+-------------+--------+-------------+------------+
5 rows in set (0.01 sec)


// UC-7
mysql> SELECT SUM(salary) FROM employee_payroll WHERE gender = 'M' GROUP BY gender;
+-------------+
| SUM(salary) |
+-------------+
| 12120000.00 |
+-------------+
1 row in set (0.00 sec)

mysql> SELECT MIN(salary) FROM employee_payroll WHERE gender = 'M' GROUP BY gender;
+-------------+
| MIN(salary) |
+-------------+
|   120000.00 |
+-------------+
1 row in set (0.00 sec)

mysql> SELECT MAX(salary) FROM employee_payroll;
+-------------+
| MAX(salary) |
+-------------+
| 10000000.00 |
+-------------+
1 row in set (0.00 sec)

mysql> 
mysql> SELECT AVG(salary) FROM employee_payroll;
+----------------+
| AVG(salary)    |
+----------------+
| 2984000.000000 |
+----------------+
1 row in set (0.00 sec)

mysql> SELECT COUNT(name) FROM employee_payroll;
+-------------+
| COUNT(name) |
+-------------+
|           5 |
+-------------+
1 row in set (0.00 sec)





// ER DIAGRAM(SECTION -02)


//UC-8
mysql> ALTER TABLE employee_payroll
    -> ADD COLUMN employee_phone VARCHAR(15),
    -> ADD COLUMN address VARCHAR(255) DEFAULT 'Not Provided',
    -> ADD COLUMN department VARCHAR(255) NOT NULL;
Query OK, 0 rows affected (0.04 sec)
Records: 0  Duplicates: 0  Warnings: 0

//UC-9
mysql> ALTER TABLE employee_payroll
    -> ADD COLUMN BasicPay DECIMAL(10,2),
    -> ADD COLUMN Deductions DECIMAL(10,2),
    -> ADD COLUMN TaxablePay DECIMAL(10,2),
    -> ADD COLUMN IncomeTax DECIMAL(10,2),
    -> ADD COLUMN NetPay DECIMAL(10,2);
Query OK, 0 rows affected (0.07 sec)
Records: 0  Duplicates: 0  Warnings: 0

//UC-10
mysql> SELECT * FROM employee_payroll;
+----+-------------+--------+-------------+------------+----------------+--------------+------------+----------+------------+------------+-----------+--------+
| id | name        | gender | salary      | start_date | employee_phone | address      | department | BasicPay | Deductions | TaxablePay | IncomeTax | NetPay |
+----+-------------+--------+-------------+------------+----------------+--------------+------------+----------+------------+------------+-----------+--------+
|  1 | Bhuvan      | M      | 10000000.00 | 2025-05-11 | NULL           | Not Provided |            |     NULL |       NULL |       NULL |      NULL |   NULL |
|  2 | Ayush Nagar | NULL   |  1000000.00 | 2025-05-12 | NULL           | Not Provided |            |     NULL |       NULL |       NULL |      NULL |   NULL |
|  3 | Ayush Nanda | M      |  2000000.00 | 2025-05-13 | NULL           | Not Provided |            |     NULL |       NULL |       NULL |      NULL |   NULL |
|  4 | Abhi        | F      |  1800000.00 | 2025-05-11 | NULL           | Not Provided |            |     NULL |       NULL |       NULL |      NULL |   NULL |
|  5 | Aniket      | M      |   120000.00 | 2022-01-11 | NULL           | Not Provided |            |     NULL |       NULL |       NULL |      NULL |   NULL |
+----+-------------+--------+-------------+------------+----------------+--------------+------------+----------+------------+------------+-----------+--------+
5 rows in set (0.04 sec)

mysql> INSERT INTO employee_payroll(name,gender,salary,start_date,department)
    -> VALUES('Terissa','M',100000.00,'2022-02-18','Sales'),
    -> ('Terissa','F',200000.00,'2022-09-11','Marketing');
Query OK, 2 rows affected (0.02 sec)
Records: 2  Duplicates: 0  Warnings: 0

mysql> SELECT * FROM employee_payroll;
+----+-------------+--------+-------------+------------+----------------+--------------+------------+----------+------------+------------+-----------+--------+
| id | name        | gender | salary      | start_date | employee_phone | address      | department | BasicPay | Deductions | TaxablePay | IncomeTax | NetPay |
+----+-------------+--------+-------------+------------+----------------+--------------+------------+----------+------------+------------+-----------+--------+
|  1 | Bhuvan      | M      | 10000000.00 | 2025-05-11 | NULL           | Not Provided |            |     NULL |       NULL |       NULL |      NULL |   NULL |
|  2 | Ayush Nagar | NULL   |  1000000.00 | 2025-05-12 | NULL           | Not Provided |            |     NULL |       NULL |       NULL |      NULL |   NULL |
|  3 | Ayush Nanda | M      |  2000000.00 | 2025-05-13 | NULL           | Not Provided |            |     NULL |       NULL |       NULL |      NULL |   NULL |
|  4 | Abhi        | F      |  1800000.00 | 2025-05-11 | NULL           | Not Provided |            |     NULL |       NULL |       NULL |      NULL |   NULL |
|  5 | Aniket      | M      |   120000.00 | 2022-01-11 | NULL           | Not Provided |            |     NULL |       NULL |       NULL |      NULL |   NULL |
|  6 | Terissa     | M      |   100000.00 | 2022-02-18 | NULL           | Not Provided | Sales      |     NULL |       NULL |       NULL |      NULL |   NULL |
|  7 | Terissa     | F      |   200000.00 | 2022-09-11 | NULL           | Not Provided | Marketing  |     NULL |       NULL |       NULL |      NULL |   NULL |
+----+-------------+--------+-------------+------------+----------------+--------------+------------+----------+------------+------------+-----------+--------+
7 rows in set (0.00 sec)

mysql> exit
mysql> tee //Section 1: MSSQL DB
mysql> SELECT * FROM employee_payroll;
ERROR 1046 (3D000): No database selected
mysql> USE payroll_service;
Reading table information for completion of table and column names
You can turn off this feature to get a quicker startup with -A

Database changed
mysql> SELECT * FROM employee_payroll;
+----+-------------+--------+-------------+------------+----------------+--------------+------------+----------+------------+------------+-----------+--------+
| id | name        | gender | salary      | start_date | employee_phone | address      | department | BasicPay | Deductions | TaxablePay | IncomeTax | NetPay |
+----+-------------+--------+-------------+------------+----------------+--------------+------------+----------+------------+------------+-----------+--------+
|  1 | Bhuvan      | M      | 10000000.00 | 2025-05-11 | NULL           | Not Provided |            |     NULL |       NULL |       NULL |      NULL |   NULL |
|  2 | Ayush Nagar | NULL   |  1000000.00 | 2025-05-12 | NULL           | Not Provided |            |     NULL |       NULL |       NULL |      NULL |   NULL |
|  3 | Ayush Nanda | M      |  2000000.00 | 2025-05-13 | NULL           | Not Provided |            |     NULL |       NULL |       NULL |      NULL |   NULL |
|  4 | Abhi        | F      |  1800000.00 | 2025-05-11 | NULL           | Not Provided |            |     NULL |       NULL |       NULL |      NULL |   NULL |
|  5 | Aniket      | M      |   120000.00 | 2022-01-11 | NULL           | Not Provided |            |     NULL |       NULL |       NULL |      NULL |   NULL |
|  6 | Terissa     | M      |   100000.00 | 2022-02-18 | NULL           | Not Provided | Sales      |     NULL |       NULL |       NULL |      NULL |   NULL |
|  7 | Terissa     | F      |   200000.00 | 2022-09-11 | NULL           | Not Provided | Marketing  |     NULL |       NULL |       NULL |      NULL |   NULL |
+----+-------------+--------+-------------+------------+----------------+--------------+------------+----------+------------+------------+-----------+--------+
7 rows in set (0.00 sec)

mysql> CREATE TABLE employee(
    -> employee_id INT PRIMARY KEY,
    -> name VARCHAR(100),
    -> gender CHAR(1),
    -> start_date DATE,
    -> phone VARCHAR(15),
    -> address VARCHAR(255) DEFAULT 'NOT PROVIDED'
    -> );
Query OK, 0 rows affected (0.03 sec)

mysql> CREATE TABLE department(
    -> department_id INT PRIMARY KEY AUTO_INCREMENT,
    -> name VARCHAR(100) NOT NULL UNIQUE
    -> );
Query OK, 0 rows affected (0.01 sec)

mysql> CREATE TABLE employee_department(
    -> employee_id INT,
    -> department_id INT,
    -> PRIMARY KEY (employee_id, department_id),
    -> FOREIGN KEY (employee_id) REFERENCES employee(employee_id),
    -> FOREIGN KEY (department_id) REFERENCES department(department_id)
    -> );
Query OK, 0 rows affected (0.02 sec)

mysql> CREATE TABLE payroll(
    -> payroll_id INT PRIMARY KEY AUTO_INCREMENT,
    ->  employee_id INT,
    -> basic_pay DECIMAL(10,2),
    -> deductions DECIMAL(10,2),
    -> taxable_pay DECIMAL(10,2),
    -> income_tax DECIMAL(10,2),
    -> net_pay DECIMAL(10,2),
    -> FOREIGN KEY (employee_id) REFERENCES employee(employee_id)
    -> );
Query OK, 0 rows affected (0.01 sec)

mysql> INSERT INTO employee (employee_id, name, gender,start_date,phone,address)
    -> VALUES(7,'Terissa','F','2022-09-11',9876543210,'IXJ');
Query OK, 1 row affected (0.02 sec)

mysql> INSERT INTO department(name)
    -> VALUES('Marketing');
Query OK, 1 row affected (0.05 sec)

mysql> INSERT INTO employee_department (employee_id, department_id)
    -> VALUES (7, 1);
Query OK, 1 row affected (0.01 sec)

mysql> SELECT * FROM employee_department;
+-------------+---------------+
| employee_id | department_id |
+-------------+---------------+
|           7 |             1 |
+-------------+---------------+
1 row in set (0.01 sec)

mysql> SELECT * FROM employee;
+-------------+---------+--------+------------+------------+---------+
| employee_id | name    | gender | start_date | phone      | address |
+-------------+---------+--------+------------+------------+---------+
|           7 | Terissa | F      | 2022-09-11 | 9876543210 | IXJ     |
+-------------+---------+--------+------------+------------+---------+
1 row in set (0.00 sec)

mysql> SELECT * FROM DEPARTMENT;
+---------------+-----------+
| department_id | name      |
+---------------+-----------+
|             1 | Marketing |
+---------------+-----------+
1 row in set (0.00 sec)

mysql> SHOW tables;
+---------------------------+
| Tables_in_payroll_service |
+---------------------------+
| department                |
| employee                  |
| employee_department       |
| employee_payroll          |
| payroll                   |
+---------------------------+
5 rows in set (0.01 sec)


mysql> tee /Users/bhuvannanda0011/Documents/MYSQL/SQL_DB_sec1.sql
mysql> SELECT * FROM employee_department;
+-------------+---------------+
| employee_id | department_id |
+-------------+---------------+
|           7 |             1 |
+-------------+---------------+
1 row in set (0.00 sec)



mysql> SELECT * FROM employee;
+-------------+---------+--------+------------+------------+---------+
| employee_id | name    | gender | start_date | phone      | address |
+-------------+---------+--------+------------+------------+---------+
|           7 | Terissa | F      | 2022-09-11 | 9876543210 | IXJ     |
+-------------+---------+--------+------------+------------+---------+
1 row in set (0.00 sec)

mysql> SELECT * FROM employee_payroll;
+----+-------------+--------+-------------+------------+----------------+--------------+------------+----------+------------+------------+-----------+--------+
| id | name        | gender | salary      | start_date | employee_phone | address      | department | BasicPay | Deductions | TaxablePay | IncomeTax | NetPay |
+----+-------------+--------+-------------+------------+----------------+--------------+------------+----------+------------+------------+-----------+--------+
|  1 | Bhuvan      | M      | 10000000.00 | 2025-05-11 | NULL           | Not Provided |            |     NULL |       NULL |       NULL |      NULL |   NULL |
|  2 | Ayush Nagar | NULL   |  1000000.00 | 2025-05-12 | NULL           | Not Provided |            |     NULL |       NULL |       NULL |      NULL |   NULL |
|  3 | Ayush Nanda | M      |  2000000.00 | 2025-05-13 | NULL           | Not Provided |            |     NULL |       NULL |       NULL |      NULL |   NULL |
|  4 | Abhi        | F      |  1800000.00 | 2025-05-11 | NULL           | Not Provided |            |     NULL |       NULL |       NULL |      NULL |   NULL |
|  5 | Aniket      | M      |   120000.00 | 2022-01-11 | NULL           | Not Provided |            |     NULL |       NULL |       NULL |      NULL |   NULL |
|  6 | Terissa     | M      |   100000.00 | 2022-02-18 | NULL           | Not Provided | Sales      |     NULL |       NULL |       NULL |      NULL |   NULL |
|  7 | Terissa     | F      |   200000.00 | 2022-09-11 | NULL           | Not Provided | Marketing  |     NULL |       NULL |       NULL |      NULL |   NULL |
+----+-------------+--------+-------------+------------+----------------+--------------+------------+----------+------------+------------+-----------+--------+
7 rows in set (0.01 sec)

mysql> SELECT * FROM department WHERE name = 'Marketing';
+---------------+-----------+
| department_id | name      |
+---------------+-----------+
|             1 | Marketing |
+---------------+-----------+
1 row in set (0.01 sec)

mysql> INSERT INTO payroll (employee_id, basic_pay, deductions, taxable_pay, income_tax, net_pay)
    -> VALUES (7, 180000.00, 11000.00, 55000.00, 10000.00, 28000.00);
Query OK, 1 row affected (0.02 sec)

mysql> SELECT * FROM payroll;
+------------+-------------+-----------+------------+-------------+------------+----------+
| payroll_id | employee_id | basic_pay | deductions | taxable_pay | income_tax | net_pay  |
+------------+-------------+-----------+------------+-------------+------------+----------+
|          1 |           7 | 180000.00 |   11000.00 |    55000.00 |   10000.00 | 28000.00 |
+------------+-------------+-----------+------------+-------------+------------+----------+
1 row in set (0.00 sec)

mysql> SELECT 
    -> e.employee_id,
    -> e.name,
    -> e.gender,
    -> e.start_date,
    -> e.phone,
    -> e.address,
    -> d.name AS department,
    -> p.basic_pay,
    -> p.deductions,
    -> p.taxable_pay,
    -> p.income_tax,
    -> p.net_pay FROM employee e
    -> LEFT JOIN employee_department ed ON e.employee_id = ed.employee_id
    -> LEFT JOIN department d ON ed.department_id = d.department_id
    -> LEFT JOIN payroll p ON e.employee_id = p.employee_id;
+-------------+---------+--------+------------+------------+---------+------------+-----------+------------+-------------+------------+----------+
| employee_id | name    | gender | start_date | phone      | address | department | basic_pay | deductions | taxable_pay | income_tax | net_pay  |
+-------------+---------+--------+------------+------------+---------+------------+-----------+------------+-------------+------------+----------+
|           7 | Terissa | F      | 2022-09-11 | 9876543210 | IXJ     | Marketing  | 180000.00 |   11000.00 |    55000.00 |   10000.00 | 28000.00 |
+-------------+---------+--------+------------+------------+---------+------------+-----------+------------+-------------+------------+----------+
1 row in set (0.01 sec)

mysql> SELECT 
    -> e.employee_id,
    -> e.name,
    -> d.name AS department
    -> FROM employee e 
    -> JOIN employee_department ed ON e.employee_id = ed.employee_id
    -> JOIN department d ON ed.department_id = d.department_id
    -> WHERE e.name = 'Terissa';
+-------------+---------+------------+
| employee_id | name    | department |
+-------------+---------+------------+
|           7 | Terissa | Marketing  |
+-------------+---------+------------+
1 row in set (0.00 sec)

mysql> exit
