# 1. Create Relational Database Tables
CREATE TABLE papers(
	paper_id int AUTO_INCREMENT PRIMARY KEY,
    paper_title VARCHAR(255),
    conference_name TEXT,
    conference_year INT,
    UNIQUE(paper_title)
);

CREATE TABLE countries(
	country_code VARCHAR(2) PRIMARY KEY,
    country_name TEXT
);

CREATE TABLE authors(
	author_id INT AUTO_INCREMENT PRIMARY KEY,
    author_name TEXT,
    author_link VARCHAR(255),
    nationality varchar(2),
    alt_nationality varchar(2),
    FOREIGN KEY (nationality) REFERENCES countries(country_code),
    FOREIGN KEY (alt_nationality) REFERENCES countries(country_code),
    UNIQUE(author_link)
);

CREATE TABLE paper_author(
	paper_id INT,
    author_id INT,
    FOREIGN KEY (paper_id) REFERENCES papers(paper_id),
    FOREIGN KEY (author_id) REFERENCES authors(author_id),
    PRIMARY KEY(paper_id, author_id)
);

# 2. Import CSV/JSON file from Webscraping and store it in a new temporary table 
# 3. Insert Data from CSV/JSON file into Table
INSERT IGNORE INTO papers(paper_title, conference_name, conference_year) 
SELECT paper_title, conference_name, conference_year 
FROM temp_paper_author_tbl;

INSERT IGNORE into authors(author_name, author_link) 
SELECT author_name, author_link 
FROM temp_paper_author_tbl;


# There are some mistakes regarding the nationality of indonesian authors, 
# so it is better to import the nationality data based on the authorss JSON in /data

-- nationality
update authors a
join wacv2023_author_nationality tan2 on a.author_name = tan2.name 
join countries c on c.country_code = tan2.country 
set a.nationality = c.country_code;

-- alt_nationality
UPDATE authors a
JOIN wacv2023_author_nationality tan2 ON a.author_name = tan2.name
JOIN countries c ON c.country_code = tan2.countryAlt
SET a.alt_nationality = c.country_code;

# 4. Resolve Many to Many Relationship
INSERT IGNORE INTO paper_author(paper_id, author_id)
SELECT paper_id, author_id
FROM temp_paper_author_tbl
JOIN papers USING(paper_title)
JOIN authors USING(author_link);

# 5. Data Cleaning
-- View Wrong Data (BMVC)
DELETE FROM papers WHERE paper_title LIKE 'British Machine Vision Conference%';

-- Delete Data
DELETE FROM paper_author WHERE paper_id IN (SELECT paper_id FROM papers WHERE paper_title LIKE 'British Machine Vision Conference%');
DELETE FROM papers WHERE paper_title LIKE 'British Machine Vision Conference%';