--insert Statements for inserting data into tables



--inserting data into winners table

INSERT INTO winners (first_name, last_name, gender, date_of_birth, date_of_death, country_id)
VALUES ('Stephen', 'Hawking', 'M', '1942-01-08', '2018-03-14', 1);

--inserting data into Prizes table

INSERT INTO Prizes (year_awarded, motivation_id, winner_id, category_id)
VALUES (2020, 1, 1, 1);

--inserting data into categories table

INSERT INTO Categories (category_name) 
VALUES ('Computer Science');


--inserting data into countries table

INSERT INTO Countries (country_name, region_name) 
VALUES ('Canada', 'North America');

--inserting data into Organizations table


INSERT INTO Organizations (organization_name, country_id)
VALUES ('University of Cambridge', 1);

--inserting data into Achievements table


INSERT INTO Achievements (description, prize_id)
VALUES ('Discovery of black hole radiation', 1);


--inserting data into Affiliation table



INSERT INTO Affiliations (institution_name, city, winner_id, country_id)
VALUES ('University of Oxford', 'Oxford', 1, 1);


--inserting data into motivations table


INSERT INTO Motivations (citation)
VALUES ('For pioneering contributions to theoretical physics and black hole dynamics.');