/*******************************************************************************
   Drop Tables
********************************************************************************/
DROP TABLE IF EXISTS [DevelopGame];

DROP TABLE IF EXISTS [DevelopDesign];

DROP TABLE IF EXISTS [Game];

DROP TABLE IF EXISTS [Genre];

DROP TABLE IF EXISTS [Platform];

DROP TABLE IF EXISTS [Designer];

DROP TABLE IF EXISTS [Developer];

/*******************************************************************************
   Create Tables
********************************************************************************/
CREATE TABLE [Game]
(
    [gameId] INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
    [gameName] NVARCHAR(60)  NOT NULL,
    [releaseDate] DATETIME,
    [hoursPlayed] INTEGER,
    [genreId] INTEGER NOT NULL,
    [platformId] INTEGER NOT NULL,
    FOREIGN KEY ([genreId]) REFERENCES [Genre] ([genreId])
		ON DELETE NO ACTION ON UPDATE NO ACTION,
    FOREIGN KEY ([platformId]) REFERENCES [Platform] ([platformId])
		ON DELETE NO ACTION ON UPDATE NO ACTION
);

CREATE TABLE [Genre]
(
    [genreId] INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
    [genreName] NVARCHAR(20)
);

CREATE TABLE [Platform]
(
    [platformId] INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
    [platformName] NVARCHAR(30) NOT NULL,
    [releaseDate] DATETIME
);

CREATE TABLE [Designer]
(
    [designerId] INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
    [firstName] NVARCHAR(40),
    [lastName] NVARCHAR(40)
);

CREATE TABLE [Developer]
(
    [developerId] INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
    [developerName] NVARCHAR(20) NOT NULL,
    [headquartersCity] NVARCHAR(40),
    [headquartersState] NVARCHAR(40),
    [president] NVARCHAR(40)
);

CREATE TABLE [DevelopGame]    --Links Developer Table with Game Table
(
  [dgId] INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
  [gameId] INTEGER,
  [developerId] INTEGER,
  FOREIGN KEY ([gameId]) REFERENCES [Game] ([gameId])
  ON DELETE NO ACTION ON UPDATE NO ACTION,
  FOREIGN KEY ([developerId]) REFERENCES [Developer] ([developerId])
  ON DELETE NO ACTION ON UPDATE NO ACTION
);

CREATE TABLE [DevelopDesign]  --Links Developer Table with Designer Table
(
  [ddId] INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
  [developerId] INTEGER,
  [designerId] INTEGER,
  FOREIGN KEY ([developerId]) REFERENCES [Developer] ([developerId])
  ON DELETE NO ACTION ON UPDATE NO ACTION,
  FOREIGN KEY ([designerId]) REFERENCES [Designer] ([designerId])
  ON DELETE NO ACTION ON UPDATE NO ACTION
);

/*******************************************************************************
   Populate Tables
********************************************************************************/
INSERT INTO [Genre] ([genreName]) VALUES ('Action');
INSERT INTO [Genre] ([genreName]) VALUES ('Adventure');
INSERT INTO [Genre] ([genreName]) VALUES ('Fighting');
INSERT INTO [Genre] ([genreName]) VALUES ('Platform');
INSERT INTO [Genre] ([genreName]) VALUES ('Puzzle');
INSERT INTO [Genre] ([genreName]) VALUES ('Racing');
INSERT INTO [Genre] ([genreName]) VALUES ('Role-playing');
INSERT INTO [Genre] ([genreName]) VALUES ('Shooter');
INSERT INTO [Genre] ([genreName]) VALUES ('Simulation');
INSERT INTO [Genre] ([genreName]) VALUES ('Sports');
INSERT INTO [Genre] ([genreName]) VALUES ('Strategy');
INSERT INTO [Genre] ([genreName]) VALUES ('Misc');

INSERT INTO [Platform] ([platformName], [releaseDate]) VALUES ('Nintendo 64', '1996-09-26');
INSERT INTO [Platform] ([platformName], [releaseDate]) VALUES ('GameCube', '2001-11-18');
INSERT INTO [Platform] ([platformName], [releaseDate]) VALUES ('Game Boy Color', '1998-11-18');
INSERT INTO [Platform] ([platformName], [releaseDate]) VALUES ('Game Boy Advance', '2001-06-11');
INSERT INTO [Platform] ([platformName], [releaseDate]) VALUES ('Nintendo DS', '2004-11-21');
INSERT INTO [Platform] ([platformName], [releaseDate]) VALUES ('Nintendo 3DS', '2011-03-27');
INSERT INTO [Platform] ([platformName], [releaseDate]) VALUES ('Wii', '2006-11-19');
INSERT INTO [Platform] ([platformName], [releaseDate]) VALUES ('Nintendo Switch', '2017-03-03');
INSERT INTO [Platform] ([platformName], [releaseDate]) VALUES ('PlayStation 3', '2006-11-11');
INSERT INTO [Platform] ([platformName], [releaseDate]) VALUES ('Xbox One', '2013-11-22');
INSERT INTO [Platform] ([platformName], [releaseDate]) VALUES ('Microsoft Windows', '1985-11-20');

INSERT INTO [Developer] ([developerName], [headquartersCity], [headquartersState], [president]) VALUES ('Nintendo', 'Kyoto', 'Japan', 'Shuntaro Furukawa');
INSERT INTO [Developer] ([developerName], [headquartersCity], [headquartersState], [president]) VALUES ('HAL Laboratory', 'Kyoto', 'Japan', 'Mitsuhiro Ikeda');
INSERT INTO [Developer] ([developerName], [headquartersCity], [headquartersState], [president]) VALUES ('Rare', 'Leicestershire', 'England', 'Tim Stamper');
INSERT INTO [Developer] ([developerName], [headquartersCity], [headquartersState], [president]) VALUES ('Travellers Tales', 'Knutsford', 'England', 'Jon Burton');
INSERT INTO [Developer] ([developerName], [headquartersCity], [headquartersState], [president]) VALUES ('Ambrella', 'Kyoto', 'Japan', 'Norio Matsumura');
INSERT INTO [Developer] ([developerName], [headquartersCity], [headquartersState], [president]) VALUES ('Game Freak', 'Tokyo', 'Japan', 'Satoshi Taijiri');
INSERT INTO [Developer] ([developerName], [headquartersCity], [headquartersState], [president]) VALUES ('Capcom', 'Osaka', 'Japan', 'Kenzo Tsujimoto');
INSERT INTO [Developer] ([developerName], [headquartersCity], [headquartersState], [president]) VALUES ('Hudson Soft', 'Tokyo', 'Japan', 'Yuji Kudo');
INSERT INTO [Developer] ([developerName], [headquartersCity], [headquartersState], [president]) VALUES ('Creatures', 'Tokyo', 'Japan', 'Hirokazu Tanaka');
INSERT INTO [Developer] ([developerName], [headquartersCity], [headquartersState], [president]) VALUES ('Griptonite Games', 'Kirkland', 'Washington', 'Steve Ettinger');
INSERT INTO [Developer] ([developerName], [headquartersCity], [headquartersState], [president]) VALUES ('Intelligent Systems', 'Kyoto', 'Japan', 'Toru Narihiro');
INSERT INTO [Developer] ([developerName], [headquartersCity], [headquartersState], [president]) VALUES ('Eurocom', 'Derby', 'England', 'Mat Sneap');
INSERT INTO [Developer] ([developerName], [headquartersCity], [headquartersState], [president]) VALUES ('Vicarious Visions', 'Menands', 'New York', 'Guha Bala');
INSERT INTO [Developer] ([developerName], [headquartersCity], [headquartersState], [president]) VALUES ('Kuju', 'London', 'England', 'Jonathon Newth');
INSERT INTO [Developer] ([developerName], [headquartersCity], [headquartersState], [president]) VALUES ('Infusion Games', 'Bristol', 'England', 'David Smith');
INSERT INTO [Developer] ([developerName], [headquartersCity], [headquartersState], [president]) VALUES ('Sega Studios', 'Irvine', 'California', 'David Rosen');
INSERT INTO [Developer] ([developerName], [headquartersCity], [headquartersState], [president]) VALUES ('Sonic Team', 'Tokyo', 'Japan', 'Yuji Naka');
INSERT INTO [Developer] ([developerName], [headquartersCity], [headquartersState], [president]) VALUES ('Tose', 'Kyoto', 'Japan', 'Shigeru Saito');
INSERT INTO [Developer] ([developerName], [headquartersCity], [headquartersState], [president]) VALUES ('AlphaDream', 'Tokyo', 'Japan', 'Tetsuo Mizuno');
INSERT INTO [Developer] ([developerName], [headquartersCity], [headquartersState], [president]) VALUES ('Neversoft', 'Woodland Hills', 'California', 'Joel Jewett');
INSERT INTO [Developer] ([developerName], [headquartersCity], [headquartersState], [president]) VALUES ('Maxis', 'Redwood Shores', 'California', 'Will Wright');
INSERT INTO [Developer] ([developerName], [headquartersCity], [headquartersState], [president]) VALUES ('Jagex', 'Cambridge', 'England', 'Phil Mansell');
INSERT INTO [Developer] ([developerName], [headquartersCity], [headquartersState], [president]) VALUES ('Riot Games', 'Los Angeles', 'California', 'Brandon Beck');
INSERT INTO [Developer] ([developerName], [headquartersCity], [headquartersState], [president]) VALUES ('Airship Syndicate', 'Austin', 'Texas', 'Joe Madureira');
INSERT INTO [Developer] ([developerName], [headquartersCity], [headquartersState], [president]) VALUES ('Blizzard Entertainment', 'Irvine', 'California', 'Allen Adham');
INSERT INTO [Developer] ([developerName], [headquartersCity], [headquartersState], [president]) VALUES ('Klei Entertainment', 'Vancouver', 'Canada', 'Jamie Cheng');
INSERT INTO [Developer] ([developerName], [headquartersCity], [headquartersState], [president]) VALUES ('Psyop', 'New York City', 'New York', 'Marie Hyon');
INSERT INTO [Developer] ([developerName], [headquartersCity], [headquartersState], [president]) VALUES ('Team Salvato', 'Sacramento', 'California', 'Dan Salvato');
INSERT INTO [Developer] ([developerName], [headquartersCity], [headquartersState], [president]) VALUES ('Bungie', 'Bellevue', 'Washington', 'Pete Parsons');
INSERT INTO [Developer] ([developerName], [headquartersCity], [headquartersState], [president]) VALUES ('Valve Corporation', 'Bellevue', 'Washington', 'Gabe Newell');
INSERT INTO [Developer] ([developerName], [headquartersCity], [headquartersState], [president]) VALUES ('Frictional Games', 'Helsingborg', 'Sweden', 'Thomas Grip');
INSERT INTO [Developer] ([developerName], [headquartersCity], [headquartersState], [president]) VALUES ('Chess.com', 'Boston', 'Massachusetts', 'Erik Allebest');
INSERT INTO [Developer] ([developerName], [headquartersCity], [headquartersState], [president]) VALUES ('Naughty Dog', 'Santa Monica', 'California', 'Andy Gavin');
INSERT INTO [Developer] ([developerName], [headquartersCity], [headquartersState], [president]) VALUES ('Kojima Productions', 'Tokyo', 'Japan', 'Hideo Kojima');
INSERT INTO [Developer] ([developerName], [headquartersCity], [headquartersState], [president]) VALUES ('Rockstar Games', 'New York City', 'New York', 'Dan Houser');
INSERT INTO [Developer] ([developerName], [headquartersCity], [headquartersState], [president]) VALUES ('Ready at Dawn', 'Irvine', 'California', 'Paul Sams');
INSERT INTO [Developer] ([developerName], [headquartersCity], [headquartersState], [president]) VALUES ('Irrational Games', 'Quincy', 'Massachusetts', 'Ken Levine');
INSERT INTO [Developer] ([developerName], [headquartersCity], [headquartersState], [president]) VALUES ('Bethesda Game Studios', 'Rockville', 'Maryland', 'Ashley Cheng');
INSERT INTO [Developer] ([developerName], [headquartersCity], [headquartersState], [president]) VALUES ('FromSoftware', 'Tokyo', 'Japan', 'Hidetaka Miyazaki');
INSERT INTO [Developer] ([developerName], [headquartersCity], [headquartersState], [president]) VALUES ('Inifnity Ward', 'Woodland Hills', 'California', 'Grant Collier');
INSERT INTO [Developer] ([developerName], [headquartersCity], [headquartersState], [president]) VALUES ('Ubisoft', 'Montreuil', 'France', 'Christian Guillemot');
INSERT INTO [Developer] ([developerName], [headquartersCity], [headquartersState], [president]) VALUES ('Cryptic Studios', 'Los Gatos', 'California', 'Stephen DAngelo');
INSERT INTO [Developer] ([developerName], [headquartersCity], [headquartersState], [president]) VALUES ('343 Industries', 'Redmond', 'Washington', 'Bonnie Ross');
INSERT INTO [Developer] ([developerName], [headquartersCity], [headquartersState], [president]) VALUES ('Tango Gameworks', 'Tokyo', 'Japan', 'Shinji Mikami');
INSERT INTO [Developer] ([developerName], [headquartersCity], [headquartersState], [president]) VALUES ('Gearbox Software', 'Frisco', 'Texas', 'Randy Pitchford');
INSERT INTO [Developer] ([developerName], [headquartersCity], [headquartersState], [president]) VALUES ('Treyarch', 'Santa Monica', 'California', 'Mark Lamia');
INSERT INTO [Developer] ([developerName], [headquartersCity], [headquartersState], [president]) VALUES ('Red Barrels', 'Montreal', 'Canada', 'Phillippe Morin');
INSERT INTO [Developer] ([developerName], [headquartersCity], [headquartersState], [president]) VALUES ('CD Projekt', 'Warsaw', 'Poland', 'Adam Kicinski');
INSERT INTO [Developer] ([developerName], [headquartersCity], [headquartersState], [president]) VALUES ('Crystal Dynamics', 'Redwood City', 'California', 'Scot Amos');
INSERT INTO [Developer] ([developerName], [headquartersCity], [headquartersState], [president]) VALUES ('PlatinumGames', 'Osaka', 'Japan', 'Kenichi Sato');
INSERT INTO [Developer] ([developerName], [headquartersCity], [headquartersState], [president]) VALUES ('Mojang Studios', 'Stockholm', 'Sweden', 'Markus Persson');
INSERT INTO [Developer] ([developerName], [headquartersCity], [headquartersState], [president]) VALUES ('Ninja Theory', 'Cambridge', 'England', 'Jez San');
INSERT INTO [Developer] ([developerName], [headquartersCity], [headquartersState], [president]) VALUES ('Behavior Interactive', 'Montreal', 'Canada', 'Remi Racine');

INSERT INTO [Designer] ([firstName], [lastName]) VALUES ('Takao', 'Shimizu');
INSERT INTO [Designer] ([firstName], [lastName]) VALUES ('Masahiro', 'Sakurai');
INSERT INTO [Designer] ([firstName], [lastName]) VALUES ('Joel', 'Goodsell');
INSERT INTO [Designer] ([firstName], [lastName]) VALUES ('Jon', 'Burton');
INSERT INTO [Designer] ([firstName], [lastName]) VALUES ('Tsunekazu', 'Ishihara');
INSERT INTO [Designer] ([firstName], [lastName]) VALUES ('Shigeru', 'Miyamoto');
INSERT INTO [Designer] ([firstName], [lastName]) VALUES ('Satoshi', 'Taijiri');
INSERT INTO [Designer] ([firstName], [lastName]) VALUES ('Hidemaro', 'Fujibayashi');
INSERT INTO [Designer] ([firstName], [lastName]) VALUES ('Shigeki', 'Morimoto');
INSERT INTO [Designer] ([firstName], [lastName]) VALUES ('Sachiko', 'Wada');
INSERT INTO [Designer] ([firstName], [lastName]) VALUES ('Satoru', 'Iwata');
INSERT INTO [Designer] ([firstName], [lastName]) VALUES ('Takashi', 'Tezuka');
INSERT INTO [Designer] ([firstName], [lastName]) VALUES ('Makoto', 'Wada');
INSERT INTO [Designer] ([firstName], [lastName]) VALUES ('Hiroshi', 'Sato');
INSERT INTO [Designer] ([firstName], [lastName]) VALUES ('Kensuke', 'Tanabe');
INSERT INTO [Designer] ([firstName], [lastName]) VALUES ('Takashi', 'Iizuka');
INSERT INTO [Designer] ([firstName], [lastName]) VALUES ('Junichi', 'Masuda');
INSERT INTO [Designer] ([firstName], [lastName]) VALUES ('Masamichi', 'Abe');
INSERT INTO [Designer] ([firstName], [lastName]) VALUES ('Richard', 'Vorodi');
INSERT INTO [Designer] ([firstName], [lastName]) VALUES ('Shu', 'Takumi');
INSERT INTO [Designer] ([firstName], [lastName]) VALUES ('Yoshio', 'Sakamoto');
INSERT INTO [Designer] ([firstName], [lastName]) VALUES ('Taku', 'Matoba');
INSERT INTO [Designer] ([firstName], [lastName]) VALUES ('Yoko', 'Shimomura');
INSERT INTO [Designer] ([firstName], [lastName]) VALUES ('Shigeru', 'Ohmori');
INSERT INTO [Designer] ([firstName], [lastName]) VALUES ('Takayuki', 'Ikkaku');
INSERT INTO [Designer] ([firstName], [lastName]) VALUES ('Yoshikazu', 'Yamashita');
INSERT INTO [Designer] ([firstName], [lastName]) VALUES ('Aya', 'Kyogoku');
INSERT INTO [Designer] ([firstName], [lastName]) VALUES ('Will', 'Wright');
INSERT INTO [Designer] ([firstName], [lastName]) VALUES ('Soren', 'Johnson');
INSERT INTO [Designer] ([firstName], [lastName]) VALUES ('Stone', 'Librande');
INSERT INTO [Designer] ([firstName], [lastName]) VALUES ('Chaim', 'Gingold');
INSERT INTO [Designer] ([firstName], [lastName]) VALUES ('Andrew', 'Gower');
INSERT INTO [Designer] ([firstName], [lastName]) VALUES ('Paul', 'Gower');
INSERT INTO [Designer] ([firstName], [lastName]) VALUES ('Steve', 'Feak');
INSERT INTO [Designer] ([firstName], [lastName]) VALUES ('Tom', 'Cadwell');
INSERT INTO [Designer] ([firstName], [lastName]) VALUES ('Mark', 'Yetter');
INSERT INTO [Designer] ([firstName], [lastName]) VALUES ('Steve', 'Feak');
INSERT INTO [Designer] ([firstName], [lastName]) VALUES ('Jeff', 'Kaplan');
INSERT INTO [Designer] ([firstName], [lastName]) VALUES ('Rob', 'Pardo');
INSERT INTO [Designer] ([firstName], [lastName]) VALUES ('Tom', 'Chilton');
INSERT INTO [Designer] ([firstName], [lastName]) VALUES ('KFC', '');
INSERT INTO [Designer] ([firstName], [lastName]) VALUES ('Dan', 'Salvato');
INSERT INTO [Designer] ([firstName], [lastName]) VALUES ('Minh', 'Lee');
INSERT INTO [Designer] ([firstName], [lastName]) VALUES ('Jess', 'Cliffe');
INSERT INTO [Designer] ([firstName], [lastName]) VALUES ('Erik', 'Allebest');
INSERT INTO [Designer] ([firstName], [lastName]) VALUES ('Kim', 'Swift');
INSERT INTO [Designer] ([firstName], [lastName]) VALUES ('John', 'Cook');
INSERT INTO [Designer] ([firstName], [lastName]) VALUES ('Robin', 'Walker');
INSERT INTO [Designer] ([firstName], [lastName]) VALUES ('Neil', 'Druckmann');
INSERT INTO [Designer] ([firstName], [lastName]) VALUES ('Richard', 'Lemarchand');
INSERT INTO [Designer] ([firstName], [lastName]) VALUES ('Hideo', 'Kojima');
INSERT INTO [Designer] ([firstName], [lastName]) VALUES ('Christian', 'Cantamessa');
INSERT INTO [Designer] ([firstName], [lastName]) VALUES ('Leslie', 'Benzies');
INSERT INTO [Designer] ([firstName], [lastName]) VALUES ('Cory', 'Barlog');
INSERT INTO [Designer] ([firstName], [lastName]) VALUES ('David', 'Jaffe');
INSERT INTO [Designer] ([firstName], [lastName]) VALUES ('Todd', 'Papy');
INSERT INTO [Designer] ([firstName], [lastName]) VALUES ('Ken', 'Levine');
INSERT INTO [Designer] ([firstName], [lastName]) VALUES ('Paul', 'Hellquist');
INSERT INTO [Designer] ([firstName], [lastName]) VALUES ('Todd', 'Howard');
INSERT INTO [Designer] ([firstName], [lastName]) VALUES ('Hidetaka', 'Miyazaki');
INSERT INTO [Designer] ([firstName], [lastName]) VALUES ('Todd', 'Alderman');
INSERT INTO [Designer] ([firstName], [lastName]) VALUES ('Steve', 'Fukuda');
INSERT INTO [Designer] ([firstName], [lastName]) VALUES ('Jack', 'Emmert');
INSERT INTO [Designer] ([firstName], [lastName]) VALUES ('Ed', 'Fries');
INSERT INTO [Designer] ([firstName], [lastName]) VALUES ('Jason', 'Jones');
INSERT INTO [Designer] ([firstName], [lastName]) VALUES ('Daniel', 'Miller');
INSERT INTO [Designer] ([firstName], [lastName]) VALUES ('Ed', 'Fries');
INSERT INTO [Designer] ([firstName], [lastName]) VALUES ('Jason', 'Jones');
INSERT INTO [Designer] ([firstName], [lastName]) VALUES ('Shinji', 'Mikami');
INSERT INTO [Designer] ([firstName], [lastName]) VALUES ('Gavin', 'Locke');
INSERT INTO [Designer] ([firstName], [lastName]) VALUES ('Lars', 'Bakken');
INSERT INTO [Designer] ([firstName], [lastName]) VALUES ('Jason', 'Botta');
INSERT INTO [Designer] ([firstName], [lastName]) VALUES ('Michael', 'Brinker');
INSERT INTO [Designer] ([firstName], [lastName]) VALUES ('Yoko', 'Taro');
INSERT INTO [Designer] ([firstName], [lastName]) VALUES ('Teruki', 'Endo');
INSERT INTO [Designer] ([firstName], [lastName]) VALUES ('Markus', 'Persson');
INSERT INTO [Designer] ([firstName], [lastName]) VALUES ('Jens', 'Bergensten');
INSERT INTO [Designer] ([firstName], [lastName]) VALUES ('Joe', 'Nelson');
INSERT INTO [Designer] ([firstName], [lastName]) VALUES ('Juan', 'Fernandez');
INSERT INTO [Designer] ([firstName], [lastName]) VALUES ('Imran', 'Sarwar');
INSERT INTO [Designer] ([firstName], [lastName]) VALUES ('Mike', 'Chapman');
INSERT INTO [Designer] ([firstName], [lastName]) VALUES ('Matthew', 'Spriggens');
INSERT INTO [Designer] ([firstName], [lastName]) VALUES ('Scott', 'Mercer');

INSERT INTO [Game] ([gameName], [releaseDate], [hoursPlayed], [genreId], [platformId]) VALUES ('Pokemon Stadium', '1999-04-30', 51, 11, 1);
INSERT INTO [Game] ([gameName], [releaseDate], [hoursPlayed], [genreId], [platformId]) VALUES ('Pokemon Stadium 2', '2000-12-14', 43, 11, 1);
INSERT INTO [Game] ([gameName], [releaseDate], [hoursPlayed], [genreId], [platformId]) VALUES ('Super Smash Bros', '1999-01-21', 97, 3, 1);
INSERT INTO [Game] ([gameName], [releaseDate], [hoursPlayed], [genreId], [platformId]) VALUES ('Mickeys Speedway USA', '2000-11-13', 13, 11, 1);
INSERT INTO [Game] ([gameName], [releaseDate], [hoursPlayed], [genreId], [platformId]) VALUES ('Toy Story 2', '1999-11-17', 8, 2, 1);
INSERT INTO [Game] ([gameName], [releaseDate], [hoursPlayed], [genreId], [platformId]) VALUES ('Hey You Pikachu', '1998-12-12', 13, 12, 1);
INSERT INTO [Game] ([gameName], [releaseDate], [hoursPlayed], [genreId], [platformId]) VALUES ('The Legend of Zelda: Ocarina of Time', '1998-11-21', 87, 2, 1);
INSERT INTO [Game] ([gameName], [releaseDate], [hoursPlayed], [genreId], [platformId]) VALUES ('The Legend of Zelda: Majoras Mask', '2000-04-27', 69, 2, 1);

INSERT INTO [Game] ([gameName], [releaseDate], [hoursPlayed], [genreId], [platformId]) VALUES ('Pokemon Yellow', '1998-09-12', 92, 11, 3);
INSERT INTO [Game] ([gameName], [releaseDate], [hoursPlayed], [genreId], [platformId]) VALUES ('Pokemon Red', '1996-02-27', 57, 11, 3);
INSERT INTO [Game] ([gameName], [releaseDate], [hoursPlayed], [genreId], [platformId]) VALUES ('Pokemon Blue', '1996-02-27', 45, 11, 3);
INSERT INTO [Game] ([gameName], [releaseDate], [hoursPlayed], [genreId], [platformId]) VALUES ('Pokemon Gold', '1999-11-21', 54, 11, 3);
INSERT INTO [Game] ([gameName], [releaseDate], [hoursPlayed], [genreId], [platformId]) VALUES ('Pokemon Silver', '1999-11-27', 78, 11, 3);
INSERT INTO [Game] ([gameName], [releaseDate], [hoursPlayed], [genreId], [platformId]) VALUES ('Pokemon Crystal', '2000-12-14', 150, 11, 3);
INSERT INTO [Game] ([gameName], [releaseDate], [hoursPlayed], [genreId], [platformId]) VALUES ('Magical Tetris Challenge', '1998-07-31', 4, 5, 3);
INSERT INTO [Game] ([gameName], [releaseDate], [hoursPlayed], [genreId], [platformId]) VALUES ('Pokemon Trading Card Game', '1998-12-18', 8, 11, 3);

INSERT INTO [Game] ([gameName], [releaseDate], [hoursPlayed], [genreId], [platformId]) VALUES ('Pokemon Ruby', '2002-11-21', 72, 11, 4);
INSERT INTO [Game] ([gameName], [releaseDate], [hoursPlayed], [genreId], [platformId]) VALUES ('Pokemon Saphire', '2002-11-21', 60, 11, 4);
INSERT INTO [Game] ([gameName], [releaseDate], [hoursPlayed], [genreId], [platformId]) VALUES ('Pokemon Leaf Green', '2004-01-29', 43, 11, 4);
INSERT INTO [Game] ([gameName], [releaseDate], [hoursPlayed], [genreId], [platformId]) VALUES ('Pokemon Fire Red', '2004-01-29', 30, 11, 4);
INSERT INTO [Game] ([gameName], [releaseDate], [hoursPlayed], [genreId], [platformId]) VALUES ('Harry Potter and the Prisoner of Azkaban', '2004-05-25', 13, 2, 4);
INSERT INTO [Game] ([gameName], [releaseDate], [hoursPlayed], [genreId], [platformId]) VALUES ('Fire Emblem: The Sacred Stones', '2004-10-07', 39, 11, 4);
INSERT INTO [Game] ([gameName], [releaseDate], [hoursPlayed], [genreId], [platformId]) VALUES ('Kirby: Nightmare in Dreamland', '2002-10-25', 17, 1, 4);

INSERT INTO [Game] ([gameName], [releaseDate], [hoursPlayed], [genreId], [platformId]) VALUES ('Animal Crossing', '2002-09-16', 13, 9, 2);
INSERT INTO [Game] ([gameName], [releaseDate], [hoursPlayed], [genreId], [platformId]) VALUES ('Super Smash Bros Melee', '2001-11-21', 500, 3, 2);
INSERT INTO [Game] ([gameName], [releaseDate], [hoursPlayed], [genreId], [platformId]) VALUES ('Batman Begins', '2005-06-14', 24, 1, 2);
INSERT INTO [Game] ([gameName], [releaseDate], [hoursPlayed], [genreId], [platformId]) VALUES ('The Legend of Zelda: Wind Waker', '2002-12-13', 33, 2, 2);
INSERT INTO [Game] ([gameName], [releaseDate], [hoursPlayed], [genreId], [platformId]) VALUES ('Mario Kart Double Dash', '2003-11-07', 60, 6, 2);
INSERT INTO [Game] ([gameName], [releaseDate], [hoursPlayed], [genreId], [platformId]) VALUES ('Super Mario Sunshine', '2002-07-19', 47, 2, 2);
INSERT INTO [Game] ([gameName], [releaseDate], [hoursPlayed], [genreId], [platformId]) VALUES ('Kirbys Airride', '2003-07-11', 50, 6, 2);
INSERT INTO [Game] ([gameName], [releaseDate], [hoursPlayed], [genreId], [platformId]) VALUES ('Mario Party 7', '2005-11-07', 18, 12, 2);
INSERT INTO [Game] ([gameName], [releaseDate], [hoursPlayed], [genreId], [platformId]) VALUES ('Battalion Wars', '2005-09-19', 28, 11, 2);
INSERT INTO [Game] ([gameName], [releaseDate], [hoursPlayed], [genreId], [platformId]) VALUES ('Shadow the Hedgehog', '2005-11-15', 3, 1, 2);
INSERT INTO [Game] ([gameName], [releaseDate], [hoursPlayed], [genreId], [platformId]) VALUES ('Sonic Adventure 2 Battle', '2001-12-20', 92, 1, 2);

INSERT INTO [Game] ([gameName], [releaseDate], [hoursPlayed], [genreId], [platformId]) VALUES ('Pokemon Diamond', '2006-09-28', 111, 11, 5);
INSERT INTO [Game] ([gameName], [releaseDate], [hoursPlayed], [genreId], [platformId]) VALUES ('Pokemon Black', '2010-09-18', 95, 11, 5);
INSERT INTO [Game] ([gameName], [releaseDate], [hoursPlayed], [genreId], [platformId]) VALUES ('Metroid Prime Hunters', '2006-03-20', 7, 8, 5);
INSERT INTO [Game] ([gameName], [releaseDate], [hoursPlayed], [genreId], [platformId]) VALUES ('Phoenix Wright: Ace Attorney', '2001-10-12', 15, 9, 5);
INSERT INTO [Game] ([gameName], [releaseDate], [hoursPlayed], [genreId], [platformId]) VALUES ('Phoenix Wright: Ace Attorney-Justice For All', '2002-10-18', 17, 9, 5);
INSERT INTO [Game] ([gameName], [releaseDate], [hoursPlayed], [genreId], [platformId]) VALUES ('Phoenix Wright: Ace Attorney-Trials and Tribulations', '2004-01-23', 22, 9, 5);
INSERT INTO [Game] ([gameName], [releaseDate], [hoursPlayed], [genreId], [platformId]) VALUES ('Wario Ware Touched', '2004-12-02', 22, 12, 5);
INSERT INTO [Game] ([gameName], [releaseDate], [hoursPlayed], [genreId], [platformId]) VALUES ('Super Princess Peach', '2005-10-20', 2, 4, 5);
INSERT INTO [Game] ([gameName], [releaseDate], [hoursPlayed], [genreId], [platformId]) VALUES ('Mario and Luigi: Partners in Time', '2005-11-28', 14, 4, 5);
INSERT INTO [Game] ([gameName], [releaseDate], [hoursPlayed], [genreId], [platformId]) VALUES ('Kirby: Canvas Curse', '2005-03-24', 8, 1, 5);
INSERT INTO [Game] ([gameName], [releaseDate], [hoursPlayed], [genreId], [platformId]) VALUES ('Big Brain Academy', '2005-06-30', 28, 5, 5);
INSERT INTO [Game] ([gameName], [releaseDate], [hoursPlayed], [genreId], [platformId]) VALUES ('New Super Mario Bros', '2006-05-15', 8, 4, 5);

INSERT INTO [Game] ([gameName], [releaseDate], [hoursPlayed], [genreId], [platformId]) VALUES ('Pokemon Y', '2013-10-12', 42, 11, 6);
INSERT INTO [Game] ([gameName], [releaseDate], [hoursPlayed], [genreId], [platformId]) VALUES ('Animal Crossing Wild World', '2005-11-23', 156, 9, 6);

INSERT INTO [Game] ([gameName], [releaseDate], [hoursPlayed], [genreId], [platformId]) VALUES ('Mario Kart Wii', '2008-04-10', 55, 6, 7);
INSERT INTO [Game] ([gameName], [releaseDate], [hoursPlayed], [genreId], [platformId]) VALUES ('Animal Crossing City Folk', '2008-11-30', 96, 9, 7);
INSERT INTO [Game] ([gameName], [releaseDate], [hoursPlayed], [genreId], [platformId]) VALUES ('Wario Ware Smooth Moves', '2006-12-02', 14, 12, 7);
INSERT INTO [Game] ([gameName], [releaseDate], [hoursPlayed], [genreId], [platformId]) VALUES ('Super Mario Galaxy', '2007-11-01', 32, 2, 7);
INSERT INTO [Game] ([gameName], [releaseDate], [hoursPlayed], [genreId], [platformId]) VALUES ('Fire Emblem: Radiant Dawn', '2007-02-22', 10, 11, 7);
INSERT INTO [Game] ([gameName], [releaseDate], [hoursPlayed], [genreId], [platformId]) VALUES ('Guitar Hero 3', '2007-10-28', 65, 10, 7);
INSERT INTO [Game] ([gameName], [releaseDate], [hoursPlayed], [genreId], [platformId]) VALUES ('Super Smash Bros Brawl', '2008-01-31', 102, 3, 7);
INSERT INTO [Game] ([gameName], [releaseDate], [hoursPlayed], [genreId], [platformId]) VALUES ('The Legend of Zelda: Twilight Princess', '2006-11-19', 87, 2, 7);
INSERT INTO [Game] ([gameName], [releaseDate], [hoursPlayed], [genreId], [platformId]) VALUES ('Wii Sports', '2006-11-19', 95, 10, 7);

INSERT INTO [Game] ([gameName], [releaseDate], [hoursPlayed], [genreId], [platformId]) VALUES ('The Legend of Zelda: Breath of the Wild', '2017-03-03', 50, 2, 8);
INSERT INTO [Game] ([gameName], [releaseDate], [hoursPlayed], [genreId], [platformId]) VALUES ('Animal Crossing New Horizon', '2020-03-20', 120, 9, 8);

INSERT INTO [Game] ([gameName], [releaseDate], [hoursPlayed], [genreId], [platformId]) VALUES ('Spore', '2008-09-04', 32, 9, 11);
INSERT INTO [Game] ([gameName], [releaseDate], [hoursPlayed], [genreId], [platformId]) VALUES ('Harry Potter and the Sorcerers Stone', '2001-11-15', 12, 2, 11);
INSERT INTO [Game] ([gameName], [releaseDate], [hoursPlayed], [genreId], [platformId]) VALUES ('Runescape', '2001-01-04', 940, 7, 11);
INSERT INTO [Game] ([gameName], [releaseDate], [hoursPlayed], [genreId], [platformId]) VALUES ('League of Legends', '2009-10-27', 168, 3, 11);
INSERT INTO [Game] ([gameName], [releaseDate], [hoursPlayed], [genreId], [platformId]) VALUES ('World of Warcraft', '2004-11-23', 28, 7, 11);
INSERT INTO [Game] ([gameName], [releaseDate], [hoursPlayed], [genreId], [platformId]) VALUES ('Dont Starve Together', '2016-04-21', 5, 11, 11);
INSERT INTO [Game] ([gameName], [releaseDate], [hoursPlayed], [genreId], [platformId]) VALUES ('I Love You Colonel Sanders', '2019-09-24', 2, 12, 11);
INSERT INTO [Game] ([gameName], [releaseDate], [hoursPlayed], [genreId], [platformId]) VALUES ('Doki Doki Literature Club', '2017-09-22', 5, 12, 11);
INSERT INTO [Game] ([gameName], [releaseDate], [hoursPlayed], [genreId], [platformId]) VALUES ('Destiny 2', '2017-09-06', 1, 8, 11);
INSERT INTO [Game] ([gameName], [releaseDate], [hoursPlayed], [genreId], [platformId]) VALUES ('Counter Strike: Global Offensive', '2012-08-21', 1, 8, 11);
INSERT INTO [Game] ([gameName], [releaseDate], [hoursPlayed], [genreId], [platformId]) VALUES ('Amnesia: The Dark Descent', '2010-09-08', 6, 5, 11);
INSERT INTO [Game] ([gameName], [releaseDate], [hoursPlayed], [genreId], [platformId]) VALUES ('Chess', '2007-05-21', 35, 10, 11);

INSERT INTO [Game] ([gameName], [releaseDate], [hoursPlayed], [genreId], [platformId]) VALUES ('Portal', '2007-10-10', 32, 5, 9);
INSERT INTO [Game] ([gameName], [releaseDate], [hoursPlayed], [genreId], [platformId]) VALUES ('Portal 2', '2011-04-18', 72, 5, 9);
INSERT INTO [Game] ([gameName], [releaseDate], [hoursPlayed], [genreId], [platformId]) VALUES ('Uncharted 2', '2009-10-13', 26, 1, 9);
INSERT INTO [Game] ([gameName], [releaseDate], [hoursPlayed], [genreId], [platformId]) VALUES ('Metal Gear Solid 4', '2008-06-12', 14, 1, 9);
INSERT INTO [Game] ([gameName], [releaseDate], [hoursPlayed], [genreId], [platformId]) VALUES ('Red Dead Redemption', '2010-05-18', 6, 2, 9);
INSERT INTO [Game] ([gameName], [releaseDate], [hoursPlayed], [genreId], [platformId]) VALUES ('God of War', '2005-03-22', 8, 1, 9);
INSERT INTO [Game] ([gameName], [releaseDate], [hoursPlayed], [genreId], [platformId]) VALUES ('God of War II', '2007-03-13', 8, 1, 9);
INSERT INTO [Game] ([gameName], [releaseDate], [hoursPlayed], [genreId], [platformId]) VALUES ('God of War III', '2010-03-16', 12, 1, 9);
INSERT INTO [Game] ([gameName], [releaseDate], [hoursPlayed], [genreId], [platformId]) VALUES ('Bioshock', '2007-08-21', 17, 8, 9);
INSERT INTO [Game] ([gameName], [releaseDate], [hoursPlayed], [genreId], [platformId]) VALUES ('The Elder Scrolls V: Skyrim', '2011-11-11', 94, 7, 9);
INSERT INTO [Game] ([gameName], [releaseDate], [hoursPlayed], [genreId], [platformId]) VALUES ('Demons Souls', '2009-02-05', 23, 2, 9);
INSERT INTO [Game] ([gameName], [releaseDate], [hoursPlayed], [genreId], [platformId]) VALUES ('Call of Duty: Modern Warfare 2', '2009-11-10', 168, 8, 9);

INSERT INTO [Game] ([gameName], [releaseDate], [hoursPlayed], [genreId], [platformId]) VALUES ('Assassins Creed 4 Black Flag', '2013-10-29', 3, 2, 10);
INSERT INTO [Game] ([gameName], [releaseDate], [hoursPlayed], [genreId], [platformId]) VALUES ('Neverwinter', '2013-06-20', 18, 7, 10);
INSERT INTO [Game] ([gameName], [releaseDate], [hoursPlayed], [genreId], [platformId]) VALUES ('Halo Master Chief Collection', '2014-11-11', 27, 8, 10);
INSERT INTO [Game] ([gameName], [releaseDate], [hoursPlayed], [genreId], [platformId]) VALUES ('The Evil Within', '2014-10-14', 28, 1, 10);
INSERT INTO [Game] ([gameName], [releaseDate], [hoursPlayed], [genreId], [platformId]) VALUES ('Metal Gear Solid 5', '2015-09-01', 2, 1, 10);
INSERT INTO [Game] ([gameName], [releaseDate], [hoursPlayed], [genreId], [platformId]) VALUES ('Child of Light', '2014-04-29', 3, 4, 10);
INSERT INTO [Game] ([gameName], [releaseDate], [hoursPlayed], [genreId], [platformId]) VALUES ('Borderlands 2', '2012-09-18', 14, 8, 10);
INSERT INTO [Game] ([gameName], [releaseDate], [hoursPlayed], [genreId], [platformId]) VALUES ('Call of of Duty: Black Ops 3', '2015-11-06', 72, 8, 10);
INSERT INTO [Game] ([gameName], [releaseDate], [hoursPlayed], [genreId], [platformId]) VALUES ('Pneuma: Breath of Life', '2015-02-27', 4, 5, 10);
INSERT INTO [Game] ([gameName], [releaseDate], [hoursPlayed], [genreId], [platformId]) VALUES ('Outlast', '2013-09-04', 8, 1, 10);
INSERT INTO [Game] ([gameName], [releaseDate], [hoursPlayed], [genreId], [platformId]) VALUES ('Destiny', '2014-09-09', 751, 8, 10);
INSERT INTO [Game] ([gameName], [releaseDate], [hoursPlayed], [genreId], [platformId]) VALUES ('Dark Souls', '2011-09-22', 107, 2, 10);
INSERT INTO [Game] ([gameName], [releaseDate], [hoursPlayed], [genreId], [platformId]) VALUES ('Dark Souls 2', '2014-03-11', 131, 2, 10);
INSERT INTO [Game] ([gameName], [releaseDate], [hoursPlayed], [genreId], [platformId]) VALUES ('Dark Souls 3', '2016-03-24', 170, 2, 10);
INSERT INTO [Game] ([gameName], [releaseDate], [hoursPlayed], [genreId], [platformId]) VALUES ('Sekiro: Shadows Die Twice', '2019-03-22', 51, 2, 10);
INSERT INTO [Game] ([gameName], [releaseDate], [hoursPlayed], [genreId], [platformId]) VALUES ('The Witcher 3', '2015-05-18', 5, 2, 10);
INSERT INTO [Game] ([gameName], [releaseDate], [hoursPlayed], [genreId], [platformId]) VALUES ('Rise of the Tomb Raider', '2015-11-10', 13, 5, 10);
INSERT INTO [Game] ([gameName], [releaseDate], [hoursPlayed], [genreId], [platformId]) VALUES ('Nier: Automata', '2017-02-23', 27, 12, 10);
INSERT INTO [Game] ([gameName], [releaseDate], [hoursPlayed], [genreId], [platformId]) VALUES ('Monster Hunter: World', '2018-01-26', 50, 12, 10);
INSERT INTO [Game] ([gameName], [releaseDate], [hoursPlayed], [genreId], [platformId]) VALUES ('Minecraft', '2009-05-17', 206, 12, 10);
INSERT INTO [Game] ([gameName], [releaseDate], [hoursPlayed], [genreId], [platformId]) VALUES ('Hellblade: Senuas Sacrifice', '2017-08-08', 10, 1, 10);
INSERT INTO [Game] ([gameName], [releaseDate], [hoursPlayed], [genreId], [platformId]) VALUES ('Human: Fall Flat', '2016-07-22', 7, 1, 10);
INSERT INTO [Game] ([gameName], [releaseDate], [hoursPlayed], [genreId], [platformId]) VALUES ('Red Dead Redemption 2', '2018-10-26', 8, 2, 10);
INSERT INTO [Game] ([gameName], [releaseDate], [hoursPlayed], [genreId], [platformId]) VALUES ('Sea of Thieves', '2018-03-20', 38, 2, 10);
INSERT INTO [Game] ([gameName], [releaseDate], [hoursPlayed], [genreId], [platformId]) VALUES ('Dead by Daylight', '2016-06-14', 16, 11, 10);
INSERT INTO [Game] ([gameName], [releaseDate], [hoursPlayed], [genreId], [platformId]) VALUES ('Overwatch', '2016-05-24', 2635, 8, 10);
INSERT INTO [Game] ([gameName], [releaseDate], [hoursPlayed], [genreId], [platformId]) VALUES ('Call of Duty: Modern Warfare', '2019-08-23', 159, 8, 10);

INSERT INTO [DevelopGame] ([gameId], [developerId]) VALUES (1, 1);
INSERT INTO [DevelopGame] ([gameId], [developerId]) VALUES (1, 2);
INSERT INTO [DevelopGame] ([gameId], [developerId]) VALUES (2, 1);
INSERT INTO [DevelopGame] ([gameId], [developerId]) VALUES (2, 2);
INSERT INTO [DevelopGame] ([gameId], [developerId]) VALUES (3, 2);
INSERT INTO [DevelopGame] ([gameId], [developerId]) VALUES (4, 3);
INSERT INTO [DevelopGame] ([gameId], [developerId]) VALUES (5, 4);
INSERT INTO [DevelopGame] ([gameId], [developerId]) VALUES (6, 5);
INSERT INTO [DevelopGame] ([gameId], [developerId]) VALUES (7, 1);
INSERT INTO [DevelopGame] ([gameId], [developerId]) VALUES (8, 1);

INSERT INTO [DevelopGame] ([gameId], [developerId]) VALUES (9, 6);
INSERT INTO [DevelopGame] ([gameId], [developerId]) VALUES (10, 6);
INSERT INTO [DevelopGame] ([gameId], [developerId]) VALUES (11, 6);
INSERT INTO [DevelopGame] ([gameId], [developerId]) VALUES (12, 6);
INSERT INTO [DevelopGame] ([gameId], [developerId]) VALUES (13, 6);
INSERT INTO [DevelopGame] ([gameId], [developerId]) VALUES (14, 6);
INSERT INTO [DevelopGame] ([gameId], [developerId]) VALUES (15, 7);
INSERT INTO [DevelopGame] ([gameId], [developerId]) VALUES (16, 8);
INSERT INTO [DevelopGame] ([gameId], [developerId]) VALUES (16, 9);

INSERT INTO [DevelopGame] ([gameId], [developerId]) VALUES (17, 6);
INSERT INTO [DevelopGame] ([gameId], [developerId]) VALUES (18, 6);
INSERT INTO [DevelopGame] ([gameId], [developerId]) VALUES (19, 6);
INSERT INTO [DevelopGame] ([gameId], [developerId]) VALUES (20, 6);
INSERT INTO [DevelopGame] ([gameId], [developerId]) VALUES (21, 10);
INSERT INTO [DevelopGame] ([gameId], [developerId]) VALUES (22, 11);
INSERT INTO [DevelopGame] ([gameId], [developerId]) VALUES (23, 1);
INSERT INTO [DevelopGame] ([gameId], [developerId]) VALUES (23, 2);

INSERT INTO [DevelopGame] ([gameId], [developerId]) VALUES (24, 1);
INSERT INTO [DevelopGame] ([gameId], [developerId]) VALUES (25, 2);
INSERT INTO [DevelopGame] ([gameId], [developerId]) VALUES (26, 12);
INSERT INTO [DevelopGame] ([gameId], [developerId]) VALUES (26, 13);
INSERT INTO [DevelopGame] ([gameId], [developerId]) VALUES (27, 1);
INSERT INTO [DevelopGame] ([gameId], [developerId]) VALUES (28, 1);
INSERT INTO [DevelopGame] ([gameId], [developerId]) VALUES (29, 1);
INSERT INTO [DevelopGame] ([gameId], [developerId]) VALUES (30, 2);
INSERT INTO [DevelopGame] ([gameId], [developerId]) VALUES (31, 1);
INSERT INTO [DevelopGame] ([gameId], [developerId]) VALUES (32, 14);
INSERT INTO [DevelopGame] ([gameId], [developerId]) VALUES (32, 15);
INSERT INTO [DevelopGame] ([gameId], [developerId]) VALUES (33, 16);
INSERT INTO [DevelopGame] ([gameId], [developerId]) VALUES (34, 17);

INSERT INTO [DevelopGame] ([gameId], [developerId]) VALUES (35, 6);
INSERT INTO [DevelopGame] ([gameId], [developerId]) VALUES (36, 6);
INSERT INTO [DevelopGame] ([gameId], [developerId]) VALUES (37, 1);
INSERT INTO [DevelopGame] ([gameId], [developerId]) VALUES (38, 7);
INSERT INTO [DevelopGame] ([gameId], [developerId]) VALUES (39, 7);
INSERT INTO [DevelopGame] ([gameId], [developerId]) VALUES (40, 7);
INSERT INTO [DevelopGame] ([gameId], [developerId]) VALUES (41, 1);
INSERT INTO [DevelopGame] ([gameId], [developerId]) VALUES (42, 1);
INSERT INTO [DevelopGame] ([gameId], [developerId]) VALUES (42, 18);
INSERT INTO [DevelopGame] ([gameId], [developerId]) VALUES (43, 19);
INSERT INTO [DevelopGame] ([gameId], [developerId]) VALUES (44, 2);
INSERT INTO [DevelopGame] ([gameId], [developerId]) VALUES (45, 1);
INSERT INTO [DevelopGame] ([gameId], [developerId]) VALUES (46, 1);

INSERT INTO [DevelopGame] ([gameId], [developerId]) VALUES (47, 6);
INSERT INTO [DevelopGame] ([gameId], [developerId]) VALUES (48, 1);

INSERT INTO [DevelopGame] ([gameId], [developerId]) VALUES (49, 1);
INSERT INTO [DevelopGame] ([gameId], [developerId]) VALUES (50, 1);
INSERT INTO [DevelopGame] ([gameId], [developerId]) VALUES (51, 1);
INSERT INTO [DevelopGame] ([gameId], [developerId]) VALUES (52, 1);
INSERT INTO [DevelopGame] ([gameId], [developerId]) VALUES (53, 11);
INSERT INTO [DevelopGame] ([gameId], [developerId]) VALUES (54, 20);
INSERT INTO [DevelopGame] ([gameId], [developerId]) VALUES (55, 1);
INSERT INTO [DevelopGame] ([gameId], [developerId]) VALUES (56, 1);
INSERT INTO [DevelopGame] ([gameId], [developerId]) VALUES (57, 1);

INSERT INTO [DevelopGame] ([gameId], [developerId]) VALUES (58, 1);
INSERT INTO [DevelopGame] ([gameId], [developerId]) VALUES (59, 1);

INSERT INTO [DevelopGame] ([gameId], [developerId]) VALUES (60, 21);
INSERT INTO [DevelopGame] ([gameId], [developerId]) VALUES (61, 10);
INSERT INTO [DevelopGame] ([gameId], [developerId]) VALUES (62, 22);
INSERT INTO [DevelopGame] ([gameId], [developerId]) VALUES (63, 23);
INSERT INTO [DevelopGame] ([gameId], [developerId]) VALUES (63, 24);
INSERT INTO [DevelopGame] ([gameId], [developerId]) VALUES (64, 25);
INSERT INTO [DevelopGame] ([gameId], [developerId]) VALUES (65, 26);
INSERT INTO [DevelopGame] ([gameId], [developerId]) VALUES (66, 27);
INSERT INTO [DevelopGame] ([gameId], [developerId]) VALUES (67, 28);
INSERT INTO [DevelopGame] ([gameId], [developerId]) VALUES (68, 29);
INSERT INTO [DevelopGame] ([gameId], [developerId]) VALUES (69, 30);
INSERT INTO [DevelopGame] ([gameId], [developerId]) VALUES (70, 31);
INSERT INTO [DevelopGame] ([gameId], [developerId]) VALUES (71, 32);

INSERT INTO [DevelopGame] ([gameId], [developerId]) VALUES (72, 30);
INSERT INTO [DevelopGame] ([gameId], [developerId]) VALUES (73, 30);
INSERT INTO [DevelopGame] ([gameId], [developerId]) VALUES (74, 33);
INSERT INTO [DevelopGame] ([gameId], [developerId]) VALUES (75, 34);
INSERT INTO [DevelopGame] ([gameId], [developerId]) VALUES (76, 35);
INSERT INTO [DevelopGame] ([gameId], [developerId]) VALUES (77, 36);
INSERT INTO [DevelopGame] ([gameId], [developerId]) VALUES (78, 36);
INSERT INTO [DevelopGame] ([gameId], [developerId]) VALUES (79, 36);
INSERT INTO [DevelopGame] ([gameId], [developerId]) VALUES (80, 37);
INSERT INTO [DevelopGame] ([gameId], [developerId]) VALUES (81, 38);
INSERT INTO [DevelopGame] ([gameId], [developerId]) VALUES (82, 39);
INSERT INTO [DevelopGame] ([gameId], [developerId]) VALUES (83, 40);

INSERT INTO [DevelopGame] ([gameId], [developerId]) VALUES (84, 41);
INSERT INTO [DevelopGame] ([gameId], [developerId]) VALUES (85, 42);
INSERT INTO [DevelopGame] ([gameId], [developerId]) VALUES (86, 43);
INSERT INTO [DevelopGame] ([gameId], [developerId]) VALUES (86, 29);
INSERT INTO [DevelopGame] ([gameId], [developerId]) VALUES (87, 44);
INSERT INTO [DevelopGame] ([gameId], [developerId]) VALUES (88, 34);
INSERT INTO [DevelopGame] ([gameId], [developerId]) VALUES (89, 41);
INSERT INTO [DevelopGame] ([gameId], [developerId]) VALUES (90, 45);
INSERT INTO [DevelopGame] ([gameId], [developerId]) VALUES (91, 46);
INSERT INTO [DevelopGame] ([gameId], [developerId]) VALUES (92, 52);
INSERT INTO [DevelopGame] ([gameId], [developerId]) VALUES (93, 47);
INSERT INTO [DevelopGame] ([gameId], [developerId]) VALUES (94, 29);
INSERT INTO [DevelopGame] ([gameId], [developerId]) VALUES (95, 39);
INSERT INTO [DevelopGame] ([gameId], [developerId]) VALUES (96, 39);
INSERT INTO [DevelopGame] ([gameId], [developerId]) VALUES (97, 39);
INSERT INTO [DevelopGame] ([gameId], [developerId]) VALUES (98, 39);
INSERT INTO [DevelopGame] ([gameId], [developerId]) VALUES (99, 48);
INSERT INTO [DevelopGame] ([gameId], [developerId]) VALUES (100, 49);
INSERT INTO [DevelopGame] ([gameId], [developerId]) VALUES (101, 50);
INSERT INTO [DevelopGame] ([gameId], [developerId]) VALUES (102, 7);
INSERT INTO [DevelopGame] ([gameId], [developerId]) VALUES (103, 51);
INSERT INTO [DevelopGame] ([gameId], [developerId]) VALUES (104, 52);
INSERT INTO [DevelopGame] ([gameId], [developerId]) VALUES (105, 37);
INSERT INTO [DevelopGame] ([gameId], [developerId]) VALUES (106, 35);
INSERT INTO [DevelopGame] ([gameId], [developerId]) VALUES (107, 3);
INSERT INTO [DevelopGame] ([gameId], [developerId]) VALUES (108, 53);
INSERT INTO [DevelopGame] ([gameId], [developerId]) VALUES (109, 25);
INSERT INTO [DevelopGame] ([gameId], [developerId]) VALUES (110, 40);

INSERT INTO [DevelopDesign] ([developerId], [designerId]) VALUES(1, 1);
INSERT INTO [DevelopDesign] ([developerId], [designerId]) VALUES(1, 6);
INSERT INTO [DevelopDesign] ([developerId], [designerId]) VALUES(1, 2);
INSERT INTO [DevelopDesign] ([developerId], [designerId]) VALUES(1, 11);
INSERT INTO [DevelopDesign] ([developerId], [designerId]) VALUES(1, 13);
INSERT INTO [DevelopDesign] ([developerId], [designerId]) VALUES(1, 14);
INSERT INTO [DevelopDesign] ([developerId], [designerId]) VALUES(1, 18);
INSERT INTO [DevelopDesign] ([developerId], [designerId]) VALUES(1, 21);
INSERT INTO [DevelopDesign] ([developerId], [designerId]) VALUES(1, 12);
INSERT INTO [DevelopDesign] ([developerId], [designerId]) VALUES(1, 22);
INSERT INTO [DevelopDesign] ([developerId], [designerId]) VALUES(1, 25);
INSERT INTO [DevelopDesign] ([developerId], [designerId]) VALUES(1, 10);
INSERT INTO [DevelopDesign] ([developerId], [designerId]) VALUES(1, 26);
INSERT INTO [DevelopDesign] ([developerId], [designerId]) VALUES(1, 8);
INSERT INTO [DevelopDesign] ([developerId], [designerId]) VALUES(1, 27);
INSERT INTO [DevelopDesign] ([developerId], [designerId]) VALUES(2, 1);
INSERT INTO [DevelopDesign] ([developerId], [designerId]) VALUES(2, 2);
INSERT INTO [DevelopDesign] ([developerId], [designerId]) VALUES(2, 11);
INSERT INTO [DevelopDesign] ([developerId], [designerId]) VALUES(2, 6);
INSERT INTO [DevelopDesign] ([developerId], [designerId]) VALUES(3, 81);
INSERT INTO [DevelopDesign] ([developerId], [designerId]) VALUES(4, 3);
INSERT INTO [DevelopDesign] ([developerId], [designerId]) VALUES(4, 4);
INSERT INTO [DevelopDesign] ([developerId], [designerId]) VALUES(5, 5);
INSERT INTO [DevelopDesign] ([developerId], [designerId]) VALUES(6, 7);
INSERT INTO [DevelopDesign] ([developerId], [designerId]) VALUES(6, 9);
INSERT INTO [DevelopDesign] ([developerId], [designerId]) VALUES(6, 17);
INSERT INTO [DevelopDesign] ([developerId], [designerId]) VALUES(6, 24);
INSERT INTO [DevelopDesign] ([developerId], [designerId]) VALUES(7, 8);
INSERT INTO [DevelopDesign] ([developerId], [designerId]) VALUES(7, 20);
INSERT INTO [DevelopDesign] ([developerId], [designerId]) VALUES(7, 75);
INSERT INTO [DevelopDesign] ([developerId], [designerId]) VALUES(8, 5);
INSERT INTO [DevelopDesign] ([developerId], [designerId]) VALUES(9, 5);
INSERT INTO [DevelopDesign] ([developerId], [designerId]) VALUES(11, 10);
INSERT INTO [DevelopDesign] ([developerId], [designerId]) VALUES(14, 15);
INSERT INTO [DevelopDesign] ([developerId], [designerId]) VALUES(15, 15);
INSERT INTO [DevelopDesign] ([developerId], [designerId]) VALUES(16, 16);
INSERT INTO [DevelopDesign] ([developerId], [designerId]) VALUES(17, 16);
INSERT INTO [DevelopDesign] ([developerId], [designerId]) VALUES(19, 6);
INSERT INTO [DevelopDesign] ([developerId], [designerId]) VALUES(19, 23);
INSERT INTO [DevelopDesign] ([developerId], [designerId]) VALUES(21, 28);
INSERT INTO [DevelopDesign] ([developerId], [designerId]) VALUES(21, 29);
INSERT INTO [DevelopDesign] ([developerId], [designerId]) VALUES(21, 30);
INSERT INTO [DevelopDesign] ([developerId], [designerId]) VALUES(21, 31);
INSERT INTO [DevelopDesign] ([developerId], [designerId]) VALUES(22, 32);
INSERT INTO [DevelopDesign] ([developerId], [designerId]) VALUES(22, 33);
INSERT INTO [DevelopDesign] ([developerId], [designerId]) VALUES(23, 34);
INSERT INTO [DevelopDesign] ([developerId], [designerId]) VALUES(23, 35);
INSERT INTO [DevelopDesign] ([developerId], [designerId]) VALUES(23, 36);
INSERT INTO [DevelopDesign] ([developerId], [designerId]) VALUES(24, 34);
INSERT INTO [DevelopDesign] ([developerId], [designerId]) VALUES(24, 35);
INSERT INTO [DevelopDesign] ([developerId], [designerId]) VALUES(24, 36);
INSERT INTO [DevelopDesign] ([developerId], [designerId]) VALUES(25, 38);
INSERT INTO [DevelopDesign] ([developerId], [designerId]) VALUES(25, 39);
INSERT INTO [DevelopDesign] ([developerId], [designerId]) VALUES(25, 40);
INSERT INTO [DevelopDesign] ([developerId], [designerId]) VALUES(25, 83);
INSERT INTO [DevelopDesign] ([developerId], [designerId]) VALUES(27, 41);
INSERT INTO [DevelopDesign] ([developerId], [designerId]) VALUES(28, 42);
INSERT INTO [DevelopDesign] ([developerId], [designerId]) VALUES(29, 64);
INSERT INTO [DevelopDesign] ([developerId], [designerId]) VALUES(29, 65);
INSERT INTO [DevelopDesign] ([developerId], [designerId]) VALUES(29, 66);
INSERT INTO [DevelopDesign] ([developerId], [designerId]) VALUES(30, 43);
INSERT INTO [DevelopDesign] ([developerId], [designerId]) VALUES(30, 44);
INSERT INTO [DevelopDesign] ([developerId], [designerId]) VALUES(30, 46);
INSERT INTO [DevelopDesign] ([developerId], [designerId]) VALUES(30, 47);
INSERT INTO [DevelopDesign] ([developerId], [designerId]) VALUES(30, 48);
INSERT INTO [DevelopDesign] ([developerId], [designerId]) VALUES(32, 45);
INSERT INTO [DevelopDesign] ([developerId], [designerId]) VALUES(33, 49);
INSERT INTO [DevelopDesign] ([developerId], [designerId]) VALUES(33, 50);
INSERT INTO [DevelopDesign] ([developerId], [designerId]) VALUES(34, 51);
INSERT INTO [DevelopDesign] ([developerId], [designerId]) VALUES(35, 52);
INSERT INTO [DevelopDesign] ([developerId], [designerId]) VALUES(35, 53);
INSERT INTO [DevelopDesign] ([developerId], [designerId]) VALUES(35, 80);
INSERT INTO [DevelopDesign] ([developerId], [designerId]) VALUES(36, 54);
INSERT INTO [DevelopDesign] ([developerId], [designerId]) VALUES(36, 55);
INSERT INTO [DevelopDesign] ([developerId], [designerId]) VALUES(36, 56);
INSERT INTO [DevelopDesign] ([developerId], [designerId]) VALUES(37, 57);
INSERT INTO [DevelopDesign] ([developerId], [designerId]) VALUES(37, 58);
INSERT INTO [DevelopDesign] ([developerId], [designerId]) VALUES(38, 59);
INSERT INTO [DevelopDesign] ([developerId], [designerId]) VALUES(39, 60);
INSERT INTO [DevelopDesign] ([developerId], [designerId]) VALUES(40, 61);
INSERT INTO [DevelopDesign] ([developerId], [designerId]) VALUES(40, 62);
INSERT INTO [DevelopDesign] ([developerId], [designerId]) VALUES(42, 63);
INSERT INTO [DevelopDesign] ([developerId], [designerId]) VALUES(43, 64);
INSERT INTO [DevelopDesign] ([developerId], [designerId]) VALUES(43, 65);
INSERT INTO [DevelopDesign] ([developerId], [designerId]) VALUES(43, 66);
INSERT INTO [DevelopDesign] ([developerId], [designerId]) VALUES(44, 69);
INSERT INTO [DevelopDesign] ([developerId], [designerId]) VALUES(46, 70);
INSERT INTO [DevelopDesign] ([developerId], [designerId]) VALUES(49, 72);
INSERT INTO [DevelopDesign] ([developerId], [designerId]) VALUES(49, 73);
INSERT INTO [DevelopDesign] ([developerId], [designerId]) VALUES(50, 74);
INSERT INTO [DevelopDesign] ([developerId], [designerId]) VALUES(51, 76);
INSERT INTO [DevelopDesign] ([developerId], [designerId]) VALUES(51, 77);
INSERT INTO [DevelopDesign] ([developerId], [designerId]) VALUES(52, 78);
INSERT INTO [DevelopDesign] ([developerId], [designerId]) VALUES(52, 79);
INSERT INTO [DevelopDesign] ([developerId], [designerId]) VALUES(53, 82);
