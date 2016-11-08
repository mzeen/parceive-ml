SELECT 	DISTINCT
	c.Id,
	c.Function,
	f.Name,
	((c.End - c.Start) * 1.0) / (SELECT (End - Start) FROM Call WHERE Function = (SELECT Id From Function WHERE Name = "main")) as Ratio,
	0 as LoopId,
	0 as LoopExecutionId,
	0 as Iteration
FROM Call c
	INNER JOIN Segment s ON s.Call = c.Id
	INNER JOIN Function f ON f.Id = c.Function
WHERE s.Type = 0 AND s.LoopIteration IS NULL;
