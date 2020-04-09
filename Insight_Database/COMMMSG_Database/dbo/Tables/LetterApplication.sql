CREATE TABLE [dbo].[LetterApplication](
	[letterId] [uniqueidentifier] NOT NULL,
	[tsCreated] [datetime] NOT NULL,
	[clientCode] [varchar](15) NOT NULL,
	[letterCode] [varchar](50) NOT NULL,
	[letterName] [varchar](100) NOT NULL,
	[colorMode] [char](1) NOT NULL,
	[width] [money] NOT NULL,
	[formatCode] [varchar](4) NOT NULL,
	[validColors] [varchar](max) NOT NULL,
	[validColorsBackground] [varchar](max) NOT NULL,
	[validFonts] [varchar](max) NOT NULL,
	[backgroundPDFfirstPage] [varbinary](max) NULL,
	[backgroundPDFoverflowPages] [varbinary](max) NULL,
	[backerPDF] [varbinary](max) NULL,
	[msrepl_tran_version] [uniqueidentifier] NOT NULL,
	[contentX] [money] NOT NULL,
	[contentY] [money] NOT NULL,
 CONSTRAINT [PK_LetterApplication] PRIMARY KEY CLUSTERED 
(
	[letterId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[LetterApplication] ADD  CONSTRAINT [DF_LetterApplication_letterId]  DEFAULT (newid()) FOR [letterId]
GO
ALTER TABLE [dbo].[LetterApplication] ADD  CONSTRAINT [DF_LetterApplication_tsCreated]  DEFAULT (getdate()) FOR [tsCreated]
GO
ALTER TABLE [dbo].[LetterApplication] ADD  CONSTRAINT [DF_LetterApplication_colorMode]  DEFAULT ('F') FOR [colorMode]
GO
ALTER TABLE [dbo].[LetterApplication] ADD  CONSTRAINT [DF_LetterApplication_width]  DEFAULT ((7.5)) FOR [width]
GO
ALTER TABLE [dbo].[LetterApplication] ADD  CONSTRAINT [DF_LetterApplication_formatCOde]  DEFAULT ('STD1') FOR [formatCode]
GO
ALTER TABLE [dbo].[LetterApplication] ADD  CONSTRAINT [DF_LetterApplication_validColors]  DEFAULT ('') FOR [validColors]
GO
ALTER TABLE [dbo].[LetterApplication] ADD  CONSTRAINT [DF_LetterApplication_validColorsBackground]  DEFAULT ('') FOR [validColorsBackground]
GO
ALTER TABLE [dbo].[LetterApplication] ADD  CONSTRAINT [DF_LetterApplication_validFonts]  DEFAULT ('Arial') FOR [validFonts]
GO
ALTER TABLE [dbo].[LetterApplication] ADD  CONSTRAINT [MSrepl_tran_version_default_D632839F_55D4_41AF_9E2A_BAB71A322E8B_405576483]  DEFAULT (newid()) FOR [msrepl_tran_version]
GO
ALTER TABLE [dbo].[LetterApplication] ADD  CONSTRAINT [DF_LetterApplication_contentX]  DEFAULT ((0)) FOR [contentX]
GO
ALTER TABLE [dbo].[LetterApplication] ADD  CONSTRAINT [DF_LetterApplication_contentY]  DEFAULT ((0)) FOR [contentY]