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
    image_s1 VARCHAR(50) NOT NULL UNIQUE,
    image_s2 VARCHAR(50) NOT NULL UNIQUE,
    image_s3 VARCHAR(50) NOT NULL UNIQUE,
    price DECIMAL(10, 2),
    composition VARCHAR(40),
    figure VARCHAR(40),
    manufacturer VARCHAR(40),
    density VARCHAR(40),
    protection VARCHAR(40),
    care VARCHAR(40),
    colors TEXT,
    is_exist BOOLEAN,
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

INSERT INTO subcatalog (name, image, catalog_id) VALUES ('Блекаут', 'sc11.png', @catalog_id);
INSERT INTO subcatalog (name, image, catalog_id) VALUES ('Дімаут', 'sc12.png', @catalog_id);
INSERT INTO subcatalog (name, image, catalog_id) VALUES ('Дімаут', 'sc13.png', @catalog_id);
INSERT INTO subcatalog (name, image, catalog_id) VALUES ('Італія', 'sc14.png', @catalog_id);
INSERT INTO subcatalog (name, image, catalog_id) VALUES ('Мармур', 'sc15.png', @catalog_id);
INSERT INTO subcatalog (name, image, catalog_id) VALUES ('Граніт', 'sc16.png', @catalog_id);
INSERT INTO subcatalog (name, image, catalog_id) VALUES ('Ангора', 'sc17.png', @catalog_id);
INSERT INTO subcatalog (name, image, catalog_id) VALUES ('Дакота', 'sc18.png', @catalog_id);
INSERT INTO subcatalog (name, image, catalog_id) VALUES ('Бенгал', 'sc19.png', @catalog_id);
INSERT INTO subcatalog (name, image, catalog_id) VALUES ('Євро нобук', 'sc110.png', @catalog_id);
INSERT INTO subcatalog (name, image, catalog_id) VALUES ('Прованс', 'sc111.png', @catalog_id);

SET @catalog_id = (
    SELECT id FROM catalog WHERE name = 'Тюль'
);

INSERT INTO subcatalog (name, image, catalog_id) VALUES ('Бамбук', 'sc21.png', @catalog_id);
INSERT INTO subcatalog (name, image, catalog_id) VALUES ('Льон', 'sc22.png', @catalog_id);
INSERT INTO subcatalog (name, image, catalog_id) VALUES ('Канвас', 'sc23.png', @catalog_id);
INSERT INTO subcatalog (name, image, catalog_id) VALUES ('Жакард', 'sc24.png', @catalog_id);
INSERT INTO subcatalog (name, image, catalog_id) VALUES ('Амбре', 'sc25.png', @catalog_id);
INSERT INTO subcatalog (name, image, catalog_id) VALUES ('Пабло', 'sc26.png', @catalog_id);
INSERT INTO subcatalog (name, image, catalog_id) VALUES ('Паскаль', 'sc27.png', @catalog_id);
INSERT INTO subcatalog (name, image, catalog_id) VALUES ('Мармарис', 'sc28.png', @catalog_id);
INSERT INTO subcatalog (name, image, catalog_id) VALUES ('Каліпсо', 'sc29.png', @catalog_id);
INSERT INTO subcatalog (name, image, catalog_id) VALUES ('Кембек', 'sc210.png', @catalog_id);

SET @catalog_id = (
    SELECT id FROM catalog WHERE name = 'Тасьма'
);

INSERT INTO subcatalog (name, image, catalog_id) VALUES ('Променева', 'sc31.png', @catalog_id);
INSERT INTO subcatalog (name, image, catalog_id) VALUES ('Бантова', 'sc32.png', @catalog_id);
INSERT INTO subcatalog (name, image, catalog_id) VALUES ('Люверсна не фіксована', 'sc33.png', @catalog_id);
INSERT INTO subcatalog (name, image, catalog_id) VALUES ('Люверсна фіксована', 'sc34.png', @catalog_id);

SET @catalog_id = (
    SELECT id FROM catalog WHERE name = 'Кріплення магніт'
);

INSERT INTO subcatalog (name, image, catalog_id) VALUES ('Овал великий', 'sc41.png', @catalog_id);
INSERT INTO subcatalog (name, image, catalog_id) VALUES ('Великий круглий', 'sc42.png', @catalog_id);
INSERT INTO subcatalog (name, image, catalog_id) VALUES ('Куля', 'sc43.png', @catalog_id);
INSERT INTO subcatalog (name, image, catalog_id) VALUES ('Овал', 'sc44.png', @catalog_id);
INSERT INTO subcatalog (name, image, catalog_id) VALUES ('Кулька ниткова', 'sc45.png', @catalog_id);

SET @catalog_id = (
    SELECT id FROM catalog WHERE name = 'Кріплення гачки'
);

INSERT INTO subcatalog (name, image, catalog_id) VALUES ('На кільце', 'sc51.png', @catalog_id);
INSERT INTO subcatalog (name, image, catalog_id) VALUES ('Класичний', 'sc52.png', @catalog_id);


SET @subcatalog_id = (
    SELECT id FROM subcatalog WHERE name = 'Блекаут'
);

INSERT INTO products (name, image, image_s1, image_s2, image_s3, price, composition, figure, manufacturer, density, protection, care, colors, is_exist, subcatalog_id) VALUES ('Блекаут Твін двосторонній', 'p1.png', 'p11.png', 'p12.jpg', 'p13.jpg', 1550, "Поліестер", "Однотоний", "Туреччина", "Товста", "8/10", "Прання за температури 30", "Чорний.png/Червоний.png/Світло-Фіолетовий.png/Коричневий.png/Зелений.png/Оранжевий.png/Шампань.png/Бірюзовий.png", 1, @subcatalog_id);
INSERT INTO products (name, image, image_s1, image_s2, image_s3, price, composition, figure, manufacturer, density, protection, care, colors, is_exist, subcatalog_id) VALUES ('Блекаут Твін двосторонній', 'p2.png', 'p21.png', 'p22.png', 'p23.png', 1550, "Поліестер", "Однотоний", "Туреччина", "Товста", "8/10", "Прання за температури 30", "Чорний.png/Червоний.png/Світло-Фіолетовий.png/Коричневий.png/Зелений.png/Оранжевий.png/Шампань.png/Бірюзовий.png", 1, @subcatalog_id);
INSERT INTO products (name, image, image_s1, image_s2, image_s3, price, composition, figure, manufacturer, density, protection, care, colors, is_exist, subcatalog_id) VALUES ('Льон на блекауті Ельбрус', 'p3.png', 'p31.png', 'p32.png', 'p33.png', 1550, "Поліестер", "Однотоний", "Туреччина", "Товста", "8/10", "Прання за температури 30", "Чорний.png/Червоний.png/Світло-Фіолетовий.png/Коричневий.png/Зелений.png/Оранжевий.png/Шампань.png/Бірюзовий.png", 1, @subcatalog_id);
INSERT INTO products (name, image, image_s1, image_s2, image_s3, price, composition, figure, manufacturer, density, protection, care, colors, is_exist, subcatalog_id) VALUES ('Блекаут Сахара ШТ-030', 'p4.png', 'p41.png', 'p42.png', 'p43.png', 1550, "Поліестер", "Однотоний", "Туреччина", "Товста", "8/10", "Прання за температури 30", "Чорний.png/Червоний.png/Світло-Фіолетовий.png/Коричневий.png/Зелений.png/Оранжевий.png/Шампань.png/Бірюзовий.png", 1, @subcatalog_id);
INSERT INTO products (name, image, image_s1, image_s2, image_s3, price, composition, figure, manufacturer, density, protection, care, colors, is_exist, subcatalog_id) VALUES ('Блекаут Твін двосторонній', 'p5.png', 'p51.png', 'p52.png', 'p53.png', 1550, "Поліестер", "Однотоний", "Туреччина", "Товста", "8/10", "Прання за температури 30", "Чорний.png/Червоний.png/Світло-Фіолетовий.png/Коричневий.png/Зелений.png/Оранжевий.png/Шампань.png/Бірюзовий.png", 1, @subcatalog_id);
INSERT INTO products (name, image, image_s1, image_s2, image_s3, price, composition, figure, manufacturer, density, protection, care, colors, is_exist, subcatalog_id) VALUES ('Блекаут Твін двосторонній', 'p6.png', 'p61.png', 'p62.png', 'p63.png', 1550, "Поліестер", "Однотоний", "Туреччина", "Товста", "8/10", "Прання за температури 30", "Чорний.png/Червоний.png/Світло-Фіолетовий.png/Коричневий.png/Зелений.png/Оранжевий.png/Шампань.png/Бірюзовий.png", 1, @subcatalog_id);
INSERT INTO products (name, image, image_s1, image_s2, image_s3, price, composition, figure, manufacturer, density, protection, care, colors, is_exist, subcatalog_id) VALUES ('Блекаут Твін двосторонній', 'p7.png', 'p71.png', 'p72.png', 'p73.png', 1550, "Поліестер", "Однотоний", "Туреччина", "Товста", "8/10", "Прання за температури 30", "Чорний.png/Червоний.png/Світло-Фіолетовий.png/Коричневий.png/Зелений.png/Оранжевий.png/Шампань.png/Бірюзовий.png", 1, @subcatalog_id);
INSERT INTO products (name, image, image_s1, image_s2, image_s3, price, composition, figure, manufacturer, density, protection, care, colors, is_exist, subcatalog_id) VALUES ('Блекаут Твін двосторонній', 'p8.png', 'p81.png', 'p82.png', 'p83.png', 1550, "Поліестер", "Однотоний", "Туреччина", "Товста", "8/10", "Прання за температури 30", "Чорний.png/Червоний.png/Світло-Фіолетовий.png/Коричневий.png/Зелений.png/Оранжевий.png/Шампань.png/Бірюзовий.png", 0, @subcatalog_id);