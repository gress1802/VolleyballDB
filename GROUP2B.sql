SELECT DISTINCT a.FirstName, a.LastName, a.AgeGroup
FROM  
(SELECT Player.FirstName, Player.LastName, Player.AgeGroup, Player.Number
    FROM Player
    WHERE Player.ageGroup >16 
    --a table of players first and last names that have an age of 17 or 18
) AS a
LEFT JOIN
(SELECT Player.FirstName, Player.LastName, Player.AgeGroup, Player.Number
    FROM Player
    WHERE Player.Number = 6
    --a table of players whose number is 6
) AS b
--This query displays the players with age group greater than 16 whose number is not 6