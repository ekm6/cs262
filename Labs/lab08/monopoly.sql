﻿--
-- This SQL script builds a monopoly database, deleting any pre-existing version.
--
-- @author Enoch Mwesigwa
-- @version Summer, 2015
--

-- Drop previous versions of the tables if they they exist, in reverse order of foreign keys.
DROP TABLE IF EXISTS PlayerGame;
DROP TABLE IF EXISTS Asset;
DROP TABLE IF EXISTS Game;
DROP TABLE IF EXISTS Player;


-- Create the schema.
CREATE TABLE Game (
	ID integer PRIMARY KEY, 
	time timestamp
	);

CREATE TABLE Player (
	ID integer PRIMARY KEY, 
	emailAddress varchar(50) NOT NULL,
	name varchar(50)
	);

CREATE TABLE Asset (
	ID integer PRIMARY KEY NOT NULL, 
	propertyName varchar(50) NOT NULL,
	numHouses integer NOT NULL,
	numHotels integer NOT NULL,
	propertyFamily varchar(50) NOT NULL,
	playerID integer REFERENCES Player(ID), 
	gameID integer REFERENCES Game(ID) 
	);

CREATE TABLE PlayerGame (
	gameID integer REFERENCES Game(ID), 
	playerID integer REFERENCES Player(ID),
	cash integer,
	location integer
	);

-- Allow users to select data from the tables.
GRANT SELECT ON Game TO PUBLIC;
GRANT SELECT ON Player TO PUBLIC;
GRANT SELECT ON PlayerGame TO PUBLIC;
GRANT SELECT ON Asset TO PUBLIC;

-- Add sample records.
INSERT INTO Game VALUES (1, '2006-06-27 08:00:00');
INSERT INTO Game VALUES (2, '2019-10-18 08:00:00');


INSERT INTO Player(ID, emailAddress) VALUES (1, 'me@calvin.edu');
INSERT INTO Player VALUES (2, 'king@gmail.edu', 'The King');
INSERT INTO Player VALUES (3, 'dog@gmail.edu', 'Dogbreath');

INSERT INTO Asset VALUES (1, 'Mediterranean Avenue', 1, 0, 'Brown',1,1);
INSERT INTO Asset VALUES (2, 'Vermont Avenue', 1, 0, 'Light Blue',2,1);
INSERT INTO Asset VALUES (3, 'Mediterranean Avenue', 1, 0, 'Brown',3,1);

INSERT INTO Asset VALUES (4, 'Mediterranean Avenue', 1, 0, 'Brown',1,2);
INSERT INTO Asset VALUES (5, 'Vermont Avenue', 1, 0, 'Light Blue',2,2);
INSERT INTO Asset VALUES (6, 'Mediterranean Avenue', 1, 0, 'Brown',3,2);

INSERT INTO PlayerGame VALUES (1, 1, 300.00, 10 );
INSERT INTO PlayerGame VALUES (1, 2, 2000.00, 8);
INSERT INTO PlayerGame VALUES (1, 3, 2350.00, 10);

INSERT INTO PlayerGame VALUES (2, 1, 300.00, 10 );
INSERT INTO PlayerGame VALUES (2, 2, 2000.00, 8);
INSERT INTO PlayerGame VALUES (2, 3, 2350.00, 10);


