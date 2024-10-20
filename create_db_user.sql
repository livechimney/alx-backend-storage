-- Creates a database and a user
CREATE DATABASE IF NOT EXISTS holberton;
CREATE USER IF NOT EXISTS 'root'@'localhost' IDENTIFIED BY 'root';
GRANT ALL PRIVILEGES ON `holberton`.* TO 'root'@'localhost';
GRANT SELECT ON `performance_schema`.* TO 'root'@'localhost';
FLUSH PRIVILEGES;
