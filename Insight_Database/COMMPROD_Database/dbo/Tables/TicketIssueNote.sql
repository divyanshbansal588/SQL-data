CREATE TABLE [dbo].[TicketIssueNote](
	[ticketNumber] [char](8) NOT NULL,
	[tsCreated] [datetime] NOT NULL,
	[noteId] [uniqueidentifier] NOT NULL,
	[issueId] [uniqueidentifier] NOT NULL,
	[createdBy] [varchar](30) NOT NULL,
	[text] [varchar](5000) NOT NULL,
 CONSTRAINT [PK_TicketIssueNote] PRIMARY KEY NONCLUSTERED 
(
	[noteId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[TicketIssueNote]  WITH CHECK ADD  CONSTRAINT [FK_TicketIssueNote_TicketIssue] FOREIGN KEY([issueId])
REFERENCES [dbo].[TicketIssue] ([issueId])
GO

ALTER TABLE [dbo].[TicketIssueNote] CHECK CONSTRAINT [FK_TicketIssueNote_TicketIssue]
GO
ALTER TABLE [dbo].[TicketIssueNote] ADD  CONSTRAINT [DF_TicketIssueNote_tsCreated]  DEFAULT (getdate()) FOR [tsCreated]
GO
ALTER TABLE [dbo].[TicketIssueNote] ADD  CONSTRAINT [DF_TicketIssueNote_noteId]  DEFAULT (newid()) FOR [noteId]