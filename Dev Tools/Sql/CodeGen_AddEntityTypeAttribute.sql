/* Code Generate 'AddEntityAttribute(...)' for migrations. 
This will list all of the attributes order by entity type and order 
Just pick the top few that you need for your migration depending
*/

begin

declare
@crlf varchar(2) = char(13) + char(10)


SELECT 
        '            AddEntityAttribute("'+    
		[e].name + '","' +
        CONVERT(nvarchar(50), ft.Guid)+ '","' + 
		a.EntityTypeQualifierColumn + '","' +
		a.EntityTypeQualifierValue + '","' +
		a.Name + '","","' +
		a.Description + '",' +
		CONVERT(varchar(5), a.[order]) + ',"' +
		a.DefaultValue + '","' +
        CONVERT(nvarchar(50), a.Guid)+ '");' + @crlf
  FROM [Attribute] [a]
  inner join [EntityType] [e] on [e].Id = [a].EntityTypeId
  inner join [FieldType] [ft] on [ft].Id = [a].FieldTypeId
order by [e].[name], [a].[Order] 


SELECT 
        '            DeleteAttribute("' +    
        CONVERT(nvarchar(50), a.Guid)+ '");    // ' + 
		[e].name + ': ' +
		a.Name + @crlf
  FROM [Attribute] [a]
  inner join [EntityType] [e] on [e].Id = [a].EntityTypeId
  inner join [FieldType] [ft] on [ft].Id = [a].FieldTypeId
order by [e].[name], [a].[Order] 

end
