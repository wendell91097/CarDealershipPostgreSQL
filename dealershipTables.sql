create table customer(
	customer_id SERIAL primary key,
	first_name VARCHAR(150),
	last_name VARCHAR(150),
	phone_number VARCHAR(15),
	address VARCHAR(150)
);

create table salesperson(
	staff_id SERIAL primary key,
	first_name VARCHAR(150),
	last_name VARCHAR(150),
	phone_number VARCHAR(15),
	address VARCHAR(150)
);

create table car(
	car_serial SERIAL primary key,
	make VARCHAR(150),
	model VARCHAR(150),
	car_year NUMERIC(4),
	MSRP NUMERIC(8,2)
);

create table invoice(
	invoice_id SERIAL primary key,
	amount numeric(8,2),
	customer_id INTEGER not null,
	staff_id INTEGER not null,
	car_serial INTEGER not null,
	foreign key(customer_id) references customer(customer_id),
	foreign key(staff_id) references salesperson(staff_id),
	foreign key(car_serial) references car(car_serial)
);

create table service(
	ticket_id SERIAL primary key,
	amount NUMERIC(7,2),
	service_time DATE default CURRENT_DATE,
	car_serial INTEGER not null,
	customer_id INTEGER not null,
	foreign key(car_serial) references car(car_serial),
	foreign key(customer_id) references customer(customer_id)
);

create table mechanic(
	mechanic_id SERIAL primary key,
	first_name VARCHAR(150),
	last_name VARCHAR(150),
	ticket_id INTEGER not null,
	foreign key(ticket_id) references service(ticket_id)
);

create table service_part(
	part_id SERIAL primary key,
	part_name VARCHAR(150),
	amount NUMERIC(8,2),
	ticket_id INTEGER not null,
	mechanic_id INTEGER not null,
	car_serial INTEGER not null,
	foreign key(ticket_id) references service(ticket_id),
	foreign key(mechanic_id) references mechanic(mechanic_id),
	foreign key(car_serial) references car(car_serial)
);