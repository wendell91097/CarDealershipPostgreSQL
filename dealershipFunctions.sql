create or replace function add_car(_car_serial INTEGER, _make VARCHAR, _model VARCHAR, _car_year INTEGER, _MSRP DECIMAL)
returns void
as $MAIN$
begin 
	insert into car(car_serial,make,model,car_year,msrp)
	values(_car_serial,_make,_model,_car_year,_MSRP);
end;
$MAIN$
language plpgsql;

select add_car(1,'Honda','Firestorm',2024,43459.90);
select add_car(3760,'Tesla','Basically a Plane',2028,257899.90);


select * from car

create or replace function add_sales_rep(_staff_id INTEGER, _first_name VARCHAR, _last_name VARCHAR, _phone_number VARCHAR, _address VARCHAR)
returns void
as $MAIN$
begin 
	insert into salesperson(staff_id, first_name, last_name, phone_number, address)
	values(_staff_id, _first_name, _last_name, _phone_number, _address);
end;
$MAIN$
language plpgsql;

select add_sales_rep(1, 'Miles', 'Wheeler', '679 645-4567', '634 Petal Burg Grove, MA 90210')
select add_sales_rep(85, 'Strong', 'Hire', '679 645-4567', '61 Real St. Placeville, GI 78910')

select * from customer

create or replace function add_customer(a INTEGER, b VARCHAR, c VARCHAR, d VARCHAR, e VARCHAR)
returns void
as $MAIN$
begin 
	insert into customer(customer_id, first_name, last_name, phone_number, address)
	values(a,b,c,d,e);
end;
$MAIN$
language plpgsql;

select add_customer(1,'Biggy','Buyere','(870) 563-5444', '23 Crosswinds Rd Louistown, RI 03431')
select add_customer(6921,'Ron','Swanson','[REDACTED]', '[REDACTED]')
select add_customer(55,'Eager','Beaver','(870) 510-1223', 'Parkway Ct Louistown, RI 03531')

create or replace function add_invoice(a INTEGER, b DECIMAL, c INTEGER, d INTEGER, e INTEGER)
returns void
as $MAIN$
begin
	insert into invoice(invoice_id, amount, customer_id, staff_id, car_serial)
	values(a,b,c,d,e);
end;
$MAIN$
language plpgsql;

select add_invoice(1, 237899.0, 6921, 85, 3760)
select add_invoice(2, 40999.0, 55, 85, 1)

select * from service

create or replace function add_service(a INTEGER, b DECIMAL, c TIMESTAMP, d INTEGER, e INTEGER)
returns void
as $MAIN$
begin
	insert into service(ticket_id, amount, service_time, car_serial, customer_id)
	values(a,b,c,d,e);
end;
$MAIN$
language plpgsql;

select add_service(230, 0.0, NOW()::TIMESTAMP, 3760, 6921)
select add_service(231, 0.0, NOW()::TIMESTAMP, 1, 55)

create or replace procedure service_charge(a INTEGER, b DECIMAL)
language plpgsql
as $$
begin 
	update service
	set amount = amount + b
	where ticket_id = a;
	commit;
end;
$$

call service_charge(230, -30.99)

select * from mechanic

create or replace function add_mechanic(a INTEGER, b VARCHAR, c VARCHAR, d INTEGER)
returns void
as $MAIN$
begin 
	insert into mechanic(mechanic_id, first_name, last_name, ticket_id)
	values(a,b,c,d);
end;
$MAIN$
language plpgsql;

select add_mechanic(53, 'Felix','Recker',230)
select add_mechanic(54, 'Joe','Wrench',231)

select * from service_part 

create or replace function add_service_part(a INTEGER, b VARCHAR, c DECIMAL, d INTEGER, e INTEGER, f INTEGER)
returns void
as $MAIN$
begin 
	insert into service_part(part_id, part_name, amount, ticket_id, mechanic_id, car_serial)
	values(a,b,c,d,e,f);
end;
$MAIN$
language plpgsql;

select add_service_part(31, 'Thruster Oil 3L', 30.99, 230, 53, 3760)
select add_service_part(102, 'Tire Cleaning', 0.0, 231, 54, 1)

select * from service 












