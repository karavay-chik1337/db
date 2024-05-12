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
select mark.mark_name, model.model_name
from mark,
     model
where model.model_id = (select model_id
                        from car
                        group by model_id)
  and model.mark_id = mark.mark_id;
