--34
SELECT DISTINCT CONCAT(d.drivers_surname, ' ', LEFT(d.drivers_name, 1), '.', COALESCE(LEFT(d.drivers_patronymic, 1), '')) AS driver_full_name
FROM drivers d
         JOIN car c ON d.drivers_id = ANY(SELECT cd.drivers_id FROM "car-drivers" cd
             JOIN car ca ON cd.car_id = ca.car_id
             JOIN model m ON ca.model_id = m.model_id
             WHERE m.mark_id = (SELECT mark_id FROM model WHERE model_id = c.model_id GROUP BY mark_id HAVING COUNT(DISTINCT model_id) = 1))
WHERE NOT d.drivers_surname ILIKE '%-'
ORDER BY driver_full_name;

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
-- select car.*, drivers.*
-- from car left join "car-drivers" on car.car_id = "car-drivers".car_id
-- left join (select car.car_id as id, "car-drivers".drivers_id as idd
--            from "car-drivers", car where car.car_id = "car-drivers".car_id)
--     t on t.id = car.car_id left join drivers on drivers.drivers_id = t.idd
-- order by car.car_yearofproduction
-- limit 3;

--40
-- select mark.mark_name, model.model_name
-- from mark,
--      model
-- where model.model_id = (select model_id
--                         from car
--                         group by model_id)
--   and model.mark_id = mark.mark_id;

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

--43
-- select distinct tc.taxi_company_name
-- from taxi_company as tc left join car on car.taxi_company_id = tc.taxi_company_id
--     left join public.model m on car.model_id = m.model_id left join public.mark m2 on m.mark_id = m2.mark_id
-- where m2.mark_name <> 'Kia' and m2.mark_name <> 'Renault';

--44
-- select tc.taxi_company_name, sum(trip.trip_price::numeric)
-- from taxi_company as tc left join car on tc.taxi_company_id = car.taxi_company_id
--     left join trip on trip.car_id = car.car_id
-- group by tc.taxi_company_id
-- having sum(trip.trip_price::numeric) > 0
-- order by 2 desc limit 1

--45
-- select client.client_name, client.client_patronymic
-- from client join trip on trip.client_id = client.client_id join
-- (select car_id
-- from car,
--      (select count(*), extract(year from car_yearofproduction) as year
--       from car
--       group by year
--       order by 1, 2 desc
--       limit 1) countCar
-- where extract(year from car.car_yearofproduction) = year) t on trip.car_id = t.car_id;

--46
-- SELECT d.drivers_id, m.mark_name
-- FROM drivers d
--          CROSS JOIN mark m
-- WHERE NOT EXISTS (
--     SELECT 1
--     FROM "car-drivers" cd
--              INNER JOIN car c ON cd.car_id = c.car_id
--              INNER JOIN model mo ON c.model_id = mo.model_id
--              INNER JOIN mark ma ON mo.mark_id = ma.mark_id
--     WHERE cd.drivers_id = d.drivers_id AND ma.mark_id = m.mark_id
-- )
-- order by 1;

--47


--48
-- SELECT
--     CASE
--         WHEN EXISTS (SELECT * FROM taxi_company WHERE taxi_company_id NOT IN (SELECT DISTINCT taxi_company_id FROM dispatcher)) THEN 'Есть таксопарки без диспетчера'
--         ELSE 'Все таксопарки с диспетчерами'
--         END AS message;

--49
-- SELECT mark.mark_name AS Самая_популярная_марка, COUNT(*) AS Количество
-- FROM car
--          JOIN model ON car.model_id = model.model_id
--          JOIN mark ON model.mark_id = mark.mark_id
-- GROUP BY mark.mark_name
-- ORDER BY 2 DESC
-- LIMIT 1;

--50


--51


--52