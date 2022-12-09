SELECT Player.FirstName AS fName, Player.LastName AS lName, Player.PlayerId AS pID, Team.Name
FROM Player NATURAL JOIN PlaysForT NATURAL JOIN Team
WHERE Team.Name LIKE 'A%'
ORDER BY fName desc
LIMIT 10;

--This query should return the Name and Player ID of each player that is on a team that starts with the letter A.
--The players that are returned will be put in reverse alphebetical order.
--Only 10 players will be shown.

--like order by limit