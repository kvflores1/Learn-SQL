/* 1. Create a Songs Table */
CREATE TABLE songs (
	id INT NOT NULL AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    length FLOAT NOT NULL,
    album_id INT NOT NULL,
    PRIMARY KEY(id),
    FOREIGN KEY(album_id) REFERENCES albums(id)
);

/* 2. Select only the Names of all the Bands */
SELECT bands.name AS 'Band Name' FROM bands;

/* 3. Select the Oldest Album */
SELECT a.id, a.name, a.release_year, a.band_id FROM albums a
WHERE a.release_year IS NOT NULL 
ORDER BY release_year
LIMIT 1;

/* 4. Get all Bands that have Albums */
SELECT DISTINCT bands.name AS 'Band Name' FROM bands
INNER JOIN albums ON bands.id = albums.band_id;

/* 5. Get all Bands that have No Albums */
SELECT bands.name AS 'Band Name' FROM bands
LEFT JOIN albums ON bands.id = albums.band_id
WHERE albums.id IS NULL;

/* 6. Get the Longest Album */
SELECT albums.name AS 'Name', albums.release_year AS 'Release Year', SUM(songs.length) AS 'Duration'
FROM albums 
INNER JOIN songs ON albums.id = songs.album_id
GROUP BY songs.album_id
ORDER BY Duration DESC
LIMIT 1;

/* 7. Update the Release Year of the Album with no Release Year */
SELECT * FROM albums;

SELECT id FROM albums WHERE release_year IS NULL;

UPDATE albums
SET release_year = 1986
WHERE id = 4;

/* 8. Insert a record for your favorite Band and one of their Albums */
INSERT INTO bands(id,name) VALUES (8,'Seventeen');
INSERT INTO albums(id,name,release_year,band_id) VALUES (19,'Face The Sun',2022,8);

/* 9. Delete the Band and Album you added in #8 */
DELETE FROM albums WHERE id=19;
DELETE FROM bands WHERE id=8;

/* 10. Get the Average Length of all Songs */
SELECT AVG(length) AS 'Average Song Duration' FROM songs;

/* 11. Select the longest Song off each Album */
SELECT albums.name AS Album, albums.release_year AS 'Release Year', MAX(songs.length) AS Duration
FROM albums JOIN songs ON albums.id = songs.album_id
GROUP BY songs.album_id;


/* 12. Get the number of Songs for each Band */
SELECT bands.name as Band, COUNT(songs.id) as 'Number of Songs'
FROM Bands JOIN albums ON bands.id = albums.band_id
JOIN songs ON albums.id = songs.album_id
GROUP BY bands.name;
