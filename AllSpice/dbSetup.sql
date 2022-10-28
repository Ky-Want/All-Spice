-- Active: 1666715750209@@SG-Zero-6848-mysql-master.servers.mongodirector.com@3306@ShiniesCollection

CREATE TABLE
    IF NOT EXISTS accounts(
        -- REVIEW accounts have a string because it uses the id that is returned from auth0
        id VARCHAR(255) NOT NULL primary key COMMENT 'primary key',
        createdAt DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT 'Time Created',
        updatedAt DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Last Update',
        name varchar(255) COMMENT 'User Name',
        email varchar(255) COMMENT 'User Email',
        picture varchar(255) COMMENT 'User Picture'
    ) default charset utf8 COMMENT '';

--

--

--

/*SECTION: recipes*/

CREATE TABLE
    IF NOT EXISTS recipes(
        id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
        title VARCHAR(255) NOT NULL,
        instructions VARCHAR(255) NOT NULL,
        imgUrl VARCHAR(255),
        category VARCHAR(255) NOT NULL,
        creatorId VARCHAR(255) NOT NULL,
        FOREIGN KEY (creatorId) REFERENCES accounts(id)
    ) default charset utf8 COMMENT '';

--

--

--

/*SECTION: ingrediants*/

CREATE TABLE
    IF NOT EXISTS ingrediants(
        -- REVIEW we use int for all ID's and auto_increment for our database to handle counting 1,2,3,..
        id int NOT NULL PRIMARY KEY AUTO_INCREMENT,
        -- NOT NULL acts as a required, meaning you can't leave that field empty
        name VARCHAR(255) NOT NULL,
        quantity INT NOT NULL,
        recipeId INT NOT NULL,
        creatorId VARCHAR(255),
        FOREIGN KEY (creatorId) REFERENCES accounts(id)
    ) default charset utf8 COMMENT '';

--

--

--

/*SECTION: favorites*/

CREATE TABLE
    IF NOT EXISTS favorites(
        id VARCHAR(255) NOT NULL primary key COMMENT 'primary key',
        accountId VARCHAR(255) NOT NULL,
        recipeId INT NOT NULL,
        FOREIGN KEY (accountId) REFERENCES accounts(id),
        FOREIGN KEY (recipeId) REFERENCES recipes(id)
    )