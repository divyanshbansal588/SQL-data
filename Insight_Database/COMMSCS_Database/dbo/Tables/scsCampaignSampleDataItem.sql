CREATE TABLE [dbo].[scsCampaignSampleDataItem](
	[campaignSampleDataItemID] [uniqueidentifier] NOT NULL,
	[campaignSampleDataID] [uniqueidentifier] NOT NULL,
	[accountNumber] [varchar](100) NOT NULL,
	[SLCTdata] [varchar](5000) NOT NULL,
	[msrepl_tran_version] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_scsCampaignSampleDataItem] PRIMARY KEY CLUSTERED 
(
	[campaignSampleDataItemID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[scsCampaignSampleDataItem]  WITH CHECK ADD  CONSTRAINT [FK_scsCampaignSampleDataItem_scsCampaignSampleData] FOREIGN KEY([campaignSampleDataID])
REFERENCES [dbo].[scsCampaignSampleData] ([campaignSampleDataId])
GO

ALTER TABLE [dbo].[scsCampaignSampleDataItem] CHECK CONSTRAINT [FK_scsCampaignSampleDataItem_scsCampaignSampleData]
GO
ALTER TABLE [dbo].[scsCampaignSampleDataItem] ADD  CONSTRAINT [DF_scsCampaignSampleDataItem_campaignSampleDataItemID]  DEFAULT (newid()) FOR [campaignSampleDataItemID]
GO
ALTER TABLE [dbo].[scsCampaignSampleDataItem] ADD  CONSTRAINT [MSrepl_tran_version_default_74401B30_EE76_4681_8AB9_1CAE7CDD453B_2041774331]  DEFAULT (newid()) FOR [msrepl_tran_version]