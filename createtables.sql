CREATE TABLE cities(
    id INTEGER PRIMARY KEY,
    city VARCHAR(60) NOT NULL UNIQUE
);

CREATE TABLE postalcodes(
    id INTEGER PRIMARY KEY,
    postalcode VARCHAR(10) NOT NULL UNIQUE,
    city_id INTEGER NOT NULL,
    CONSTRAINT fk_city FOREIGN KEY(city_id) REFERENCES cities(id)
);

CREATE TABLE addresses(
    id INTEGER PRIMARY KEY,
    addressline VARCHAR(60) NOT NULL,
    postalcode_id INTEGER NOT NULL,
    CONSTRAINT fk_postalcode FOREIGN KEY(postalcode_id) REFERENCES postalcodes(id)
);

CREATE TABLE suppliers(
    id INTEGER PRIMARY KEY,
    suppliername VARCHAR(80) NOT NULL UNIQUE,
    contactperson VARCHAR(60) NOT NULL,
    phone VARCHAR(15) NOT NULL,
    email VARCHAR(128) NOT NULL,
    address_id INTEGER NOT NULL,
    CONSTRAINT fk_address FOREIGN KEY(address_id) REFERENCES addresses(id)
);

CREATE TABLE ingredients(
    id INTEGER PRIMARY KEY,
    ingredientname VARCHAR(80) NOT NULL UNIQUE,
    stockkg FLOAT NOT NULL DEFAULT 0
);

CREATE TABLE supplieringredients(
    supplier_id INTEGER NOT NULL,
    ingredient_id INTEGER NOT NULL,
    itemnumber VARCHAR(15) NOT NULL,
    priceperkg FLOAT NOT NULL,
    CONSTRAINT pk_supplieringredients PRIMARY KEY(supplier_id,ingredient_id),
    CONSTRAINT fk_supplier FOREIGN KEY(supplier_id) REFERENCES suppliers(id),
    CONSTRAINT fk_ingredient FOREIGN KEY(ingredient_id) REFERENCES ingredients(id)
);

CREATE TABLE products(
    id INTEGER PRIMARY KEY,
    productname VARCHAR(80) NOT NULL UNIQUE
);

CREATE TABLE recipes(
    product_id INTEGER NOT NULL,
    ingredient_id INTEGER NOT NULL,
    quantitykg FLOAT NOT NULL,
    CONSTRAINT pk_recipes PRIMARY KEY(product_id,ingredient_id),
    CONSTRAINT fk_product FOREIGN KEY(product_id) REFERENCES products(id),
    CONSTRAINT fk_ingredient FOREIGN KEY(ingredient_id) REFERENCES ingredients(id)
);

CREATE TABLE purchases(
    id INTEGER PRIMARY KEY,
    purchasedate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    supplier_id INTEGER NOT NULL,
    ingredient_id INTEGER NOT NULL,
    quantitykg FLOAT NOT NULL,
    CONSTRAINT fk_supplieringredient FOREIGN KEY(supplier_id,ingredient_id) REFERENCES supplieringredients(supplier_id,ingredient_id)
);
