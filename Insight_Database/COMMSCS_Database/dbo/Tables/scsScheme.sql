CREATE TABLE [dbo].[scsScheme](
	[schemeId] [uniqueidentifier] NOT NULL,
	[campaignId] [uniqueidentifier] NOT NULL,
	[schemeName] [varchar](100) NOT NULL,
	[sequence] [int] NOT NULL,
	[msrepl_tran_version] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PKscsScheme] PRIMARY KEY CLUSTERED 
(
	[schemeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[scsScheme]  WITH CHECK ADD  CONSTRAINT [FK_scsScheme_scsCampaign] FOREIGN KEY([campaignId])
REFERENCES [dbo].[scsCampaign] ([campaignId])
GO

ALTER TABLE [dbo].[scsScheme] CHECK CONSTRAINT [FK_scsScheme_scsCampaign]
GO
ALTER TABLE [dbo].[scsScheme] ADD  CONSTRAINT [DF__scsScheme__schem__45544755]  DEFAULT (newid()) FOR [schemeId]
GO
ALTER TABLE [dbo].[scsScheme] ADD  CONSTRAINT [DF__scsScheme__seque__46486B8E]  DEFAULT ((1)) FOR [sequence]
GO
ALTER TABLE [dbo].[scsScheme] ADD  CONSTRAINT [MSrepl_tran_version_default_DB92EC56_772A_452C_AD39_0234A79E9C5A_1131151075]  DEFAULT (newid()) FOR [msrepl_tran_version]