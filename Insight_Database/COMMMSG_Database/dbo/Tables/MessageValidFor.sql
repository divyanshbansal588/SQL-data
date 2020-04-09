CREATE TABLE [dbo].[MessageValidFor](
	[applicationCode] [varchar](20) NOT NULL,
	[messageAreaCode] [varchar](20) NOT NULL,
	[messageId] [uniqueidentifier] NOT NULL,
	[msrepl_tran_version] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_MessageValidFor] PRIMARY KEY CLUSTERED 
(
	[applicationCode] ASC,
	[messageAreaCode] ASC,
	[messageId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[MessageValidFor]  WITH NOCHECK ADD  CONSTRAINT [FK_MessageValidFor_Message] FOREIGN KEY([messageId])
REFERENCES [dbo].[Message] ([messageId])
NOT FOR REPLICATION
GO

ALTER TABLE [dbo].[MessageValidFor] CHECK CONSTRAINT [FK_MessageValidFor_Message]
GO
ALTER TABLE [dbo].[MessageValidFor]  WITH NOCHECK ADD  CONSTRAINT [FK_MessageValidFor_MessageArea] FOREIGN KEY([applicationCode], [messageAreaCode])
REFERENCES [dbo].[MessageArea] ([applicationCode], [messageAreaCode])
NOT FOR REPLICATION
GO

ALTER TABLE [dbo].[MessageValidFor] CHECK CONSTRAINT [FK_MessageValidFor_MessageArea]
GO
ALTER TABLE [dbo].[MessageValidFor] ADD  CONSTRAINT [DF_MessageValidFor_messageId]  DEFAULT (newid()) FOR [messageId]
GO
ALTER TABLE [dbo].[MessageValidFor] ADD  CONSTRAINT [MSrepl_tran_version_default_B943C3D9_B4D6_48CF_B3B8_C39B69F17028_693577509]  DEFAULT (newid()) FOR [msrepl_tran_version]