CREATE TABLE [dbo].[TicketActivityLog](
	[clientCode] [varchar](15) NOT NULL,
	[ticketNumber] [varchar](8) NOT NULL,
	[tsActivity] [datetime] NOT NULL,
	[activityId] [uniqueidentifier] NOT NULL,
	[userName] [varchar](100) NOT NULL,
	[summary] [varchar](6000) NOT NULL,
	[detail] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_TicketActivityLog] PRIMARY KEY NONCLUSTERED 
(
	[activityId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[TicketActivityLog] ADD  CONSTRAINT [DF_TicketActivityLog_tsActivity]  DEFAULT (getdate()) FOR [tsActivity]
GO
ALTER TABLE [dbo].[TicketActivityLog] ADD  CONSTRAINT [DF_TicketActivityLog_activityId]  DEFAULT (newid()) FOR [activityId]