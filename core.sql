-- create database my_database;
create schema core;

create table
  core.core_country (
    cou_id serial primary key,
    cou_name varchar(100) not null,
    cou_code varchar(10) not null,
    cou_prefix varchar(10) not null,
    cou_created_date timestamp default current_timestamp,
    cou_record_status varchar(1) not null
  );

create table
  core.core_province (
    pro_id serial primary key,
    pro_name varchar(100) not null,
    pro_code varchar(10) not null,
    pro_prefix varchar(10) not null,
    pro_created_date timestamp default current_timestamp,
    pro_record_status varchar(1) not null,
    id_country int not null,
    constraint fk1_core_province foreign key (id_country) references core.core_country (cou_id)
  );

create table
  core.core_city (
    cit_id serial primary key,
    cit_name varchar(100) not null,
    cit_created_date timestamp default current_timestamp,
    cit_record_status varchar(1) not null,
    id_province int not null,
    id_country int not null,
    constraint fk1_core_province foreign key (id_province) references core.core_province (pro_id),
    constraint fk2_core_province foreign key (id_country) references core.core_country (cou_id)
  );

create table
  core.core_user (
    use_id serial primary key,
    use_name varchar(100) not null,
    use_last_name varchar(100) not null,
    use_email varchar(100) unique not null,
    use_password varchar(100) not null,
    use_token varchar(60),
    use_created_date timestamp default current_timestamp,
    use_record_status varchar(1) not null
  );

create table
  core.core_role (
    rol_id serial primary key,
    rol_name varchar(100) not null,
    rol_description varchar(200),
    rol_created_date timestamp default current_timestamp,
    rol_record_status varchar(1) not null
  );

create table
  core.core_user_role (
    uro_id serial primary key,
    uro_created_date timestamp default current_timestamp,
    uro_record_status varchar(1) not null,
    id_user int not null,
    id_role int not null,
    constraint fk1_core_user_role foreign key (id_user) references core.core_user (use_id),
    constraint fk2_core_user_role foreign key (id_role) references core.core_role (rol_id)
  );

create table
  core.core_genre (
    gen_id serial primary key,
    gen_name varchar(50) not null,
    gen_description varchar(100),
    gen_abbreviation varchar(10),
    gen_created_date timestamp default current_timestamp,
    gen_record_status varchar(1) not null
  );

create table
  core.core_identification_type (
    ity_id serial primary key,
    ity_name varchar(50) not null,
    ity_description varchar(100),
    ity_abbreviation varchar(10),
    ity_created_date timestamp default current_timestamp,
    ity_record_status varchar(1) not null,
    id_country int not null,
    constraint fk1_core_identification_type foreign key (id_country) references core.core_country (cou_id)
  );

create table
  core.core_phone_type (
    pty_id serial primary key,
    pty_name varchar(100) not null,
    pty_description varchar(100),
    pty_created_date timestamp default current_timestamp,
    pty_record_status varchar(1) not null
  );

create table
  core.core_payment_method (
    pme_id serial primary key,
    pme_name varchar(100) not null,
    pme_description varchar(300) not null,
    pme_created_date timestamp default current_timestamp,
    pme_record_status varchar(1) not null
  );

create table
  core.core_notification_type (
    nty_id serial primary key,
    nty_name varchar(100) not null,
    nty_description varchar(300) not null,
    nty_created_date timestamp default current_timestamp,
    nty_record_status varchar(1) not null
  );

-- TODO
create table
  core.core_constant (
    con_id serial primary key,
    con_name varchar(100) not null,
    con_value_id int not null,
    con_created_date timestamp default current_timestamp,
    con_record_status varchar(1) not null
  );

create table
  core.core_status (
    sta_id serial primary key,
    sta_name varchar(100) not null,
    sta_created_date timestamp default current_timestamp,
    sta_record_status varchar(1) not null
  );