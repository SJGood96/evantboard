DROP DATABASE IF EXISTS EventBoard;

CREATE DATABASE EventBoard;

USE EventBoard;

CREATE TABLE Post (
	PostId INT PRIMARY KEY AUTO_INCREMENT,
    Title VARCHAR(20) NOT NULL,
    Category VARCHAR(15) NOT NULL,
    Address VARCHAR(30) NOT NULL,
    ZipCode CHAR(5) NOT NULL,
    Preview VARCHAR(50) NOT NULL,
    EventInfo MEDIUMTEXT,
    Date Datetime
);

CREATE TABLE User (
	UserId INT PRIMARY KEY AUTO_INCREMENT,
    UserName VARCHAR(25) NOT NULL
);

CREATE TABLE Comment (
	CommentId INT PRIMARY KEY AUTO_INCREMENT,
    CommentText VARCHAR(200) NOT NULL,
    Date Datetime
);

ALTER TABLE Post
	ADD COLUMN (
		UserId INT NOT NULL),
	ADD CONSTRAINT fk_PostUserId
		FOREIGN KEY (UserId)
        REFERENCES User(UserId);

ALTER TABLE Comment
	ADD COLUMN (
		PostId INT NOT NULL),
	ADD CONSTRAINT fk_CommentPostId
		FOREIGN KEY (PostId)
        REFERENCES Post(PostId);