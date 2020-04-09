CREATE TABLE [dbo].[scsApplication](
	[applicationCode] [varchar](20) NOT NULL,
	[clientCode] [varchar](10) NOT NULL,
	[dataSourceId] [uniqueidentifier] NULL,
	[applicationName] [varchar](100) NOT NULL,
	[active] [char](1) NOT NULL,
	[notes] [varchar](500) NOT NULL,
	[messagesPerDocument] [char](1) NOT NULL,
	[sampleDataMax] [int] NOT NULL,
	[msrepl_tran_version] [uniqueidentifier] NOT NULL,
	[applicationVersion] [int] NOT NULL,
 CONSTRAINT [PKscsSetup] PRIMARY KEY CLUSTERED 
(
	[applicationCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[scsApplication]  WITH NOCHECK ADD  CONSTRAINT [FKscsSetup#scsDataSource] FOREIGN KEY([dataSourceId])
REFERENCES [dbo].[scsDataSource] ([dataSourceId])
GO

ALTER TABLE [dbo].[scsApplication] CHECK CONSTRAINT [FKscsSetup#scsDataSource]
GO
ALTER TABLE [dbo].[scsApplication] ADD  CONSTRAINT [DF__scsSetup__notes__467D75B8]  DEFAULT ('') FOR [notes]
GO
ALTER TABLE [dbo].[scsApplication] ADD  CONSTRAINT [DF_scsApplication_messageMode]  DEFAULT ('1') FOR [messagesPerDocument]
GO
ALTER TABLE [dbo].[scsApplication] ADD  CONSTRAINT [DF_scsApplication_sampleDataMax]  DEFAULT ((5)) FOR [sampleDataMax]
GO
ALTER TABLE [dbo].[scsApplication] ADD  CONSTRAINT [MSrepl_tran_version_default_60F67493_18E7_46B0_BF18_501D573833DE_375672386]  DEFAULT (newid()) FOR [msrepl_tran_version]
GO
ALTER TABLE [dbo].[scsApplication] ADD  CONSTRAINT [DF_scsApplication_version]  DEFAULT ((1)) FOR [applicationVersion]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'''0'', ''1'' or ''M''' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'scsApplication', @level2type=N'COLUMN',@level2name=N'messagesPerDocument'