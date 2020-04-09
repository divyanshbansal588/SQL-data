CREATE TABLE [dbo].[MessageApplication](
	[clientCode] [varchar](15) NOT NULL,
	[applicationCode] [varchar](20) NOT NULL,
	[tsCreated] [datetime] NOT NULL,
	[printOrWeb] [varchar](4) NOT NULL,
	[applicationName] [varchar](100) NOT NULL,
	[colorMode] [char](1) NOT NULL,
	[validFonts] [varchar](max) NOT NULL,
	[validColors] [varchar](max) NOT NULL,
	[validColorsBackground] [varchar](max) NOT NULL,
	[defaultFontName] [varchar](50) NOT NULL,
	[defaultFontSize] [money] NOT NULL,
	[msrepl_tran_version] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_MessageApplication] PRIMARY KEY CLUSTERED 
(
	[applicationCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[MessageApplication] ADD  CONSTRAINT [DF_MessageApplication_tsCreated]  DEFAULT (getdate()) FOR [tsCreated]
GO
ALTER TABLE [dbo].[MessageApplication] ADD  CONSTRAINT [DF_MessageApplication_printOrWeb]  DEFAULT ('P') FOR [printOrWeb]
GO
ALTER TABLE [dbo].[MessageApplication] ADD  CONSTRAINT [DF_MessageApplication_colorMode]  DEFAULT ('F') FOR [colorMode]
GO
ALTER TABLE [dbo].[MessageApplication] ADD  CONSTRAINT [DF_MessageApplication_validFonts]  DEFAULT ('Arial') FOR [validFonts]
GO
ALTER TABLE [dbo].[MessageApplication] ADD  CONSTRAINT [DF_MessageApplication_validColors]  DEFAULT ('') FOR [validColors]
GO
ALTER TABLE [dbo].[MessageApplication] ADD  CONSTRAINT [DF_MessageApplication_validColorsBackground]  DEFAULT ('') FOR [validColorsBackground]
GO
ALTER TABLE [dbo].[MessageApplication] ADD  CONSTRAINT [DF_MessageApplication_defaultFontName]  DEFAULT ('Arial') FOR [defaultFontName]
GO
ALTER TABLE [dbo].[MessageApplication] ADD  CONSTRAINT [DF_MessageApplication_defaultFontSize]  DEFAULT ((13)) FOR [defaultFontSize]
GO
ALTER TABLE [dbo].[MessageApplication] ADD  CONSTRAINT [MSrepl_tran_version_default_7252FE85_2D88_4EF0_B046_752A793CC83A_629577281]  DEFAULT (newid()) FOR [msrepl_tran_version]