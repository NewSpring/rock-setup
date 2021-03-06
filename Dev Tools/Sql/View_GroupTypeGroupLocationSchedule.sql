-- Flatten the GroupTypeAssociation heirarchy for GroupTypes under 'Family Ministries'
;WITH Heirarchy
AS
(
		SELECT gta1.GroupTypeId, gta1.ChildGroupTypeId
		FROM [GroupTypeAssociation] gta1
		WHERE gta1.GroupTypeId = 
			(SELECT Id FROM [GroupType] WHERE Name = 'Family Ministries') 
    UNION ALL
		SELECT gta1.GroupTypeId, gta1.ChildGroupTypeId
		FROM [GroupTypeAssociation] gta1
		INNER JOIN Heirarchy TH ON TH.ChildGroupTypeId = gta1.GroupTypeId
)
--SELECT * FROM Heirarchy
/* List each Group's GroupType, Location and Schedule */
SELECT
   g.[Name] [Group.Name]
   , g.[Id] [Group.Id]
   , gt.[Name] [GroupType.Name]
   , gt.[Id] [GroupType.Id]
   , l.[Name] [Location.Name]
   , l.[Id] [Location.Id]
   , s.[Name] [Schedule.Name]
   , convert(varchar(5), s.[StartTime] ,108) [Schedule.StartTime]
   , convert(varchar(5), s.[EndTime] ,108) [Schedule.EndTime]
   , s.[Frequency] [Schedule.Frequency]
   , s.[FrequencyQualifier] [Schedule.FrequencyQualifier]
FROM [Group] g
   JOIN [GroupType] gt ON gt.Id = g.GroupTypeId
   JOIN Heirarchy ON Heirarchy.ChildGroupTypeId = g.GroupTypeId
   LEFT JOIN [GroupLocation] gl ON gl.GroupId = g.Id
   LEFT JOIN [Location] l ON l.Id = gl.LocationId
   LEFT JOIN [GroupLocationSchedule] gls ON gls.GroupLocationId = gl.Id
   LEFT JOIN [Schedule] s ON s.Id = gls.ScheduleId
ORDER BY [GroupType.Name], [Group.Name], [Location.Name], [Schedule.StartTime]