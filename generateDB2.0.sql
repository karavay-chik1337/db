/*==============================================================*/
/* DBMS name:      PostgreSQL 9.x                               */
/* Created on:     12.05.2024 19:04:36                          */
/*==============================================================*/

--
-- drop index "car-model_FK";
--
-- drop index "car-company_FK";
--
-- drop index car_PK;
--
-- drop table car;
--
-- drop index "car-drivers_FK";
--
-- drop index "car-drivers2_FK";
--
-- drop index "car-drivers_PK";
--
-- drop table "car-drivers";
--
-- drop index city_PK;
--
-- drop table city;
--
-- drop index client_PK;
--
-- drop table client;
--
-- drop index "drivers-address_FK";
--
-- drop index "drivers-company_FK";
--
-- drop index drivers_PK;
--
-- drop table drivers;
--
-- drop index "drivers-license_FK";
--
-- drop index drivers_license_PK;
--
-- drop table drivers_license;
--
-- drop index street_house_FK;
--
-- drop index house_PK;
--
-- drop table house;
--
-- drop index mark_PK;
--
-- drop table mark;
--
-- drop index "model-mark_FK";
--
-- drop index model_PK;
--
-- drop table model;
--
-- drop index "city-street_FK";
--
-- drop index street_PK;
--
-- drop table street;
--
-- drop index company_address_FK;
--
-- drop index "company-owner_FK";
--
-- drop index taxi_company_PK;
--
-- drop table taxi_company;
--
-- drop index taxi_company_owner_PK;
--
-- drop table taxi_company_owner;
--
-- drop index "trip_car-drivers_FK";
--
-- drop index trip_address_FK;
--
-- drop index "trip-client_FK";
--
-- drop index trip_PK;
--
-- drop table trip;

/*==============================================================*/
/* Table: car                                                   */
/*==============================================================*/
create table car (
   car_id               INT4                 not null,
   taxi_company_id      INT4                 not null,
   model_id             INT4                 not null,
   car_yearOfProduction DATE                 not null,
   car_number           TEXT                 not null,
   car_insurance        INT4                 not null,
   constraint PK_CAR primary key (car_id)
);

/*==============================================================*/
/* Index: car_PK                                                */
/*==============================================================*/
create unique index car_PK on car (
car_id
);

/*==============================================================*/
/* Index: "car-company_FK"                                      */
/*==============================================================*/
create  index "car-company_FK" on car (
taxi_company_id
);

/*==============================================================*/
/* Index: "car-model_FK"                                        */
/*==============================================================*/
create  index "car-model_FK" on car (
model_id
);

/*==============================================================*/
/* Table: "car-drivers"                                         */
/*==============================================================*/
create table "car-drivers" (
   car_id               INT4                 not null,
   drivers_id           INT4                 not null,
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
create table city (
   city_id              INT4                 not null,
   city_name            TEXT                 not null,
   constraint PK_CITY primary key (city_id)
);

/*==============================================================*/
/* Index: city_PK                                               */
/*==============================================================*/
create unique index city_PK on city (
city_id
);

/*==============================================================*/
/* Table: client                                                */
/*==============================================================*/
create table client (
   client_id            INT4                 not null,
   client_phone         INT8                 not null,
   client_name          TEXT                 not null,
   client_patronymic    TEXT                 null,
   constraint PK_CLIENT primary key (client_id)
);

/*==============================================================*/
/* Index: client_PK                                             */
/*==============================================================*/
create unique index client_PK on client (
client_id
);

/*==============================================================*/
/* Table: drivers                                               */
/*==============================================================*/
create table drivers (
   drivers_id           INT4                 not null,
   taxi_company_id      INT4                 not null,
   house_id             INT4                 not null,
   drivers_name         TEXT                 not null,
   drivers_surname      TEXT                 not null,
   drivers_patronymic   TEXT                 null,
   drivers_birthday     DATE                 not null,
   drivers_phone        INT8                 not null,
   constraint PK_DRIVERS primary key (drivers_id)
);

/*==============================================================*/
/* Index: drivers_PK                                            */
/*==============================================================*/
create unique index drivers_PK on drivers (
drivers_id
);

/*==============================================================*/
/* Index: "drivers-company_FK"                                  */
/*==============================================================*/
create  index "drivers-company_FK" on drivers (
taxi_company_id
);

/*==============================================================*/
/* Index: "drivers-address_FK"                                  */
/*==============================================================*/
create  index "drivers-address_FK" on drivers (
house_id
);

/*==============================================================*/
/* Table: drivers_license                                       */
/*==============================================================*/
create table drivers_license (
   drivers_license_id   INT4                 not null,
   drivers_id           INT4                 not null,
   drivers_license_series INT4                 not null,
   drivers_license_number INT4                 not null,
   drivers_license_validityPeriod DATE                 not null,
   drivers_license_categoriesA BOOL                 not null,
   drivers_license_categoriesB BOOL                 not null,
   drivers_license_categoriesC BOOL                 not null,
   drivers_license_categoriesD BOOL                 not null,
   constraint PK_DRIVERS_LICENSE primary key (drivers_license_id)
);

/*==============================================================*/
/* Index: drivers_license_PK                                    */
/*==============================================================*/
create unique index drivers_license_PK on drivers_license (
drivers_license_id
);

/*==============================================================*/
/* Index: "drivers-license_FK"                                  */
/*==============================================================*/
create  index "drivers-license_FK" on drivers_license (
drivers_id
);

/*==============================================================*/
/* Table: house                                                 */
/*==============================================================*/
create table house (
   house_id             INT4                 not null,
   street_id            INT4                 not null,
   house_number         TEXT                 not null,
   office_number        INT4                 null,
   constraint PK_HOUSE primary key (house_id)
);

/*==============================================================*/
/* Index: house_PK                                              */
/*==============================================================*/
create unique index house_PK on house (
house_id
);

/*==============================================================*/
/* Index: street_house_FK                                       */
/*==============================================================*/
create  index street_house_FK on house (
street_id
);

/*==============================================================*/
/* Table: mark                                                  */
/*==============================================================*/
create table mark (
   mark_id              INT4                 not null,
   mark_name            TEXT                 not null,
   constraint PK_MARK primary key (mark_id)
);

/*==============================================================*/
/* Index: mark_PK                                               */
/*==============================================================*/
create unique index mark_PK on mark (
mark_id
);

/*==============================================================*/
/* Table: model                                                 */
/*==============================================================*/
create table model (
   model_id             INT4                 not null,
   mark_id              INT4                 not null,
   model_name           TEXT                 not null,
   constraint PK_MODEL primary key (model_id)
);

/*==============================================================*/
/* Index: model_PK                                              */
/*==============================================================*/
create unique index model_PK on model (
model_id
);

/*==============================================================*/
/* Index: "model-mark_FK"                                       */
/*==============================================================*/
create  index "model-mark_FK" on model (
mark_id
);

/*==============================================================*/
/* Table: street                                                */
/*==============================================================*/
create table street (
   street_id            INT4                 not null,
   city_id              INT4                 not null,
   street_name          TEXT                 not null,
   constraint PK_STREET primary key (street_id)
);

/*==============================================================*/
/* Index: street_PK                                             */
/*==============================================================*/
create unique index street_PK on street (
street_id
);

/*==============================================================*/
/* Index: "city-street_FK"                                      */
/*==============================================================*/
create  index "city-street_FK" on street (
city_id
);

/*==============================================================*/
/* Table: taxi_company                                          */
/*==============================================================*/
create table taxi_company (
   taxi_company_id      INT4                 not null,
   taxi_company_owner_id INT4                 not null,
   house_id             INT4                 not null,
   taxi_company_name    TEXT                 not null,
   taxi_company_phone   INT8                 not null,
   constraint PK_TAXI_COMPANY primary key (taxi_company_id)
);

/*==============================================================*/
/* Index: taxi_company_PK                                       */
/*==============================================================*/
create unique index taxi_company_PK on taxi_company (
taxi_company_id
);

/*==============================================================*/
/* Index: "company-owner_FK"                                    */
/*==============================================================*/
create  index "company-owner_FK" on taxi_company (
taxi_company_owner_id
);

/*==============================================================*/
/* Index: company_address_FK                                    */
/*==============================================================*/
create  index company_address_FK on taxi_company (
house_id
);

/*==============================================================*/
/* Table: taxi_company_owner                                    */
/*==============================================================*/
create table taxi_company_owner (
   taxi_company_owner_id INT4                 not null,
   taxi_company_owner_name TEXT                 not null,
   taxi_company_owner_surname TEXT                 not null,
   taxi_company_owner_patronymic TEXT                 null,
   taxi_company_owner_phone INT8                 not null,
   taxi_company_owner_birthday DATE                 not null,
   constraint PK_TAXI_COMPANY_OWNER primary key (taxi_company_owner_id)
);

/*==============================================================*/
/* Index: taxi_company_owner_PK                                 */
/*==============================================================*/
create unique index taxi_company_owner_PK on taxi_company_owner (
taxi_company_owner_id
);

/*==============================================================*/
/* Table: trip                                                  */
/*==============================================================*/
create table trip (
   trip_id              INT4                 not null,
   client_id            INT4                 not null,
   house_id             INT4                 not null,
   car_id               INT4                 not null,
   drivers_id           INT4                 not null,
   trip_timeStart       DATE                 not null,
   trip_timeEnd         TIME                 null,
   trip_price           MONEY                null,
   constraint PK_TRIP primary key (trip_id)
);

/*==============================================================*/
/* Index: trip_PK                                               */
/*==============================================================*/
create unique index trip_PK on trip (
trip_id
);

/*==============================================================*/
/* Index: "trip-client_FK"                                      */
/*==============================================================*/
create  index "trip-client_FK" on trip (
client_id
);

/*==============================================================*/
/* Index: trip_address_FK                                       */
/*==============================================================*/
create  index trip_address_FK on trip (
house_id
);

/*==============================================================*/
/* Index: "trip_car-drivers_FK"                                 */
/*==============================================================*/
create  index "trip_car-drivers_FK" on trip (
car_id,
drivers_id
);

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

