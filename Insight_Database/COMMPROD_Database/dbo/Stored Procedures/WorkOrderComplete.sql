CREATE PROCEDURE [dbo].[WorkOrderComplete]	@ticketNumber [varchar](8)
WITH EXECUTE AS CALLER
AS
/* set the ticket status and stage based on receipt of file via web/ftp and process steps through scan programs*/
DECLARE @status VARCHAR(4)
DECLARE @message VARCHAR(255)

BEGIN TRANSACTION
SELECT @status = processingStatus,@message=processingMessage from ticket where ticketNumber=@ticketNumber

if (@Status = 'WXFR')
  BEGIN
	SET @Status = 'WWRK'
	SET @Message = 'Work Order completed. Pending Remote FTP scan'
	GOTO DONE
  END
if (@Status = 'WFTP')
  BEGIN
	SET @Status = 'WPND'
	SET @Message = 'Work Order completed, Pending InBox scan'
	GOTO DONE
  END

DONE:
UPDATE ticket set processingStatus = @Status, processingMessage = @Message where ticketNumber = @ticketNumber
COMMIT TRANSACTION