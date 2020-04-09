CREATE TABLE [dbo].[scsTargetMessage](
	[targetMessageId] [uniqueidentifier] NOT NULL,
	[campaignID] [uniqueidentifier] NOT NULL,
	[targetID] [uniqueidentifier] NOT NULL,
	[sequence] [int] NOT NULL,
	[invMsgId] [varchar](20) NOT NULL,
	[action] [char](1) NOT NULL,
	[msrepl_tran_version] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_scsTargetMessage] PRIMARY KEY CLUSTERED 
(
	[targetMessageId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[scsTargetMessage]  WITH CHECK ADD  CONSTRAINT [FK_scsTargetMessage_scsCampaignTarget] FOREIGN KEY([campaignID], [targetID])
REFERENCES [dbo].[scsCampaignTarget] ([campaignId], [targetID])
GO

ALTER TABLE [dbo].[scsTargetMessage] CHECK CONSTRAINT [FK_scsTargetMessage_scsCampaignTarget]
GO
ALTER TABLE [dbo].[scsTargetMessage] ADD  CONSTRAINT [DF__scsTarget__targe__4D1564AE]  DEFAULT (newid()) FOR [targetMessageId]
GO
ALTER TABLE [dbo].[scsTargetMessage] ADD  CONSTRAINT [DF__scsTarget__seque__4E0988E7]  DEFAULT ((1)) FOR [sequence]
GO
ALTER TABLE [dbo].[scsTargetMessage] ADD  CONSTRAINT [DF__scsTarget__invMs__4EFDAD20]  DEFAULT ('') FOR [invMsgId]
GO
ALTER TABLE [dbo].[scsTargetMessage] ADD  CONSTRAINT [DF_scsTargetMessage_action]  DEFAULT ('C') FOR [action]
GO
ALTER TABLE [dbo].[scsTargetMessage] ADD  CONSTRAINT [MSrepl_tran_version_default_25DAEFEA_9AA3_41A3_AB5E_FC425F1C8834_2029250284]  DEFAULT (newid()) FOR [msrepl_tran_version]