CREATE TABLE [dbo].[LetterVariable](
	[variableId] [uniqueidentifier] NOT NULL,
	[tsCreated] [datetime] NOT NULL,
	[letterId] [uniqueidentifier] NOT NULL,
	[variableName] [varchar](50) NOT NULL,
	[GMCvariableName] [varchar](500) NOT NULL,
	[sampleValue] [varchar](100) NOT NULL,
	[msrepl_tran_version] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_LetterVariable] PRIMARY KEY CLUSTERED 
(
	[variableId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[LetterVariable]  WITH NOCHECK ADD  CONSTRAINT [FK_LetterVariable_LetterApplication] FOREIGN KEY([letterId])
REFERENCES [dbo].[LetterApplication] ([letterId])
NOT FOR REPLICATION
GO

ALTER TABLE [dbo].[LetterVariable] CHECK CONSTRAINT [FK_LetterVariable_LetterApplication]
GO
ALTER TABLE [dbo].[LetterVariable] ADD  CONSTRAINT [DF_LetterVariable_variableId]  DEFAULT (newid()) FOR [variableId]
GO
ALTER TABLE [dbo].[LetterVariable] ADD  CONSTRAINT [DF_LetterVariable_tsCreated]  DEFAULT (getdate()) FOR [tsCreated]
GO
ALTER TABLE [dbo].[LetterVariable] ADD  CONSTRAINT [DF_LetterVariable_GMCvariableName]  DEFAULT ('') FOR [GMCvariableName]
GO
ALTER TABLE [dbo].[LetterVariable] ADD  CONSTRAINT [MSrepl_tran_version_default_24B67603_EA49_46F2_8156_0F64DDC4B303_501576825]  DEFAULT (newid()) FOR [msrepl_tran_version]