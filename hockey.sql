/*
implementa base de datos relacionales en un sistema de informacion 
20/02/2025 4°j
Jesus Enrique Dominguez Cetzal 
Hockey 
*/


CREATE TABLE playoffround(
    id int (16) NOT NULL,
    team1id int (13) NOT NULL,
    team2id int (13) NOT NULL,
    StartTime date NOT NULL, 
    endTime date NOT NULL,
    roundNum int (14) NOT NULL,
    PRIMARY KEY (id, StartTime)
);


CREATE TABLE HockeyGame(
    id int (16) NOT NULL,
    roundId int (13) NOT NULL,
    startTime date NOT NULL,
    endTime date NOT NULL,
    description varchar(255),
    team1Id int (13) NOT NULL,
    team2Id int (13) NOT NULL,
    PRIMARY KEY (id, startTime)
);


CREATE TABLE GameScores(
    id int (16) NOT NULL,
    team1Score int (13) NOT NULL,
    team2Score int (13) NOT NULL,
    PRIMARY KEY (id)
);


CREATE TABLE RoundStats(
    id int (16) NOT NULL,
    numShutouts int (13),
    goalLeaderId int (13),
    assistLeaderId int (13),
    penaltyLeaderId int (13),
    plusMinusLeaderId int (13),
    faceoffsWonLeaderId int (13),
    sogLeaderId int (13),
    PRIMARY KEY (id)
);


CREATE TABLE UserStatsPicks(
    id int (16) NOT NULL,
    roundId int (13) NOT NULL,
    goalLeaderId int (13),
    assistLeaderId int (13),
    penaltyLeaderId int (13),
    plusMinusLeaderId int (13),
    faceoffsWonLeaderId int (13),
    sogLeaderId int (13),
    numShutouts int (13),
    userId int (13) NOT NULL,
    PRIMARY KEY (id)
);


CREATE TABLE User(
    id int (16) NOT NULL,
    username varchar(50) NOT NULL,
    password varchar(50) NOT NULL,
    PRIMARY KEY (id)
);


CREATE TABLE UserScorePicks(
    id int (16) NOT NULL,
    hockeyGameId int (13) NOT NULL,
    team1Score int (13) NOT NULL,
    team2Score int (13) NOT NULL,
    userId int (13) NOT NULL,
    PRIMARY KEY (id)
);


CREATE TABLE HockeyTeam(
    id int (16) NOT NULL,
    name varchar(100) NOT NULL,
    logo varchar(100),
    PRIMARY KEY (id)
);


CREATE TABLE HockeyTeamPlayer(
    id int (16) NOT NULL,
    hockeyTeamId int (13) NOT NULL,
    firstName varchar(25) NOT NULL,
    lastName varchar(25) NOT NULL,
    jerseyNum int (13),
    position varchar(255),
    PRIMARY KEY (id)
);


CREATE TABLE UserInfo(
    id int (16) NOT NULL,
    firstName varchar(25) NOT NULL,
    lastName varchar(25) NOT NULL,
    email varchar(25) NOT NULL,
    round1Points int (13),
    round2Points int (13),
    round3Points int (13),
    round4Points int (13),
    PRIMARY KEY (id)
);
