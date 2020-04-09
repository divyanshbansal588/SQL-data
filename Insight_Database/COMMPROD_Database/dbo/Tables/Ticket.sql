CREATE TABLE [dbo].[Ticket](
	[ticketNumber] [varchar](8) NOT NULL,
	[tsReceived] [datetime] NOT NULL,
	[clientCode] [varchar](15) NOT NULL,
	[source] [varchar](3) NOT NULL,
	[mode] [varchar](4) NOT NULL,
	[archiveName] [varchar](255) NOT NULL,
	[archiveSize] [bigint] NOT NULL,
	[uploadServer] [varchar](50) NOT NULL,
	[uploadUser] [varchar](50) NOT NULL,
	[processable] [char](1) NOT NULL,
	[queued] [char](1) NOT NULL,
	[processingStage] [varchar](4) NOT NULL,
	[processingStatus] [varchar](4) NOT NULL,
	[processingMessage] [varchar](255) NOT NULL,
 CONSTRAINT [PK_Ticket] PRIMARY KEY CLUSTERED 
(
	[ticketNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Ticket]  WITH CHECK ADD  CONSTRAINT [FK_Ticket_Client] FOREIGN KEY([clientCode])
REFERENCES [dbo].[Client] ([clientCode])
GO

ALTER TABLE [dbo].[Ticket] CHECK CONSTRAINT [FK_Ticket_Client]
GO
ALTER TABLE [dbo].[Ticket] ADD  CONSTRAINT [DF_Ticket_tsCreated]  DEFAULT (getdate()) FOR [tsReceived]
GO
ALTER TABLE [dbo].[Ticket] ADD  CONSTRAINT [DF_Ticket_upoadServer]  DEFAULT ('') FOR [uploadServer]
GO
ALTER TABLE [dbo].[Ticket] ADD  CONSTRAINT [DF_Ticket_uploadUser]  DEFAULT ('') FOR [uploadUser]
GO
ALTER TABLE [dbo].[Ticket] ADD  CONSTRAINT [DF_Ticket_processable]  DEFAULT ('N') FOR [processable]
GO
ALTER TABLE [dbo].[Ticket] ADD  CONSTRAINT [DF_Ticket_ququed]  DEFAULT ('N') FOR [queued]
GO
ALTER TABLE [dbo].[Ticket] ADD  CONSTRAINT [DF_Ticket_processingMessage]  DEFAULT ('') FOR [processingMessage]