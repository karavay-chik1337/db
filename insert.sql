insert into city(city_id, city_name)
VALUES (1, 'Voronezh');

insert into street(street_id, city_id, street_name)
VALUES (1, 1, 'Voroshilova'),
       (2, 1, 'Gramshi');

insert into house(house_id, street_id, house_number, office_number)
VALUES (1, 1, '49', null),
       (2, 1, '50', null),
       (3, 1, '30', null),
       (4, 2, '40', 2),
       (5, 2, '40', 3),
       (6, 2, '40', 4);

insert into mark(mark_id, mark_name)
VALUES (1, 'Mazda'),
       (2, 'Renault'),
       (3, 'Kia'),
       (4, 'Nissan'),
       (5, 'Toyota');

insert into model(model_id, mark_id, model_name)
VALUES (1, 1, 'CX-5'),
       (2, 1, 'RX-7'),
       (3, 2, 'Logan'),
       (4, 2, 'Megan'),
       (5, 3, 'Rio'),
       (6, 3, 'Ceed'),
       (7, 4, 'Qashqai'),
       (8, 4, 'X-Trail'),
       (9, 5, 'Camry'),
       (10, 5, 'Corolla');

insert into taxi_company_owner(taxi_company_owner_id, taxi_company_owner_name, taxi_company_owner_surname, taxi_company_owner_patronymic, taxi_company_owner_phone, taxi_company_owner_birthday)
VALUES (1, 'Alex', 'Korolev', 'Petrovich', 89006001234, '21/04/1970'),
       (2, 'Dmitriy', 'Karavaev', 'Alekseevich', 89006002345, '07/01/2004'),
       (3, 'David', 'Davidov', 'Davidovich', 89006003456, '12/07/1991');

insert into taxi_company(taxi_company_id, taxi_company_owner_id, house_id, taxi_company_name, taxi_company_phone)
values (1, 1, 4, 'Honey and honey', 545450),
       (2, 2, 5, 'Speed', 515115),
       (3, 3, 6, 'Forsazh', 909091);

insert into client(client_id, client_phone, client_name, client_patronymic)
values (1, 89006001020, 'Ivan', null),
       (2, 89006002030, 'Maks', null),
       (3, 89006003040, 'Alex', null);

insert into car(car_id, taxi_company_id, model_id, car_yearofproduction, car_number, car_insurance)
values (1, 1, 3, '01/07/2007', 'o700ct36', '111111111'),
       (2, 1, 3, '01/04/2008', 'o700cq36', '111111112'),
       (3, 1, 3, '01/05/2009', 'o700ca36', '111111113'),
       (4, 1, 5, '01/08/2008', 'o700cs36', '111111114'),
       (5, 1, 5, '01/08/2008', 'o700cd36', '111111115'),
       (6, 1, 4, '01/09/2009', 'o700cf36', '111111116'),
       (7, 1, 4, '01/10/2012', 'o700ct36', '111111117'),
       (8, 3, 1, '01/12/2014', 'o700cc36', '211111111'),
       (9, 3, 1, '01/09/2015', 'o700cu36', '311111111'),
       (10, 3, 7, '01/04/2007', 'o700ci36', '411111111'),
       (11, 3, 8, '01/03/2008', 'o700cp36', '511111111'),
       (12, 3, 9, '01/02/2008', 'o700cx36', '611111111'),
       (13, 3, 9, '01/02/2013', 'o700cy36', '711111111'),
       (14, 3, 2, '01/01/2020', 'o700cz36', '811111111');