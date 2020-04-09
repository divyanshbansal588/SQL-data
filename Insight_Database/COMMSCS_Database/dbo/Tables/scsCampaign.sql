CREATE TABLE [dbo].[scsCampaign](
	[campaignId] [uniqueidentifier] NOT NULL,
	[applicationCode] [varchar](20) NOT NULL,
	[effectiveDate] [datetime] NOT NULL,
	[useEnvelopeMessaging] [char](1) NOT NULL,
	[defaultEnvMsgID] [int] NOT NULL,
	[envMsgColor] [char](1) NOT NULL,
	[accumulateMessages] [char](1) NOT NULL,
	[failIfNoMessage] [char](1) NOT NULL,
	[stage] [varchar](4) NOT NULL,
	[mode] [char](1) NOT NULL,
	[QA] [char](1) NOT NULL,
	[notes] [varchar](500) NOT NULL,
	[msrepl_tran_version] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PKscsProgram] PRIMARY KEY CLUSTERED 
(
	[campaignId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[scsCampaign]  WITH NOCHECK ADD  CONSTRAINT [FKscsProgram#scsSetup] FOREIGN KEY([applicationCode])
REFERENCES [dbo].[scsApplication] ([applicationCode])
GO

ALTER TABLE [dbo].[scsCampaign] CHECK CONSTRAINT [FKscsProgram#scsSetup]
GO
ALTER TABLE [dbo].[scsCampaign] ADD  CONSTRAINT [DF__scsProgra__progr__55BFB948]  DEFAULT (newid()) FOR [campaignId]
GO
ALTER TABLE [dbo].[scsCampaign] ADD  CONSTRAINT [DF_scsProgram_envelopeMessaging]  DEFAULT ('N') FOR [useEnvelopeMessaging]
GO
ALTER TABLE [dbo].[scsCampaign] ADD  CONSTRAINT [DF_scsProgram_defaultEnvMsgID]  DEFAULT ((0)) FOR [defaultEnvMsgID]
GO
ALTER TABLE [dbo].[scsCampaign] ADD  CONSTRAINT [DF_scsProgram_envMsgCOlor]  DEFAULT ('M') FOR [envMsgColor]
GO
ALTER TABLE [dbo].[scsCampaign] ADD  CONSTRAINT [DF_scsProgram_packageHandling]  DEFAULT ('N') FOR [accumulateMessages]
GO
ALTER TABLE [dbo].[scsCampaign] ADD  CONSTRAINT [DF_scsCampaign_failIfNoMessage]  DEFAULT ('N') FOR [failIfNoMessage]
GO
ALTER TABLE [dbo].[scsCampaign] ADD  CONSTRAINT [DF_scsProgram_mode]  DEFAULT ('A') FOR [mode]
GO
ALTER TABLE [dbo].[scsCampaign] ADD  CONSTRAINT [DF__scsProgra__notes__56B3DD81]  DEFAULT ('') FOR [notes]
GO
ALTER TABLE [dbo].[scsCampaign] ADD  CONSTRAINT [MSrepl_tran_version_default_6AFD2FFD_101B_4166_84DF_E73B39E18155_775673811]  DEFAULT (newid()) FOR [msrepl_tran_version]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'TEST, PROD, orQA' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'scsCampaign', @level2type=N'COLUMN',@level2name=N'stage'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Identifies the campiagn to be used by the SelectionProcessor when run in QA mode' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'scsCampaign', @level2type=N'COLUMN',@level2name=N'QA'