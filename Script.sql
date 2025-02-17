-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2025-02-16 10:43:16.529

-- tables
-- Table: Achievements
CREATE TABLE Achievements (
    achievement_id int  NOT NULL AUTO_INCREMENT,
    description text  NOT NULL,
    prize_id int  NOT NULL,
    CONSTRAINT Achievements_pk PRIMARY KEY (achievement_id)
);

-- Table: Affiliations
CREATE TABLE Affiliations (
    affiliation_id int  NOT NULL AUTO_INCREMENT,
    institution_name varchar(64)  NOT NULL,
    city varchar(64)  NOT NULL,
    winner_id int  NOT NULL,
    country_id int  NOT NULL,
    CONSTRAINT Affiliations_pk PRIMARY KEY (affiliation_id)
);

-- Table: Categories
CREATE TABLE Categories (
    category_id int  NOT NULL AUTO_INCREMENT,
    category_name varchar(64)  NOT NULL,
    CONSTRAINT Categories_pk PRIMARY KEY (category_id)
);

-- Table: Countries
CREATE TABLE Countries (
    country_id int  NOT NULL AUTO_INCREMENT,
    country_name varchar(64)  NOT NULL,
    region_name varchar(64)  NOT NULL,
    CONSTRAINT Countries_pk PRIMARY KEY (country_id)
);

-- Table: Motivations
CREATE TABLE Motivations (
    motivation_id int  NOT NULL AUTO_INCREMENT,
    citation text  NOT NULL,
    CONSTRAINT Motivations_pk PRIMARY KEY (motivation_id)
);

-- Table: Organizations
CREATE TABLE Organizations (
    organization_id int  NOT NULL AUTO_INCREMENT,
    organization_name varchar(64)  NOT NULL,
    country_id int  NOT NULL,
    CONSTRAINT Organizations_pk PRIMARY KEY (organization_id)
);

-- Table: Prizes
CREATE TABLE Prizes (
    prize_id int  NOT NULL AUTO_INCREMENT,
    year_awarded int  NOT NULL,
    motivation_id int  NOT NULL,
    winner_id int  NOT NULL,
    category_id int  NOT NULL,
    CONSTRAINT Prizes_pk PRIMARY KEY (prize_id)
);

-- Table: winners
CREATE TABLE winners (
    winner_id int  NOT NULL AUTO_INCREMENT,
    first_name varchar(32)  NOT NULL,
    last_name varchar(32)  NOT NULL,
    gender char(6)  NOT NULL,
    date_of_birth date  NOT NULL,
    date_of_death date  NOT NULL,
    country_id int  NOT NULL,
    CONSTRAINT winners_pk PRIMARY KEY (winner_id)
);

-- foreign keys
-- Reference: Achievements_Prizes (table: Achievements)
ALTER TABLE Achievements ADD CONSTRAINT Achievements_Prizes FOREIGN KEY Achievements_Prizes (prize_id)
    REFERENCES Prizes (prize_id);

-- Reference: Affiliations_Countries (table: Affiliations)
ALTER TABLE Affiliations ADD CONSTRAINT Affiliations_Countries FOREIGN KEY Affiliations_Countries (country_id)
    REFERENCES Countries (country_id);

-- Reference: Affiliations_winners (table: Affiliations)
ALTER TABLE Affiliations ADD CONSTRAINT Affiliations_winners FOREIGN KEY Affiliations_winners (winner_id)
    REFERENCES winners (winner_id);

-- Reference: Categories_Prizes (table: Prizes)
ALTER TABLE Prizes ADD CONSTRAINT Categories_Prizes FOREIGN KEY Categories_Prizes (category_id)
    REFERENCES Categories (category_id);

-- Reference: Prizes_Motivations (table: Prizes)
ALTER TABLE Prizes ADD CONSTRAINT Prizes_Motivations FOREIGN KEY Prizes_Motivations (motivation_id)
    REFERENCES Motivations (motivation_id);

-- Reference: Prizes_winners (table: Prizes)
ALTER TABLE Prizes ADD CONSTRAINT Prizes_winners FOREIGN KEY Prizes_winners (winner_id)
    REFERENCES winners (winner_id);

-- Reference: organizations_Countries (table: Organizations)
ALTER TABLE Organizations ADD CONSTRAINT organizations_Countries FOREIGN KEY organizations_Countries (country_id)
    REFERENCES Countries (country_id);

-- Reference: winners_Countries (table: winners)
ALTER TABLE winners ADD CONSTRAINT winners_Countries FOREIGN KEY winners_Countries (country_id)
    REFERENCES Countries (country_id);

-- End of file.

