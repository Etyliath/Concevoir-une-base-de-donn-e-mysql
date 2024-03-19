CREATE DATABASE tifosi;
CREATE USER 'tifosi'@'localhost' IDENTIFIED BY 'tifosi-admin-2024$';
GRANT ALL PRIVILEGES ON tifosi.* TO 'tifosi'@'localhost';
FLUSH PRIVILEGES;
USE tifosi;
CREATE TABLE customers (
    id_customer INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    name_customer VARCHAR(45) NOT NULL,
    age INT,
    cp_customer INT
);

CREATE TABLE focaccia (
    id_focaccia INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    name_focaccia VARCHAR(45) NOT NULL,
    price_focaccia INT NOT NULL
);

CREATE TABLE customers_focaccia (
    customer_id INT NOT NULL,
    focaccia_id INT NOT NULL,
    day DATE NOT NULL,
    PRIMARY KEY (customer_id,focaccia_id),
    UNIQUE (customer_id,focaccia_id),
    CONSTRAINT fk_customers_focaccia_1
        FOREIGN KEY (customer_id) REFERENCES customers (id_customer)
        ON DELETE CASCADE,
    CONSTRAINT fk_customers_focaccia_2
        FOREIGN KEY (focaccia_id) REFERENCES focaccia (id_focaccia)
        ON DELETE CASCADE
);

CREATE TABLE ingredients (
    id_ingredient INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    name_ingredient VARCHAR(45) NOT NULL
);

CREATE TABLE focaccia_ingredients (
    focaccia_id INT NOT NULL,
    ingredient_id INT NOT NULL,
    CONSTRAINT fk_focaccia_ingredients_1
        FOREIGN KEY (focaccia_id) REFERENCES focaccia (id_focaccia) ON DELETE CASCADE,
    CONSTRAINT fk_focaccia_ingredients_2
        FOREIGN KEY (ingredient_id) REFERENCES ingredients (id_ingredient) ON DELETE CASCADE,
    PRIMARY KEY (focaccia_id,ingredient_id),
    UNIQUE (focaccia_id,ingredient_id)
);

CREATE TABLE menus (
    id_menu INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    name_menu VARCHAR(45) NOT NULL,
    price_menu FLOAT NOT NULL,
    focaccia_id INT NOT NULL,
    CONSTRAINT fk_focaccia_menu
        FOREIGN KEY (focaccia_id) REFERENCES focaccia (id_focaccia) ON DELETE CASCADE
);

CREATE TABLE customers_menus (
    customer_id INT NOT NULL,
    menu_id INT NOT NULL,
    day DATE NOT NULL,
    PRIMARY KEY (customer_id,menu_id),
    UNIQUE (customer_id,menu_id),
    CONSTRAINT fk_customers_menus_1
        FOREIGN KEY (customer_id) REFERENCES customers (id_customer) ON DELETE CASCADE,
    CONSTRAINT fk_customers_menus_2
        FOREIGN KEY (menu_id) REFERENCES menus (id_menu) ON DELETE CASCADE
);

CREATE TABLE brands (
    id_brand INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    name_brand VARCHAR(45)
);

CREATE TABLE drinks (
    id_drink INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    name_drink VARCHAR(45),
    brand_id INT NOT NULL,
    CONSTRAINT fk_drinks_brands
        FOREIGN KEY (brand_id) REFERENCES brands (id_brand) ON DELETE CASCADE
);

CREATE TABLE drinks_menus (
    drink_id INT NOT NULL,
    menu_id INT NOT NULL,
    PRIMARY KEY (drink_id,menu_id),
    UNIQUE (drink_id,menu_id),
    CONSTRAINT fk_drinks_menus_1
        FOREIGN KEY (drink_id) REFERENCES drinks(id_drink) ON DELETE CASCADE,
    CONSTRAINT fk_drinks_menus_2
        FOREIGN KEY (menu_id) REFERENCES menus (id_menu) ON DELETE CASCADE
);