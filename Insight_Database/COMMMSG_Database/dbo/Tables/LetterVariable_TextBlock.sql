CREATE TABLE [dbo].[LetterVariable#TextBlock](
	[variableId] [uniqueidentifier] NOT NULL,
	[textBlockId] [uniqueidentifier] NOT NULL,
	[msrepl_tran_version] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_LetterVariable#TextBlock] PRIMARY KEY CLUSTERED 
(
	[variableId] ASC,
	[textBlockId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[LetterVariable#TextBlock]  WITH NOCHECK ADD  CONSTRAINT [FK_LetterVariable#TextBlock_LetterVariable] FOREIGN KEY([variableId])
REFERENCES [dbo].[LetterVariable] ([variableId])
NOT FOR REPLICATION
GO

ALTER TABLE [dbo].[LetterVariable#TextBlock] CHECK CONSTRAINT [FK_LetterVariable#TextBlock_LetterVariable]
GO
ALTER TABLE [dbo].[LetterVariable#TextBlock]  WITH NOCHECK ADD  CONSTRAINT [FK_LetterVariable#TextBlock_TextBlock] FOREIGN KEY([textBlockId])
REFERENCES [dbo].[TextBlock] ([textBlockId])
NOT FOR REPLICATION
GO

ALTER TABLE [dbo].[LetterVariable#TextBlock] CHECK CONSTRAINT [FK_LetterVariable#TextBlock_TextBlock]
GO
ALTER TABLE [dbo].[LetterVariable#TextBlock] ADD  CONSTRAINT [MSrepl_tran_version_default_BED05F8A_2ED7_4501_B05E_B99C091BE359_533576939]  DEFAULT (newid()) FOR [msrepl_tran_version]