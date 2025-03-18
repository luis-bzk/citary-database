-- latin countries
INSERT INTO
    core.core_country (cou_name, cou_code, cou_prefix, cou_record_status)
VALUES
    ('Argentina', '+54', 'AR', '0'),
    ('Bolivia', '+591', 'BO', '0'),
    ('Brazil', '+55', 'BR', '0'),
    ('Chile', '+56', 'CL', '0'),
    ('Colombia', '+57', 'CO', '0'),
    ('Costa Rica', '+506', 'CR', '0'),
    ('Cuba', '+53', 'CU', '0'),
    ('Dominican Republic', '+1-809', 'DO', '0'),
    ('Ecuador', '+593', 'EC', '0'),
    ('El Salvador', '+503', 'SV', '0'),
    ('Guatemala', '+502', 'GT', '0'),
    ('Honduras', '+504', 'HN', '0'),
    ('Mexico', '+52', 'MX', '0'),
    ('Nicaragua', '+505', 'NI', '0'),
    ('Panama', '+507', 'PA', '0'),
    ('Paraguay', '+595', 'PY', '0'),
    ('Peru', '+51', 'PE', '0'),
    ('Puerto Rico', '+1-787', 'PR', '0'),
    ('Uruguay', '+598', 'UY', '0'),
    ('Venezuela', '+58', 'VE', '0');

commit;

-- PROVINCES ECUADOR
INSERT INTO
    core.core_province (
        pro_name,
        pro_code,
        id_country,
        pro_prefix,
        pro_record_status
    )
VALUES
    ('Azuay', '01', 9, 'AZ', '0'),
    ('Bolívar', '02', 9, 'BO', '0'),
    ('Cañar', '03', 9, 'CA', '0'),
    ('Carchi', '04', 9, 'CR', '0'),
    ('Chimborazo', '05', 9, 'CH', '0'),
    ('Cotopaxi', '06', 9, 'CO', '0'),
    ('El Oro', '07', 9, 'EO', '0'),
    ('Esmeraldas', '08', 9, 'ES', '0'),
    ('Galápagos', '09', 9, 'GA', '0'),
    ('Guayas', '10', 9, 'GU', '0'),
    ('Imbabura', '11', 9, 'IM', '0'),
    ('Loja', '12', 9, 'LO', '0'),
    ('Los Ríos', '13', 9, 'LR', '0'),
    ('Manabí', '14', 9, 'MA', '0'),
    ('Morona Santiago', '15', 9, 'MS', '0'),
    ('Napo', '16', 9, 'NA', '0'),
    ('Orellana', '17', 9, 'OR', '0'),
    ('Pastaza', '18', 9, 'PA', '0'),
    ('Pichincha', '19', 9, 'PI', '0'),
    ('Santa Elena', '20', 9, 'SE', '0'),
    (
        'Santo Domingo de los Tsáchilas',
        '21',
        9,
        'SD',
        '0'
    ),
    ('Sucumbíos', '22', 9, 'SU', '0'),
    ('Tungurahua', '23', 9, 'TU', '0'),
    ('Zamora Chinchipe', '24', 9, 'ZC', '0');

-- PROVINCES COLOMBIA
INSERT INTO
    core.core_province (
        pro_name,
        pro_code,
        id_country,
        pro_prefix,
        pro_record_status
    )
VALUES
    ('Amazonas', '01', 5, 'AMA', '0'),
    ('Antioquia', '02', 5, 'ANT', '0'),
    ('Arauca', '03', 5, 'ARA', '0'),
    ('Atlántico', '04', 5, 'ATL', '0'),
    ('Bolívar', '05', 5, 'BOL', '0'),
    ('Boyacá', '06', 5, 'BOY', '0'),
    ('Caldas', '07', 5, 'CAL', '0'),
    ('Caquetá', '08', 5, 'CAQ', '0'),
    ('Casanare', '09', 5, 'CAS', '0'),
    ('Cauca', '10', 5, 'CAU', '0'),
    ('Cesar', '11', 5, 'CES', '0'),
    ('Chocó', '12', 5, 'CHO', '0'),
    ('Córdoba', '13', 5, 'COR', '0'),
    ('Cundinamarca', '14', 5, 'CUN', '0'),
    ('Guainía', '15', 5, 'GUA', '0'),
    ('Guaviare', '16', 5, 'GUV', '0'),
    ('Huila', '17', 5, 'HUI', '0'),
    ('La Guajira', '18', 5, 'LGU', '0'),
    ('Magdalena', '19', 5, 'MAG', '0'),
    ('Meta', '20', 5, 'MET', '0'),
    ('Nariño', '21', 5, 'NAR', '0'),
    ('Norte de Santander', '22', 5, 'NSA', '0'),
    ('Putumayo', '23', 5, 'PUT', '0'),
    ('Quindío', '24', 5, 'QUI', '0'),
    ('Risaralda', '25', 5, 'RIS', '0'),
    ('San Andrés y Providencia', '26', 5, 'SAP', '0'),
    ('Santander', '27', 5, 'SAN', '0'),
    ('Sucre', '28', 5, 'SUC', '0'),
    ('Tolima', '29', 5, 'TOL', '0'),
    ('Valle del Cauca', '30', 5, 'VCA', '0'),
    ('Vaupés', '31', 5, 'VAU', '0'),
    ('Vichada', '32', 5, 'VIC', '0');

commit;

-- CITIES ECUADOR
-- Azuay (ID 1)
INSERT INTO
    core.core_city (
        cit_name,
        id_country,
        id_province,
        cit_record_status
    )
VALUES
    ('Cuenca', 9, 1, '0'),
    ('Gualaceo', 9, 1, '0'),
    ('Paute', 9, 1, '0'),
    ('Sígsig', 9, 1, '0'),
    ('Chordeleg', 9, 1, '0');

-- Bolívar (ID 2)
INSERT INTO
    core.core_city (
        cit_name,
        id_country,
        id_province,
        cit_record_status
    )
VALUES
    ('Guaranda', 9, 2, '0'),
    ('Chillanes', 9, 2, '0'),
    ('Chimbo', 9, 2, '0'),
    ('Echeandía', 9, 2, '0'),
    ('San Miguel', 9, 2, '0');

-- Cañar (ID 3)
INSERT INTO
    core.core_city (
        cit_name,
        id_country,
        id_province,
        cit_record_status
    )
VALUES
    ('Azogues', 9, 3, '0'),
    ('Biblián', 9, 3, '0'),
    ('Cañar', 9, 3, '0'),
    ('La Troncal', 9, 3, '0'),
    ('El Tambo', 9, 3, '0');

-- Carchi (ID 4)
INSERT INTO
    core.core_city (
        cit_name,
        id_country,
        id_province,
        cit_record_status
    )
VALUES
    ('Tulcán', 9, 4, '0'),
    ('Bolívar', 9, 4, '0'),
    ('Espejo', 9, 4, '0'),
    ('Mira', 9, 4, '0'),
    ('Montúfar', 9, 4, '0');

-- Chimborazo (ID 5)
INSERT INTO
    core.core_city (
        cit_name,
        id_country,
        id_province,
        cit_record_status
    )
VALUES
    ('Riobamba', 9, 5, '0'),
    ('Alausí', 9, 5, '0'),
    ('Chambo', 9, 5, '0'),
    ('Chunchi', 9, 5, '0'),
    ('Guamote', 9, 5, '0');

-- Cotopaxi (ID 6)
INSERT INTO
    core.core_city (
        cit_name,
        id_country,
        id_province,
        cit_record_status
    )
VALUES
    ('Latacunga', 9, 6, '0'),
    ('La Maná', 9, 6, '0'),
    ('Pangua', 9, 6, '0'),
    ('Pujilí', 9, 6, '0'),
    ('Salcedo', 9, 6, '0');

-- El Oro (ID 7)
INSERT INTO
    core.core_city (
        cit_name,
        id_country,
        id_province,
        cit_record_status
    )
VALUES
    ('Machala', 9, 7, '0'),
    ('Arenillas', 9, 7, '0'),
    ('Atahualpa', 9, 7, '0'),
    ('Balsas', 9, 7, '0'),
    ('Chilla', 9, 7, '0');

-- Esmeraldas (ID 8)
INSERT INTO
    core.core_city (
        cit_name,
        id_country,
        id_province,
        cit_record_status
    )
VALUES
    ('Esmeraldas', 9, 8, '0'),
    ('Atacames', 9, 8, '0'),
    ('Eloy Alfaro', 9, 8, '0'),
    ('Muisne', 9, 8, '0'),
    ('Quinindé', 9, 8, '0');

-- Galápagos (ID 9)
INSERT INTO
    core.core_city (
        cit_name,
        id_country,
        id_province,
        cit_record_status
    )
VALUES
    ('Puerto Ayora', 9, 9, '0'),
    ('Puerto Baquerizo Moreno', 9, 9, '0'),
    ('Puerto Villamil', 9, 9, '0');

-- Guayas (ID 10)
INSERT INTO
    core.core_city (
        cit_name,
        id_country,
        id_province,
        cit_record_status
    )
VALUES
    ('Guayaquil', 9, 10, '0'),
    ('Durán', 9, 10, '0'),
    ('Milagro', 9, 10, '0'),
    ('Samborondón', 9, 10, '0'),
    ('Daule', 9, 10, '0');

-- Imbabura (ID 11)
INSERT INTO
    core.core_city (
        cit_name,
        id_country,
        id_province,
        cit_record_status
    )
VALUES
    ('Ibarra', 9, 11, '0'),
    ('Antonio Ante', 9, 11, '0'),
    ('Cotacachi', 9, 11, '0'),
    ('Otavalo', 9, 11, '0'),
    ('Pimampiro', 9, 11, '0');

-- Loja (ID 12)
INSERT INTO
    core.core_city (
        cit_name,
        id_country,
        id_province,
        cit_record_status
    )
VALUES
    ('Loja', 9, 12, '0'),
    ('Calvas', 9, 12, '0'),
    ('Catamayo', 9, 12, '0'),
    ('Celica', 9, 12, '0'),
    ('Chaguarpamba', 9, 12, '0');

-- Los Ríos (ID 13)
INSERT INTO
    core.core_city (
        cit_name,
        id_country,
        id_province,
        cit_record_status
    )
VALUES
    ('Babahoyo', 9, 13, '0'),
    ('Buena Fe', 9, 13, '0'),
    ('Quevedo', 9, 13, '0'),
    ('Vinces', 9, 13, '0'),
    ('Ventanas', 9, 13, '0');

-- Manabí (ID 14)
INSERT INTO
    core.core_city (
        cit_name,
        id_country,
        id_province,
        cit_record_status
    )
VALUES
    ('Portoviejo', 9, 14, '0'),
    ('Manta', 9, 14, '0'),
    ('Chone', 9, 14, '0'),
    ('Bahía de Caráquez', 9, 14, '0'),
    ('Jipijapa', 9, 14, '0');

-- Morona Santiago (ID 15)
INSERT INTO
    core.core_city (
        cit_name,
        id_country,
        id_province,
        cit_record_status
    )
VALUES
    ('Macas', 9, 15, '0'),
    ('Gualaquiza', 9, 15, '0'),
    ('Huamboya', 9, 15, '0'),
    ('Limón Indanza', 9, 15, '0'),
    ('Santiago', 9, 15, '0');

-- Napo (ID 16)
INSERT INTO
    core.core_city (
        cit_name,
        id_country,
        id_province,
        cit_record_status
    )
VALUES
    ('Tena', 9, 16, '0'),
    ('Archidona', 9, 16, '0'),
    ('El Chaco', 9, 16, '0'),
    ('Quijos', 9, 16, '0'),
    ('Carlos Julio Arosemena Tola', 9, 16, '0');

-- Orellana (ID 17)
INSERT INTO
    core.core_city (
        cit_name,
        id_country,
        id_province,
        cit_record_status
    )
VALUES
    ('Francisco de Orellana', 9, 17, '0'),
    ('Aguarico', 9, 17, '0'),
    ('La Joya de los Sachas', 9, 17, '0'),
    ('Loreto', 9, 17, '0');

-- Pastaza (ID 18)
INSERT INTO
    core.core_city (
        cit_name,
        id_country,
        id_province,
        cit_record_status
    )
VALUES
    ('Puyo', 9, 18, '0'),
    ('Mera', 9, 18, '0'),
    ('Santa Clara', 9, 18, '0'),
    ('Arajuno', 9, 18, '0');

-- Pichincha (ID 19)
INSERT INTO
    core.core_city (
        cit_name,
        id_country,
        id_province,
        cit_record_status
    )
VALUES
    ('Quito', 9, 19, '0'),
    ('Cayambe', 9, 19, '0'),
    ('Mejía', 9, 19, '0'),
    ('Pedro Moncayo', 9, 19, '0'),
    ('Rumiñahui', 9, 19, '0');

-- Santa Elena (ID 20)
INSERT INTO
    core.core_city (
        cit_name,
        id_country,
        id_province,
        cit_record_status
    )
VALUES
    ('Santa Elena', 9, 20, '0'),
    ('La Libertad', 9, 20, '0'),
    ('Salinas', 9, 20, '0');

-- Santo Domingo de los Tsáchilas (ID 21)
INSERT INTO
    core.core_city (
        cit_name,
        id_country,
        id_province,
        cit_record_status
    )
VALUES
    ('Santo Domingo', 9, 21, '0'),
    ('La Concordia', 9, 21, '0');

-- Sucumbíos (ID 22)
INSERT INTO
    core.core_city (
        cit_name,
        id_country,
        id_province,
        cit_record_status
    )
VALUES
    ('Nueva Loja', 9, 22, '0'),
    ('Cascales', 9, 22, '0'),
    ('Cuyabeno', 9, 22, '0'),
    ('Gonzalo Pizarro', 9, 22, '0'),
    ('Lago Agrio', 9, 22, '0');

-- Tungurahua (ID 23)
INSERT INTO
    core.core_city (
        cit_name,
        id_country,
        id_province,
        cit_record_status
    )
VALUES
    ('Ambato', 9, 23, '0'),
    ('Baños de Agua Santa', 9, 23, '0'),
    ('Cevallos', 9, 23, '0'),
    ('Mocha', 9, 23, '0'),
    ('Patate', 9, 23, '0');

-- Zamora Chinchipe (ID 24)
INSERT INTO
    core.core_city (
        cit_name,
        id_country,
        id_province,
        cit_record_status
    )
VALUES
    ('Zamora', 9, 24, '0'),
    ('Chinchipe', 9, 24, '0'),
    ('Nangaritza', 9, 24, '0'),
    ('Yacuambi', 9, 24, '0'),
    ('Yantzaza', 9, 24, '0');

-- CITIES COLOMBIA
-- Amazonas (ID 1)
INSERT INTO
    core.core_city (
        cit_name,
        id_country,
        id_province,
        cit_record_status
    )
VALUES
    ('Leticia', 5, 1, '0'),
    ('Puerto Nariño', 5, 1, '0');

-- Antioquia (ID 2)
INSERT INTO
    core.core_city (
        cit_name,
        id_country,
        id_province,
        cit_record_status
    )
VALUES
    ('Medellín', 5, 2, '0'),
    ('Bello', 5, 2, '0'),
    ('Itagüí', 5, 2, '0'),
    ('Envigado', 5, 2, '0'),
    ('Apartadó', 5, 2, '0');

-- Arauca (ID 3)
INSERT INTO
    core.core_city (
        cit_name,
        id_country,
        id_province,
        cit_record_status
    )
VALUES
    ('Arauca', 5, 3, '0'),
    ('Arauquita', 5, 3, '0'),
    ('Saravena', 5, 3, '0');

-- Atlántico (ID 4)
INSERT INTO
    core.core_city (
        cit_name,
        id_country,
        id_province,
        cit_record_status
    )
VALUES
    ('Barranquilla', 5, 4, '0'),
    ('Soledad', 5, 4, '0'),
    ('Malambo', 5, 4, '0');

-- Bolívar (ID 5)
INSERT INTO
    core.core_city (
        cit_name,
        id_country,
        id_province,
        cit_record_status
    )
VALUES
    ('Cartagena', 5, 5, '0'),
    ('Magangué', 5, 5, '0'),
    ('Turbaco', 5, 5, '0');

-- Boyacá (ID 6)
INSERT INTO
    core.core_city (
        cit_name,
        id_country,
        id_province,
        cit_record_status
    )
VALUES
    ('Tunja', 5, 6, '0'),
    ('Duitama', 5, 6, '0'),
    ('Sogamoso', 5, 6, '0');

-- Caldas (ID 7)
INSERT INTO
    core.core_city (
        cit_name,
        id_country,
        id_province,
        cit_record_status
    )
VALUES
    ('Manizales', 5, 7, '0'),
    ('Villamaría', 5, 7, '0'),
    ('Chinchiná', 5, 7, '0');

-- Caquetá (ID 8)
INSERT INTO
    core.core_city (
        cit_name,
        id_country,
        id_province,
        cit_record_status
    )
VALUES
    ('Florencia', 5, 8, '0'),
    ('San Vicente del Caguán', 5, 8, '0');

-- Casanare (ID 9)
INSERT INTO
    core.core_city (
        cit_name,
        id_country,
        id_province,
        cit_record_status
    )
VALUES
    ('Yopal', 5, 9, '0'),
    ('Aguazul', 5, 9, '0'),
    ('Villanueva', 5, 9, '0');

-- Cauca (ID 10)
INSERT INTO
    core.core_city (
        cit_name,
        id_country,
        id_province,
        cit_record_status
    )
VALUES
    ('Popayán', 5, 10, '0'),
    ('Santander de Quilichao', 5, 10, '0'),
    ('Guapi', 5, 10, '0');

-- Cesar (ID 11)
INSERT INTO
    core.core_city (
        cit_name,
        id_country,
        id_province,
        cit_record_status
    )
VALUES
    ('Valledupar', 5, 11, '0'),
    ('Aguachica', 5, 11, '0'),
    ('Bosconia', 5, 11, '0');

-- Chocó (ID 12)
INSERT INTO
    core.core_city (
        cit_name,
        id_country,
        id_province,
        cit_record_status
    )
VALUES
    ('Quibdó', 5, 12, '0'),
    ('Istmina', 5, 12, '0'),
    ('Riosucio', 5, 12, '0');

-- Córdoba (ID 13)
INSERT INTO
    core.core_city (
        cit_name,
        id_country,
        id_province,
        cit_record_status
    )
VALUES
    ('Montería', 5, 13, '0'),
    ('Cereté', 5, 13, '0'),
    ('Sahagún', 5, 13, '0');

-- Cundinamarca (ID 14)
INSERT INTO
    core.core_city (
        cit_name,
        id_country,
        id_province,
        cit_record_status
    )
VALUES
    ('Bogotá', 5, 14, '0'),
    ('Soacha', 5, 14, '0'),
    ('Girardot', 5, 14, '0');

-- Guainía (ID 15)
INSERT INTO
    core.core_city (
        cit_name,
        id_country,
        id_province,
        cit_record_status
    )
VALUES
    ('Inírida', 5, 15, '0');

-- Guaviare (ID 16)
INSERT INTO
    core.core_city (
        cit_name,
        id_country,
        id_province,
        cit_record_status
    )
VALUES
    ('San José del Guaviare', 5, 16, '0');

-- Huila (ID 17)
INSERT INTO
    core.core_city (
        cit_name,
        id_country,
        id_province,
        cit_record_status
    )
VALUES
    ('Neiva', 5, 17, '0'),
    ('Pitalito', 5, 17, '0'),
    ('Garzón', 5, 17, '0');

-- La Guajira (ID 18)
INSERT INTO
    core.core_city (
        cit_name,
        id_country,
        id_province,
        cit_record_status
    )
VALUES
    ('Riohacha', 5, 18, '0'),
    ('Maicao', 5, 18, '0'),
    ('Uribia', 5, 18, '0');

-- Magdalena (ID 19)
INSERT INTO
    core.core_city (
        cit_name,
        id_country,
        id_province,
        cit_record_status
    )
VALUES
    ('Santa Marta', 5, 19, '0'),
    ('Ciénaga', 5, 19, '0'),
    ('Fundación', 5, 19, '0');

-- Meta (ID 20)
INSERT INTO
    core.core_city (
        cit_name,
        id_country,
        id_province,
        cit_record_status
    )
VALUES
    ('Villavicencio', 5, 20, '0'),
    ('Acacías', 5, 20, '0'),
    ('Granada', 5, 20, '0');

-- Nariño (ID 21)
INSERT INTO
    core.core_city (
        cit_name,
        id_country,
        id_province,
        cit_record_status
    )
VALUES
    ('Pasto', 5, 21, '0'),
    ('Tumaco', 5, 21, '0'),
    ('Ipiales', 5, 21, '0');

-- Norte de Santander (ID 22)
INSERT INTO
    core.core_city (
        cit_name,
        id_country,
        id_province,
        cit_record_status
    )
VALUES
    ('Cúcuta', 5, 22, '0'),
    ('Ocaña', 5, 22, '0'),
    ('Pamplona', 5, 22, '0');

-- Putumayo (ID 23)
INSERT INTO
    core.core_city (
        cit_name,
        id_country,
        id_province,
        cit_record_status
    )
VALUES
    ('Mocoa', 5, 23, '0'),
    ('Puerto Asís', 5, 23, '0');

-- Quindío (ID 24)
INSERT INTO
    core.core_city (
        cit_name,
        id_country,
        id_province,
        cit_record_status
    )
VALUES
    ('Armenia', 5, 24, '0'),
    ('Calarcá', 5, 24, '0'),
    ('La Tebaida', 5, 24, '0');

-- Risaralda (ID 25)
INSERT INTO
    core.core_city (
        cit_name,
        id_country,
        id_province,
        cit_record_status
    )
VALUES
    ('Pereira', 5, 25, '0'),
    ('Dosquebradas', 5, 25, '0'),
    ('Santa Rosa de Cabal', 5, 25, '0');

-- San Andrés y Providencia (ID 26)
INSERT INTO
    core.core_city (
        cit_name,
        id_country,
        id_province,
        cit_record_status
    )
VALUES
    ('San Andrés', 5, 26, '0'),
    ('Providencia', 5, 26, '0');

-- Santander (ID 27)
INSERT INTO
    core.core_city (
        cit_name,
        id_country,
        id_province,
        cit_record_status
    )
VALUES
    ('Bucaramanga', 5, 27, '0'),
    ('Floridablanca', 5, 27, '0'),
    ('Barrancabermeja', 5, 27, '0');

-- Sucre (ID 28)
INSERT INTO
    core.core_city (
        cit_name,
        id_country,
        id_province,
        cit_record_status
    )
VALUES
    ('Sincelejo', 5, 28, '0'),
    ('Corozal', 5, 28, '0'),
    ('Sampués', 5, 28, '0');

-- Tolima (ID 29)
INSERT INTO
    core.core_city (
        cit_name,
        id_country,
        id_province,
        cit_record_status
    )
VALUES
    ('Ibagué', 5, 29, '0'),
    ('Espinal', 5, 29, '0'),
    ('Melgar', 5, 29, '0');

-- Valle del Cauca (ID 30)
INSERT INTO
    core.core_city (
        cit_name,
        id_country,
        id_province,
        cit_record_status
    )
VALUES
    ('Cali', 5, 30, '0'),
    ('Palmira', 5, 30, '0'),
    ('Buenaventura', 5, 30, '0');

-- Vaupés (ID 31)
INSERT INTO
    core.core_city (
        cit_name,
        id_country,
        id_province,
        cit_record_status
    )
VALUES
    ('Mitú', 5, 31, '0');

-- Vichada (ID 32)
INSERT INTO
    core.core_city (
        cit_name,
        id_country,
        id_province,
        cit_record_status
    )
VALUES
    ('Puerto Carreño', 5, 32, '0');

commit;

------------------- USERS -------------------
insert into
    core.core_user (
        use_name,
        use_last_name,
        use_email,
        use_password,
        use_token,
        use_created_date,
        use_record_status
    )
values
    (
        'Luis',
        'Berrezueta',
        'luis@gmail.com',
        'password',
        null,
        current_timestamp,
        '0'
    );

insert into
    core.core_user (
        use_name,
        use_last_name,
        use_email,
        use_password,
        use_token,
        use_created_date,
        use_record_status
    )
values
    (
        'Maria',
        'Sanchez',
        'msanchexz@gmail.com',
        'password',
        null,
        current_timestamp,
        '0'
    );

insert into
    core.core_user (
        use_name,
        use_last_name,
        use_email,
        use_password,
        use_token,
        use_created_date,
        use_record_status
    )
values
    (
        'Andres',
        'Montero',
        'amontero192@gmail.com',
        'password',
        null,
        current_timestamp,
        '0'
    );

insert into
    core.core_user (
        use_name,
        use_last_name,
        use_email,
        use_password,
        use_token,
        use_created_date,
        use_record_status
    )
values
    (
        'Jina',
        'Ferrero',
        'jianaafer@gmail.com',
        'password',
        null,
        current_timestamp,
        '0'
    );

commit;

------------------- ROLES -------------------
insert into
    core.core_role (
        rol_name,
        rol_description,
        rol_created_date,
        rol_record_status
    )
values
    ('ADMIN', 'Admin role', current_timestamp, '0');

insert into
    core.core_role (
        rol_name,
        rol_description,
        rol_created_date,
        rol_record_status
    )
values
    (
        'DEVELOPER',
        'Developer role',
        current_timestamp,
        '0'
    );

insert into
    core.core_role (
        rol_name,
        rol_description,
        rol_created_date,
        rol_record_status
    )
values
    ('USER', 'User role', current_timestamp, '0');

insert into
    core.core_role (
        rol_name,
        rol_description,
        rol_created_date,
        rol_record_status
    )
values
    ('DOCTOR', 'User role', current_timestamp, '0');

insert into
    core.core_role (
        rol_name,
        rol_description,
        rol_created_date,
        rol_record_status
    )
values
    ('PATIENT', 'User role', current_timestamp, '0');

commit;

------------------- USER ROLES -------------------
insert into
    core.core_user_role (
        uro_created_date,
        uro_record_status,
        id_user,
        id_role
    )
values
    (current_timestamp, '0', 1, 1);

insert into
    core.core_user_role (
        uro_created_date,
        uro_record_status,
        id_user,
        id_role
    )
values
    (current_timestamp, '0', 1, 2);

insert into
    core.core_user_role (
        uro_created_date,
        uro_record_status,
        id_user,
        id_role
    )
values
    (current_timestamp, '0', 1, 3);

insert into
    core.core_user_role (
        uro_created_date,
        uro_record_status,
        id_user,
        id_role
    )
values
    (current_timestamp, '0', 2, 3);

insert into
    core.core_user_role (
        uro_created_date,
        uro_record_status,
        id_user,
        id_role
    )
values
    (current_timestamp, '0', 2, 4);

insert into
    core.core_user_role (
        uro_created_date,
        uro_record_status,
        id_user,
        id_role
    )
values
    (current_timestamp, '0', 3, 3);

insert into
    core.core_user_role (
        uro_created_date,
        uro_record_status,
        id_user,
        id_role
    )
values
    (current_timestamp, '0', 3, 5);

insert into
    core.core_user_role (
        uro_created_date,
        uro_record_status,
        id_user,
        id_role
    )
values
    (current_timestamp, '0', 4, 3);

insert into
    core.core_user_role (
        uro_created_date,
        uro_record_status,
        id_user,
        id_role
    )
values
    (current_timestamp, '0', 4, 5);

commit;

------------------- GENRE -------------------
insert into
    core.core_genre (
        gen_name,
        gen_description,
        gen_abbreviation,
        gen_created_date,
        gen_record_status
    )
values
    (
        'masculino',
        'genero masculino',
        'm',
        current_timestamp,
        '0'
    );

insert into
    core.core_genre (
        gen_name,
        gen_description,
        gen_abbreviation,
        gen_created_date,
        gen_record_status
    )
values
    (
        'femenino',
        'genero femenino',
        'f',
        current_timestamp,
        '0'
    );

insert into
    core.core_genre (
        gen_name,
        gen_description,
        gen_abbreviation,
        gen_created_date,
        gen_record_status
    )
values
    (
        'no binario',
        'genero no binario',
        'nb',
        current_timestamp,
        '0'
    );

insert into
    core.core_genre (
        gen_name,
        gen_description,
        gen_abbreviation,
        gen_created_date,
        gen_record_status
    )
values
    ('gay', 'genero gay', 'g', current_timestamp, '0');

insert into
    core.core_genre (
        gen_name,
        gen_description,
        gen_abbreviation,
        gen_created_date,
        gen_record_status
    )
values
    (
        'lesbiana',
        'genero lesbiana',
        'l',
        current_timestamp,
        '0'
    );

insert into
    core.core_genre (
        gen_name,
        gen_description,
        gen_abbreviation,
        gen_created_date,
        gen_record_status
    )
values
    (
        'trans',
        'genero transexual',
        't',
        current_timestamp,
        '0'
    );

commit;

------------------- IDENTIFICATION TYPE -------------------
insert into
    core.core_identification_type (
        ity_name,
        ity_description,
        ity_abbreviation,
        ity_created_date,
        ity_record_status,
        id_country
    )
values
    (
        'cédula',
        'cédula de identificación ecuatoriana',
        'ci',
        current_timestamp,
        '0',
        (
            select
                cc.cou_id
            from
                core.core_country cc
            where
                cc.cou_prefix = 'EC'
        )
    );

insert into
    core.core_identification_type (
        ity_name,
        ity_description,
        ity_abbreviation,
        ity_created_date,
        ity_record_status,
        id_country
    )
values
    (
        'pasaporte',
        'pasaporte ecuatoriano',
        'pp',
        current_timestamp,
        '0',
        (
            select
                cc.cou_id
            from
                core.core_country cc
            where
                cc.cou_prefix = 'EC'
        )
    );

commit;

------------------- PHONE TYPE -------------------
insert into
    core.core_phone_type (
        pty_name,
        pty_description,
        pty_created_date,
        pty_record_status
    )
values
    (
        'principal',
        'número de teléfono principal',
        current_timestamp,
        '0'
    );

insert into
    core.core_phone_type (
        pty_name,
        pty_description,
        pty_created_date,
        pty_record_status
    )
values
    (
        'hogar',
        'número de teléfono del hogar',
        current_timestamp,
        '0'
    );

insert into
    core.core_phone_type (
        pty_name,
        pty_description,
        pty_created_date,
        pty_record_status
    )
values
    (
        'secundario',
        'número de teléfono adicional',
        current_timestamp,
        '0'
    );

commit;

------------------- PAYMENT METHOD -------------------
insert into
    core.core_payment_method (
        pme_name,
        pme_description,
        pme_created_date,
        pme_record_status
    )
values
    (
        'efectivo',
        'pago en efectivo',
        current_timestamp,
        '0'
    );

insert into
    core.core_payment_method (
        pme_name,
        pme_description,
        pme_created_date,
        pme_record_status
    )
values
    (
        'tarjeta',
        'pago con tarjeta de débito o crédito',
        current_timestamp,
        '0'
    );

insert into
    core.core_payment_method (
        pme_name,
        pme_description,
        pme_created_date,
        pme_record_status
    )
values
    (
        'transferencia',
        'pago mediante transferencia interbancaria',
        current_timestamp,
        '0'
    );

commit;

------------------- NOTIFICATION TYPE -------------------
insert into
    core.core_notification_type (
        nty_name,
        nty_description,
        nty_created_date,
        nty_record_status
    )
values
    (
        'alerta',
        'mensaje de alerta',
        current_timestamp,
        '0'
    );

insert into
    core.core_notification_type (
        nty_name,
        nty_description,
        nty_created_date,
        nty_record_status
    )
values
    (
        'error',
        'mensaje de error',
        current_timestamp,
        '0'
    );

insert into
    core.core_notification_type (
        nty_name,
        nty_description,
        nty_created_date,
        nty_record_status
    )
values
    (
        'recordatorio',
        'mensaje para recordar',
        current_timestamp,
        '0'
    );

commit;