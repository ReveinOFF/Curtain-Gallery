CREATE TABLE IF NOT EXISTS catalog (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(30) NOT NULL
);

CREATE TABLE IF NOT EXISTS subcatalog (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(30) NOT NULL,
    image VARCHAR(50) NOT NULL,
    catalog_id INT NOT NULL,
    FOREIGN KEY (catalog_id) REFERENCES catalog(id)
);

CREATE TABLE IF NOT EXISTS products (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(30) NOT NULL,
    image VARCHAR(50) NOT NULL,
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