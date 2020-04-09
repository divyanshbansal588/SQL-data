CREATE TABLE [dbo].[LetterTemplate#TextBlock](
	[letterTemplateTextBlockId] [uniqueidentifier] NOT NULL,
	[textBlockCode] [varchar](100) NOT NULL,
	[templateId] [uniqueidentifier] NOT NULL,
	[seq] [tinyint] NOT NULL,
	[msrepl_tran_version] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_LetterTemplate#TextBlock] PRIMARY KEY CLUSTERED 
(
	[letterTemplateTextBlockId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[LetterTemplate#TextBlock]  WITH NOCHECK ADD  CONSTRAINT [FK_LetterTemplate#TextBlock_LetterTemplate] FOREIGN KEY([templateId])
REFERENCES [dbo].[LetterTemplate] ([templateId])
NOT FOR REPLICATION
GO

ALTER TABLE [dbo].[LetterTemplate#TextBlock] CHECK CONSTRAINT [FK_LetterTemplate#TextBlock_LetterTemplate]
GO
ALTER TABLE [dbo].[LetterTemplate#TextBlock] ADD  CONSTRAINT [DF_LetterTemplate#TextBlock_letterTemplateTextBlockId]  DEFAULT (newid()) FOR [letterTemplateTextBlockId]
GO
ALTER TABLE [dbo].[LetterTemplate#TextBlock] ADD  CONSTRAINT [MSrepl_tran_version_default_F4E0281A_470C_469F_AE92_07FE06EA43AD_469576711]  DEFAULT (newid()) FOR [msrepl_tran_version]