create or replace function add_car(_car_serial INTEGER, _make VARCHAR, _model VARCHAR, _car_year INTEGER, _MSRP DECIMAL)
returns void
as $MAIN$
begin 
	insert into car(car_serial,make,model,car_year,msrp)
	values(car_serial,make,model,_car_year,_MSRP);
end;
$MAIN$
language plpgsql;

select add_car(1,'Honda','Firestorm',2024,43459.90);