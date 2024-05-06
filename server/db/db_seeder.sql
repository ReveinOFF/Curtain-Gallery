USE gallery;

CREATE TABLE IF NOT EXISTS catalog (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(30) NOT NULL
);

CREATE TABLE IF NOT EXISTS subcatalog (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(30) NOT NULL,
    image VARCHAR(50) NOT NULL UNIQUE,
    catalog_id INT NOT NULL,
    FOREIGN KEY (catalog_id) REFERENCES catalog(id)
);

CREATE TABLE IF NOT EXISTS products (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(30) NOT NULL,
    image VARCHAR(50) NOT NULL UNIQUE,
    price DECIMAL(10, 2),
    composition VARCHAR(40),
    figure VARCHAR(40),
    manufacturer VARCHAR(40),
    density VARCHAR(40),
    protection VARCHAR(40),
    care VARCHAR(40),
    colors TEXT,
    subcatalog_id INT NOT NULL,
    FOREIGN KEY (subcatalog_id) REFERENCES subcatalog(id)
);


INSERT INTO catalog (name) VALUES ('Штори');
INSERT INTO catalog (name) VALUES ('Тюль');
INSERT INTO catalog (name) VALUES ('Тасьма');
INSERT INTO catalog (name) VALUES ('Кріплення магніт');
INSERT INTO catalog (name) VALUES ('Кріплення гачки');


SET @catalog_id = (
    SELECT id FROM catalog WHERE name = 'Штори'
);

INSERT INTO subcatalog (name, image, catalog_id) VALUES ('Блекаут', 'sc11.jpg', @catalog_id);
INSERT INTO subcatalog (name, image, catalog_id) VALUES ('Дімаут', 'sc12.jpg', @catalog_id);
INSERT INTO subcatalog (name, image, catalog_id) VALUES ('Дімаут', 'sc13.jpg', @catalog_id);
INSERT INTO subcatalog (name, image, catalog_id) VALUES ('Італія', 'sc14.jpg', @catalog_id);
INSERT INTO subcatalog (name, image, catalog_id) VALUES ('Мармур', 'sc15.jpg', @catalog_id);
INSERT INTO subcatalog (name, image, catalog_id) VALUES ('Граніт', 'sc16.jpg', @catalog_id);
INSERT INTO subcatalog (name, image, catalog_id) VALUES ('Ангора', 'sc17.jpg', @catalog_id);
INSERT INTO subcatalog (name, image, catalog_id) VALUES ('Дакота', 'sc18.jpg', @catalog_id);
INSERT INTO subcatalog (name, image, catalog_id) VALUES ('Бенгал', 'sc19.jpg', @catalog_id);
INSERT INTO subcatalog (name, image, catalog_id) VALUES ('Євро нобук', 'sc110.jpg', @catalog_id);
INSERT INTO subcatalog (name, image, catalog_id) VALUES ('Прованс', 'sc111.jpg', @catalog_id);

SET @catalog_id = (
    SELECT id FROM catalog WHERE name = 'Тюль'
);

INSERT INTO subcatalog (name, image, catalog_id) VALUES ('Бамбук', 'sc21.jpg', @catalog_id);
INSERT INTO subcatalog (name, image, catalog_id) VALUES ('Льон', 'sc22.jpg', @catalog_id);
INSERT INTO subcatalog (name, image, catalog_id) VALUES ('Канвас', 'sc23.jpg', @catalog_id);
INSERT INTO subcatalog (name, image, catalog_id) VALUES ('Жакард', 'sc24.jpg', @catalog_id);
INSERT INTO subcatalog (name, image, catalog_id) VALUES ('Амбре', 'sc25.jpg', @catalog_id);
INSERT INTO subcatalog (name, image, catalog_id) VALUES ('Пабло', 'sc26.jpg', @catalog_id);
INSERT INTO subcatalog (name, image, catalog_id) VALUES ('Паскаль', 'sc27.jpg', @catalog_id);
INSERT INTO subcatalog (name, image, catalog_id) VALUES ('Мармарис', 'sc28.jpg', @catalog_id);
INSERT INTO subcatalog (name, image, catalog_id) VALUES ('Каліпсо', 'sc29.jpg', @catalog_id);
INSERT INTO subcatalog (name, image, catalog_id) VALUES ('Кембек', 'sc210.jpg', @catalog_id);

SET @catalog_id = (
    SELECT id FROM catalog WHERE name = 'Тасьма'
);

INSERT INTO subcatalog (name, image, catalog_id) VALUES ('Променева', 'sc31.jpg', @catalog_id);
INSERT INTO subcatalog (name, image, catalog_id) VALUES ('Бантова', 'sc32.jpg', @catalog_id);
INSERT INTO subcatalog (name, image, catalog_id) VALUES ('Люверсна не фіксована', 'sc33.jpg', @catalog_id);
INSERT INTO subcatalog (name, image, catalog_id) VALUES ('Люверсна фіксована', 'sc34.jpg', @catalog_id);

SET @catalog_id = (
    SELECT id FROM catalog WHERE name = 'Кріплення магніт'
);

INSERT INTO subcatalog (name, image, catalog_id) VALUES ('Овал великий', 'sc41.jpg', @catalog_id);
INSERT INTO subcatalog (name, image, catalog_id) VALUES ('Великий круглий', 'sc42.jpg', @catalog_id);
INSERT INTO subcatalog (name, image, catalog_id) VALUES ('Куля', 'sc43.jpg', @catalog_id);
INSERT INTO subcatalog (name, image, catalog_id) VALUES ('Овал', 'sc44.jpg', @catalog_id);
INSERT INTO subcatalog (name, image, catalog_id) VALUES ('Кулька ниткова', 'sc45.jpg', @catalog_id);

SET @catalog_id = (
    SELECT id FROM catalog WHERE name = 'Кріплення гачки'
);

INSERT INTO subcatalog (name, image, catalog_id) VALUES ('На кільце', 'sc51.jpg', @catalog_id);
INSERT INTO subcatalog (name, image, catalog_id) VALUES ('Класичний', 'sc52.jpg', @catalog_id);


SET @subcatalog_id = (
    SELECT id FROM subcatalog WHERE name = 'Блекаут'
);

INSERT INTO products (name, image, price, composition, figure, manufacturer, density, protection, care, colors, subcatalog_id) VALUES ('Блекаут Твін двосторонній', 'p1.jpg', 1550, "Поліестер", "Однотоний", "Туреччина", "Товста", "8/10", "Прання за температури 30", "Чорний/Червоний", @subcatalog_id);
INSERT INTO products (name, image, price, composition, figure, manufacturer, density, protection, care, colors, subcatalog_id) VALUES ('Блекаут Твін двосторонній', 'p2.jpg', 1550, "Поліестер", "Однотоний", "Туреччина", "Товста", "8/10", "Прання за температури 30", "Чорний/Червоний", @subcatalog_id);
INSERT INTO products (name, image, price, composition, figure, manufacturer, density, protection, care, colors, subcatalog_id) VALUES ('Льон на блекауті Ельбрус', 'p3.jpg', 1550, "Поліестер", "Однотоний", "Туреччина", "Товста", "8/10", "Прання за температури 30", "Чорний/Червоний", @subcatalog_id);
INSERT INTO products (name, image, price, composition, figure, manufacturer, density, protection, care, colors, subcatalog_id) VALUES ('Блекаут Сахара ШТ-030', 'p4.jpg', 1550, "Поліестер", "Однотоний", "Туреччина", "Товста", "8/10", "Прання за температури 30", "Чорний/Червоний", @subcatalog_id);
INSERT INTO products (name, image, price, composition, figure, manufacturer, density, protection, care, colors, subcatalog_id) VALUES ('Блекаут Твін двосторонній', 'p5.jpg', 1550, "Поліестер", "Однотоний", "Туреччина", "Товста", "8/10", "Прання за температури 30", "Чорний/Червоний", @subcatalog_id);
INSERT INTO products (name, image, price, composition, figure, manufacturer, density, protection, care, colors, subcatalog_id) VALUES ('Блекаут Твін двосторонній', 'p6.jpg', 1550, "Поліестер", "Однотоний", "Туреччина", "Товста", "8/10", "Прання за температури 30", "Чорний/Червоний", @subcatalog_id);
INSERT INTO products (name, image, price, composition, figure, manufacturer, density, protection, care, colors, subcatalog_id) VALUES ('Блекаут Твін двосторонній', 'p7.jpg', 1550, "Поліестер", "Однотоний", "Туреччина", "Товста", "8/10", "Прання за температури 30", "Чорний/Червоний", @subcatalog_id);
INSERT INTO products (name, image, price, composition, figure, manufacturer, density, protection, care, colors, subcatalog_id) VALUES ('Блекаут Твін двосторонній', 'p8.jpg', 1550, "Поліестер", "Однотоний", "Туреччина", "Товста", "8/10", "Прання за температури 30", "Чорний/Червоний", @subcatalog_id);