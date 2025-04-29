mysql> CREATE DATABASE address_book_service;
Query OK, 1 row affected (0.05 sec)

mysql> USE address_book_service;
Database changed
mysql> CREATE TABLE address_book (first_name VARCHAR(20), last_name VARCHAR(20), address VARCHAR(20), city VARCHAR(20), zip INT(6), phone INT(10), email VARCHAR(50) PRIMARY KEY);
Query OK, 0 rows affected, 2 warnings (0.02 sec)

mysql> ALTER TABLE address_book ADD COLUMN state VARCHAR(10);
Query OK, 0 rows affected (0.02 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> ALTER TABLE address_book MODIFY COLUMN phone VARCHAR(10);
Query OK, 0 rows affected (0.02 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> INSERT INTO address_book VALUES('John', 'Smith', '123 Maple Street', 'New York', 10001, '5551234567', 'john.smith@email.com', 'NY');
Query OK, 1 row affected (0.00 sec)

mysql> SELECT * FROM address_book;
+------------+-----------+------------------+----------+-------+------------+----------------------+-------+
| first_name | last_name | address          | city     | zip   | phone      | email                | state |
+------------+-----------+------------------+----------+-------+------------+----------------------+-------+
| John       | Smith     | 123 Maple Street | New York | 10001 | 5551234567 | john.smith@email.com | NY    |
+------------+-----------+------------------+----------+-------+------------+----------------------+-------+
1 row in set (0.01 sec)


mysql> INSERT INTO address_book VALUES('Jane', 'Doe', '456 Maple Street', 'LA', 18002, '5559877654', 'jane.doe@email.com', 'CA');
Query OK, 1 row affected (0.02 sec)

mysql> SELECT * FROM address_book;
+------------+-----------+------------------+----------+-------+------------+----------------------+-------+
| first_name | last_name | address          | city     | zip   | phone      | email                | state |
+------------+-----------+------------------+----------+-------+------------+----------------------+-------+
| Jane       | Doe       | 456 Maple Street | LA       | 18002 | 5559877654 | jane.doe@email.com   | CA    |
| John       | Smith     | 123 Maple Street | New York | 10001 | 5551234567 | john.smith@email.com | NY    |
+------------+-----------+------------------+----------+-------+------------+----------------------+-------+
2 rows in set (0.01 sec)

mysql> INSERT INTO address_book(first_name, last_name, address, city, state, zip, phone, email) VALUES('Robert','Brown','789 Oak Drive','Chicago','IL',60601,'5554567890','robert.brown@email.com');
Query OK, 1 row affected (0.01 sec)

mysql> INSERT INTO address_book(first_name, last_name, address, city, state, zip, phone, email) VALUES('Emily','Davis','321 Pine Road','Houston','TX',77001,'5556541234','emily.davis@email.com');
Query OK, 1 row affected (0.00 sec)

mysql> SELECT * from address_book;
+------------+-----------+------------------+----------+-------+------------+------------------------+-------+
| first_name | last_name | address          | city     | zip   | phone      | email                  | state |
+------------+-----------+------------------+----------+-------+------------+------------------------+-------+
| Emily      | Davis     | 321 Pine Road    | Houston  | 77001 | 5556541234 | emily.davis@email.com  | TX    |
| Jane       | Doe       | 456 Maple Street | LA       | 18002 | 5559877654 | jane.doe@email.com     | CA    |
| John       | Smith     | 123 Maple Street | New York | 10001 | 5551234567 | john.smith@email.com   | NY    |
| Robert     | Brown     | 789 Oak Drive    | Chicago  | 60601 | 5554567890 | robert.brown@email.com | IL    |
+------------+-----------+------------------+----------+-------+------------+------------------------+-------+
4 rows in set (0.01 sec)

mysql> UPDATE address_book SET city='Miami', state='FL' WHERE first_name='Emily';
Query OK, 1 row affected (0.01 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> SELECT * from address_book;
+------------+-----------+------------------+----------+-------+------------+------------------------+-------+
| first_name | last_name | address          | city     | zip   | phone      | email                  | state |
+------------+-----------+------------------+----------+-------+------------+------------------------+-------+
| Emily      | Davis     | 321 Pine Road    | Miami    | 77001 | 5556541234 | emily.davis@email.com  | FL    |
| Jane       | Doe       | 456 Maple Street | LA       | 18002 | 5559877654 | jane.doe@email.com     | CA    |
| John       | Smith     | 123 Maple Street | New York | 10001 | 5551234567 | john.smith@email.com   | NY    |
| Robert     | Brown     | 789 Oak Drive    | Chicago  | 60601 | 5554567890 | robert.brown@email.com | IL    |
+------------+-----------+------------------+----------+-------+------------+------------------------+-------+
4 rows in set (0.00 sec)

mysql> DELETE FROM address_book WHERE first_name='Emily';
Query OK, 1 row affected (0.00 sec)

mysql> SELECT * from address_book;
+------------+-----------+------------------+----------+-------+------------+------------------------+-------+
| first_name | last_name | address          | city     | zip   | phone      | email                  | state |
+------------+-----------+------------------+----------+-------+------------+------------------------+-------+
| Jane       | Doe       | 456 Maple Street | LA       | 18002 | 5559877654 | jane.doe@email.com     | CA    |
| John       | Smith     | 123 Maple Street | New York | 10001 | 5551234567 | john.smith@email.com   | NY    |
| Robert     | Brown     | 789 Oak Drive    | Chicago  | 60601 | 5554567890 | robert.brown@email.com | IL    |
+------------+-----------+------------------+----------+-------+------------+------------------------+-------+
3 rows in set (0.00 sec)

mysql> SELECT * from address_book WHERE city='Chicago' OR state='CA';
+------------+-----------+------------------+---------+-------+------------+------------------------+-------+
| first_name | last_name | address          | city    | zip   | phone      | email                  | state |
+------------+-----------+------------------+---------+-------+------------+------------------------+-------+
| Jane       | Doe       | 456 Maple Street | LA      | 18002 | 5559877654 | jane.doe@email.com     | CA    |
| Robert     | Brown     | 789 Oak Drive    | Chicago | 60601 | 5554567890 | robert.brown@email.com | IL    |
+------------+-----------+------------------+---------+-------+------------+------------------------+-------+
2 rows in set (0.00 sec)

mysql> SELECT COUNT(city) from address_book;
+-------------+
| COUNT(city) |
+-------------+
|           3 |
+-------------+
1 row in set (0.01 sec)

mysql> INSERT INTO address_book(first_name, last_name, address, city, state, zip, phone, email) VALUES('Emily','Brown','789 Oak Drive','Chicago','IL',60601,'5554567890','emily.brown@email.com');
Query OK, 1 row affected (0.01 sec)

mysql> SELECT * FROM address_book WHERE city='Chicago' ORDER BY first_name ASC;
+------------+-----------+---------------+---------+-------+------------+------------------------+-------+
| first_name | last_name | address       | city    | zip   | phone      | email                  | state |
+------------+-----------+---------------+---------+-------+------------+------------------------+-------+
| Emily      | Brown     | 789 Oak Drive | Chicago | 60601 | 5554567890 | emily.brown@email.com  | IL    |
| Robert     | Brown     | 789 Oak Drive | Chicago | 60601 | 5554567890 | robert.brown@email.com | IL    |
+------------+-----------+---------------+---------+-------+------------+------------------------+-------+
2 rows in set (0.00 sec)

mysql> ALTER TABLE address_book ADD COLUMN type VARCHAR(10);
Query OK, 0 rows affected (0.03 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> SELECT * FROM address_book;
+------------+-----------+------------------+----------+-------+------------+------------------------+-------+------+
| first_name | last_name | address          | city     | zip   | phone      | email                  | state | type |
+------------+-----------+------------------+----------+-------+------------+------------------------+-------+------+
| Emily      | Brown     | 789 Oak Drive    | Chicago  | 60601 | 5554567890 | emily.brown@email.com  | IL    | NULL |
| Jane       | Doe       | 456 Maple Street | LA       | 18002 | 5559877654 | jane.doe@email.com     | CA    | NULL |
| John       | Smith     | 123 Maple Street | New York | 10001 | 5551234567 | john.smith@email.com   | NY    | NULL |
| Robert     | Brown     | 789 Oak Drive    | Chicago  | 60601 | 5554567890 | robert.brown@email.com | IL    | NULL |
+------------+-----------+------------------+----------+-------+------------+------------------------+-------+------+
4 rows in set (0.00 sec)

mysql> UPDATE address_book SET type='friends' WHERE first_name='Emily';
Query OK, 1 row affected (0.00 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> UPDATE address_book SET type='family' WHERE first_name='Jane' OR first_name='John';
Query OK, 2 rows affected (0.00 sec)
Rows matched: 2  Changed: 2  Warnings: 0

mysql> UPDATE address_book SET type='profession' WHERE first_name='Robert';
Query OK, 1 row affected (0.00 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> SELECT COUNT(first_name) from address_book WHERE type='family';
+-------------------+
| COUNT(first_name) |
+-------------------+
|                 2 |
+-------------------+
1 row in set (0.00 sec)

mysql> INSERT INTO address_book(first_name, last_name, address, city, state, zip, phone, email, type) VALUES('Michael','Brown','789 Oak Drive','Chicago','IL',60601,'5554567890','michael.brown@email.com', 'fmly+frnd');
Query OK, 1 row affected (0.01 sec)

mysql> SELECT * FROM address_book;
+------------+-----------+------------------+----------+-------+------------+-------------------------+-------+------------+
| first_name | last_name | address          | city     | zip   | phone      | email                   | state | type       |
+------------+-----------+------------------+----------+-------+------------+-------------------------+-------+------------+
| Emily      | Brown     | 789 Oak Drive    | Chicago  | 60601 | 5554567890 | emily.brown@email.com   | IL    | friends    |
| Jane       | Doe       | 456 Maple Street | LA       | 18002 | 5559877654 | jane.doe@email.com      | CA    | family     |
| John       | Smith     | 123 Maple Street | New York | 10001 | 5551234567 | john.smith@email.com    | NY    | family     |
| Michael    | Brown     | 789 Oak Drive    | Chicago  | 60601 | 5554567890 | michael.brown@email.com | IL    | fmly+frnd  |
| Robert     | Brown     | 789 Oak Drive    | Chicago  | 60601 | 5554567890 | robert.brown@email.com  | IL    | profession |
+------------+-----------+------------------+----------+-------+------------+-------------------------+-------+------------+
5 rows in set (0.00 sec)

