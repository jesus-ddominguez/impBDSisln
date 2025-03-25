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
    position varchar(30),
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

INSERT into playoffround (id,team1id,team2id,startTime, endTime,roundNum) 
values (1,1,2,'2025/02/20 20:00:00','2025/02/20 23:00:00',3 );

INSERT into HockeyGame (id, roundId, startTime, endTime, description, team1Id, team2Id)
values (1, 1, '2025-02-20 14:30', '2025-02-20 16:30', 'Quarterfinals', 1, 2);

INSERT into GameScores (id, team1Score, team2Score)
values (1, 3, 2);

INSERT into RoundStats (id, numShutouts, goalLeaderId, assistLeaderId, penaltyLeaderId, plusMinusLeaderId, faceoffsWonLeaderId, sogLeaderId)
values (1, 2, 10, 15, 12, 8, 14, 20);

INSERT into UserStatsPicks (id, roundId, goalLeaderId, assistLeaderId, penaltyLeaderId, plusMinusLeaderId, faceoffsWonLeaderId, sogLeaderId, numShutouts, userId)
values (1, 1, 10, 15, 12, 8, 14, 20, 2, 2);

INSERT into User (id, username, password)
values (1, 'jgraham', 'password123');

INSERT INTO UserScorePicks (id, hockeyGameId, team1Score, team2Score, userId)
values (1, 1, 3, 2, 1);

INSERT into HockeyTeam (id, name, logo)
values(1, 'Team A', 'logoA.png');

INSERT into HockeyTeamPlayer (id, hockeyTeamId, firstName, lastName, jerseyNum, position)
values (1, 1, 'John', 'Hayden', 99, 'Forward');

INSERT into UserInfo (id, firstName, lastName, email, round1Points, round2Points, round3Points, round4Points)
values (1, 'John', 'Hayden', 'john.hayden@example.com', 10, 15, 20, 25);
 
