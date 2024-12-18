
CREATE DATABASE IF NOT EXISTS Optics;
USE Optics;


CREATE TABLE IF NOT EXISTS Suppliers (
    suppliers_ID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(45) NOT NULL,
    address VARCHAR(100) NULL,
    phone VARCHAR(15) NULL,
    Fax VARCHAR(45) NULL,
    NIF VARCHAR(45) NOT NULL
);


CREATE TABLE IF NOT EXISTS Brand (
    brand_ID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(45) NOT NULL,
    suppliers_ID INT,
    FOREIGN KEY (suppliers_ID) REFERENCES Suppliers(suppliers_ID)
);


CREATE TABLE IF NOT EXISTS Glasses (
    glasses_ID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    graduationLeftEye DOUBLE NULL,
    graduationRightEye DOUBLE NULL,
    mountTipe ENUM('floating', 'paste', 'metallic') NULL,
    mountColor VARCHAR(45) NULL,
    lensColor VARCHAR(45) NULL,
    price DOUBLE NULL,
    brand_ID INT,
    FOREIGN KEY (brand_ID) REFERENCES Brand(brand_ID)
);


CREATE TABLE IF NOT EXISTS Customer (
    customer_ID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(45) NULL,
    postalAddress VARCHAR(45) NULL,
    phone VARCHAR(15) NULL,
    email VARCHAR(45) NULL,
    registrationDate DATE NULL,
    recommended_by INT NULL,
    FOREIGN KEY (recommended_by) REFERENCES Customer(customer_ID)
);


CREATE TABLE IF NOT EXISTS Employee (
    employee_ID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(45) NULL
);


CREATE TABLE IF NOT EXISTS Sale (
    sale_ID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    customer_ID INT NULL,
    employee_ID INT NULL,
    dateSale DATE NULL,
    invoice INT NULL,
    FOREIGN KEY (customer_ID) REFERENCES Customer(customer_ID),
    FOREIGN KEY (employee_ID) REFERENCES Employee(employee_ID)
);


CREATE TABLE IF NOT EXISTS Sale_has_Glasses (
    sale_sale_ID INT NOT NULL,
    glasses_glasses_ID INT NOT NULL,
    PRIMARY KEY (sale_sale_ID, glasses_glasses_ID),
    FOREIGN KEY (sale_sale_ID) REFERENCES Sale(sale_ID),
    FOREIGN KEY (glasses_glasses_ID) REFERENCES Glasses(glasses_ID)
);