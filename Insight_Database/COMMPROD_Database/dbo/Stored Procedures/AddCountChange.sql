CREATE PROCEDURE [dbo].[AddCountChange]
	@ticketNumber [varchar](8),
	@fileNumber [int],
	@processingType [varchar](4),
	@changeInStatementCount [int],
	@changeInPageCount [int],
	@reason [varchar](255)
WITH EXECUTE AS CALLER
AS
UPDATE  Processing set 
netStatementCount = netStatementCount + @changeInStatementCount, 
netPageCount = netPageCount + @changeInPageCount
WHERE ticketNumber = @ticketNumber and fileNumber=@fileNumber and processingType = @processingType

INSERT INTO CountAdjustment([ticketNumber],[fileNumber],[processingType],[changeInStatementCount],changeInPageCount,reason)
VALUES(@ticketNumber,@fileNumber,@processingType,@changeInStatementCount,@changeInPageCount,@reason)

/* to prevent duplicate key errors */
WAITFOR DELAY '00:00:01'