SELECT 	c.Id,
	c.Function,
	f.Name,
	((c.End - c.Start) * 1.0) / (SELECT (End - Start) FROM Call WHERE Function = (SELECT Id From Function WHERE Name = "main")) as Ratio,
	le.Loop as LoopId,
	li.Execution as LoopExecutionId,
	li.Iteration
FROM Call c
	INNER JOIN Segment s ON s.Call = c.Id
	INNER JOIN LoopIteration li ON li.Id = s.LoopIteration
	INNER JOIN LoopExecution le ON le.Id = li.Execution
	INNER JOIN Function f ON f.Id = c.Function
WHERE s.Type = 0;
