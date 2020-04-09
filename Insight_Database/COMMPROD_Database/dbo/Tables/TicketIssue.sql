CREATE TABLE [dbo].[TicketIssue](
	[ticketNumber] [varchar](8) NOT NULL,
	[issueId] [uniqueidentifier] NOT NULL,
	[tsCreated] [datetime] NOT NULL,
	[openedBy] [varchar](50) NOT NULL,
	[fileNumber] [int] NOT NULL,
	[status] [varchar](4) NOT NULL,
	[billable] [varchar](1) NOT NULL,
	[type] [varchar](50) NOT NULL,
	[department] [varchar](4) NOT NULL,
	[assignedBy] [varchar](50) NOT NULL,
	[assignedTo] [varchar](50) NOT NULL,
	[accepted] [char](1) NOT NULL,
	[billableHours] [decimal](7, 2) NOT NULL,
	[description] [varchar](1000) NOT NULL,
	[resolution] [varchar](5000) NOT NULL,
 CONSTRAINT [PK_TicketIssue] PRIMARY KEY NONCLUSTERED 
(
	[issueId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[TicketIssue]  WITH CHECK ADD  CONSTRAINT [FK_TicketIssue_Ticket] FOREIGN KEY([ticketNumber])
REFERENCES [dbo].[Ticket] ([ticketNumber])
GO

ALTER TABLE [dbo].[TicketIssue] CHECK CONSTRAINT [FK_TicketIssue_Ticket]
GO
ALTER TABLE [dbo].[TicketIssue] ADD  CONSTRAINT [DF_TicketIssue_issueId]  DEFAULT (newid()) FOR [issueId]
GO
ALTER TABLE [dbo].[TicketIssue] ADD  CONSTRAINT [DF__TicketIss__tsOpe__257C74A0]  DEFAULT (getdate()) FOR [tsCreated]
GO
ALTER TABLE [dbo].[TicketIssue] ADD  CONSTRAINT [DF__TicketIss__fileN__267098D9]  DEFAULT ((0)) FOR [fileNumber]