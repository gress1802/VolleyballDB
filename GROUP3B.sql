SELECT Coach.FirstName, Coach.LastName, Club.Name
FROM Coach JOIN CoachesFor JOIN Club
ON Coach.CoachID = CoachesFor.CoachID AND CoachesFor.ClubID = Club.ClubID
UNION
SELECT Player.FirstName, Player.LastName, Club.Name
FROM Player JOIN Coaches JOIN Coach JOIN CoachesFor JOIN Club
ON Player.PlayerID = Coaches.PlayerID AND Coaches.CoachID = Coach.CoachID AND Coach.CoachID = CoachesFor.CoachID AND CoachesFor.ClubID = Club.ClubID
ORDER BY Club.Name

--This query shows everyone (coaches and players) incvolved with each club