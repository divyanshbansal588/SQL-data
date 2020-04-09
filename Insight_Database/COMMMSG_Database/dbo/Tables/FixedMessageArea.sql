CREATE TABLE [dbo].[FixedMessageArea](
	[applicationCode] [varchar](20) NOT NULL,
	[pageLayoutCode] [varchar](20) NOT NULL,
	[messageAreaCode] [varchar](20) NOT NULL,
	[X] [money] NOT NULL,
	[Y] [money] NOT NULL,
	[msrepl_tran_version] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_FixedMessageArea] PRIMARY KEY CLUSTERED 
(
	[applicationCode] ASC,
	[pageLayoutCode] ASC,
	[messageAreaCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[FixedMessageArea]  WITH NOCHECK ADD  CONSTRAINT [FK_FixedMessageArea_MessageArea] FOREIGN KEY([applicationCode], [messageAreaCode])
REFERENCES [dbo].[MessageArea] ([applicationCode], [messageAreaCode])
NOT FOR REPLICATION
GO

ALTER TABLE [dbo].[FixedMessageArea] CHECK CONSTRAINT [FK_FixedMessageArea_MessageArea]
GO
ALTER TABLE [dbo].[FixedMessageArea]  WITH NOCHECK ADD  CONSTRAINT [FK_FixedMessageArea_PageLayout] FOREIGN KEY([applicationCode], [pageLayoutCode])
REFERENCES [dbo].[PageLayout] ([applicationCode], [pageLayoutCode])
NOT FOR REPLICATION
GO

ALTER TABLE [dbo].[FixedMessageArea] CHECK CONSTRAINT [FK_FixedMessageArea_PageLayout]
GO
ALTER TABLE [dbo].[FixedMessageArea] ADD  CONSTRAINT [MSrepl_tran_version_default_F37B8E90_12C2_46B1_AED3_8C135E9E6103_277576027]  DEFAULT (newid()) FOR [msrepl_tran_version]