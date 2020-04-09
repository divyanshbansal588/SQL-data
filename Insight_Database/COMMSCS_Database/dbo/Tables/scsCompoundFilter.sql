CREATE TABLE [dbo].[scsCompoundFilter](
	[filterIdOwner] [uniqueidentifier] NOT NULL,
	[filterIdMember] [uniqueidentifier] NOT NULL,
	[msrepl_tran_version] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_scsCompoundFilter] PRIMARY KEY CLUSTERED 
(
	[filterIdOwner] ASC,
	[filterIdMember] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[scsCompoundFilter]  WITH CHECK ADD  CONSTRAINT [FK_scsCompoundFilter_scsFilter] FOREIGN KEY([filterIdOwner])
REFERENCES [dbo].[scsFilter] ([filterId])
GO

ALTER TABLE [dbo].[scsCompoundFilter] CHECK CONSTRAINT [FK_scsCompoundFilter_scsFilter]
GO
ALTER TABLE [dbo].[scsCompoundFilter]  WITH CHECK ADD  CONSTRAINT [FK_scsCompoundFilter_scsFilter1] FOREIGN KEY([filterIdMember])
REFERENCES [dbo].[scsFilter] ([filterId])
GO

ALTER TABLE [dbo].[scsCompoundFilter] CHECK CONSTRAINT [FK_scsCompoundFilter_scsFilter1]
GO
ALTER TABLE [dbo].[scsCompoundFilter] ADD  CONSTRAINT [MSrepl_tran_version_default_6342ADA2_9A25_438F_93BD_A5D64F9F01C7_1821249543]  DEFAULT (newid()) FOR [msrepl_tran_version]