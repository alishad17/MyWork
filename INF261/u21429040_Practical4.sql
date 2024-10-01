USE GotchaSystems 
GO

-- Q1
CREATE PARTITION FUNCTION 
TotalGuestsAttending (INT)
AS RANGE LEFT
FOR VALUES (20, 50, 100)

CREATE partition function 
Total_Guests_Attending (int)
AS range left
FOR values (20,50,100)

--Q2
CREATE PARTITION SCHEME
TotalGuestsAttendingScheme
AS PARTITION TotalGuestsAttending
ALL TO ([PRIMARY]);

Create partition scheme 
Total_Guests_Scheme
As partition Total_Guests_Attending
all TO ([PRIMARY]);

-- Q3
SELECT 
OBJECT_NAME(p.object_id) AS SchemaName,
t.name AS TableName,
i.name AS IndexName,
d.name AS FileGroupName,
p.partition_number AS PartitionNo,
p.rows AS PartitionRows
FROM sys.partitions AS p
INNER JOIN sys.indexes AS i 
ON p.object_id= i.object_id
AND p.index_id = i.index_id
INNER JOIN sys.data_spaces AS d
ON i.data_space_id = d.data_space_id
INNER JOIN sys.tables AS t
ON t.object_id = i.object_id
ORDER BY TableName, IndexName, FileGroupName

SELECT OBJECT_NAME (p.object_id) AS SchemaName,
t.name AS TableName,
i.index_id AS IndexID,
i.name AS IndexName,
p.partition_number AS PartitionNo,
p.rows AS ParitionRows
FROM sys.tables AS t
INNER JOIN sys.indexes AS i
ON t.object_id = i.object_id
join sys.partitions AS p
ON p.object_id= i.object_id AND i.index_id = p.index_id
ORDER BY TableName, IndexName

SELECT OBJECT_NAME (p.object_id) as schema_name,
t.name AS table_name,
i.index_id AS index_id,
i.name AS index_name,
p.rows AS partition_row,
p.partition_number AS partition_number
FROM sys.tables AS t
inner join sys.indexes AS i ON t.object_id = i.object_id
inner join sys.partitions AS p ON p.object_id= i.object_id AND i.index_id = p.index_id
ORDER BY index_name, table_name

