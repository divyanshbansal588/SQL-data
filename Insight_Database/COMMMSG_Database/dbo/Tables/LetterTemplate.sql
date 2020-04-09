CREATE TABLE [dbo].[LetterTemplate](
	[templateId] [uniqueidentifier] NOT NULL,
	[tsCreated] [datetime] NOT NULL,
	[templateCode] [varchar](50) NOT NULL,
	[draft] [char](1) NOT NULL,
	[approvalStatus] [varchar](4) NOT NULL,
	[tsApproved] [datetime] NULL,
	[approvedBy] [varchar](100) NOT NULL,
	[letterId] [uniqueidentifier] NOT NULL,
	[templateName] [varchar](100) NOT NULL,
	[tsUpdated] [datetime] NOT NULL,
	[updatedBy] [varchar](100) NOT NULL,
	[notes] [varchar](2000) NOT NULL,
	[msrepl_tran_version] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_LetterTemplate_1] PRIMARY KEY CLUSTERED 
(
	[templateId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[LetterTemplate]  WITH NOCHECK ADD  CONSTRAINT [FK_LetterTemplate_LetterApplication1] FOREIGN KEY([letterId])
REFERENCES [dbo].[LetterApplication] ([letterId])
NOT FOR REPLICATION
GO

ALTER TABLE [dbo].[LetterTemplate] CHECK CONSTRAINT [FK_LetterTemplate_LetterApplication1]
GO
ALTER TABLE [dbo].[LetterTemplate] ADD  CONSTRAINT [DF_LetterTemplate_templateId]  DEFAULT (newid()) FOR [templateId]
GO
ALTER TABLE [dbo].[LetterTemplate] ADD  CONSTRAINT [DF_LetterTemplate_tsCreated]  DEFAULT (getdate()) FOR [tsCreated]
GO
ALTER TABLE [dbo].[LetterTemplate] ADD  CONSTRAINT [DF_LetterTemplate_templateCode]  DEFAULT ('') FOR [templateCode]
GO
ALTER TABLE [dbo].[LetterTemplate] ADD  CONSTRAINT [DF_LetterTemplate_pending]  DEFAULT ('Y') FOR [draft]
GO
ALTER TABLE [dbo].[LetterTemplate] ADD  CONSTRAINT [DF_LetterTemplate_approvalStatus]  DEFAULT ('EDIT') FOR [approvalStatus]
GO
ALTER TABLE [dbo].[LetterTemplate] ADD  CONSTRAINT [DF_LetterTemplate_approvedBy]  DEFAULT ('') FOR [approvedBy]
GO
ALTER TABLE [dbo].[LetterTemplate] ADD  CONSTRAINT [DF_LetterTemplate_tsUpdated]  DEFAULT (getdate()) FOR [tsUpdated]
GO
ALTER TABLE [dbo].[LetterTemplate] ADD  CONSTRAINT [DF_LetterTemplate_updatedBy]  DEFAULT ('') FOR [updatedBy]
GO
ALTER TABLE [dbo].[LetterTemplate] ADD  CONSTRAINT [DF_LetterTemplate_notes]  DEFAULT ('') FOR [notes]
GO
ALTER TABLE [dbo].[LetterTemplate] ADD  CONSTRAINT [MSrepl_tran_version_default_89DC0DCF_29C9_4B1C_8FAE_8C97AA82EE96_437576597]  DEFAULT (newid()) FOR [msrepl_tran_version]
GO
ALTER TABLE [dbo].[LetterTemplate]  WITH NOCHECK ADD  CONSTRAINT [CK_TLetterTemplate_Draft_status] CHECK NOT FOR REPLICATION (([draft]='N' OR [draft]='Y'))
GO

ALTER TABLE [dbo].[LetterTemplate] CHECK CONSTRAINT [CK_TLetterTemplate_Draft_status]