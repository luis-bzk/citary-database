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
    per_record_status varchar(1) not null default '0',
    id_identification_type int not null,
    id_genre int not null,
    id_user int not null,
    constraint fk1_data_person foreign key (id_identification_type) references core.core_identification_type (ity_id),
    constraint fk2_data_person foreign key (id_genre) references core.core_genre (gen_id),
    constraint fk3_data_person foreign key (id_user) references core.core_user (use_id)
  );

create index idx_data_person_identification on data.data_person (per_identification_number);

create index idx_data_person_user on data.data_person (id_user);

create index idx_data_person_identification_type on data.data_person (id_identification_type);

create index idx_data_person_genre on data.data_person (id_genre);

create index idx_data_person_status on data.data_person (per_record_status);

-- Índice para búsquedas por nombre
create index idx_data_person_name on data.data_person (per_first_name, per_first_last_name);

create table
  data.data_phone (
    pho_id serial primary key,
    pho_number varchar(13) not null,
    pho_created_date timestamp default current_timestamp,
    pho_record_status varchar(1) not null default '0',
    id_person int not null,
    id_phone_type int not null,
    constraint fk1_data_phone foreign key (id_person) references data.data_person (per_id),
    constraint fk2_data_phone foreign key (id_phone_type) references core.core_phone_type (pty_id)
  );

create index idx_data_phone_person on data.data_phone (id_person);

create index idx_data_phone_type on data.data_phone (id_phone_type);

create index idx_data_phone_number on data.data_phone (pho_number);

-- Para búsquedas por teléfono
create table
  data.data_address_type (
    aty_id serial primary key,
    aty_name varchar(100) not null,
    aty_description varchar(100),
    aty_created_date timestamp default current_timestamp,
    aty_record_status varchar(1) not null default '0'
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
    add_record_status varchar(1) not null default '0',
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

create index idx_data_address_country on data.data_address (id_country);

create index idx_data_address_province on data.data_address (id_province);

create index idx_data_address_city on data.data_address (id_city);

create index idx_data_address_person on data.data_address (id_person);

create index idx_data_address_type on data.data_address (id_address_type);

-- Índice compuesto para búsquedas geográficas
create index idx_data_address_location on data.data_address (id_country, id_province, id_city);

-- ================================================
-- 1. GESTIÓN DE RESTAURANTES (Multi-tenant)
-- ================================================
create table
  data.data_restaurant (
    res_id serial primary key,
    res_name varchar(200) not null,
    res_business_name varchar(200) not null,
    res_ruc varchar(13) not null unique,
    res_email varchar(100) not null,
    res_phone varchar(13),
    res_website varchar(200),
    res_logo_url varchar(300),
    res_description text,
    res_opening_hours jsonb, -- {"monday": "08:00-22:00", "tuesday": "08:00-22:00", ...}
    res_tax_percentage numeric(5, 2) default 12.00,
    res_created_date timestamp default current_timestamp,
    res_record_status varchar(1) not null default '0',
    id_owner int not null,
    id_address int not null,
    constraint fk1_data_restaurant foreign key (id_owner) references core.core_user (use_id),
    constraint fk2_data_restaurant foreign key (id_address) references data.data_address (add_id)
  );

create index idx_restaurant_ruc on data.data_restaurant (res_ruc);

create index idx_restaurant_owner on data.data_restaurant (id_owner);

create table
  data.data_restaurant_employee (
    rem_id serial primary key,
    rem_position varchar(100) not null,
    rem_salary numeric(10, 2),
    rem_hire_date date not null,
    rem_created_date timestamp default current_timestamp,
    rem_record_status varchar(1) not null default '0',
    id_restaurant int not null,
    id_person int not null,
    constraint fk1_data_restaurant_employee foreign key (id_restaurant) references data.data_restaurant (res_id),
    constraint fk2_data_restaurant_employee foreign key (id_person) references data.data_person (per_id),
    constraint uk1_data_restaurant_employee unique (id_restaurant, id_person)
  );

create index idx_restaurant_employee_restaurant on data.data_restaurant_employee (id_restaurant);

-- 2. GESTIÓN DE MESAS Y ZONAS
-- ================================================
create table
  data.data_zone (
    zon_id serial primary key,
    zon_name varchar(100) not null,
    zon_description varchar(200),
    zon_capacity int not null default 0,
    zon_created_date timestamp default current_timestamp,
    zon_record_status varchar(1) not null default '0',
    id_restaurant int not null,
    constraint fk1_data_zone foreign key (id_restaurant) references data.data_restaurant (res_id)
  );

create index idx_zone_restaurant on data.data_zone (id_restaurant);

create table
  data.data_table (
    tab_id serial primary key,
    tab_number varchar(20) not null,
    tab_capacity int not null,
    tab_qr_code varchar(200),
    tab_status varchar(20) not null default 'available', -- available, occupied, reserved, maintenance
    tab_created_date timestamp default current_timestamp,
    tab_record_status varchar(1) not null default '0',
    id_restaurant int not null,
    id_zone int not null,
    constraint fk1_data_table foreign key (id_restaurant) references data.data_restaurant (res_id),
    constraint fk2_data_table foreign key (id_zone) references data.data_zone (zon_id),
    constraint uk1_data_table unique (id_restaurant, tab_number)
  );

create index idx_table_restaurant on data.data_table (id_restaurant);

create index idx_table_zone on data.data_table (id_zone);

create index idx_table_status on data.data_table (tab_status);

-- 3. INVENTARIO INTELIGENTE
-- ================================================
create table
  data.data_unit_measure (
    uni_id serial primary key,
    uni_name varchar(50) not null,
    uni_abbreviation varchar(10) not null,
    uni_type varchar(20) not null, -- weight, volume, quantity
    uni_created_date timestamp default current_timestamp,
    uni_record_status varchar(1) not null default '0'
  );

create table
  data.data_supplier (
    sup_id serial primary key,
    sup_name varchar(200) not null,
    sup_contact_name varchar(100),
    sup_phone varchar(13),
    sup_email varchar(100),
    sup_ruc varchar(13),
    sup_created_date timestamp default current_timestamp,
    sup_record_status varchar(1) not null default '0',
    id_restaurant int not null,
    id_address int,
    constraint fk1_data_supplier foreign key (id_restaurant) references data.data_restaurant (res_id),
    constraint fk2_data_supplier foreign key (id_address) references data.data_address (add_id)
  );

create index idx_supplier_restaurant on data.data_supplier (id_restaurant);

create table
  data.data_ingredient (
    ing_id serial primary key,
    ing_name varchar(200) not null,
    ing_description text,
    ing_current_stock numeric(10, 4) not null default 0,
    ing_minimum_stock numeric(10, 4) not null default 0,
    ing_maximum_stock numeric(10, 4),
    ing_cost_per_unit numeric(10, 4) not null default 0,
    ing_created_date timestamp default current_timestamp,
    ing_record_status varchar(1) not null default '0',
    id_restaurant int not null,
    id_unit_measure int not null,
    constraint fk1_data_ingredient foreign key (id_restaurant) references data.data_restaurant (res_id),
    constraint fk2_data_ingredient foreign key (id_unit_measure) references data.data_unit_measure (uni_id)
  );

create index idx_ingredient_restaurant on data.data_ingredient (id_restaurant);

create index idx_ingredient_stock on data.data_ingredient (ing_current_stock);

create table
  data.data_inventory_movement_type (
    imt_id serial primary key,
    imt_name varchar(50) not null,
    imt_description varchar(200),
    imt_operation varchar(10) not null, -- add, subtract
    imt_created_date timestamp default current_timestamp,
    imt_record_status varchar(1) not null default '0'
  );

create table
  data.data_inventory_movement (
    inm_id serial primary key,
    inm_quantity numeric(10, 4) not null,
    inm_unit_cost numeric(10, 4),
    inm_total_cost numeric(10, 4),
    inm_notes text,
    inm_created_date timestamp default current_timestamp,
    inm_record_status varchar(1) not null default '0',
    id_ingredient int not null,
    id_movement_type int not null,
    id_supplier int,
    id_employee int,
    constraint fk1_data_inventory_movement foreign key (id_ingredient) references data.data_ingredient (ing_id),
    constraint fk2_data_inventory_movement foreign key (id_movement_type) references data.data_inventory_movement_type (imt_id),
    constraint fk3_data_inventory_movement foreign key (id_supplier) references data.data_supplier (sup_id),
    constraint fk4_data_inventory_movement foreign key (id_employee) references data.data_restaurant_employee (rem_id)
  );

create index idx_inventory_movement_ingredient on data.data_inventory_movement (id_ingredient);

create index idx_inventory_movement_date on data.data_inventory_movement (inm_created_date);

-- 4. MENÚ Y PRODUCTOS
-- ================================================
create table
  data.data_menu_category (
    mca_id serial primary key,
    mca_name varchar(200) not null,
    mca_description text,
    mca_image_url varchar(300),
    mca_sort_order int default 0,
    mca_created_date timestamp default current_timestamp,
    mca_record_status varchar(1) not null default '0',
    id_restaurant int not null,
    constraint fk1_data_menu_category foreign key (id_restaurant) references data.data_restaurant (res_id)
  );

create index idx_menu_category_restaurant on data.data_menu_category (id_restaurant);

create table
  data.data_product (
    pro_id serial primary key,
    pro_name varchar(200) not null,
    pro_description text,
    pro_price numeric(10, 4) not null,
    pro_cost numeric(10, 4) not null default 0,
    pro_preparation_time int default 0, -- minutes
    pro_image_url varchar(300),
    pro_is_available boolean default true,
    pro_sort_order int default 0,
    pro_created_date timestamp default current_timestamp,
    pro_record_status varchar(1) not null default '0',
    id_restaurant int not null,
    id_menu_category int not null,
    constraint fk1_data_product foreign key (id_restaurant) references data.data_restaurant (res_id),
    constraint fk2_data_product foreign key (id_menu_category) references data.data_menu_category (mca_id)
  );

create index idx_product_restaurant on data.data_product (id_restaurant);

create index idx_product_category on data.data_product (id_menu_category);

create index idx_product_available on data.data_product (pro_is_available);

create table
  data.data_recipe (
    rec_id serial primary key,
    rec_quantity_needed numeric(10, 4) not null,
    rec_created_date timestamp default current_timestamp,
    rec_record_status varchar(1) not null default '0',
    id_product int not null,
    id_ingredient int not null,
    constraint fk1_data_recipe foreign key (id_product) references data.data_product (pro_id),
    constraint fk2_data_recipe foreign key (id_ingredient) references data.data_ingredient (ing_id),
    constraint uk1_data_recipe unique (id_product, id_ingredient)
  );

create index idx_recipe_product on data.data_recipe (id_product);

create index idx_recipe_ingredient on data.data_recipe (id_ingredient);

-- 5. GESTIÓN DE PEDIDOS
-- ================================================
create table
  data.data_order_type (
    ort_id serial primary key,
    ort_name varchar(50) not null,
    ort_description varchar(200),
    ort_created_date timestamp default current_timestamp,
    ort_record_status varchar(1) not null default '0'
  );

create table
  data.data_customer (
    cus_id serial primary key,
    cus_name varchar(200) not null,
    cus_phone varchar(13),
    cus_email varchar(100),
    cus_identification varchar(20),
    cus_created_date timestamp default current_timestamp,
    cus_record_status varchar(1) not null default '0',
    id_restaurant int not null,
    id_identification_type int,
    id_address int,
    constraint fk1_data_customer foreign key (id_restaurant) references data.data_restaurant (res_id),
    constraint fk2_data_customer foreign key (id_identification_type) references core.core_identification_type (ity_id),
    constraint fk3_data_customer foreign key (id_address) references data.data_address (add_id)
  );

create index idx_customer_restaurant on data.data_customer (id_restaurant);

create index idx_customer_phone on data.data_customer (cus_phone);

create table
  data.data_order (
    ord_id serial primary key,
    ord_number varchar(50) not null,
    ord_status varchar(20) not null default 'pending', -- pending, preparing, ready, delivered, cancelled
    ord_total_amount numeric(10, 4) not null default 0,
    ord_tax_amount numeric(10, 4) not null default 0,
    ord_discount_amount numeric(10, 4) not null default 0,
    ord_delivery_address text,
    ord_delivery_fee numeric(10, 4) default 0,
    ord_notes text,
    ord_estimated_time int, -- minutes
    ord_created_date timestamp default current_timestamp,
    ord_record_status varchar(1) not null default '0',
    id_restaurant int not null,
    id_order_type int not null,
    id_customer int,
    id_table int,
    id_employee int,
    constraint fk1_data_order foreign key (id_restaurant) references data.data_restaurant (res_id),
    constraint fk2_data_order foreign key (id_order_type) references data.data_order_type (ort_id),
    constraint fk3_data_order foreign key (id_customer) references data.data_customer (cus_id),
    constraint fk4_data_order foreign key (id_table) references data.data_table (tab_id),
    constraint fk5_data_order foreign key (id_employee) references data.data_restaurant_employee (rem_id),
    constraint uk1_data_order unique (id_restaurant, ord_number)
  );

create index idx_order_restaurant on data.data_order (id_restaurant);

create index idx_order_status on data.data_order (ord_status);

create index idx_order_date on data.data_order (ord_created_date);

create index idx_order_customer on data.data_order (id_customer);

create table
  data.data_order_item (
    ori_id serial primary key,
    ori_quantity int not null,
    ori_unit_price numeric(10, 4) not null,
    ori_total_price numeric(10, 4) not null,
    ori_special_instructions text,
    ori_created_date timestamp default current_timestamp,
    ori_record_status varchar(1) not null default '0',
    id_order int not null,
    id_product int not null,
    constraint fk1_data_order_item foreign key (id_order) references data.data_order (ord_id),
    constraint fk2_data_order_item foreign key (id_product) references data.data_product (pro_id)
  );

create index idx_order_item_order on data.data_order_item (id_order);

create index idx_order_item_product on data.data_order_item (id_product);

-- 6. FACTURACIÓN ELECTRÓNICA SRI
-- ================================================
create table
  data.data_document_type (
    dty_id serial primary key,
    dty_code varchar(10) not null,
    dty_name varchar(100) not null,
    dty_description varchar(200),
    dty_created_date timestamp default current_timestamp,
    dty_record_status varchar(1) not null default '0'
  );

create table
  data.data_invoice (
    inv_id serial primary key,
    inv_number varchar(50) not null,
    inv_access_key varchar(49), -- Clave de acceso SRI
    inv_authorization_date timestamp,
    inv_subtotal numeric(10, 4) not null,
    inv_tax_amount numeric(10, 4) not null,
    inv_total_amount numeric(10, 4) not null,
    inv_xml_response text,
    inv_pdf_url varchar(300),
    inv_sri_status varchar(20) default 'pending', -- pending, authorized, rejected
    inv_created_date timestamp default current_timestamp,
    inv_record_status varchar(1) not null default '0',
    id_restaurant int not null,
    id_customer int not null,
    id_order int,
    id_document_type int not null,
    constraint fk1_data_invoice foreign key (id_restaurant) references data.data_restaurant (res_id),
    constraint fk2_data_invoice foreign key (id_customer) references data.data_customer (cus_id),
    constraint fk3_data_invoice foreign key (id_order) references data.data_order (ord_id),
    constraint fk4_data_invoice foreign key (id_document_type) references data.data_document_type (dty_id),
    constraint uk1_data_invoice unique (id_restaurant, inv_number)
  );

create index idx_invoice_restaurant on data.data_invoice (id_restaurant);

create index idx_invoice_customer on data.data_invoice (id_customer);

create index idx_invoice_access_key on data.data_invoice (inv_access_key);

create index idx_invoice_sri_status on data.data_invoice (inv_sri_status);

create index idx_invoice_date on data.data_invoice (inv_created_date);

create table
  data.data_invoice_item (
    ini_id serial primary key,
    ini_description varchar(300) not null,
    ini_quantity numeric(10, 4) not null,
    ini_unit_price numeric(10, 4) not null,
    ini_total_price numeric(10, 4) not null,
    ini_tax_rate numeric(5, 2) not null default 12.00,
    ini_tax_amount numeric(10, 4) not null,
    ini_created_date timestamp default current_timestamp,
    ini_record_status varchar(1) not null default '0',
    id_invoice int not null,
    id_product int,
    constraint fk1_data_invoice_item foreign key (id_invoice) references data.data_invoice (inv_id),
    constraint fk2_data_invoice_item foreign key (id_product) references data.data_product (pro_id)
  );

create index idx_invoice_item_invoice on data.data_invoice_item (id_invoice);

-- 7. PAGOS Y REPORTES
-- ================================================
create table
  data.data_payment_method (
    pam_id serial primary key,
    pam_name varchar(100) not null,
    pam_description varchar(200),
    pam_is_cash boolean default false,
    pam_created_date timestamp default current_timestamp,
    pam_record_status varchar(1) not null default '0'
  );

create table
  data.data_payment (
    pay_id serial primary key,
    pay_amount numeric(10, 4) not null,
    pay_reference varchar(100),
    pay_notes text,
    pay_created_date timestamp default current_timestamp,
    pay_record_status varchar(1) not null default '0',
    id_order int not null,
    id_payment_method int not null,
    constraint fk1_data_payment foreign key (id_order) references data.data_order (ord_id),
    constraint fk2_data_payment foreign key (id_payment_method) references data.data_payment_method (pam_id)
  );

create index idx_payment_order on data.data_payment (id_order);

create index idx_payment_method on data.data_payment (id_payment_method);

create index idx_payment_date on data.data_payment (pay_created_date);

create table
  data.data_daily_report (
    dre_id serial primary key,
    dre_date date not null,
    dre_total_sales numeric(10, 4) not null default 0,
    dre_total_orders int not null default 0,
    dre_total_customers int not null default 0,
    dre_average_order_value numeric(10, 4) not null default 0,
    dre_cash_sales numeric(10, 4) not null default 0,
    dre_card_sales numeric(10, 4) not null default 0,
    dre_delivery_orders int not null default 0,
    dre_dine_in_orders int not null default 0,
    dre_takeaway_orders int not null default 0,
    dre_created_date timestamp default current_timestamp,
    dre_record_status varchar(1) not null default '0',
    id_restaurant int not null,
    constraint fk1_data_daily_report foreign key (id_restaurant) references data.data_restaurant (res_id),
    constraint uk1_data_daily_report unique (id_restaurant, dre_date)
  );

create index idx_daily_report_restaurant on data.data_daily_report (id_restaurant);

create index idx_daily_report_date on data.data_daily_report (dre_date);