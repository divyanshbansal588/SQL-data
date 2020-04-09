CREATE TABLE [dbo].[scsCampaignSampleData](
	[campaignSampleDataId] [uniqueidentifier] NOT NULL,
	[applicationCode] [varchar](20) NOT NULL,
	[tsCreated] [datetime] NOT NULL,
	[ticketNumber] [char](8) NOT NULL,
	[fileNumber] [int] NOT NULL,
	[fileName] [varchar](200) NOT NULL,
	[msrepl_tran_version] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_scsCampaignSampleData] PRIMARY KEY CLUSTERED 
(
	[campaignSampleDataId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[scsCampaignSampleData]  WITH CHECK ADD  CONSTRAINT [FK_scsCampaignSampleData_scsApplication] FOREIGN KEY([applicationCode])
REFERENCES [dbo].[scsApplication] ([applicationCode])
GO

ALTER TABLE [dbo].[scsCampaignSampleData] CHECK CONSTRAINT [FK_scsCampaignSampleData_scsApplication]
GO
ALTER TABLE [dbo].[scsCampaignSampleData] ADD  CONSTRAINT [DF__scsCampai__campa__75E27017]  DEFAULT (newid()) FOR [campaignSampleDataId]
GO
ALTER TABLE [dbo].[scsCampaignSampleData] ADD  CONSTRAINT [DF_scsCampaignSampleData_tsCreated]  DEFAULT (getdate()) FOR [tsCreated]
GO
ALTER TABLE [dbo].[scsCampaignSampleData] ADD  CONSTRAINT [MSrepl_tran_version_default_E6306739_BCC3_4267_B9AD_2F6FAA5C298F_182291709]  DEFAULT (newid()) FOR [msrepl_tran_version]