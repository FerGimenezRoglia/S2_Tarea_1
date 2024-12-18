CREATE DATABASE IF NOT EXISTS Pizzeria;
USE Pizzeria;

CREATE TABLE IF NOT EXISTS Province (
    province_ID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(45) NOT NULL
);

CREATE TABLE IF NOT EXISTS Locality (
    locality_ID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(45) NOT NULL,
    province_ID INT NOT NULL,
    FOREIGN KEY (province_ID) REFERENCES Province(province_ID)
);

CREATE TABLE IF NOT EXISTS Customer (
    customer_ID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(45) NOT NULL,
    last_name VARCHAR(45) NOT NULL,
    address VARCHAR(100) NOT NULL,
    postal_code VARCHAR(10) NOT NULL,
    phone_number VARCHAR(15) NOT NULL,
    locality_ID INT NOT NULL,
    FOREIGN KEY (locality_ID) REFERENCES Locality(locality_ID)
);

CREATE TABLE IF NOT EXISTS Pizza_Branch (
    pizza_branch_ID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    address VARCHAR(45) NOT NULL,
    postal_code VARCHAR(10) NOT NULL,
    locality_ID INT NOT NULL,
    FOREIGN KEY (locality_ID) REFERENCES Locality(locality_ID)
);

CREATE TABLE IF NOT EXISTS Employees (
    employee_ID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(45) NOT NULL,
    last_name VARCHAR(45) NOT NULL,
    NIF VARCHAR(20) NOT NULL,
    phone_number VARCHAR(15) NOT NULL, 
    role ENUM('cook', 'delivery') NOT NULL,
    pizza_branch_ID INT NOT NULL,
    FOREIGN KEY (pizza_branch_ID) REFERENCES Pizza_Branch(pizza_branch_ID)
);

CREATE TABLE IF NOT EXISTS Categories (
    category_ID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(45) NOT NULL
);

CREATE TABLE IF NOT EXISTS Products (
    products_ID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(45) NOT NULL,
    description VARCHAR(255) NOT NULL,
    image VARCHAR(255) NULL,
    price DOUBLE(10,2) NOT NULL,
    product_type ENUM('pizza', 'burger', 'drink') NOT NULL,
    category_ID INT NULL,
    FOREIGN KEY (category_ID) REFERENCES Categories(category_ID)
);

CREATE TABLE IF NOT EXISTS Orders (
    order_ID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    date_time DATETIME NOT NULL,
    delivery_type ENUM('home_delivery', 'pickup') NOT NULL,
    total_price DOUBLE(10,2) NOT NULL,
    customer_ID INT NOT NULL,
    employee_ID INT NOT NULL,
    pizza_branch_ID INT NOT NULL,
    FOREIGN KEY (customer_ID) REFERENCES Customer(customer_ID),
    FOREIGN KEY (employee_ID) REFERENCES Employees(employee_ID),
    FOREIGN KEY (pizza_branch_ID) REFERENCES Pizza_Branch(pizza_branch_ID)
);

CREATE TABLE IF NOT EXISTS Order_Details (
    order_ID INT NOT NULL,
    products_ID INT NOT NULL,
    quantity INT NOT NULL,
    delivery_date DATETIME NULL,
    PRIMARY KEY (order_ID, products_ID),
    FOREIGN KEY (order_ID) REFERENCES Orders(order_ID),
    FOREIGN KEY (products_ID) REFERENCES Products(products_ID)
);