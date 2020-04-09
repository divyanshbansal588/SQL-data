CREATE TABLE [dbo].[scsPackage](
	[packageId] [uniqueidentifier] NOT NULL,
	[schemeId] [uniqueidentifier] NOT NULL,
	[campaignID] [uniqueidentifier] NOT NULL,
	[packageName] [varchar](100) NOT NULL,
	[sequence] [int] NOT NULL,
	[invMsgId] [varchar](20) NOT NULL,
	[envMsgId] [int] NOT NULL,
	[continueFlag] [char](1) NOT NULL,
	[keepTogether] [char](1) NOT NULL,
	[msrepl_tran_version] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PKscsPackage] PRIMARY KEY CLUSTERED 
(
	[packageId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[scsPackage]  WITH NOCHECK ADD  CONSTRAINT [FKscsPackage#scsScheme] FOREIGN KEY([schemeId])
REFERENCES [dbo].[scsScheme] ([schemeId])
GO

ALTER TABLE [dbo].[scsPackage] CHECK CONSTRAINT [FKscsPackage#scsScheme]
GO
ALTER TABLE [dbo].[scsPackage] ADD  CONSTRAINT [DF__scsPackag__packa__5D60DB10]  DEFAULT (newid()) FOR [packageId]
GO
ALTER TABLE [dbo].[scsPackage] ADD  CONSTRAINT [DF__scsPackag__prior__5E54FF49]  DEFAULT ((1)) FOR [sequence]
GO
ALTER TABLE [dbo].[scsPackage] ADD  CONSTRAINT [DF__scsPackag__invMs__5F492382]  DEFAULT ('') FOR [invMsgId]
GO
ALTER TABLE [dbo].[scsPackage] ADD  CONSTRAINT [DF__scsPackag__ievMs__603D47BB]  DEFAULT ((0)) FOR [envMsgId]
GO
ALTER TABLE [dbo].[scsPackage] ADD  CONSTRAINT [DF_scsPackage_continueFlag]  DEFAULT ('Y') FOR [continueFlag]
GO
ALTER TABLE [dbo].[scsPackage] ADD  CONSTRAINT [DF_scsPackage_keepTogether]  DEFAULT ('Y') FOR [keepTogether]
GO
ALTER TABLE [dbo].[scsPackage] ADD  CONSTRAINT [MSrepl_tran_version_default_08E1089C_0D2B_4A2F_864A_068469BE5DE1_1979154096]  DEFAULT (newid()) FOR [msrepl_tran_version]