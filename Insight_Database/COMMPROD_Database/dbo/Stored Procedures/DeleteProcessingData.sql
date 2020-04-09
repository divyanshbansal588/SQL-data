CREATE PROCEDURE [dbo].[DeleteProcessingData]
	@ticketNumber [varchar](8),
	@fileNumber [int],
	@processingType [varchar](4)

AS

if @processingType='PRNT'
begin
   delete TOP (500) from PrinterPiece where ticketNumber=@ticketNumber and fileNumber=@fileNumber
   while @@rowcount > 0
   begin
      delete TOP (500) from PrinterPiece where ticketNumber=@ticketNumber and fileNumber=@fileNumber
   end
   delete from PrinterSegment where ticketNumber=@ticketNumber and fileNumber=@fileNumber
   delete from InserterOutputGroup where ticketNumber=@ticketNumber and fileNumber=@fileNumber
   delete from PrinterOutputGroup where ticketNumber=@ticketNumber and fileNumber=@fileNumber
end
delete from CountAdjustment where ticketNumber = @ticketNumber and fileNumber = @fileNumber and processingType = @processingType
delete from Processing where ticketNumber = @ticketNumber and fileNumber = @fileNumber and processingType = @processingType