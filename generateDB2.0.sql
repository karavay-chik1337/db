/*==============================================================*/
/* Table: car                                                   */
/*==============================================================*/
create table car
(
    car_id               INT4 not null unique,
    taxi_company_id      INT4 not null,
    model_id             INT4 not null,
    car_yearOfProduction DATE not null,
    car_number           TEXT not null,
    car_insurance        INT4 not null,
    constraint PK_CAR primary key (car_id)
);

/*==============================================================*/
/* Table: dispatcher                                            */
/*==============================================================*/
create table dispatcher
(
    dispatcher_id         INT4 not null unique ,
    taxi_company_id       INT4 not null,
    dispatcher_name       TEXT not null,
    dispatcher_surname    TEXT not null,
    dispatcher_patronymic TEXT,
    dispatcher_phone      INT8 not null unique ,
    dispatcher_birthday   DATE not null check (dispatcher_birthday > '1900-01-01'),
    constraint PK_DISPATCHER primary key (dispatcher_id)
);

/*==============================================================*/
/* Table: "car-drivers"                                         */
/*==============================================================*/
create table "car-drivers"
(
    car_id     INT4 not null,
    drivers_id INT4 not null,
    constraint "PK_CAR-DRIVERS" primary key (car_id, drivers_id)
);

/*==============================================================*/
/* Index: "car-drivers_PK"                                      */
/*==============================================================*/
create unique index "car-drivers_PK" on "car-drivers" (
car_id,
drivers_id
);

/*==============================================================*/
/* Index: "car-drivers2_FK"                                     */
/*==============================================================*/
create  index "car-drivers2_FK" on "car-drivers" (
drivers_id
);

/*==============================================================*/
/* Index: "car-drivers_FK"                                      */
/*==============================================================*/
create  index "car-drivers_FK" on "car-drivers" (
car_id
);

/*==============================================================*/
/* Table: city                                                  */
/*==============================================================*/
create table city
(
    city_id   INT4 not null unique,
    city_name TEXT not null unique,
    constraint PK_CITY primary key (city_id)
);

/*==============================================================*/
/* Table: client                                                */
/*==============================================================*/
create table client
(
    client_id         INT4 not null unique,
    client_phone      INT8 not null unique,
    client_name       TEXT not null,
    client_patronymic TEXT null,
    constraint PK_CLIENT primary key (client_id)
);

/*==============================================================*/
/* Table: drivers                                               */
/*==============================================================*/
create table drivers
(
    drivers_id         INT4 not null unique,
    taxi_company_id    INT4 not null,
    house_id           INT4 not null,
    drivers_name       TEXT not null,
    drivers_surname    TEXT not null,
    drivers_patronymic TEXT null,
    drivers_birthday   DATE not null check (drivers_birthday > '1900-01-01'),
    drivers_phone      INT8 not null,
    constraint PK_DRIVERS primary key (drivers_id)
);

/*==============================================================*/
/* Table: drivers_license                                       */
/*==============================================================*/
create table drivers_license
(
    drivers_license_id             INT4 not null unique,
    drivers_id                     INT4 not null,
    drivers_license_series         INT4 not null unique ,
    drivers_license_number         INT4 not null unique ,
    drivers_license_validityPeriod DATE not null check (drivers_license_validityPeriod > '2000-01-01'),
    drivers_license_categoriesA    BOOL not null,
    drivers_license_categoriesB    BOOL not null,
    drivers_license_categoriesC    BOOL not null,
    drivers_license_categoriesD    BOOL not null,
    constraint PK_DRIVERS_LICENSE primary key (drivers_license_id)
);

/*==============================================================*/
/* Table: house                                                 */
/*==============================================================*/
create table house
(
    house_id      INT4 not null unique ,
    street_id     INT4 not null,
    house_number  TEXT not null,
    office_number INT4 null,
    constraint PK_HOUSE primary key (house_id)
);

/*==============================================================*/
/* Table: mark                                                  */
/*==============================================================*/
create table mark
(
    mark_id   INT4 not null unique ,
    mark_name TEXT not null unique ,
    constraint PK_MARK primary key (mark_id)
);

/*==============================================================*/
/* Table: model                                                 */
/*==============================================================*/
create table model
(
    model_id   INT4 not null unique ,
    mark_id    INT4 not null,
    model_name TEXT not null,
    constraint PK_MODEL primary key (model_id)
);

/*==============================================================*/
/* Table: street                                                */
/*==============================================================*/
create table street
(
    street_id   INT4 not null unique ,
    city_id     INT4 not null,
    street_name TEXT not null,
    constraint PK_STREET primary key (street_id)
);

/*==============================================================*/
/* Table: taxi_company                                          */
/*==============================================================*/
create table taxi_company
(
    taxi_company_id       INT4 not null unique ,
    taxi_company_owner_id INT4 not null,
    house_id              INT4 not null unique ,
    taxi_company_name     TEXT not null unique ,
    taxi_company_phone    INT8 not null unique ,
    constraint PK_TAXI_COMPANY primary key (taxi_company_id)
);

/*==============================================================*/
/* Table: taxi_company_owner                                    */
/*==============================================================*/
create table taxi_company_owner
(
    taxi_company_owner_id         INT4 not null unique,
    taxi_company_owner_name       TEXT not null,
    taxi_company_owner_surname    TEXT not null,
    taxi_company_owner_patronymic TEXT null,
    taxi_company_owner_phone      INT8 not null unique,
    taxi_company_owner_birthday   DATE not null check ( taxi_company_owner_birthday > '1900/01/01' ),
    constraint PK_TAXI_COMPANY_OWNER primary key (taxi_company_owner_id)
);

/*==============================================================*/
/* Table: trip                                                  */
/*==============================================================*/
create table trip
(
    trip_id        INT4      not null unique ,
    client_id      INT4      not null,
    house_id       INT4      not null,
    car_id         INT4      not null,
    drivers_id     INT4      not null,
    trip_timeStart TIMESTAMP not null,
    trip_timeEnd   TIMESTAMP null,
    trip_price     MONEY     null,
    constraint PK_TRIP primary key (trip_id)
);

alter table dispatcher
    add constraint "FK_DISPATCHER-TAXI_COM" foreign key (taxi_company_id)
        references taxi_company (taxi_company_id)
        on delete restrict on update restrict;

alter table car
    add constraint "FK_CAR_CAR-COMPA_TAXI_COM" foreign key (taxi_company_id)
        references taxi_company (taxi_company_id)
        on delete restrict on update restrict;

alter table car
    add constraint "FK_CAR_CAR-MODEL_MODEL" foreign key (model_id)
        references model (model_id)
        on delete restrict on update restrict;

alter table "car-drivers"
    add constraint "FK_CAR-DRIV_CAR-DRIVE_CAR" foreign key (car_id)
        references car (car_id)
        on delete restrict on update restrict;

alter table "car-drivers"
    add constraint "FK_CAR-DRIV_CAR-DRIVE_DRIVERS" foreign key (drivers_id)
        references drivers (drivers_id)
        on delete restrict on update restrict;

alter table drivers
    add constraint "FK_DRIVERS_DRIVERS-A_HOUSE" foreign key (house_id)
        references house (house_id)
        on delete restrict on update restrict;

alter table drivers
    add constraint "FK_DRIVERS_DRIVERS-C_TAXI_COM" foreign key (taxi_company_id)
        references taxi_company (taxi_company_id)
        on delete restrict on update restrict;

alter table drivers_license
    add constraint "FK_DRIVERS__DRIVERS-L_DRIVERS" foreign key (drivers_id)
        references drivers (drivers_id)
        on delete restrict on update restrict;

alter table house
    add constraint FK_HOUSE_STREET_HO_STREET foreign key (street_id)
        references street (street_id)
        on delete restrict on update restrict;

alter table model
    add constraint "FK_MODEL_MODEL-MAR_MARK" foreign key (mark_id)
        references mark (mark_id)
        on delete restrict on update restrict;

alter table street
    add constraint "FK_STREET_CITY-STRE_CITY" foreign key (city_id)
        references city (city_id)
        on delete restrict on update restrict;

alter table taxi_company
    add constraint "FK_TAXI_COM_COMPANY-O_TAXI_COM" foreign key (taxi_company_owner_id)
        references taxi_company_owner (taxi_company_owner_id)
        on delete restrict on update restrict;

alter table taxi_company
    add constraint FK_TAXI_COM_COMPANY_A_HOUSE foreign key (house_id)
        references house (house_id)
        on delete restrict on update restrict;

alter table trip
    add constraint "FK_TRIP_TRIP-CLIE_CLIENT" foreign key (client_id)
        references client (client_id)
        on delete restrict on update restrict;

alter table trip
    add constraint FK_TRIP_TRIP_ADDR_HOUSE foreign key (house_id)
        references house (house_id)
        on delete restrict on update restrict;

alter table trip
    add constraint "FK_TRIP_TRIP_CAR-_CAR-DRIV" foreign key (car_id, drivers_id)
        references "car-drivers" (car_id, drivers_id)
        on delete restrict on update restrict;

