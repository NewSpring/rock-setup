SELECT [a].[Key] [AttributeKey]
    ,[v].[Value] [AttributeValue.Value]
    ,[v].[Guid] [AttributeValue.Guid]
    ,[ft].[Name] [FieldType.Name]
    ,[ft].[Guid] [FieldType.Guid]
    ,[a].[Guid] [Attribute.Guid]
    ,isnull([e].[Name], 'Global') [EntityName]
    ,CASE e.NAME
        WHEN 'Rock.Model.Block'
            THEN p.InternalName
        ELSE 'n/a'
        END 'Page.Name'
    ,CASE e.NAME
        WHEN 'Rock.Model.Block'
            THEN b.NAME
        ELSE 'n/a'
        END 'Block.Name'
    ,CASE e.NAME
        WHEN 'Rock.Model.Block'
            THEN convert(VARCHAR(36), b.Guid)
        ELSE 'n/a'
        END 'Block.Guid'
        ,[a].[EntityTypeQualifierColumn]
    ,[a].[EntityTypeQualifierValue]
    ,isnull(cast([v].[EntityId] AS NVARCHAR(100)), 'n/a') [Entity's Id Value]
        ,[v].[ModifiedDateTime] [Value.ModifiedDateTime]
FROM [AttributeValue] [v]
JOIN [Attribute] [a] ON [a].[Id] = [v].[AttributeId]
LEFT JOIN [EntityType] [e] ON [e].[Id] = [a].[EntityTypeId]
JOIN [FieldType] [ft] ON [ft].[Id] = [a].[FieldTypeId]
LEFT JOIN [Block] [b] ON b.Id = [v].[EntityId]
LEFT OUTER JOIN [Page] [p] ON [b].[PageId] = [p].[Id]
--where ft.[Guid] = 'C403E219-A56B-439E-9D50-9302DFE760CF' -- BinaryFile
ORDER BY [a].[Key], [v].[Value]


