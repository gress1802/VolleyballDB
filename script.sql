--CREATE DATABASE Volleyball; --creating the database

/*
 *Creating the tables for Club, Team, Coach, and Player that will hold 
 *the data
*/

CREATE TABLE Club(--Creating our Club table
    ClubID INTEGER PRIMARY KEY AUTOINCREMENT,
    Rank NVARCHAR(24) NOT NULL,
    Name NVARCHAR(24) NOT NULL, 
    State NVARCHAR(24) NOT NULL,
    City NVARCHAR(24) NOT NULL
);

CREATE TABLE Team(--Creating our Team table
    TeamID INTEGER PRIMARY KEY AUTOINCREMENT,
    Name NVARCHAR(24) NOT NULL,
    Division NVARCHAR(24) NOT NULL
);

CREATE TABLE Coach(--Creating our Coach table
    CoachID INTEGER PRIMARY KEY AUTOINCREMENT,
    Salary INTEGER NOT NULL,
    LastName NVARCHAR(24) NOT NULL,
    FirstName NVARCHAR(24) NOT NULL
);

CREATE TABLE Player(--Creating our Player table
    PlayerID INTEGER PRIMARY KEY AUTOINCREMENT,
    Number INTEGER NOT NULL,
    AgeGroup INTEGER NOT NULL,
    FirstName NVARCHAR(24) NOT NULL,
    LastName NVARCHAR(24) NOT NULL
);

/*
 *Now creating the relationship tables
*/

CREATE TABLE PartOfC( --Relationship (Club (1) <-> (Many) Team) 
    ClubID INTEGER NOT NULL,
    TeamID INTEGER NOT NULL,
    CONSTRAINT fk_team_part_of_club FOREIGN KEY (TeamID) REFERENCES Team(TeamID),
    CONSTRAINT fk_club_has_team FOREIGN KEY (ClubID) REFERENCES Club(ClubID)
);

CREATE TABLE PlaysForT( --Relationship (Team (1) <-> (Many) Player)
    TeamID INTEGER NOT NULL,
    PlayerID INTEGER NOT NULL,
    CONSTRAINT fk_player_plays_forT FOREIGN KEY (PlayerID) REFERENCES Player(PlayerID),
    CONSTRAINT fk_team_has_player FOREIGN KEY (TeamID) REFERENCES Team(TeamID)
);

CREATE TABLE Coaches( --Relationship (Player (Many) <-> (1) Coach)
    CoachID INTEGER NOT NULL,
    PlayerID INTEGER NOT NULL,
    CONSTRAINT fk_player_plays_forC FOREIGN KEY (PlayerID) REFERENCES Player(PlayerID),
    CONSTRAINT fk_coach_coaches_player FOREIGN KEY (CoachID) REFERENCES Coach(CoachID)
);

CREATE TABLE CoachesFor( --Relationship (Coach (Many) <-> (1) Club)
    CoachID INTEGER NOT NULL,
    ClubID INTEGER NOT NULL,
    CONSTRAINT coach_coaches_for FOREIGN KEY (CoachID) REFERENCES Coach(CoachID),
    CONSTRAINT club_has_coach FOREIGN KEY (ClubID) REFERENCES Club(ClubID)
);

/*
 *Now adding tuples to the tables
*/

--Starting with Club table (5 Clubs)
INSERT INTO Club (Rank, Name, State, City) VALUES (1, 'MVC', 'Wisconsin', 'New Berlin');
INSERT INTO Club (Rank, Name, State, City) VALUES (2, 'Balboa Bay', 'California', 'Los Angeles');
INSERT INTO Club (Rank, Name, State, City) VALUES (3, '630', 'Ohio', 'Columbus');
INSERT INTO Club (Rank, Name, State, City) VALUES (4, 'Victory', 'New York', 'Syracuse');
INSERT INTO Club (Rank, Name, State, City) VALUES (5, '949', 'California', 'San Francisco');
INSERT INTO Club (Rank, Name, State, City) VALUES (6, 'Rockstar', 'Florida', 'Miami');
INSERT INTO Club (Rank, Name, State, City) VALUES (7, 'Academy', 'Florida', 'Orlando');
INSERT INTO Club (Rank, Name, State, City) VALUES (8, 'MKE Sting', 'Wisconsin', 'Pewaukee');

--Team table (20)
INSERT INTO Team (Name, Division) VALUES ('MVC 18 Black', 'Open');
INSERT INTO Team (Name, Division) VALUES ('MVC 18 White', 'USA');
INSERT INTO Team (Name, Division) VALUES ('BB Gold', 'Open');
INSERT INTO Team (Name, Division) VALUES ('BB Silver', 'USA');
INSERT INTO Team (Name, Division) VALUES ('BB Bronze', 'USA');
INSERT INTO Team (Name, Division) VALUES ('630 Matt', 'Open');
INSERT INTO Team (Name, Division) VALUES ('630 Joey', 'USA');
INSERT INTO Team (Name, Division) VALUES ('Victory A', 'Open');
INSERT INTO Team (Name, Division) VALUES ('Victory B', 'USA');
INSERT INTO Team (Name, Division) VALUES ('949 Blue', 'Open');
INSERT INTO Team (Name, Division) VALUES ('949 Red', 'USA');
INSERT INTO Team (Name, Division) VALUES ('949 White', 'USA');
INSERT INTO Team (Name, Division) VALUES ('Rockstar 1', 'Open');
INSERT INTO Team (Name, Division) VALUES ('Rockstar 2', 'USA');
INSERT INTO Team (Name, Division) VALUES ('Academy Light', 'Open');
INSERT INTO Team (Name, Division) VALUES ('Academy Dark', 'USA');
INSERT INTO Team (Name, Division) VALUES ('Sting Gold', 'Open');
INSERT INTO Team (Name, Division) VALUES ('Sting Blue', 'USA');
INSERT INTO Team (Name, Division) VALUES ('Sting Silver', 'USA');
INSERT INTO Team (Name, Division) VALUES ('Sting Red', 'USA');

--Coach table (20)
INSERT INTO Coach (Salary, LastName, FirstName) VALUES (5000, 'Frye', 'Milan');
INSERT INTO Coach (Salary, LastName, FirstName) VALUES (3500, 'Hernandez', 'Moses');
INSERT INTO Coach (Salary, LastName, FirstName) VALUES (7000, 'Underwood', 'Glenn');
INSERT INTO Coach (Salary, LastName, FirstName) VALUES (2000, 'Cordova', 'Wade');
INSERT INTO Coach (Salary, LastName, FirstName) VALUES (10000, 'Palmer', 'Keane');
INSERT INTO Coach (Salary, LastName, FirstName) VALUES (1750, 'Cox', "Otto");
INSERT INTO Coach (Salary, LastName, FirstName) VALUES (3500, 'Collins', 'Kieron');
INSERT INTO Coach (Salary, LastName, FirstName) VALUES (4000, 'Golden', 'Ahmad');
INSERT INTO Coach (Salary, LastName, FirstName) VALUES (5000, 'Pittman', 'Tegan');
INSERT INTO Coach (Salary, LastName, FirstName) VALUES (4500, 'Montoya', 'Ehsan');
INSERT INTO Coach (Salary, LastName, FirstName) VALUES (2500, 'Gibbons', 'Dana');
INSERT INTO Coach (Salary, LastName, FirstName) VALUES (1000, 'Morrow', 'Eden');
INSERT INTO Coach (Salary, LastName, FirstName) VALUES (2000, 'Arias', 'Keeley');
INSERT INTO Coach (Salary, LastName, FirstName) VALUES (7000, 'Rollins', 'Trinity');
INSERT INTO Coach (Salary, LastName, FirstName) VALUES (3500, 'Huber', 'Tyler');
INSERT INTO Coach (Salary, LastName, FirstName) VALUES (5000, 'Lom', 'Evan');
INSERT INTO Coach (Salary, LastName, FirstName) VALUES (7000, 'Richardson', 'Chris');
INSERT INTO Coach (Salary, LastName, FirstName) VALUES (2500, 'Hussey', 'Connor');
INSERT INTO Coach (Salary, LastName, FirstName) VALUES (10000, 'Gress', 'Joseph');
INSERT INTO Coach (Salary, LastName, FirstName) VALUES (5000, 'Seamonson', 'David');

--Player Table (120 total players for exacly 6 per team)
--first age group is 16
INSERT INTO Player (Number, AgeGroup, FirstName, LastName) VALUES (1, 16, 'Warren', 'Houston');
INSERT INTO Player (Number, AgeGroup, FirstName, LastName) VALUES (2, 16, 'Omer', 'Arnold');
INSERT INTO Player (Number, AgeGroup, FirstName, LastName) VALUES (3, 16, 'Silas', 'Fulton');
INSERT INTO Player (Number, AgeGroup, FirstName, LastName) VALUES (4, 16, 'Felix', 'Lopez');
INSERT INTO Player (Number, AgeGroup, FirstName, LastName) VALUES (5, 16, 'Owain', 'Curry');
INSERT INTO Player (Number, AgeGroup, FirstName, LastName) VALUES (6, 16, 'Finnley', 'Davidson');

INSERT INTO Player (Number, AgeGroup, FirstName, LastName) VALUES (1, 16, 'Otto' , 'Holloway');
INSERT INTO Player (Number, AgeGroup, FirstName, LastName) VALUES (2, 16, 'Adem' , 'Bowen');
INSERT INTO Player (Number, AgeGroup, FirstName, LastName) VALUES (3, 16, 'Mason' , 'Barron');
INSERT INTO Player (Number, AgeGroup, FirstName, LastName) VALUES (4, 16, 'Hamish' , 'Adkins');
INSERT INTO Player (Number, AgeGroup, FirstName, LastName) VALUES (5, 16, 'Xavier' , 'Shields');
INSERT INTO Player (Number, AgeGroup, FirstName, LastName) VALUES (6, 16, 'Kaden' , 'Maddox');

INSERT INTO Player (Number, AgeGroup, FirstName, LastName) VALUES (1, 16, 'Frazer' , 'Lara');
INSERT INTO Player (Number, AgeGroup, FirstName, LastName) VALUES (2, 16, 'Dajuan' , 'Falk');
INSERT INTO Player (Number, AgeGroup, FirstName, LastName) VALUES (3, 16, 'Larissa' , 'Fanning');
INSERT INTO Player (Number, AgeGroup, FirstName, LastName) VALUES (4, 16, 'Rafael' , 'Weir');
INSERT INTO Player (Number, AgeGroup, FirstName, LastName) VALUES (5, 16, 'Margarita' , 'Parent');
INSERT INTO Player (Number, AgeGroup, FirstName, LastName) VALUES (6, 16, 'Norman' , 'Lumpkin');

INSERT INTO Player (Number, AgeGroup, FirstName, LastName) VALUES (1, 16, 'Sabrina' , 'Brock');
INSERT INTO Player (Number, AgeGroup, FirstName, LastName) VALUES (2, 16, 'Bradford' , 'Feliciano');
INSERT INTO Player (Number, AgeGroup, FirstName, LastName) VALUES (3, 16, 'Aldo' , 'Kilpatrick');
INSERT INTO Player (Number, AgeGroup, FirstName, LastName) VALUES (4, 16, 'Reece' , 'Braun');
INSERT INTO Player (Number, AgeGroup, FirstName, LastName) VALUES (5, 16, 'Cydney' , 'Pyle');
INSERT INTO Player (Number, AgeGroup, FirstName, LastName) VALUES (6, 16, 'Fredy' , 'Decker');

INSERT INTO Player (Number, AgeGroup, FirstName, LastName) VALUES (1, 16, 'Ana' , 'Luther');
INSERT INTO Player (Number, AgeGroup, FirstName, LastName) VALUES (2, 16, 'Haylee' , 'Jameson');
INSERT INTO Player (Number, AgeGroup, FirstName, LastName) VALUES (3, 16, 'Jaleel' , 'Bennett');
INSERT INTO Player (Number, AgeGroup, FirstName, LastName) VALUES (4, 16, 'Conner' , 'Regan');
INSERT INTO Player (Number, AgeGroup, FirstName, LastName) VALUES (5, 16, 'Lizette' , 'Phelps');
INSERT INTO Player (Number, AgeGroup, FirstName, LastName) VALUES (6, 16, 'Walter' , 'Pease');

--second age group is 17

INSERT INTO Player (Number, AgeGroup, FirstName, LastName) VALUES (1, 17, 'Ariana' , 'Wilburn');
INSERT INTO Player (Number, AgeGroup, FirstName, LastName) VALUES (2, 17, 'Tobias' , 'McCorkle');
INSERT INTO Player (Number, AgeGroup, FirstName, LastName) VALUES (3, 17, 'Adriana' , 'Serna');
INSERT INTO Player (Number, AgeGroup, FirstName, LastName) VALUES (4, 17, 'Jair' , 'Caswell');
INSERT INTO Player (Number, AgeGroup, FirstName, LastName) VALUES (5, 17, 'Reilly' , 'Hope');
INSERT INTO Player (Number, AgeGroup, FirstName, LastName) VALUES (6, 17, 'Eleazar' , 'Flanagan');

INSERT INTO Player (Number, AgeGroup, FirstName, LastName) VALUES (1, 17, 'Winston' , 'Connor');
INSERT INTO Player (Number, AgeGroup, FirstName, LastName) VALUES (2, 17, 'Trista' , 'Gaddis');
INSERT INTO Player (Number, AgeGroup, FirstName, LastName) VALUES (3, 17, 'Brad' , 'Wills');
INSERT INTO Player (Number, AgeGroup, FirstName, LastName) VALUES (4, 17, 'Alexander' , 'Colwell');
INSERT INTO Player (Number, AgeGroup, FirstName, LastName) VALUES (5, 17, 'Gladys' , 'Alba');
INSERT INTO Player (Number, AgeGroup, FirstName, LastName) VALUES (6, 17, 'Jovan' , 'Carlson');

INSERT INTO Player (Number, AgeGroup, FirstName, LastName) VALUES (1, 17, 'Jacob' , 'Lester');
INSERT INTO Player (Number, AgeGroup, FirstName, LastName) VALUES (2, 17, 'Yazmin' , 'Forster');
INSERT INTO Player (Number, AgeGroup, FirstName, LastName) VALUES (3, 17, 'Cielo' , 'Noyes');
INSERT INTO Player (Number, AgeGroup, FirstName, LastName) VALUES (4, 17, 'Misty' , 'Rosado');
INSERT INTO Player (Number, AgeGroup, FirstName, LastName) VALUES (5, 17, 'Ava' , 'Cockrell');
INSERT INTO Player (Number, AgeGroup, FirstName, LastName) VALUES (6, 17, 'Stephen' , 'Clough');

INSERT INTO Player (Number, AgeGroup, FirstName, LastName) VALUES (1, 17, 'Bryanna' , 'Garcia');
INSERT INTO Player (Number, AgeGroup, FirstName, LastName) VALUES (2, 17, 'Breanna' , 'Baca');
INSERT INTO Player (Number, AgeGroup, FirstName, LastName) VALUES (3, 17, 'Damion' , 'Vickers');
INSERT INTO Player (Number, AgeGroup, FirstName, LastName) VALUES (4, 17, 'Gilberto' , 'Barron');
INSERT INTO Player (Number, AgeGroup, FirstName, LastName) VALUES (5, 17, 'Janiya' , 'Ball');
INSERT INTO Player (Number, AgeGroup, FirstName, LastName) VALUES (6, 17, 'Litzy' , 'Johns');

INSERT INTO Player (Number, AgeGroup, FirstName, LastName) VALUES (1, 17, 'Kelsey' , 'Lankford');
INSERT INTO Player (Number, AgeGroup, FirstName, LastName) VALUES (2, 17, 'Kalie' , 'Gross');
INSERT INTO Player (Number, AgeGroup, FirstName, LastName) VALUES (3, 17, 'Rylan' , 'Cameron');
INSERT INTO Player (Number, AgeGroup, FirstName, LastName) VALUES (4, 17, 'Marisa' , 'Alonzo');
INSERT INTO Player (Number, AgeGroup, FirstName, LastName) VALUES (5, 17, 'Vicky' , 'Crowley');
INSERT INTO Player (Number, AgeGroup, FirstName, LastName) VALUES (6, 17, 'Alia' , 'Guthrie');

--third age group is 18

INSERT INTO Player (Number, AgeGroup, FirstName, LastName) VALUES (1, 18, 'Nicklaus' , 'Gibson');
INSERT INTO Player (Number, AgeGroup, FirstName, LastName) VALUES (2, 18, 'Jackie' , 'Salgado');
INSERT INTO Player (Number, AgeGroup, FirstName, LastName) VALUES (3, 18, 'Meghan' , 'Benoit');
INSERT INTO Player (Number, AgeGroup, FirstName, LastName) VALUES (4, 18, 'Rhianna' , 'Aguilera');
INSERT INTO Player (Number, AgeGroup, FirstName, LastName) VALUES (5, 18, 'Damien' , 'Finney');
INSERT INTO Player (Number, AgeGroup, FirstName, LastName) VALUES (6, 18, 'Derick' , 'Goforth');

INSERT INTO Player (Number, AgeGroup, FirstName, LastName) VALUES (1, 18, 'Guillermo' , 'Abernathy');
INSERT INTO Player (Number, AgeGroup, FirstName, LastName) VALUES (2, 18, 'Nathan' , 'Wagoner');
INSERT INTO Player (Number, AgeGroup, FirstName, LastName) VALUES (3, 18, 'Mae' , 'Fennell');
INSERT INTO Player (Number, AgeGroup, FirstName, LastName) VALUES (4, 18, 'Kyle' , 'Jackson');
INSERT INTO Player (Number, AgeGroup, FirstName, LastName) VALUES (5, 18, 'Raul' , 'Dunbar');
INSERT INTO Player (Number, AgeGroup, FirstName, LastName) VALUES (6, 18, 'Shannon' , 'Sprague');

INSERT INTO Player (Number, AgeGroup, FirstName, LastName) VALUES (1, 18, 'Sam' , 'Whipple');
INSERT INTO Player (Number, AgeGroup, FirstName, LastName) VALUES (2, 18, 'Alec' , 'Roland');
INSERT INTO Player (Number, AgeGroup, FirstName, LastName) VALUES (3, 18, 'Harvey' , 'Earley');
INSERT INTO Player (Number, AgeGroup, FirstName, LastName) VALUES (4, 18, 'Chance' , 'Acosta');
INSERT INTO Player (Number, AgeGroup, FirstName, LastName) VALUES (5, 18, 'Joan' , 'Crowell');
INSERT INTO Player (Number, AgeGroup, FirstName, LastName) VALUES (6, 18, 'Jajuan' , 'Lea');

INSERT INTO Player (Number, AgeGroup, FirstName, LastName) VALUES (1, 18, 'Jamar' , 'Driver');
INSERT INTO Player (Number, AgeGroup, FirstName, LastName) VALUES (2, 18, 'Yisroel' , 'Grubbs');
INSERT INTO Player (Number, AgeGroup, FirstName, LastName) VALUES (3, 18, 'Dana' , 'Deutsch');
INSERT INTO Player (Number, AgeGroup, FirstName, LastName) VALUES (4, 18, 'Quinn' , 'Keck');
INSERT INTO Player (Number, AgeGroup, FirstName, LastName) VALUES (5, 18, 'India' , 'Britt');
INSERT INTO Player (Number, AgeGroup, FirstName, LastName) VALUES (6, 18, 'Camden' , 'Donaldson');

INSERT INTO Player (Number, AgeGroup, FirstName, LastName) VALUES (1, 18, 'Rayshawn' , 'Spears');
INSERT INTO Player (Number, AgeGroup, FirstName, LastName) VALUES (2, 18, 'Forrest' , 'Mauldin');
INSERT INTO Player (Number, AgeGroup, FirstName, LastName) VALUES (3, 18, 'Emely' , 'Sikes');
INSERT INTO Player (Number, AgeGroup, FirstName, LastName) VALUES (4, 18, 'Linda' , 'Browning');
INSERT INTO Player (Number, AgeGroup, FirstName, LastName) VALUES (5, 18, 'Shayne' , 'Ontiveros');
INSERT INTO Player (Number, AgeGroup, FirstName, LastName) VALUES (6, 18, 'Lawrence' , 'Creamer');

--Fourth age group is 15

INSERT INTO Player (Number, AgeGroup, FirstName, LastName) VALUES (1, 15, 'Marcellus' , 'Ripley');
INSERT INTO Player (Number, AgeGroup, FirstName, LastName) VALUES (2, 15, 'Darrin' , 'Hodge');
INSERT INTO Player (Number, AgeGroup, FirstName, LastName) VALUES (3, 15, 'Sonia' , 'Padgett');
INSERT INTO Player (Number, AgeGroup, FirstName, LastName) VALUES (4, 15, 'Lesli' , 'Sawyer');
INSERT INTO Player (Number, AgeGroup, FirstName, LastName) VALUES (5, 15, 'Kaci' , 'Padron');
INSERT INTO Player (Number, AgeGroup, FirstName, LastName) VALUES (6, 15, 'Ramiro' , 'Moe');

INSERT INTO Player (Number, AgeGroup, FirstName, LastName) VALUES (1, 15, 'Lynette' , 'Joshua');
INSERT INTO Player (Number, AgeGroup, FirstName, LastName) VALUES (2, 15, 'Trae' , 'Johns');
INSERT INTO Player (Number, AgeGroup, FirstName, LastName) VALUES (3, 15, 'Alden' , 'Hagen');
INSERT INTO Player (Number, AgeGroup, FirstName, LastName) VALUES (4, 15, 'Shemar' , 'Robertson');
INSERT INTO Player (Number, AgeGroup, FirstName, LastName) VALUES (5, 15, 'Ramon' , 'Hatcher');
INSERT INTO Player (Number, AgeGroup, FirstName, LastName) VALUES (6, 15, 'Talia' , 'Madsen');

INSERT INTO Player (Number, AgeGroup, FirstName, LastName) VALUES (1, 15, 'Destiny' , 'Nielsen');
INSERT INTO Player (Number, AgeGroup, FirstName, LastName) VALUES (2, 15, 'Bernadette' , 'Shuman');
INSERT INTO Player (Number, AgeGroup, FirstName, LastName) VALUES (3, 15, 'Martina' , 'Feldman');
INSERT INTO Player (Number, AgeGroup, FirstName, LastName) VALUES (4, 15, 'Areli' , 'Kurtz');
INSERT INTO Player (Number, AgeGroup, FirstName, LastName) VALUES (5, 15, 'Cecilia' , 'Decker');
INSERT INTO Player (Number, AgeGroup, FirstName, LastName) VALUES (6, 15, 'Michael' , 'Hardy');

INSERT INTO Player (Number, AgeGroup, FirstName, LastName) VALUES (1, 15, 'Dallas' , 'Wiseman');
INSERT INTO Player (Number, AgeGroup, FirstName, LastName) VALUES (2, 15, 'Adonis' , 'Craven');
INSERT INTO Player (Number, AgeGroup, FirstName, LastName) VALUES (3, 15, 'Dexter' , 'Franks');
INSERT INTO Player (Number, AgeGroup, FirstName, LastName) VALUES (4, 15, 'Stephon' , 'Waite');
INSERT INTO Player (Number, AgeGroup, FirstName, LastName) VALUES (5, 15, 'Renae' , 'Boyd');
INSERT INTO Player (Number, AgeGroup, FirstName, LastName) VALUES (6, 15, 'Devon' , 'McClure');

INSERT INTO Player (Number, AgeGroup, FirstName, LastName) VALUES (1, 15, 'Eboni' , 'Berry');
INSERT INTO Player (Number, AgeGroup, FirstName, LastName) VALUES (2, 15, 'Jesenia' , 'Babb');
INSERT INTO Player (Number, AgeGroup, FirstName, LastName) VALUES (3, 15, 'Matthew' , 'Chin');
INSERT INTO Player (Number, AgeGroup, FirstName, LastName) VALUES (4, 15, 'Fredy' , 'Gaston');
INSERT INTO Player (Number, AgeGroup, FirstName, LastName) VALUES (5, 15, 'Devon' , 'Burns');
INSERT INTO Player (Number, AgeGroup, FirstName, LastName) VALUES (6, 15, 'Alayna' , 'Land');

/*
 *Now adding to the relationships
*/

--PartOfC table
--MVC
INSERT INTO PartOfC (ClubID, TeamID) VALUES (1, 1);
INSERT INTO PartOfC (ClubID, TeamID) VALUES (1, 2);
--BB
INSERT INTO PartOfC (ClubID, TeamID) VALUES (2, 3);
INSERT INTO PartOfC (ClubID, TeamID) VALUES (2, 4);
INSERT INTO PartOfC (ClubID, TeamID) VALUES (2, 5);
--640
INSERT INTO PartOfC (ClubID, TeamID) VALUES (3, 6);
INSERT INTO PartOfC (ClubID, TeamID) VALUES (3, 7);
--Victory
INSERT INTO PartOfC (ClubID, TeamID) VALUES (4, 8);
INSERT INTO PartOfC (ClubID, TeamID) VALUES (4, 9);
--949
INSERT INTO PartOfC (ClubID, TeamID) VALUES (5, 10);
INSERT INTO PartOfC (ClubID, TeamID) VALUES (5, 11);
INSERT INTO PartOfC (ClubID, TeamID) VALUES (5, 12);
--Rockstar
INSERT INTO PartOfC (ClubID, TeamID) VALUES (6, 13);
INSERT INTO PartOfC (ClubID, TeamID) VALUES (6, 14);
--Academy
INSERT INTO PartOfC (ClubID, TeamID) VALUES (7, 15);
INSERT INTO PartOfC (ClubID, TeamID) VALUES (7, 16);
--Sting
INSERT INTO PartOfC (ClubID, TeamID) VALUES (8, 17);
INSERT INTO PartOfC (ClubID, TeamID) VALUES (8, 18);
INSERT INTO PartOfC (ClubID, TeamID) VALUES (8, 19);
INSERT INTO PartOfC (ClubID, TeamID) VALUES (8, 20);

--PlaysForT table
INSERT INTO PlaysForT (TeamID, PlayerID) VALUES (1, 1);
INSERT INTO PlaysForT (TeamID, PlayerID) VALUES (1, 2);
INSERT INTO PlaysForT (TeamID, PlayerID) VALUES (1, 3);
INSERT INTO PlaysForT (TeamID, PlayerID) VALUES (1, 4);
INSERT INTO PlaysForT (TeamID, PlayerID) VALUES (1, 5);
INSERT INTO PlaysForT (TeamID, PlayerID) VALUES (1, 6);

INSERT INTO PlaysForT (TeamID, PlayerID) VALUES (2, 7);
INSERT INTO PlaysForT (TeamID, PlayerID) VALUES (2, 8);
INSERT INTO PlaysForT (TeamID, PlayerID) VALUES (2, 9);
INSERT INTO PlaysForT (TeamID, PlayerID) VALUES (2, 10);
INSERT INTO PlaysForT (TeamID, PlayerID) VALUES (2, 11);
INSERT INTO PlaysForT (TeamID, PlayerID) VALUES (2, 12);

INSERT INTO PlaysForT (TeamID, PlayerID) VALUES (3, 13);
INSERT INTO PlaysForT (TeamID, PlayerID) VALUES (3, 14);
INSERT INTO PlaysForT (TeamID, PlayerID) VALUES (3, 15);
INSERT INTO PlaysForT (TeamID, PlayerID) VALUES (3, 16);
INSERT INTO PlaysForT (TeamID, PlayerID) VALUES (3, 17);
INSERT INTO PlaysForT (TeamID, PlayerID) VALUES (3, 18);

INSERT INTO PlaysForT (TeamID, PlayerID) VALUES (4, 19);
INSERT INTO PlaysForT (TeamID, PlayerID) VALUES (4, 20);
INSERT INTO PlaysForT (TeamID, PlayerID) VALUES (4, 21);
INSERT INTO PlaysForT (TeamID, PlayerID) VALUES (4, 22);
INSERT INTO PlaysForT (TeamID, PlayerID) VALUES (4, 23);
INSERT INTO PlaysForT (TeamID, PlayerID) VALUES (4, 24);

INSERT INTO PlaysForT (TeamID, PlayerID) VALUES (5, 25);
INSERT INTO PlaysForT (TeamID, PlayerID) VALUES (5, 26);
INSERT INTO PlaysForT (TeamID, PlayerID) VALUES (5, 27);
INSERT INTO PlaysForT (TeamID, PlayerID) VALUES (5, 28);
INSERT INTO PlaysForT (TeamID, PlayerID) VALUES (5, 29);
INSERT INTO PlaysForT (TeamID, PlayerID) VALUES (5, 30);

INSERT INTO PlaysForT (TeamID, PlayerID) VALUES (6, 31);
INSERT INTO PlaysForT (TeamID, PlayerID) VALUES (6, 32);
INSERT INTO PlaysForT (TeamID, PlayerID) VALUES (6, 33);
INSERT INTO PlaysForT (TeamID, PlayerID) VALUES (6, 34);
INSERT INTO PlaysForT (TeamID, PlayerID) VALUES (6, 35);
INSERT INTO PlaysForT (TeamID, PlayerID) VALUES (6, 36);

INSERT INTO PlaysForT (TeamID, PlayerID) VALUES (7, 37);
INSERT INTO PlaysForT (TeamID, PlayerID) VALUES (7, 38);
INSERT INTO PlaysForT (TeamID, PlayerID) VALUES (7, 39);
INSERT INTO PlaysForT (TeamID, PlayerID) VALUES (7, 40);
INSERT INTO PlaysForT (TeamID, PlayerID) VALUES (7, 41);
INSERT INTO PlaysForT (TeamID, PlayerID) VALUES (7, 42);

INSERT INTO PlaysForT (TeamID, PlayerID) VALUES (8, 43);
INSERT INTO PlaysForT (TeamID, PlayerID) VALUES (8, 44);
INSERT INTO PlaysForT (TeamID, PlayerID) VALUES (8, 45);
INSERT INTO PlaysForT (TeamID, PlayerID) VALUES (8, 46);
INSERT INTO PlaysForT (TeamID, PlayerID) VALUES (8, 47);
INSERT INTO PlaysForT (TeamID, PlayerID) VALUES (8, 48);

INSERT INTO PlaysForT (TeamID, PlayerID) VALUES (9, 49);
INSERT INTO PlaysForT (TeamID, PlayerID) VALUES (9, 50);
INSERT INTO PlaysForT (TeamID, PlayerID) VALUES (9, 51);
INSERT INTO PlaysForT (TeamID, PlayerID) VALUES (9, 52);
INSERT INTO PlaysForT (TeamID, PlayerID) VALUES (9, 53);
INSERT INTO PlaysForT (TeamID, PlayerID) VALUES (9, 54);

INSERT INTO PlaysForT (TeamID, PlayerID) VALUES (10, 55);
INSERT INTO PlaysForT (TeamID, PlayerID) VALUES (10, 56);
INSERT INTO PlaysForT (TeamID, PlayerID) VALUES (10, 57);
INSERT INTO PlaysForT (TeamID, PlayerID) VALUES (10, 58);
INSERT INTO PlaysForT (TeamID, PlayerID) VALUES (10, 59);
INSERT INTO PlaysForT (TeamID, PlayerID) VALUES (10, 60);

INSERT INTO PlaysForT (TeamID, PlayerID) VALUES (11, 61);
INSERT INTO PlaysForT (TeamID, PlayerID) VALUES (11, 62);
INSERT INTO PlaysForT (TeamID, PlayerID) VALUES (11, 63);
INSERT INTO PlaysForT (TeamID, PlayerID) VALUES (11, 64);
INSERT INTO PlaysForT (TeamID, PlayerID) VALUES (11, 65);
INSERT INTO PlaysForT (TeamID, PlayerID) VALUES (11, 66);

INSERT INTO PlaysForT (TeamID, PlayerID) VALUES (12, 67);
INSERT INTO PlaysForT (TeamID, PlayerID) VALUES (12, 68);
INSERT INTO PlaysForT (TeamID, PlayerID) VALUES (12, 69);
INSERT INTO PlaysForT (TeamID, PlayerID) VALUES (12, 70);
INSERT INTO PlaysForT (TeamID, PlayerID) VALUES (12, 71);
INSERT INTO PlaysForT (TeamID, PlayerID) VALUES (12, 72);

INSERT INTO PlaysForT (TeamID, PlayerID) VALUES (13, 73);
INSERT INTO PlaysForT (TeamID, PlayerID) VALUES (13, 74);
INSERT INTO PlaysForT (TeamID, PlayerID) VALUES (13, 75);
INSERT INTO PlaysForT (TeamID, PlayerID) VALUES (13, 76);
INSERT INTO PlaysForT (TeamID, PlayerID) VALUES (13, 77);
INSERT INTO PlaysForT (TeamID, PlayerID) VALUES (13, 78);

INSERT INTO PlaysForT (TeamID, PlayerID) VALUES (14, 79);
INSERT INTO PlaysForT (TeamID, PlayerID) VALUES (14, 80);
INSERT INTO PlaysForT (TeamID, PlayerID) VALUES (14, 81);
INSERT INTO PlaysForT (TeamID, PlayerID) VALUES (14, 82);
INSERT INTO PlaysForT (TeamID, PlayerID) VALUES (14, 83);
INSERT INTO PlaysForT (TeamID, PlayerID) VALUES (14, 84);

INSERT INTO PlaysForT (TeamID, PlayerID) VALUES (15, 85);
INSERT INTO PlaysForT (TeamID, PlayerID) VALUES (15, 86);
INSERT INTO PlaysForT (TeamID, PlayerID) VALUES (15, 87);
INSERT INTO PlaysForT (TeamID, PlayerID) VALUES (15, 88);
INSERT INTO PlaysForT (TeamID, PlayerID) VALUES (15, 89);
INSERT INTO PlaysForT (TeamID, PlayerID) VALUES (15, 90);

INSERT INTO PlaysForT (TeamID, PlayerID) VALUES (16, 91);
INSERT INTO PlaysForT (TeamID, PlayerID) VALUES (16, 92);
INSERT INTO PlaysForT (TeamID, PlayerID) VALUES (16, 93);
INSERT INTO PlaysForT (TeamID, PlayerID) VALUES (16, 94);
INSERT INTO PlaysForT (TeamID, PlayerID) VALUES (16, 95);
INSERT INTO PlaysForT (TeamID, PlayerID) VALUES (16, 96);

INSERT INTO PlaysForT (TeamID, PlayerID) VALUES (17, 97);
INSERT INTO PlaysForT (TeamID, PlayerID) VALUES (17, 98);
INSERT INTO PlaysForT (TeamID, PlayerID) VALUES (17, 99);
INSERT INTO PlaysForT (TeamID, PlayerID) VALUES (17, 100);
INSERT INTO PlaysForT (TeamID, PlayerID) VALUES (17, 101);
INSERT INTO PlaysForT (TeamID, PlayerID) VALUES (17, 102);

INSERT INTO PlaysForT (TeamID, PlayerID) VALUES (18, 103);
INSERT INTO PlaysForT (TeamID, PlayerID) VALUES (18, 104);
INSERT INTO PlaysForT (TeamID, PlayerID) VALUES (18, 105);
INSERT INTO PlaysForT (TeamID, PlayerID) VALUES (18, 106);
INSERT INTO PlaysForT (TeamID, PlayerID) VALUES (18, 107);
INSERT INTO PlaysForT (TeamID, PlayerID) VALUES (18, 108);

INSERT INTO PlaysForT (TeamID, PlayerID) VALUES (19, 109);
INSERT INTO PlaysForT (TeamID, PlayerID) VALUES (19, 110);
INSERT INTO PlaysForT (TeamID, PlayerID) VALUES (19, 111);
INSERT INTO PlaysForT (TeamID, PlayerID) VALUES (19, 112);
INSERT INTO PlaysForT (TeamID, PlayerID) VALUES (19, 113);
INSERT INTO PlaysForT (TeamID, PlayerID) VALUES (19, 114);

INSERT INTO PlaysForT (TeamID, PlayerID) VALUES (20, 115);
INSERT INTO PlaysForT (TeamID, PlayerID) VALUES (20, 116);
INSERT INTO PlaysForT (TeamID, PlayerID) VALUES (20, 117);
INSERT INTO PlaysForT (TeamID, PlayerID) VALUES (20, 118);
INSERT INTO PlaysForT (TeamID, PlayerID) VALUES (20, 119);
INSERT INTO PlaysForT (TeamID, PlayerID) VALUES (20, 120);

/*
 *Coaches table
*/

INSERT INTO Coaches (CoachID, PlayerID) VALUES (1, 1);
INSERT INTO Coaches (CoachID, PlayerID) VALUES (1, 2);
INSERT INTO Coaches (CoachID, PlayerID) VALUES (1, 3);
INSERT INTO Coaches (CoachID, PlayerID) VALUES (1, 4);
INSERT INTO Coaches (CoachID, PlayerID) VALUES (1, 5);
INSERT INTO Coaches (CoachID, PlayerID) VALUES (1, 6);

INSERT INTO Coaches (CoachID, PlayerID) VALUES (2, 7);
INSERT INTO Coaches (CoachID, PlayerID) VALUES (2, 8);
INSERT INTO Coaches (CoachID, PlayerID) VALUES (2, 9);
INSERT INTO Coaches (CoachID, PlayerID) VALUES (2, 10);
INSERT INTO Coaches (CoachID, PlayerID) VALUES (2, 11);
INSERT INTO Coaches (CoachID, PlayerID) VALUES (2, 12);

INSERT INTO Coaches (CoachID, PlayerID) VALUES (3, 13);
INSERT INTO Coaches (CoachID, PlayerID) VALUES (3, 14);
INSERT INTO Coaches (CoachID, PlayerID) VALUES (3, 15);
INSERT INTO Coaches (CoachID, PlayerID) VALUES (3, 16);
INSERT INTO Coaches (CoachID, PlayerID) VALUES (3, 17);
INSERT INTO Coaches (CoachID, PlayerID) VALUES (3, 18);

INSERT INTO Coaches (CoachID, PlayerID) VALUES (4, 19);
INSERT INTO Coaches (CoachID, PlayerID) VALUES (4, 20);
INSERT INTO Coaches (CoachID, PlayerID) VALUES (4, 21);
INSERT INTO Coaches (CoachID, PlayerID) VALUES (4, 22);
INSERT INTO Coaches (CoachID, PlayerID) VALUES (4, 23);
INSERT INTO Coaches (CoachID, PlayerID) VALUES (4, 24);

INSERT INTO Coaches (CoachID, PlayerID) VALUES (5, 25);
INSERT INTO Coaches (CoachID, PlayerID) VALUES (5, 26);
INSERT INTO Coaches (CoachID, PlayerID) VALUES (5, 27);
INSERT INTO Coaches (CoachID, PlayerID) VALUES (5, 28);
INSERT INTO Coaches (CoachID, PlayerID) VALUES (5, 29);
INSERT INTO Coaches (CoachID, PlayerID) VALUES (5, 30);

INSERT INTO Coaches (CoachID, PlayerID) VALUES (6, 31);
INSERT INTO Coaches (CoachID, PlayerID) VALUES (6, 32);
INSERT INTO Coaches (CoachID, PlayerID) VALUES (6, 33);
INSERT INTO Coaches (CoachID, PlayerID) VALUES (6, 34);
INSERT INTO Coaches (CoachID, PlayerID) VALUES (6, 35);
INSERT INTO Coaches (CoachID, PlayerID) VALUES (6, 36);

INSERT INTO Coaches (CoachID, PlayerID) VALUES (7, 37);
INSERT INTO Coaches (CoachID, PlayerID) VALUES (7, 38);
INSERT INTO Coaches (CoachID, PlayerID) VALUES (7, 39);
INSERT INTO Coaches (CoachID, PlayerID) VALUES (7, 40);
INSERT INTO Coaches (CoachID, PlayerID) VALUES (7, 41);
INSERT INTO Coaches (CoachID, PlayerID) VALUES (7, 42);

INSERT INTO Coaches (CoachID, PlayerID) VALUES (8, 43);
INSERT INTO Coaches (CoachID, PlayerID) VALUES (8, 44);
INSERT INTO Coaches (CoachID, PlayerID) VALUES (8, 45);
INSERT INTO Coaches (CoachID, PlayerID) VALUES (8, 46);
INSERT INTO Coaches (CoachID, PlayerID) VALUES (8, 47);
INSERT INTO Coaches (CoachID, PlayerID) VALUES (8, 48);

INSERT INTO Coaches (CoachID, PlayerID) VALUES (9, 49);
INSERT INTO Coaches (CoachID, PlayerID) VALUES (9, 50);
INSERT INTO Coaches (CoachID, PlayerID) VALUES (9, 51);
INSERT INTO Coaches (CoachID, PlayerID) VALUES (9, 52);
INSERT INTO Coaches (CoachID, PlayerID) VALUES (9, 53);
INSERT INTO Coaches (CoachID, PlayerID) VALUES (9, 54);

INSERT INTO Coaches (CoachID, PlayerID) VALUES (10, 55);
INSERT INTO Coaches (CoachID, PlayerID) VALUES (10, 56);
INSERT INTO Coaches (CoachID, PlayerID) VALUES (10, 57);
INSERT INTO Coaches (CoachID, PlayerID) VALUES (10, 58);
INSERT INTO Coaches (CoachID, PlayerID) VALUES (10, 59);
INSERT INTO Coaches (CoachID, PlayerID) VALUES (10, 60);

INSERT INTO Coaches (CoachID, PlayerID) VALUES (11, 61);
INSERT INTO Coaches (CoachID, PlayerID) VALUES (11, 62);
INSERT INTO Coaches (CoachID, PlayerID) VALUES (11, 63);
INSERT INTO Coaches (CoachID, PlayerID) VALUES (11, 64);
INSERT INTO Coaches (CoachID, PlayerID) VALUES (11, 65);
INSERT INTO Coaches (CoachID, PlayerID) VALUES (11, 66);

INSERT INTO Coaches (CoachID, PlayerID) VALUES (12, 67);
INSERT INTO Coaches (CoachID, PlayerID) VALUES (12, 68);
INSERT INTO Coaches (CoachID, PlayerID) VALUES (12, 69);
INSERT INTO Coaches (CoachID, PlayerID) VALUES (12, 70);
INSERT INTO Coaches (CoachID, PlayerID) VALUES (12, 71);
INSERT INTO Coaches (CoachID, PlayerID) VALUES (12, 72);

INSERT INTO Coaches (CoachID, PlayerID) VALUES (13, 73);
INSERT INTO Coaches (CoachID, PlayerID) VALUES (13, 74);
INSERT INTO Coaches (CoachID, PlayerID) VALUES (13, 75);
INSERT INTO Coaches (CoachID, PlayerID) VALUES (13, 76);
INSERT INTO Coaches (CoachID, PlayerID) VALUES (13, 77);
INSERT INTO Coaches (CoachID, PlayerID) VALUES (13, 78);

INSERT INTO Coaches (CoachID, PlayerID) VALUES (14, 79);
INSERT INTO Coaches (CoachID, PlayerID) VALUES (14, 80);
INSERT INTO Coaches (CoachID, PlayerID) VALUES (14, 81);
INSERT INTO Coaches (CoachID, PlayerID) VALUES (14, 82);
INSERT INTO Coaches (CoachID, PlayerID) VALUES (14, 83);
INSERT INTO Coaches (CoachID, PlayerID) VALUES (14, 84);

INSERT INTO Coaches (CoachID, PlayerID) VALUES (15, 85);
INSERT INTO Coaches (CoachID, PlayerID) VALUES (15, 86);
INSERT INTO Coaches (CoachID, PlayerID) VALUES (15, 87);
INSERT INTO Coaches (CoachID, PlayerID) VALUES (15, 88);
INSERT INTO Coaches (CoachID, PlayerID) VALUES (15, 89);
INSERT INTO Coaches (CoachID, PlayerID) VALUES (15, 90);

INSERT INTO Coaches (CoachID, PlayerID) VALUES (16, 91);
INSERT INTO Coaches (CoachID, PlayerID) VALUES (16, 92);
INSERT INTO Coaches (CoachID, PlayerID) VALUES (16, 93);
INSERT INTO Coaches (CoachID, PlayerID) VALUES (16, 94);
INSERT INTO Coaches (CoachID, PlayerID) VALUES (16, 95);
INSERT INTO Coaches (CoachID, PlayerID) VALUES (16, 96);

INSERT INTO Coaches (CoachID, PlayerID) VALUES (17, 97);
INSERT INTO Coaches (CoachID, PlayerID) VALUES (17, 98);
INSERT INTO Coaches (CoachID, PlayerID) VALUES (17, 99);
INSERT INTO Coaches (CoachID, PlayerID) VALUES (17, 100);
INSERT INTO Coaches (CoachID, PlayerID) VALUES (17, 101);
INSERT INTO Coaches (CoachID, PlayerID) VALUES (17, 102);

INSERT INTO Coaches (CoachID, PlayerID) VALUES (18, 103);
INSERT INTO Coaches (CoachID, PlayerID) VALUES (18, 104);
INSERT INTO Coaches (CoachID, PlayerID) VALUES (18, 105);
INSERT INTO Coaches (CoachID, PlayerID) VALUES (18, 106);
INSERT INTO Coaches (CoachID, PlayerID) VALUES (18, 107);
INSERT INTO Coaches (CoachID, PlayerID) VALUES (18, 108);

INSERT INTO Coaches (CoachID, PlayerID) VALUES (19, 109);
INSERT INTO Coaches (CoachID, PlayerID) VALUES (19, 110);
INSERT INTO Coaches (CoachID, PlayerID) VALUES (19, 111);
INSERT INTO Coaches (CoachID, PlayerID) VALUES (19, 112);
INSERT INTO Coaches (CoachID, PlayerID) VALUES (19, 113);
INSERT INTO Coaches (CoachID, PlayerID) VALUES (19, 114);

INSERT INTO Coaches (CoachID, PlayerID) VALUES (20, 115);
INSERT INTO Coaches (CoachID, PlayerID) VALUES (20, 116);
INSERT INTO Coaches (CoachID, PlayerID) VALUES (20, 117);
INSERT INTO Coaches (CoachID, PlayerID) VALUES (20, 118);
INSERT INTO Coaches (CoachID, PlayerID) VALUES (20, 119);
INSERT INTO Coaches (CoachID, PlayerID) VALUES (20, 120);

--CoachesFor table

INSERT INTO CoachesFor (CoachID, ClubID) VALUES (1,1);
INSERT INTO CoachesFor (CoachID, ClubID) VALUES (2,1);
INSERT INTO CoachesFor (CoachID, ClubID) VALUES (3,2);
INSERT INTO CoachesFor (CoachID, ClubID) VALUES (4,2);
INSERT INTO CoachesFor (CoachID, ClubID) VALUES (5,2);
INSERT INTO CoachesFor (CoachID, ClubID) VALUES (6,3);
INSERT INTO CoachesFor (CoachID, ClubID) VALUES (7,3);
INSERT INTO CoachesFor (CoachID, ClubID) VALUES (8,4);
INSERT INTO CoachesFor (CoachID, ClubID) VALUES (9,4);
INSERT INTO CoachesFor (CoachID, ClubID) VALUES (10,5);
INSERT INTO CoachesFor (CoachID, ClubID) VALUES (11,5);
INSERT INTO CoachesFor (CoachID, ClubID) VALUES (12,5);
INSERT INTO CoachesFor (CoachID, ClubID) VALUES (13,6);
INSERT INTO CoachesFor (CoachID, ClubID) VALUES (14,6);
INSERT INTO CoachesFor (CoachID, ClubID) VALUES (15,7);
INSERT INTO CoachesFor (CoachID, ClubID) VALUES (16,7);
INSERT INTO CoachesFor (CoachID, ClubID) VALUES (17,8);
INSERT INTO CoachesFor (CoachID, ClubID) VALUES (18,8);
INSERT INTO CoachesFor (CoachID, ClubID) VALUES (19,8);
INSERT INTO CoachesFor (CoachID, ClubID) VALUES (20,8);