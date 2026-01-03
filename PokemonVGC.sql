CREATE DATABASE PokemonVGC;
GO

USE PokemonVGC;
GO

--Main Table Creator
CREATE TABLE Player (
    Player_ID       INT IDENTITY(1,1) NOT NULL,
    Player_FstName  VARCHAR(30)       NOT NULL,
    Player_LstName  VARCHAR(30)       NOT NULL,
    Player_Country  VARCHAR(30)       NOT NULL,
    CONSTRAINT PK_Player PRIMARY KEY (Player_ID)
);
GO

CREATE TABLE Pokemon (
    PKMN_ID       INT IDENTITY(1,1) NOT NULL,
    PKMN_Species  VARCHAR(30)       NOT NULL,
    PKMN_Type1    VARCHAR(15)       NOT NULL,
    PKMN_Type2    VARCHAR(15)       NULL,
    PKMN_Ability  VARCHAR(30)       NOT NULL,
    CONSTRAINT PK_Pokemon PRIMARY KEY (PKMN_ID)
);
GO

CREATE TABLE Tournament (
    TRNMT_ID         VARCHAR(10) NOT NULL,
    TRNMT_Name       VARCHAR(30) NOT NULL,
    TRNMT_Location   VARCHAR(30) NOT NULL,
    TRNMT_Start_Date DATE        NOT NULL,
    TRNMT_End_Date   DATE        NOT NULL,
    CONSTRAINT PK_Tournament PRIMARY KEY (TRNMT_ID)
);
GO

CREATE TABLE Team (
    Team_ID    INT IDENTITY(1,1) NOT NULL,
    Player_ID  INT               NOT NULL,
    CONSTRAINT PK_Team PRIMARY KEY (Team_ID),
    CONSTRAINT FK_Team_Player 
        FOREIGN KEY (Player_ID)
        REFERENCES Player(Player_ID)
        ON UPDATE CASCADE
        ON DELETE NO ACTION
);
GO

CREATE TABLE Match (
    Match_ID           INT IDENTITY(1,1) NOT NULL,
    TRNMT_ID           VARCHAR(10)       NOT NULL,
    Round_Placement    VARCHAR(30)       NOT NULL,
    Match_Team_1       INT               NOT NULL,
    Match_Team_2       INT               NOT NULL,
    Match_Winning_Team INT               NOT NULL,
    Match_Score        VARCHAR(10)       NOT NULL,
    CONSTRAINT PK_Match PRIMARY KEY (Match_ID),

    CONSTRAINT FK_Match_Tournament 
        FOREIGN KEY (TRNMT_ID)
        REFERENCES Tournament(TRNMT_ID)
        ON UPDATE CASCADE       
        ON DELETE NO ACTION,

    CONSTRAINT FK_Match_Team1 
        FOREIGN KEY (Match_Team_1)
        REFERENCES Team(Team_ID)
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,

    CONSTRAINT FK_Match_Team2 
        FOREIGN KEY (Match_Team_2)
        REFERENCES Team(Team_ID)
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,

    CONSTRAINT FK_Match_WinningTeam 
        FOREIGN KEY (Match_Winning_Team)
        REFERENCES Team(Team_ID)
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
);
GO

--Create Bridging Tables
CREATE TABLE TeamRosters (
    Team_ID  INT NOT NULL,
    PKMN_ID  INT NOT NULL,
    Slot_No  INT NOT NULL,
    CONSTRAINT PK_TeamRosters PRIMARY KEY (Team_ID, PKMN_ID),
    CONSTRAINT UQ_TeamRosters_Slot UNIQUE (Team_ID, Slot_No),
    CONSTRAINT CK_TeamRosters_SlotRange CHECK (Slot_No BETWEEN 1 AND 6),
    CONSTRAINT FK_TeamRosters_Team 
        FOREIGN KEY (Team_ID)
        REFERENCES Team(Team_ID)
        ON UPDATE CASCADE
        ON DELETE CASCADE,
    CONSTRAINT FK_TeamRosters_Pokemon 
        FOREIGN KEY (PKMN_ID)
        REFERENCES Pokemon(PKMN_ID)
        ON UPDATE CASCADE
        ON DELETE CASCADE
);
GO

CREATE TABLE CombatPoints (
    TRNMT_ID             VARCHAR(10) NOT NULL,
    Team_ID              INT         NOT NULL,
    Combat_Points_Earned INT         NOT NULL,
    CONSTRAINT PK_CombatPoints PRIMARY KEY (TRNMT_ID, Team_ID),
    CONSTRAINT FK_CombatPoints_Tournament 
        FOREIGN KEY (TRNMT_ID)
        REFERENCES Tournament(TRNMT_ID)
        ON UPDATE CASCADE
        ON DELETE CASCADE,
    CONSTRAINT FK_CombatPoints_Team 
        FOREIGN KEY (Team_ID)
        REFERENCES Team(Team_ID)
        ON UPDATE CASCADE
        ON DELETE CASCADE
);
GO

CREATE TABLE Tera_Item (
    Player_ID INT         NOT NULL,
    TRNMT_ID  VARCHAR(10) NOT NULL,
    PKMN_ID   INT         NOT NULL,
    TeraType  VARCHAR(15) NOT NULL,
    Item      VARCHAR(30) NULL,
    CONSTRAINT PK_Tera_Item PRIMARY KEY (Player_ID, TRNMT_ID, PKMN_ID),
    CONSTRAINT FK_TeraItem_Player 
        FOREIGN KEY (Player_ID)
        REFERENCES Player(Player_ID)
        ON UPDATE CASCADE
        ON DELETE CASCADE,
    CONSTRAINT FK_TeraItem_Tournament 
        FOREIGN KEY (TRNMT_ID)
        REFERENCES Tournament(TRNMT_ID)
        ON UPDATE CASCADE
        ON DELETE CASCADE,
    CONSTRAINT FK_TeraItem_Pokemon 
        FOREIGN KEY (PKMN_ID)
        REFERENCES Pokemon(PKMN_ID)
        ON UPDATE CASCADE
        ON DELETE CASCADE
);
GO

CREATE TABLE PokemonMoves (
    Player_ID INT         NOT NULL,
    TRNMT_ID  VARCHAR(10) NOT NULL,
    PKMN_ID   INT         NOT NULL,
    Move_Slot INT         NOT NULL,
    Move_Name VARCHAR(30) NOT NULL,
    CONSTRAINT PK_PokemonMoves PRIMARY KEY (Player_ID, TRNMT_ID, PKMN_ID, Move_Slot),
    CONSTRAINT FK_PokemonMoves_Player 
        FOREIGN KEY (Player_ID)
        REFERENCES Player(Player_ID)
        ON UPDATE CASCADE
        ON DELETE CASCADE,
    CONSTRAINT FK_PokemonMoves_Tournament 
        FOREIGN KEY (TRNMT_ID)
        REFERENCES Tournament(TRNMT_ID)
        ON UPDATE CASCADE
        ON DELETE CASCADE,
    CONSTRAINT FK_PokemonMoves_Pokemon 
        FOREIGN KEY (PKMN_ID)
        REFERENCES Pokemon(PKMN_ID)
        ON UPDATE CASCADE
        ON DELETE CASCADE
);
GO