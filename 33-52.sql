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

--40
WITH RankedCars AS (
    SELECT
        m.mark_name,
        c.car_yearOfProduction,
        ROW_NUMBER() OVER (PARTITION BY m.mark_name ORDER BY c.car_yearOfProduction) AS oldest_rank,
        ROW_NUMBER() OVER (PARTITION BY m.mark_name ORDER BY c.car_yearOfProduction DESC) AS newest_rank
    FROM car c
             JOIN model mo ON c.model_id = mo.model_id
             JOIN mark m ON mo.mark_id = m.mark_id
)
SELECT
    mark_name,
    MIN(car_yearOfProduction) AS oldest_car_year,
    MAX(car_yearOfProduction) AS newest_car_year
FROM RankedCars
WHERE oldest_rank = 1 OR newest_rank = 1
GROUP BY mark_name
ORDER BY mark_name;