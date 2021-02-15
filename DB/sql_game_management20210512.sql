CREATE SCHEMA game_management;

USE game_management;

CREATE TABLE genres (
	id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    genre_name VARCHAR (20) NOT NULL
);

CREATE TABLE games (
	id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    genre_id INT NOT NULL,
    game_name VARCHAR(40) NOT NULL,
    CONSTRAINT fk_games
    FOREIGN KEY (genre_id)
    REFERENCES genres(id)
);

CREATE TABLE publishers (
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    publisher_name VARCHAR(40) NOT NULL
);

CREATE TABLE game_publishers (
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    game_id INT NOT NULL,
    publisher_id INT NOT NULL,
    CONSTRAINT fk_games_game_publishers
    FOREIGN KEY (game_id)
    REFERENCES games(id),
    CONSTRAINT fk_publishers
    FOREIGN KEY (publisher_id)
    REFERENCES publishers(id)
);

CREATE TABLE platforms (
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    platform_name VARCHAR(30) NOT NULL
);

CREATE TABLE game_platforms (
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    game_publisher_id INT NOT NULL,
    platform_if INT NOT NULL, 
    release_year INT NOT NULL,
    CONSTRAINT fk_game_publishers
    FOREIGN KEY (game_publisher_id)
    REFERENCES game_publishers(id),
    CONSTRAINT fk_platforms
    FOREIGN KEY (id)
    REFERENCES platforms(id)
);

CREATE TABLE region_sales (
	region_id INT NOT NULL,
    game_platform_id INT NOT NULL,
    num_sales INT NOT NULL
);

CREATE TABLE regions (
	id INT NOT NULL,
    region_name VARCHAR(40) NOT NULL
);

ALTER TABLE region_sales
ADD CONSTRAINT pk_region_sales PRIMARY KEY (
	region_id,
	game_platform_id
);

ALTER TABLE regions
ADD CONSTRAINT pk_regions PRIMARY KEY (id);

ALTER TABLE regions
MODIFY id INT NOT NULL AUTO_INCREMENT;


ALTER TABLE region_sales
ADD CONSTRAINT fk_region_sales_regions
FOREIGN KEY (region_id) REFERENCES regions(id);

ALTER TABLE region_sales
ADD CONSTRAINT fk_region_sales_game_platforms
FOREIGN KEY (game_platform_id) REFERENCES game_platforms(id);



