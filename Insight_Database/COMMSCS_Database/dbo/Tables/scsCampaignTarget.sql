CREATE TABLE [dbo].[scsCampaignTarget](
	[campaignId] [uniqueidentifier] NOT NULL,
	[targetID] [uniqueidentifier] NOT NULL,
	[msrepl_tran_version] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_scsCampaignTarget] PRIMARY KEY CLUSTERED 
(
	[campaignId] ASC,
	[targetID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[scsCampaignTarget]  WITH CHECK ADD  CONSTRAINT [FK_scsCampaignTarget_scsCampaign] FOREIGN KEY([campaignId])
REFERENCES [dbo].[scsCampaign] ([campaignId])
GO

ALTER TABLE [dbo].[scsCampaignTarget] CHECK CONSTRAINT [FK_scsCampaignTarget_scsCampaign]
GO
ALTER TABLE [dbo].[scsCampaignTarget] ADD  CONSTRAINT [MSrepl_tran_version_default_FC6B346D_FE69_4E80_A68A_AAE3BEEB7018_1981250113]  DEFAULT (newid()) FOR [msrepl_tran_version]