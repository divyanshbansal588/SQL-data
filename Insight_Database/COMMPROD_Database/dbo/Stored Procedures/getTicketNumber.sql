CREATE PROCEDURE [dbo].[getTicketNumber]
WITH EXECUTE AS CALLER
AS
declare @newTicketNumber decimal(8,0)
UPDATE LastTicketNumber SET @newTicketNumber = ticketNumber = ticketNumber + 1
RETURN @newTicketNumber