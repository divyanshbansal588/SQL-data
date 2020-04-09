CREATE TABLE [dbo].[TextBlock](
	[textBlockId] [uniqueidentifier] NOT NULL,
	[tsCreated] [datetime] NOT NULL,
	[letterId] [uniqueidentifier] NOT NULL,
	[textBlockCode] [varchar](50) NOT NULL,
	[draft] [char](1) NOT NULL,
	[textBlockName] [varchar](100) NOT NULL,
	[blockType] [char](1) NOT NULL,
	[approvalStatus] [varchar](4) NOT NULL,
	[tsApproved] [datetime] NULL,
	[approvedBy] [varchar](100) NOT NULL,
	[tsUpdated] [datetime] NOT NULL,
	[updatedBy] [varchar](100) NOT NULL,
	[notes] [varchar](2000) NOT NULL,
	[HTMLcontent] [nvarchar](max) NOT NULL,
	[HTMLcontentGMC] [nvarchar](max) NOT NULL,
	[imageBytes] [varbinary](max) NULL,
	[pdfContent] [varbinary](max) NULL,
	[msrepl_tran_version] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_TextBlock] PRIMARY KEY CLUSTERED 
(
	[textBlockId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[TextBlock]  WITH NOCHECK ADD  CONSTRAINT [FK_TextBlock_LetterApplication] FOREIGN KEY([letterId])
REFERENCES [dbo].[LetterApplication] ([letterId])
NOT FOR REPLICATION
GO

ALTER TABLE [dbo].[TextBlock] CHECK CONSTRAINT [FK_TextBlock_LetterApplication]
GO
ALTER TABLE [dbo].[TextBlock] ADD  CONSTRAINT [DF_LetterParagraph_paragraphId]  DEFAULT (newid()) FOR [textBlockId]
GO
ALTER TABLE [dbo].[TextBlock] ADD  CONSTRAINT [DF_TextBlock_tsCreated]  DEFAULT (getdate()) FOR [tsCreated]
GO
ALTER TABLE [dbo].[TextBlock] ADD  CONSTRAINT [DF_TextBlock_textBlockCode]  DEFAULT ('') FOR [textBlockCode]
GO
ALTER TABLE [dbo].[TextBlock] ADD  CONSTRAINT [DF_TextBlock_pending]  DEFAULT ('Y') FOR [draft]
GO
ALTER TABLE [dbo].[TextBlock] ADD  CONSTRAINT [DF_TextBlock_blockTyoe]  DEFAULT ('V') FOR [blockType]
GO
ALTER TABLE [dbo].[TextBlock] ADD  CONSTRAINT [DF_LetterParagraph_approvalStatus]  DEFAULT ('PNDG') FOR [approvalStatus]
GO
ALTER TABLE [dbo].[TextBlock] ADD  CONSTRAINT [DF_TextBlock_approvedBy]  DEFAULT ('') FOR [approvedBy]
GO
ALTER TABLE [dbo].[TextBlock] ADD  CONSTRAINT [DF_TextBlock_tsUpdated]  DEFAULT (getdate()) FOR [tsUpdated]
GO
ALTER TABLE [dbo].[TextBlock] ADD  CONSTRAINT [DF_TextBlock_updatedBy]  DEFAULT ('') FOR [updatedBy]
GO
ALTER TABLE [dbo].[TextBlock] ADD  CONSTRAINT [DF_TextBlock_notes]  DEFAULT ('') FOR [notes]
GO
ALTER TABLE [dbo].[TextBlock] ADD  CONSTRAINT [DF_LetterParagraph_HTMLcontentGMC]  DEFAULT ('') FOR [HTMLcontentGMC]
GO
ALTER TABLE [dbo].[TextBlock] ADD  CONSTRAINT [MSrepl_tran_version_default_817CDBAB_A512_4BEE_B52F_3B22F305B11E_789577851]  DEFAULT (newid()) FOR [msrepl_tran_version]
GO
ALTER TABLE [dbo].[TextBlock]  WITH NOCHECK ADD  CONSTRAINT [CK_TextBlock_Draft_status] CHECK NOT FOR REPLICATION (([draft]='N' OR [draft]='Y'))
GO

ALTER TABLE [dbo].[TextBlock] CHECK CONSTRAINT [CK_TextBlock_Draft_status]