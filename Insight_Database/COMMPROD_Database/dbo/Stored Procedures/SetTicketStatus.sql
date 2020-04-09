CREATE PROCEDURE [dbo].[SetTicketStatus](@ticketNumber varchar(8)) AS 
/* set the ticket status and stage to reflect the status of the datafiles */
DECLARE @Stage VARCHAR(4)
DECLARE @Status VARCHAR(4)
DECLARE @CntFiles INT
DECLARE @CntFailed INT
DECLARE @CntUnProcessed INT
DECLARE @CntFinished INT
DECLARE @CntBillable INT
Declare @CntNotDoneProcessing INT
DECLARE @Mode VARCHAR(4)
DECLARE @BillingStatus CHAR(4)
DECLARE @Message VARCHAR(255)
DECLARE @processable CHAR(1)
SELECT @Stage = processingStage,@Mode=mode from ticket where ticketNumber = @ticketNumber
if (@@ROWCOUNT = 0) RETURN 99
SET @Message = ''
SET @processable = 'Y'
if (@Stage = 'VOID') RETURN

SELECT @CntFiles = count(*) from datafile where ticketNumber = @ticketNumber and processingStage <> 'SKIP'
SELECT @CntFailed = count(*) from datafile where ticketNumber = @ticketNumber and processingStage = 'PROC' and processingStatus = 'FAIL'
SELECT @CntBillable = count(*) from datafile where ticketNumber = @ticketNumber and processingStage = 'PROC' and processingStatus = 'CONB'
SELECT @CntUnProcessed = count(*) from datafile where ticketNumber = @ticketNumber and processingStage = 'UNPR'
SELECT @CntNotDoneProcessing = count(*) from datafile where ticketNumber = @ticketNumber and processingStage in ('GMC','PHS2')
if (@CntFiles = 0)
   BEGIN
	SET @Stage = 'VOID'
	SET @Status = 'N/A'
	SET @Message = 'Automatically voided - all files are SKIP'
	GOTO DONE
   END
if (@CntFiles = @CntUnprocessed) 
   BEGIN
	SET @Stage = 'PEND'
	SET @Status = 'N/A'
	GOTO DONE
   END
if (@CntUnprocessed > 0) OR (@CntFailed > 0)  OR (@CntBillable > 0) or (@CntNotDoneProcessing > 0)
   BEGIN
	SET @Stage = 'PROC'
	SET @Status = 'INC'
	GOTO DONE
   END
SET @Stage = 'PROC'
SET @Status = 'DONE'
SET @BillingStatus = 'PNDG'
SET @processable = 'N'
DONE:
UPDATE ticket set  processable=@processable,processingStage=@Stage, processingStatus=@status, processingMessage=@Message where ticketNumber = @ticketNumber