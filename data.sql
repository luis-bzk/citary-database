create schema data;

create table
  data.data_person (
    per_id serial primary key,
    per_identification_number varchar(20) not null,
    per_first_name varchar(50) not null,
    per_second_name varchar(50),
    per_first_last_name varchar(50) not null,
    per_second_last_name varchar(50),
    per_occupation varchar(100),
    per_created_date timestamp default current_timestamp,
    per_record_status varchar(1) not null,
    id_identification_type int not null,
    id_genre int not null,
    id_user int not null,
    constraint fk1_data_person foreign key (id_identification_type) references core.core_identification_type (ity_id),
    constraint fk2_data_person foreign key (id_genre) references core.core_genre (gen_id),
    constraint fk3_data_person foreign key (id_user) references core.core_user (use_id)
  );

create table
  data.data_phone (
    pho_id serial primary key,
    pho_number varchar(13) not null,
    pho_created_date timestamp default current_timestamp,
    pho_record_status varchar(1) not null,
    id_person int not null,
    id_phone_type int not null,
    constraint fk1_data_phone foreign key (id_person) references data.data_person (per_id),
    constraint fk2_data_phone foreign key (id_phone_type) references core.core_phone_type (pty_id)
  );

create table
  data.data_address_type (
    aty_id serial primary key,
    aty_name varchar(100) not null,
    aty_description varchar(100),
    aty_created_date timestamp default current_timestamp,
    aty_record_status varchar(1) not null
  );

create table
  data.data_address (
    add_id serial primary key,
    add_main_street varchar(150) not null,
    add_secondary_street varchar(100),
    add_postal_code varchar(20),
    add_reference varchar(150) not null,
    add_number varchar(10),
    add_created_date timestamp default current_timestamp,
    add_record_status varchar(1) not null,
    id_country int not null,
    id_province int not null,
    id_city int not null,
    id_person int,
    id_address_type int not null,
    constraint fk1_data_address foreign key (id_country) references core.core_country (cou_id),
    constraint fk2_data_address foreign key (id_province) references core.core_province (pro_id),
    constraint fk3_data_address foreign key (id_city) references core.core_city (cit_id),
    constraint fk4_data_address foreign key (id_person) references data.data_person (per_id),
    constraint fk5_data_address foreign key (id_address_type) references data.data_address_type (aty_id)
  );

create table
  data.data_category (
    cat_id serial primary key,
    cat_name varchar(100) not null,
    cat_description varchar(150),
    cat_created_date timestamp default current_timestamp,
    cat_record_status varchar(1) not null
  );

create table
  data.data_service (
    ser_id serial primary key,
    ser_name varchar(100) not null,
    ser_description varchar(150),
    id_category int not null,
    constraint fk1_data_service foreign key (id_category) references data.data_category (cat_id)
  );

create table
  data.data_doctor (
    doc_id serial primary key,
    doc_license_number varchar(20) not null,
    doc_years_experience int not null,
    doc_email varchar(100),
    doc_created_date timestamp default current_timestamp,
    doc_record_status varchar(1) not null,
    id_person int not null,
    constraint fk1_data_doctor foreign key (id_person) references data.data_person (per_id)
  );

create table
  data.data_doctor_service (
    dse_id serial primary key,
    dse_created_date timestamp default current_timestamp,
    dse_record_status varchar(1) not null,
    id_doctor int not null,
    id_service int not null,
    constraint fk1_data_doctor_service foreign key (id_doctor) references data.data_doctor (doc_id),
    constraint fk2_data_doctor_service foreign key (id_service) references data.data_service (ser_id)
  );

create table
  data.data_patient (
    pat_id serial primary key,
    pat_medical_record_number varchar(20) not null,
    pat_insurance_company varchar(100),
    pat_insurance_number varchar(20),
    pat_blood_type varchar(3),
    pat_allergies varchar(200),
    pat_medical_conditions varchar(200),
    pat_height numeric(2, 4),
    pat_weight numeric(4, 4),
    pat_created_date timestamp default current_timestamp,
    pat_record_status varchar(1) not null,
    id_person int not null,
    constraint fk1_data_patient foreign key (id_person) references data.data_person (per_id)
  );

create table
  data.data_medical_history (
    mhi_id serial primary key,
    mhi_disease varchar(100) not null,
    mhi_description varchar(200) not null,
    mhi_diagnostic_date timestamp default current_timestamp,
    mhi_created_date timestamp default current_timestamp,
    mhi_record_status varchar(1) not null,
    id_status int not null,
    id_patient int not null,
    constraint fk1_data_medical_history foreign key (id_status) references core.core_status (sta_id),
    constraint fk2_data_medical_history foreign key (id_patient) references data.data_patient (pat_id)
  );

create table
  data.data_prescription (
    pre_id serial primary key,
    pre_medication_name varchar(100) not null,
    pre_dosage varchar(100) not null,
    pre_instructions varchar(300) not null,
    pre_prescription_date timestamp default current_timestamp,
    pre_created_date timestamp default current_timestamp,
    pre_record_status varchar(1) not null,
    id_doctor int not null,
    id_patient int not null,
    constraint fk1_data_prescription foreign key (id_doctor) references data.data_doctor (doc_id),
    constraint fk2_data_prescription foreign key (id_patient) references data.data_patient (pat_id)
  );

create table
  data.data_consultation (
    con_id serial primary key,
    con_name varchar(100) not null,
    con_description varchar(150),
    con_duration_time interval not null,
    con_base_price numeric(10, 4) not null,
    con_iva_price numeric(10, 4) not null,
    con_discount numeric(10, 4),
    con_final_price numeric(10, 4) not null,
    con_created_date timestamp default current_timestamp,
    con_record_status varchar(1) not null,
    id_doctor int not null,
    id_service int not null,
    constraint fk1_data_consultation foreign key (id_doctor) references data.data_doctor (doc_id),
    constraint fk2_data_consultation foreign key (id_service) references data.data_service (ser_id)
  );

create table
  data.data_schedule (
    sch_id serial primary key,
    sch_day varchar(20) not null,
    sch_start_time time not null,
    sch_end_time time not null,
    sch_start_break_time time,
    sch_end_break_time time,
    sch_created_date timestamp default current_timestamp,
    sch_record_status varchar(1) not null,
    id_doctor int not null,
    id_address int not null,
    constraint fk1_data_schedule foreign key (id_doctor) references data.data_doctor (doc_id),
    constraint fk2_data_schedule foreign key (id_address) references data.data_address (add_id)
  );

create table
  data.data_appointment (
    app_id serial primary key,
    app_shift_number int not null,
    app_date timestamp not null,
    app_start_time time not null,
    app_end_time time not null,
    app_created_date timestamp default current_timestamp,
    app_record_status varchar(1) not null,
    id_doctor int not null,
    id_patient int not null,
    id_consultation int not null,
    id_address int not null,
    id_status int not null,
    constraint fk1_data_appointment foreign key (id_doctor) references data.data_doctor (doc_id),
    constraint fk2_data_appointment foreign key (id_patient) references data.data_patient (pat_id),
    constraint fk3_data_appointment foreign key (id_consultation) references data.data_consultation (con_id),
    constraint fk4_data_appointment foreign key (id_address) references data.data_address (add_id),
    constraint fk5_data_appointment foreign key (id_status) references core.core_status (sta_id)
  );

create table
  data.data_review (
    rev_id serial primary key,
    rev_qualification numeric(2, 1) not null,
    rev_date timestamp not null,
    rev_comment varchar(400) not null,
    rev_created_date timestamp default current_timestamp,
    rev_record_status varchar(1) not null,
    id_doctor int not null,
    id_patient int not null,
    id_consultation int not null,
    id_appointment int not null,
    constraint fk1_data_review foreign key (id_doctor) references data.data_doctor (doc_id),
    constraint fk2_data_review foreign key (id_patient) references data.data_patient (pat_id),
    constraint fk3_data_review foreign key (id_consultation) references data.data_consultation (con_id),
    constraint fk4_data_review foreign key (id_appointment) references data.data_appointment (app_id)
  );

create table
  data.data_payment (
    pay_id serial primary key,
    pay_amount numeric(10, 4) not null,
    pay_payment_date timestamp,
    pay_date timestamp not null,
    pay_created_date timestamp default current_timestamp,
    pay_record_status varchar(1) not null,
    id_consultation int not null,
    id_appointment int not null,
    id_payment_method int not null,
    constraint fk1_data_payment foreign key (id_consultation) references data.data_consultation (con_id),
    constraint fk2_data_payment foreign key (id_appointment) references data.data_appointment (app_id),
    constraint fk3_data_payment foreign key (id_payment_method) references core.core_payment_method (pme_id)
  );

create table
  data.data_notification (
    not_id serial primary key,
    not_message varchar(400) not null,
    not_is_read boolean,
    not_created_date timestamp default current_timestamp,
    not_record_status varchar(1) not null,
    id_notification_type int not null,
    id_user int not null,
    constraint fk1_data_notification foreign key (id_notification_type) references core.core_notification_type (nty_id),
    constraint fk2_data_notification foreign key (id_user) references core.core_user (use_id)
  );