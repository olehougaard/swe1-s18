CREATE TABLE Item (
	item_number SERIAL PRIMARY KEY,
	name VARCHAR(50) NOT NULL,
	price_amount DECIMAL(10, 2) NOT NULL,
	price_currency CHAR(3) NOT NULL
);

CREATE TABLE Customer (
	email VARCHAR(50) PRIMARY KEY,
	name VARCHAR(80) NOT NULL
);

CREATE TABLE Orders (
	order_number SERIAL PRIMARY KEY,
	currency CHAR(3) NOT NULL,
	customer VARCHAR(50) REFERENCES Customer(email)
);

CREATE TABLE Order_Line (
	order_number INTEGER REFERENCES Orders(order_number) ON DELETE CASCADE,
	item_number INTEGER REFERENCES Item(item_number),
	amount INTEGER NOT NULL,
	PRIMARY KEY (order_number, item_number)
);