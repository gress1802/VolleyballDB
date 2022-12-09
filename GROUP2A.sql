SELECT Player.AgeGroup AS Age, max(Coach.Salary) AS maxSalary, avg(Club.rank)
FROM Club JOIN CoachesFor ON Club.ClubID = CoachesFor.ClubID 
JOIN Coach ON CoachesFor.CoachID = Coach.CoachID 
JOIN Coaches ON Coach.CoachID = Coaches.CoachID 
JOIN Player ON Coaches.PlayerID = Player.PlayerID
GROUP BY Player.AgeGroup 
HAVING Age > 16



--This query selects and groups by the player age groups greater than 15, the greatest a coach is being payed within that age group,
--and the average ranking of all the teams within the age group. 