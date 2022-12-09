SELECT Club.Name, sum(Coach.Salary) AS TotalSalary
FROM Coach JOIN CoachesFor JOIN Club
ON Coach.CoachID = CoachesFor.CoachID AND CoachesFor.ClubID = Club.ClubID
GROUP BY Club.ClubID
ORDER BY TotalSalary desc;

--This query returns club name and total compensation for each club in the database displayed in descending order.
