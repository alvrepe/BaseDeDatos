USE game_management;

-- 1. Crea los siguientes registros en la tabla genres
-- a. Mediante un solo comando: Action, Adventure, Fighting, Misc, Platform, Puzzle,
INSERT INTO genres (genre_name)
VALUES 
('Action'),
('Adventure'),
('Fighting'),
('Misc'),
('Platform'),
('Puzzle');

select * from genres;
 
-- b. Cada opción un comando en un insert: Racing, Role-Playing, Shooter, Simulation, Sports, Strategy
INSERT INTO genres (genre_name)
VALUES ('Racing');
INSERT INTO genres (genre_name)
VALUES ('Role-Playing');
INSERT INTO genres (genre_name)
VALUES ('Shooter');
INSERT INTO genres (genre_name)
VALUES ('Simulation');
INSERT INTO genres (genre_name)
VALUES ('Sports');
INSERT INTO genres (genre_name)
VALUES ('Strategy');

select * from genres;

-- 2. Crea los siguientes registros en la tabla platforms
-- (1,'Wii U'),(2,'PS5'),(3,'XBOX ONE'),(4,'PS3')
-- (5,'3DS'),(6,'PS4'),(7,'PC')
INSERT INTO platforms (platform_name)
VALUES 
('Wii U'),
('PS5'),
('XBOX ONE'),
('PS3'),
('3DS'),
('PS4'),
('PC');

select * from platforms;

-- 3. Crea los siguientes registros en la tabla publisers mediante un solo comando insert
-- (1,'10TACLE Studios'),(2,'1C Company'),(3,'20th Century Fox Video Games')
-- (4,'Activision'),(5,'Activision Blizzard'),(6,'Activision Value')

INSERT INTO publishers (publisher_name)
VALUES 
('10TACLE Studios'),
('1C Company'),
('20th Century Fox Video Games'),
('Activision'),
('Activision Blizzard'),
('Activision Value');

select * from publishers;

-- 4. Crea los siguientes registros en la tabla regions mediante un solo comando insert
-- (1,'North America'),(2,'Europe'),(3,'Japan'),(4,'Other')

INSERT INTO regions (region_name)
VALUES ('North America');
INSERT INTO regions (region_name)
VALUES ('Europe');
INSERT INTO regions (region_name)
VALUES ('Japan');
INSERT INTO regions (region_name)
VALUES ('Other');

select * from regions;

-- 5. Crea los campos 'created_at' y 'updated_at' para las siguientes tablas:
-- a. game, game_publisher y game_platform
-- b. NOTA: los campos deben guardar por defecto la fecha actual

ALTER TABLE games ADD (
	created_at  DATETIME DEFAULT NOW(),
    updated_at DATETIME DEFAULT NOW()
);
ALTER TABLE game_publishers ADD (
	created_at  DATETIME DEFAULT NOW(),
    updated_at DATETIME DEFAULT NOW()
);
ALTER TABLE game_platforms ADD (
	created_at  DATETIME DEFAULT NOW(),
    updated_at DATETIME DEFAULT NOW()
);


select * from game_platforms;
-- c. Inserta 2 registros en cada una de las tablas anteriores
INSERT INTO games (game_name, genre_id)
VALUES 
('Call of duty', '9'),
('Mario Bross', '5');

INSERT INTO game_publishers (game_id, publisher_id)
VALUES 
('1','4'),
('2','1');

INSERT INTO game_platforms (game_publisher_id, platform_id, release_year)
VALUES 
('1','14','1997'),
('2','8','1993');

