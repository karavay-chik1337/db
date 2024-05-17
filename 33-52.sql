--35
-- select mark.mark_name, model.model_name
-- from mark, model
-- where model.model_id =
-- (select model_id
-- from car
-- where car_yearofproduction = (select car_yearofproduction
-- from car
-- group by car_yearofproduction
-- order by 1 desc
-- limit 1)) and model.mark_id = mark.mark_id;

--37
-- select count(*)
-- from trip
-- where trip_price = (select min(trip_price) from trip);

--38
-- select year
-- from car, (select count(*) as countCar, extract(year from car_yearofproduction) as year
--            from car
--            group by extract(year from car_yearofproduction)
--            order by 1 desc ) countCar
-- limit 1

--39
select car.*, drivers.*
from car left join "car-drivers" on car.car_id = "car-drivers".car_id
left join (select car.car_id as id, "car-drivers".drivers_id as idd
           from "car-drivers", car where car.car_id = "car-drivers".car_id)
    t on t.id = car.car_id left join drivers on drivers.drivers_id = t.idd
order by car.car_yearofproduction
limit 3;

--40
-- select mark.mark_name, model.model_name
-- from mark,
--      model
-- where model.model_id = (select model_id
--                         from car
--                         group by model_id)
--   and model.mark_id = mark.mark_id;

--41
select client.client_name, client.client_patronymic, t.countCar
from client left join (
    select trip.client_id as clientId, count(distinct trip.car_id) as countCar
    from trip left join car on trip.car_id = car.car_id
    group by trip.client_id
    order by 1
) t on client.client_id = t.clientId
where countCar = (select count(*) from car);

--42
select *
from taxi_company
where taxi_company_id NOT IN (select distinct car.taxi_company_id as id from car)

--43
