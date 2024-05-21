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

insert into drivers(drivers_id, taxi_company_id, house_id, drivers_name, drivers_surname, drivers_patronymic,
                    drivers_birthday, drivers_phone)
values (1, 1, 1, 'Alex', 'Ivanov', null, '1/1/1980', 89005004030),
       (2, 1, 2, 'Ivan', 'Perov', null, '1/1/1981', 89005004040),
       (3, 1, 3, 'Maks', 'Negrov', null, '1/1/1982', 89005004050),
       (4, 3, 4, 'Eric', 'Saharov', null, '2/1/1980', 89006004030),
       (5, 3, 5, 'Mark', 'Kozlov', null, '3/1/1980', 89007004030),
       (6, 3, 6, 'David', 'Fedotov', null, '4/1/1980', 89008004030);


insert into "car-drivers"(car_id, drivers_id)
values (1, 1),
       (2, 2),
       (3, 3),
       (3, 1),
       (2, 1),
       (5, 1),
       (5, 3),
       (6, 2),
       (7, 2),
       (7, 3),
       (9, 4),
       (10, 5),
       (8, 6),
       (11, 6),
       (12, 5),
       (13, 4),
       (14, 4);

insert into trip(trip_id, client_id, house_id, car_id, drivers_id, trip_timestart, trip_timeend, trip_price)
values (1, 1, 1, 1, 1, '2/2/2020 10:00:00', '2/2/2020 10:30:12', 200),
       (2, 2, 2, 2, 2, '3/2/2020 11:10:00', '3/2/2020 12:30:12', 250),
       (3, 3, 3, 3, 3, '3/2/2020 23:11:00', '3/2/2020 00:10:12', 300),
       (4, 3, 6, 1, 1, '4/2/2020 9:45:00', '4/2/2020 10:15:12', 200),
       (5, 3, 5, 3, 1, '1/2/2020 9:45:00', '1/2/2020 10:15:12', 100),
       (6, 3, 1, 2, 1, '5/2/2020 9:45:00', '5/2/2020 10:15:12', 150),
       (7, 3, 1, 12, 5, '5/2/2021 9:45:00', '5/2/2021 10:55:12', 350),
       (8, 1, 6, 10, 5, '5/2/2021 7:45:00', '5/2/2021 7:55:12', 150),
       (9, 1, 5, 14, 4, '5/2/2021 19:45:00', '5/2/2021 20:15:12', 250),
       (10, 2, 4, 13, 4, '5/2/2021 9:43:12', '5/2/2021 12:15:12', 550),
       (11, 3, 2, 8, 6, '5/2/2021 9:44:10', '5/2/2021 10:00:12', 151),
       (12, 3, 3, 11, 6, '5/2/2021 9:41:00', '5/2/2021 10:03:12', 158),
       (13, 2, 4, 14, 4, '12/2/2020 22:30:00', '13/2/2020 00:30:12', 656);

insert into dispatcher (dispatcher_id, taxi_company_id, dispatcher_name, dispatcher_surname, dispatcher_patronymic,
                        dispatcher_phone, dispatcher_birthday)
values (1, 1, 'Anton', 'Opryshko', null, 89091002030, '10/12/2003'),
       (2, 2, 'Vladislav', 'Opryshko', null, 89091002031, '10/12/2004'),
       (3, 3, 'Alex', 'Opryshko', null, 89091002032, '10/12/2005');