# 1. Number of New Authors Contributed throughout the years
-- BMVC
SELECT
    p.conference_name,
    p.conference_year,
    COUNT(DISTINCT pa.author_id) AS unique_author_count
FROM
    papers p
JOIN
    paper_author pa ON p.paper_id = pa.paper_id
WHERE
    p.conference_name = 'BMVC'
    AND p.conference_year IN (
        SELECT DISTINCT conference_year
        FROM papers
        WHERE conference_name = 'BMVC'
    )
    AND pa.author_id NOT IN (
        SELECT DISTINCT pa1.author_id
        FROM papers p1
        JOIN paper_author pa1 ON p1.paper_id = pa1.paper_id
        AND p1.conference_name = 'BMVC' AND p1.conference_year < p.conference_year
    )
GROUP BY
    p.conference_name, p.conference_year;

-- CVPR
SELECT
    p.conference_name,
    p.conference_year,
    COUNT(DISTINCT pa.author_id) AS unique_author_count
FROM
    papers p
JOIN
    paper_author pa ON p.paper_id = pa.paper_id
WHERE
    p.conference_name = 'CVPR'
    AND p.conference_year IN (
        SELECT DISTINCT conference_year
        FROM papers
        WHERE conference_name = 'CVPR'
    )
    AND pa.author_id NOT IN (
        SELECT DISTINCT pa1.author_id
        FROM papers p1
        JOIN paper_author pa1 ON p1.paper_id = pa1.paper_id
        AND p1.conference_name = 'CVPR' AND p1.conference_year < p.conference_year
    )
GROUP BY
    p.conference_name, p.conference_year;
   
-- ICCV
SELECT
    p.conference_name,
    p.conference_year,
    COUNT(DISTINCT pa.author_id) AS unique_author_count
FROM
    papers p
JOIN
    paper_author pa ON p.paper_id = pa.paper_id
WHERE
    p.conference_name = 'ICCV'
    AND p.conference_year IN (
        SELECT DISTINCT conference_year
        FROM papers
        WHERE conference_name = 'ICCV'
    )
    AND pa.author_id NOT IN (
        SELECT DISTINCT pa1.author_id
        FROM papers p1
        JOIN paper_author pa1 ON p1.paper_id = pa1.paper_id
        AND p1.conference_name = 'ICCV' AND p1.conference_year < p.conference_year
    )
GROUP BY
    p.conference_name, p.conference_year;
   
-- WACV
SELECT
    p.conference_name,
    p.conference_year,
    COUNT(DISTINCT pa.author_id) AS unique_author_count
FROM
    papers p
JOIN
    paper_author pa ON p.paper_id = pa.paper_id
WHERE
    p.conference_name = 'WACV'
    AND p.conference_year IN (
        SELECT DISTINCT conference_year
        FROM papers
        WHERE conference_name = 'WACV'
    )
    AND pa.author_id NOT IN (
        SELECT DISTINCT pa1.author_id
        FROM papers p1
        JOIN paper_author pa1 ON p1.paper_id = pa1.paper_id
        AND p1.conference_name = 'WACV' AND p1.conference_year < p.conference_year
    )
GROUP BY
    p.conference_name, p.conference_year;
   
-- ECCV 
SELECT
    p.conference_name,
    p.conference_year,
    COUNT(DISTINCT pa.author_id) AS unique_author_count
FROM
    papers p
JOIN
    paper_author pa ON p.paper_id = pa.paper_id
WHERE
    p.conference_name = 'ECCV'
    AND p.conference_year IN (
        SELECT DISTINCT conference_year
        FROM papers
        WHERE conference_name = 'ECCV'
    )
    AND pa.author_id NOT IN (
        SELECT DISTINCT pa1.author_id
        FROM papers p1
        JOIN paper_author pa1 ON p1.paper_id = pa1.paper_id
        AND p1.conference_name = 'ECCV' AND p1.conference_year < p.conference_year
    )
GROUP BY
    p.conference_name, p.conference_year;
   
# 2. Number of papers published throughout the years 
select 
	conference_name as 'Conference',
	conference_year as 'Year',
	count(paper_id) as 'Number of Papers'
from 
	papers 
group by 
	conference_year, conference_name 
order by 
	conference_name, conference_year asc   

# 3.Number of Papers Published throughout the years by South East Asian Authors

SELECT
    p.conference_name AS 'Conference',
    p.conference_year AS 'Year',
    c.country_name as 'Country Name',
    count(DISTINCT pa.paper_id) AS 'Number of Papers'
FROM
    authors a,
    countries c,
    paper_author pa,
    papers p
WHERE
    a.nationality = c.country_code
    AND a.author_id = pa.author_id
    AND pa.paper_id = p.paper_id
    AND c.subregion = 'South Eastern Asia'
GROUP BY
    p.conference_name, p.conference_year, c.country_name
order by
	p.conference_year asc, c.country_name asc;

# 4. Number of Authors in South East Asia
WITH CountryAuthorRanks AS (
    SELECT
        c.country_name AS 'Country Name',
        a.author_name AS 'Top Author',
        RANK() OVER (PARTITION BY c.country_name ORDER BY COUNT(DISTINCT p.paper_id) DESC) AS AuthorRank
    FROM
        authors a
        JOIN countries c ON a.nationality = c.country_code
        JOIN paper_author pa ON a.author_id = pa.author_id
        JOIN papers p ON pa.paper_id = p.paper_id
    WHERE
        c.subregion = 'South Eastern Asia'
    GROUP BY
        c.country_name,
        a.author_name
)
, CountryStats AS (
    SELECT
        c.country_name AS 'Country Name',
        COUNT(DISTINCT a.author_id) AS 'Number of Authors from Country',
        COUNT(DISTINCT p.paper_id) AS 'Number of Papers by Country',
        RANK() OVER (ORDER BY COUNT(DISTINCT a.author_id) DESC) AS CountryRank
    FROM
        authors a
        JOIN countries c ON a.nationality = c.country_code
        JOIN paper_author pa ON a.author_id = pa.author_id
        JOIN papers p ON pa.paper_id = p.paper_id
    WHERE
        c.subregion = 'South Eastern Asia'
    GROUP BY
        c.country_name
)
SELECT
    car.`Country Name`,
    car.`Top Author`,
    cs.`Number of Papers by Country`,
    cs.`Number of Authors from Country`
FROM
    CountryAuthorRanks car
JOIN
    CountryStats cs ON car.`Country Name` = cs.`Country Name` AND car.AuthorRank = 1
ORDER BY
    cs.`Number of Authors from Country` DESC, car.`Country Name`;

# 6. Number of Papers and Authors published by subregions
WITH SubregionStats AS (
    SELECT
        c.subregion,
        c.region,
        COUNT(DISTINCT a.author_id) AS TotalAuthors,
        COUNT(DISTINCT p.paper_id) AS TotalPapers
    FROM
        papers p
        JOIN paper_author pa ON p.paper_id = pa.paper_id
        JOIN authors a ON a.author_id = pa.author_id
        JOIN countries c ON a.nationality = c.country_code
    GROUP BY
        c.subregion, c.region
)
SELECT
    s.subregion as 'Subregion',
    s.region as 'Continent',
    s.TotalAuthors as 'Number of Authors',
    s.TotalPapers as 'Number of Papers',
    r.country_name AS 'Top Publishing Country'
FROM
    SubregionStats s
JOIN (
    SELECT
        c.subregion,
        c.region,
        c.country_name,
        ROW_NUMBER() OVER (PARTITION BY c.subregion ORDER BY COUNT(DISTINCT p.paper_id) DESC) AS CountryRank
    FROM
        papers p
        JOIN paper_author pa ON p.paper_id = pa.paper_id
        JOIN authors a ON a.author_id = pa.author_id
        JOIN countries c ON a.nationality = c.country_code
    GROUP BY
        c.subregion, c.region, c.country_name
) r ON s.subregion = r.subregion AND r.CountryRank = 1
ORDER BY
    s.subregion, s.TotalPapers DESC;
    
# 7. Number of Papers published by Indonesia throughout the years
select 
	conference_name as 'Conference',
	conference_year as 'Year',
	count(distinct p.paper_id) as 'Number of Papers',
	count(distinct a.author_id) as 'Number of Authors'
from 
	papers p,
	paper_author pa ,
	authors a 
where 
	p.paper_id = pa.paper_id 
	and a.author_id = pa.author_id 
	and nationality = 'ID'
group by 
	conference_year, conference_name 
order by 
	conference_name, conference_year asc

# 8. Indonesian Authors and their Number of Papers Published
select 
a.author_name as 'Indonesian Authors',
count(pa.paper_id) as 'Papers Published' 
from 
authors a ,
paper_author pa 
where 
a.author_id=pa.author_id 
and nationality = 'ID'
group by 
a.author_name 
order by 
count(pa.paper_id);

# 9. View all papers
select distinct paper_title 
from papers 