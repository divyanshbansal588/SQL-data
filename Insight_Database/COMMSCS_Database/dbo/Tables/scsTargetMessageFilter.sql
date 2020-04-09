CREATE TABLE [dbo].[scsTargetMessageFilter](
	[filterId] [uniqueidentifier] NOT NULL,
	[targetMessageId] [uniqueidentifier] NOT NULL,
	[campaignID] [uniqueidentifier] NOT NULL,
	[msrepl_tran_version] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PKscsTargetMessageFilter] PRIMARY KEY CLUSTERED 
(
	[filterId] ASC,
	[targetMessageId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[scsTargetMessageFilter]  WITH CHECK ADD  CONSTRAINT [FK_scsTargetMessageFilter_scsFilter] FOREIGN KEY([filterId])
REFERENCES [dbo].[scsFilter] ([filterId])
GO

ALTER TABLE [dbo].[scsTargetMessageFilter] CHECK CONSTRAINT [FK_scsTargetMessageFilter_scsFilter]
GO
ALTER TABLE [dbo].[scsTargetMessageFilter]  WITH CHECK ADD  CONSTRAINT [FK_scsTargetMessageFilter_scsTargetMessage] FOREIGN KEY([targetMessageId])
REFERENCES [dbo].[scsTargetMessage] ([targetMessageId])
GO

ALTER TABLE [dbo].[scsTargetMessageFilter] CHECK CONSTRAINT [FK_scsTargetMessageFilter_scsTargetMessage]
GO
ALTER TABLE [dbo].[scsTargetMessageFilter] ADD  CONSTRAINT [MSrepl_tran_version_default_E8E091FA_CADB_4E71_A192_0B182D04D8A0_1373247947]  DEFAULT (newid()) FOR [msrepl_tran_version]