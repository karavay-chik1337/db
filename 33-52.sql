--32
select sum(cnt)
from (   select count(drivers_surname) as cnt
         from drivers
         group by drivers_surname
         having count(drivers_surname) > 1) с;

--33
select drivers.drivers_surname, drivers.drivers_name, drivers.drivers_patronymic
from drivers
where drivers_id not in (
    select drivers_id
    from trip
    group by drivers_id, car_id
    having count(*) > 1);

--35//сделать джоинами
select m.mark_name, mo.model_name
from car c
         join model mo on c.model_id = mo.model_id
         join mark m on mo.mark_id = m.mark_id
where c.car_yearOfProduction = (
    select MAX(car_yearOfProduction)
    from car);

--36
select car_yearofproduction, m.mark_name, mo.model_name
from car c
         join model mo on c.model_id = mo.model_id
         join mark m on mo.mark_id = m.mark_id
where c.car_yearofproduction = (
    select max(car_yearofproduction)
    from car
)
   or c.car_yearofproduction = (
    select min(car_yearofproduction)
    from car
)
order by 1, 2, 3;

--40
select m.mark_name as brand,
       min(c.car_yearofproduction) as oldest_car_year,
       max(c.car_yearofproduction) as newest_car_year
from car c
         join model mo on c.model_id = mo.model_id
         join mark m on mo.mark_id = m.mark_id
group by m.mark_name
order by brand;

--43
SELECT t.taxi_company_name
FROM taxi_company t
         JOIN car c ON t.taxi_company_id = c.taxi_company_id
         JOIN model mo ON c.model_id = mo.model_id
         JOIN mark m ON mo.mark_id = m.mark_id
WHERE m.mark_name IN ('Mazda', 'Nissan', 'Toyota')
  AND t.taxi_company_name NOT IN (
    SELECT t2.taxi_company_name
    FROM taxi_company t2
             JOIN car c2 ON t2.taxi_company_id = c2.taxi_company_id
             JOIN model mo2 ON c2.model_id = mo2.model_id
             JOIN mark m2 ON mo2.mark_id = m2.mark_id
    WHERE m2.mark_name IN ('Kia', 'Renault')
)
GROUP BY t.taxi_company_name;

--45
select client.client_name, client.client_patronymic
from client
    join trip on trip.client_id = client.client_id
    join car on trip.car_id = car.car_id
where extract(year from car.car_yearofproduction) =(
      select extract(year from car_yearofproduction) as year
      from car
      group by year
      order by count(*)
      limit 1);

--46
SELECT d.drivers_id, m.mark_name
FROM drivers d
         CROSS JOIN mark m
WHERE NOT EXISTS (
    SELECT 1
    FROM "car-drivers" cd
             INNER JOIN car c ON cd.car_id = c.car_id
             INNER JOIN model mo ON c.model_id = mo.model_id
             INNER JOIN mark ma ON mo.mark_id = ma.mark_id
    WHERE cd.drivers_id = d.drivers_id AND ma.mark_id = m.mark_id
)
order by 1;
--переделать через джоины



--50


--51
рекурсия

--52
оконные









--37
-- select count(*)
-- from trip
-- where trip_price = (select min(trip_price) from trip);

--38
-- select year
-- from (select count(*) as countCar, extract(year from car_yearofproduction) as year
--            from car
--            group by extract(year from car_yearofproduction)
--            order by 1 desc ) countCar
-- limit 1;

--39
-- select car.*, drivers.*
-- from car left join "car-drivers" on car.car_id = "car-drivers".car_id
-- left join (select car.car_id as id, "car-drivers".drivers_id as idd
--            from "car-drivers", car where car.car_id = "car-drivers".car_id)
--     t on t.id = car.car_id left join drivers on drivers.drivers_id = t.idd
-- order by car.car_yearofproduction
-- limit 3;
--41
-- select client.client_name, client.client_patronymic, t.countCar
-- from client left join (
--     select trip.client_id as clientId, count(distinct trip.car_id) as countCar
--     from trip left join car on trip.car_id = car.car_id
--     group by trip.client_id
--     order by 1
-- ) t on client.client_id = t.clientId
-- where countCar = (select count(*) from car);

--42
-- select *
-- from taxi_company
-- where taxi_company_id NOT IN (select distinct car.taxi_company_id as id from car);
--44
-- select tc.taxi_company_name, sum(trip.trip_price::numeric)
-- from taxi_company as tc left join car on tc.taxi_company_id = car.taxi_company_id
--     left join trip on trip.car_id = car.car_id
-- group by tc.taxi_company_id
-- having sum(trip.trip_price::numeric) > 0
-- order by 2 desc limit 1;
--47


--48
-- SELECT
--     CASE
--         WHEN EXISTS (SELECT * FROM taxi_company WHERE taxi_company_id NOT IN
--             (SELECT DISTINCT taxi_company_id FROM dispatcher)) THEN 'Есть таксопарки без диспетчера'
--         ELSE 'Все таксопарки с диспетчерами'
--         END AS message;
--
--49
-- SELECT mark.mark_name AS Самая_популярная_марка, COUNT(*) AS Количество
-- FROM car
--          JOIN model ON car.model_id = model.model_id
--          JOIN mark ON model.mark_id = mark.mark_id
-- GROUP BY mark.mark_name
-- ORDER BY 2 DESC
-- LIMIT 1;