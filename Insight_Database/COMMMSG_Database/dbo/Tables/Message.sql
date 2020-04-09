CREATE TABLE [dbo].[Message](
	[clientCode] [varchar](15) NOT NULL,
	[messageCode] [varchar](20) NOT NULL,
	[draft] [char](1) NOT NULL,
	[messageId] [uniqueidentifier] NOT NULL,
	[tsCreated] [datetime] NOT NULL,
	[tsLastUsed] [datetime] NULL,
	[contentType] [varchar](4) NOT NULL,
	[messageDescription] [varchar](100) NOT NULL,
	[messageWidth] [money] NOT NULL,
	[messageHeight] [money] NOT NULL,
	[thumbnailBytes] [varbinary](max) NULL,
	[imageBytes] [varbinary](max) NULL,
	[htmlContent] [nvarchar](max) NULL,
	[pdfContent] [varbinary](max) NULL,
	[approvalStatus] [varchar](4) NOT NULL,
	[tsUpdated] [datetime] NOT NULL,
	[updatedBy] [varchar](100) NOT NULL,
	[tsApproved] [datetime] NULL,
	[approvedBy] [varchar](100) NOT NULL,
	[tsApprovedOSG] [datetime] NULL,
	[approvedByOSG] [varchar](100) NOT NULL,
	[notes] [varchar](2000) NOT NULL,
	[msrepl_tran_version] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_Message] PRIMARY KEY NONCLUSTERED 
(
	[messageId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[Message] ADD  CONSTRAINT [DF_Message_pending]  DEFAULT ('Y') FOR [draft]
GO
ALTER TABLE [dbo].[Message] ADD  CONSTRAINT [DF_Message_messageId]  DEFAULT (newid()) FOR [messageId]
GO
ALTER TABLE [dbo].[Message] ADD  CONSTRAINT [DF_Message_tsCreated]  DEFAULT (getdate()) FOR [tsCreated]
GO
ALTER TABLE [dbo].[Message] ADD  CONSTRAINT [DF_Message_contentType]  DEFAULT ('') FOR [contentType]
GO
ALTER TABLE [dbo].[Message] ADD  CONSTRAINT [DF_Message_approvalSTatus]  DEFAULT ('EDIT') FOR [approvalStatus]
GO
ALTER TABLE [dbo].[Message] ADD  CONSTRAINT [DF_Message_tsUpdated]  DEFAULT (getdate()) FOR [tsUpdated]
GO
ALTER TABLE [dbo].[Message] ADD  CONSTRAINT [DF_Message_edittedByUser]  DEFAULT ('') FOR [updatedBy]
GO
ALTER TABLE [dbo].[Message] ADD  CONSTRAINT [DF_Message_approvedByClient]  DEFAULT ('') FOR [approvedBy]
GO
ALTER TABLE [dbo].[Message] ADD  CONSTRAINT [DF_Message_approvedByOSG]  DEFAULT ('') FOR [approvedByOSG]
GO
ALTER TABLE [dbo].[Message] ADD  CONSTRAINT [DF_Message_notes]  DEFAULT ('') FOR [notes]
GO
ALTER TABLE [dbo].[Message] ADD  CONSTRAINT [MSrepl_tran_version_default_85D99C53_D0ED_4C8F_96DC_F5D20CCEC71F_565577053]  DEFAULT (newid()) FOR [msrepl_tran_version]
GO
ALTER TABLE [dbo].[Message]  WITH NOCHECK ADD  CONSTRAINT [CK_Message_Draft_status] CHECK NOT FOR REPLICATION (([draft]='N' OR [draft]='Y'))
GO

ALTER TABLE [dbo].[Message] CHECK CONSTRAINT [CK_Message_Draft_status]