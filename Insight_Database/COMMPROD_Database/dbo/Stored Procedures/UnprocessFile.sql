CREATE PROCEDURE [dbo].[UnprocessFile](@ticketNumber char(8), @fileNumber integer)AS 

delete TOP (500) from PrinterPiece where ticketNumber=@ticketNumber and fileNumber=@fileNumber
while @@rowcount > 0
begin
   delete TOP (500) from PrinterPiece where ticketNumber=@ticketNumber and fileNumber=@fileNumber
end

delete from PrinterSegment where ticketNumber=@ticketNumber and fileNumber=@fileNumber
delete from InserterOutputGroup where ticketNumber=@ticketNumber and fileNumber=@fileNumber
delete from PrinterOutputGroup where ticketNumber=@ticketNumber and fileNumber=@fileNumber
delete from CountAdjustment where ticketNumber=@ticketNumber and fileNumber=@fileNumber
delete from Processing where ticketNumber=@ticketNumber and fileNumber=@fileNumber

UPDATE datafile
SET	processingStage = 'UNPR', 
	processingStatus = 'N/A', 
	tsProcessingStarted = NULL,
	tsProcessingEnded = NULL,
	tsProcessingStarted2 = NULL,
	tsProcessingEnded2 = NULL,
	processedOn = ''
WHERE ticketNumber=@ticketNumber and fileNumber=@fileNumber

exec SetTicketStatus @ticketNumber