-- If you haven't already done so, run the script in the above folder to generate the Doctor Who database.

-- Write a query to list out for each episode year and enemy the number of episodes made, but in addition:

-- Only show episodes made by doctors born before 1970; and
-- Omit rows where an enemy appeared in only one episode in a particular year. --

USE DoctorWho
GO

SELECT year(a.EpisodeDate) AS Episode_Year, b.EnemyName, COUNT(a.EpisodeId) AS Number_of_Episodes
FROM dbo.tblEpisode a
JOIN dbo.tblEpisodeEnemy c
ON a.EpisodeId = c.EpisodeID
JOIN dbo.tblEnemy b
ON b.EnemyId = c.EnemyId
GROUP BY b.EnemyName, year(a.EpisodeDate);


SELECT year(a.EpisodeDate) AS Episode_Year, b.EnemyName, COUNT(a.EpisodeId) AS Number_of_Episodes
FROM dbo.tblEpisode a
JOIN dbo.tblEpisodeEnemy c
ON a.EpisodeId = c.EpisodeID
JOIN dbo.tblEnemy b
ON b.EnemyId = c.EnemyId
JOIN dbo.tblDoctor d
ON d.DoctorId = a.DoctorId
WHERE year(d.BirthDate) < '1970'
GROUP BY b.EnemyName, year(a.EpisodeDate)
HAVING COUNT(b.EnemyId) > 1;