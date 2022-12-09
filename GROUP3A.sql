SELECT DISTINCT fName, lName, minRank
FROM (SELECT Player.FirstName AS fName, Player.LastName AS lName, min(Club.Rank) AS minRank
            FROM Club JOIN PartOfC JOIN Team JOIN PlaysForT JOIN Player
            ON Club.ClubID = PartOfC.ClubID AND PartOfC.TeamID = Team.TeamID AND Team.TeamID = PlaysForT.TeamID AND PlaysForT.PlayerID = Player.PlayerID
            WHERE State IN ('Wisconsin', 'Ohio', 'New York')
            GROUP BY Team.TeamID)
ORDER BY minRank;

--This query shows us the first name and last name of players with the best club ranking in the northern states within our database (Wisconsin, Ohio, and New York)
