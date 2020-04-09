USE [COMMMSG]
GO
/****** Object:  User [demoadminuser]    Script Date: 08/04/2020 11:44:51 ******/
CREATE USER [demoadminuser] FOR LOGIN [demoadminuser] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [demodevuser]    Script Date: 08/04/2020 11:44:51 ******/
CREATE USER [demodevuser] FOR LOGIN [demodevuser] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [FrameworkApplication]    Script Date: 08/04/2020 11:44:51 ******/
CREATE USER [FrameworkApplication] FOR LOGIN [FrameworkApplication] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [OPERATIONS\tsnowden2]    Script Date: 08/04/2020 11:44:51 ******/
CREATE USER [OPERATIONS\tsnowden2] FOR LOGIN [OPERATIONS\tsnowden2] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [SERVICES\Abhishek.Sahu]    Script Date: 08/04/2020 11:44:51 ******/
CREATE USER [SERVICES\Abhishek.Sahu] FOR LOGIN [SERVICES\Abhishek.Sahu] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [SERVICES\Vikas.Semra1]    Script Date: 08/04/2020 11:44:51 ******/
CREATE USER [SERVICES\Vikas.Semra1] FOR LOGIN [SERVICES\Vikas.Semra1] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_datareader] ADD MEMBER [demoadminuser]
GO
ALTER ROLE [db_datawriter] ADD MEMBER [demoadminuser]
GO
ALTER ROLE [db_datareader] ADD MEMBER [demodevuser]
GO
ALTER ROLE [db_datawriter] ADD MEMBER [demodevuser]
GO
ALTER ROLE [db_datareader] ADD MEMBER [FrameworkApplication]
GO
ALTER ROLE [db_datawriter] ADD MEMBER [FrameworkApplication]
GO
ALTER ROLE [db_datareader] ADD MEMBER [OPERATIONS\tsnowden2]
GO
ALTER ROLE [db_datawriter] ADD MEMBER [OPERATIONS\tsnowden2]
GO
ALTER ROLE [db_datareader] ADD MEMBER [SERVICES\Abhishek.Sahu]
GO
ALTER ROLE [db_datawriter] ADD MEMBER [SERVICES\Abhishek.Sahu]
GO
ALTER ROLE [db_datareader] ADD MEMBER [SERVICES\Vikas.Semra1]
GO
ALTER ROLE [db_datawriter] ADD MEMBER [SERVICES\Vikas.Semra1]
GO
/****** Object:  Table [dbo].[ErrorLog]    Script Date: 08/04/2020 11:44:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ErrorLog](
	[errorId] [uniqueidentifier] NOT NULL,
	[tsCreated] [datetime] NOT NULL,
	[userId] [varchar](100) NOT NULL,
	[application] [varchar](100) NOT NULL,
	[errorText] [varchar](max) NULL,
	[msrepl_tran_version] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_ErrorLog] PRIMARY KEY NONCLUSTERED 
(
	[errorId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FixedMessageArea]    Script Date: 08/04/2020 11:44:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
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
/****** Object:  Table [dbo].[Image]    Script Date: 08/04/2020 11:44:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Image](
	[clientCode] [varchar](15) NOT NULL,
	[imageCode] [varchar](100) NOT NULL,
	[imageId] [uniqueidentifier] NOT NULL,
	[tsCreated] [datetime] NOT NULL,
	[tsLastUsed] [datetime] NULL,
	[imageDescription] [varchar](100) NULL,
	[sourceFileName] [varchar](500) NOT NULL,
	[categoryId] [uniqueidentifier] NOT NULL,
	[imageFormat] [varchar](20) NOT NULL,
	[resolution] [money] NOT NULL,
	[imageWidth] [money] NOT NULL,
	[imageHeight] [money] NOT NULL,
	[thumbnailBytes] [varbinary](max) NULL,
	[imageBytes] [varbinary](max) NULL,
	[imageBytesGrayscale] [varbinary](max) NULL,
	[msrepl_tran_version] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_MessageImage] PRIMARY KEY CLUSTERED 
(
	[clientCode] ASC,
	[imageCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ImageCategory]    Script Date: 08/04/2020 11:44:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ImageCategory](
	[clientCode] [varchar](15) NOT NULL,
	[categoryId] [uniqueidentifier] NOT NULL,
	[categoryDescription] [varchar](100) NOT NULL,
	[tsCreated] [datetime] NOT NULL,
	[msrepl_tran_version] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_MessageCategory] PRIMARY KEY CLUSTERED 
(
	[categoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ImageUsedBy]    Script Date: 08/04/2020 11:44:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ImageUsedBy](
	[imageId] [uniqueidentifier] NOT NULL,
	[objectId] [uniqueidentifier] NOT NULL,
	[objectType] [char](1) NOT NULL,
	[msrepl_tran_version] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_ImageUsedBy_1] PRIMARY KEY CLUSTERED 
(
	[imageId] ASC,
	[objectId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LetterApplication]    Script Date: 08/04/2020 11:44:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
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
/****** Object:  Table [dbo].[LetterTemplate]    Script Date: 08/04/2020 11:44:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
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
/****** Object:  Table [dbo].[LetterTemplate#TextBlock]    Script Date: 08/04/2020 11:44:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
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
/****** Object:  Table [dbo].[LetterVariable]    Script Date: 08/04/2020 11:44:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
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
/****** Object:  Table [dbo].[LetterVariable#TextBlock]    Script Date: 08/04/2020 11:44:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
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
/****** Object:  Table [dbo].[Message]    Script Date: 08/04/2020 11:44:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
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
/****** Object:  Table [dbo].[MessageActivityLog]    Script Date: 08/04/2020 11:44:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MessageActivityLog](
	[clientCode] [varchar](15) NOT NULL,
	[itemCode] [varchar](100) NOT NULL,
	[tsActivity] [datetime] NOT NULL,
	[activityId] [uniqueidentifier] NOT NULL,
	[IPaddress] [varchar](20) NOT NULL,
	[isError] [char](1) NOT NULL,
	[userName] [varchar](100) NOT NULL,
	[summary] [varchar](6000) NOT NULL,
	[detail] [nvarchar](max) NOT NULL,
	[msrepl_tran_version] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_MessageActivityLog] PRIMARY KEY NONCLUSTERED 
(
	[activityId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MessageApplication]    Script Date: 08/04/2020 11:44:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
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
/****** Object:  Table [dbo].[MessageArea]    Script Date: 08/04/2020 11:44:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MessageArea](
	[applicationCode] [varchar](20) NOT NULL,
	[messageAreaCode] [varchar](20) NOT NULL,
	[tsCreated] [datetime] NOT NULL,
	[messageAreaName] [varchar](100) NOT NULL,
	[width] [money] NOT NULL,
	[maxHeight] [money] NOT NULL,
	[multipleMessageHandlingCode] [char](1) NOT NULL,
	[messageSpacing] [money] NOT NULL,
	[msrepl_tran_version] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_MessageArea] PRIMARY KEY CLUSTERED 
(
	[applicationCode] ASC,
	[messageAreaCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MessageValidFor]    Script Date: 08/04/2020 11:44:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MessageValidFor](
	[applicationCode] [varchar](20) NOT NULL,
	[messageAreaCode] [varchar](20) NOT NULL,
	[messageId] [uniqueidentifier] NOT NULL,
	[msrepl_tran_version] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_MessageValidFor] PRIMARY KEY CLUSTERED 
(
	[applicationCode] ASC,
	[messageAreaCode] ASC,
	[messageId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MessageVersion]    Script Date: 08/04/2020 11:44:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MessageVersion](
	[clientCode] [varchar](15) NOT NULL,
	[messageCode] [varchar](100) NOT NULL,
	[messageId] [uniqueidentifier] NOT NULL,
	[messageVersionId] [uniqueidentifier] NOT NULL,
	[tsCreated] [datetime] NOT NULL,
	[contentType] [varchar](4) NOT NULL,
	[tsApproved] [datetime] NOT NULL,
	[tsApprovedOSG] [datetime] NULL,
	[messageDescription] [varchar](100) NOT NULL,
	[messageWidth] [money] NOT NULL,
	[messageHeight] [money] NOT NULL,
	[thumbnailBytes] [varbinary](max) NULL,
	[imageBytes] [varbinary](max) NULL,
	[htmlContent] [nvarchar](max) NULL,
	[pdfContent] [varbinary](max) NULL,
	[msrepl_tran_version] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_MessageHistory] PRIMARY KEY NONCLUSTERED 
(
	[messageVersionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PageLayout]    Script Date: 08/04/2020 11:44:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PageLayout](
	[applicationCode] [varchar](20) NOT NULL,
	[pageLayoutCode] [varchar](20) NOT NULL,
	[tsCreated] [datetime] NOT NULL,
	[pageLayoutDescription] [varchar](100) NOT NULL,
	[thumbnailBytes] [varbinary](max) NULL,
	[pdfContent] [varbinary](max) NULL,
	[msrepl_tran_version] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_PageLayout] PRIMARY KEY CLUSTERED 
(
	[applicationCode] ASC,
	[pageLayoutCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TextBlock]    Script Date: 08/04/2020 11:44:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
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
ALTER TABLE [dbo].[ErrorLog] ADD  CONSTRAINT [DF_errorLog_errorId]  DEFAULT (newid()) FOR [errorId]
GO
ALTER TABLE [dbo].[ErrorLog] ADD  CONSTRAINT [DF_errorLog_tsCreated]  DEFAULT (getdate()) FOR [tsCreated]
GO
ALTER TABLE [dbo].[ErrorLog] ADD  CONSTRAINT [DF_errorLog_userId]  DEFAULT ('') FOR [userId]
GO
ALTER TABLE [dbo].[ErrorLog] ADD  CONSTRAINT [DF_errorLog_application]  DEFAULT ('') FOR [application]
GO
ALTER TABLE [dbo].[ErrorLog] ADD  CONSTRAINT [MSrepl_tran_version_default_8D7C7544_EC7D_4E38_A5F2_4A1093E43F63_245575913]  DEFAULT (newid()) FOR [msrepl_tran_version]
GO
ALTER TABLE [dbo].[FixedMessageArea] ADD  CONSTRAINT [MSrepl_tran_version_default_F37B8E90_12C2_46B1_AED3_8C135E9E6103_277576027]  DEFAULT (newid()) FOR [msrepl_tran_version]
GO
ALTER TABLE [dbo].[Image] ADD  CONSTRAINT [DF_Image_imageId]  DEFAULT (newid()) FOR [imageId]
GO
ALTER TABLE [dbo].[Image] ADD  CONSTRAINT [DF_Image_tsCreated]  DEFAULT (getdate()) FOR [tsCreated]
GO
ALTER TABLE [dbo].[Image] ADD  CONSTRAINT [MSrepl_tran_version_default_63E8371D_1D9E_4116_B16C_BC99E5D0FCEA_309576141]  DEFAULT (newid()) FOR [msrepl_tran_version]
GO
ALTER TABLE [dbo].[ImageCategory] ADD  CONSTRAINT [DF_MessageCategory_categoryCode]  DEFAULT (newid()) FOR [categoryId]
GO
ALTER TABLE [dbo].[ImageCategory] ADD  CONSTRAINT [DF_ImageCategory_tsCreated]  DEFAULT (getdate()) FOR [tsCreated]
GO
ALTER TABLE [dbo].[ImageCategory] ADD  CONSTRAINT [MSrepl_tran_version_default_B4441F2B_C76E_4A92_A935_EF9642F9BD38_341576255]  DEFAULT (newid()) FOR [msrepl_tran_version]
GO
ALTER TABLE [dbo].[ImageUsedBy] ADD  CONSTRAINT [DF_ImageUsedBy_objectType]  DEFAULT ('M') FOR [objectType]
GO
ALTER TABLE [dbo].[ImageUsedBy] ADD  CONSTRAINT [MSrepl_tran_version_default_D1753573_7586_407A_8A10_9C95AFFEEF87_373576369]  DEFAULT (newid()) FOR [msrepl_tran_version]
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
ALTER TABLE [dbo].[LetterTemplate#TextBlock] ADD  CONSTRAINT [DF_LetterTemplate#TextBlock_letterTemplateTextBlockId]  DEFAULT (newid()) FOR [letterTemplateTextBlockId]
GO
ALTER TABLE [dbo].[LetterTemplate#TextBlock] ADD  CONSTRAINT [MSrepl_tran_version_default_F4E0281A_470C_469F_AE92_07FE06EA43AD_469576711]  DEFAULT (newid()) FOR [msrepl_tran_version]
GO
ALTER TABLE [dbo].[LetterVariable] ADD  CONSTRAINT [DF_LetterVariable_variableId]  DEFAULT (newid()) FOR [variableId]
GO
ALTER TABLE [dbo].[LetterVariable] ADD  CONSTRAINT [DF_LetterVariable_tsCreated]  DEFAULT (getdate()) FOR [tsCreated]
GO
ALTER TABLE [dbo].[LetterVariable] ADD  CONSTRAINT [DF_LetterVariable_GMCvariableName]  DEFAULT ('') FOR [GMCvariableName]
GO
ALTER TABLE [dbo].[LetterVariable] ADD  CONSTRAINT [MSrepl_tran_version_default_24B67603_EA49_46F2_8156_0F64DDC4B303_501576825]  DEFAULT (newid()) FOR [msrepl_tran_version]
GO
ALTER TABLE [dbo].[LetterVariable#TextBlock] ADD  CONSTRAINT [MSrepl_tran_version_default_BED05F8A_2ED7_4501_B05E_B99C091BE359_533576939]  DEFAULT (newid()) FOR [msrepl_tran_version]
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
ALTER TABLE [dbo].[MessageActivityLog] ADD  CONSTRAINT [DF_MessageActivityLog_tsActivity]  DEFAULT (getdate()) FOR [tsActivity]
GO
ALTER TABLE [dbo].[MessageActivityLog] ADD  CONSTRAINT [DF__MessageAc__activ__79FD19BE]  DEFAULT (newid()) FOR [activityId]
GO
ALTER TABLE [dbo].[MessageActivityLog] ADD  CONSTRAINT [DF_MessageActivityLog_isError]  DEFAULT ('N') FOR [isError]
GO
ALTER TABLE [dbo].[MessageActivityLog] ADD  CONSTRAINT [MSrepl_tran_version_default_C7A4E65D_4379_4841_84D0_3A9762A0F1CC_597577167]  DEFAULT (newid()) FOR [msrepl_tran_version]
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
GO
ALTER TABLE [dbo].[MessageArea] ADD  CONSTRAINT [DF_MessageArea_tsCreated]  DEFAULT (getdate()) FOR [tsCreated]
GO
ALTER TABLE [dbo].[MessageArea] ADD  CONSTRAINT [DF_MessageArea_mutlipleMessageHandlingCode]  DEFAULT ('2') FOR [multipleMessageHandlingCode]
GO
ALTER TABLE [dbo].[MessageArea] ADD  CONSTRAINT [DF_MessageArea_messageSpacing]  DEFAULT ((0.1)) FOR [messageSpacing]
GO
ALTER TABLE [dbo].[MessageArea] ADD  CONSTRAINT [MSrepl_tran_version_default_458292B5_27B2_487E_9C25_7F0015FAF44D_661577395]  DEFAULT (newid()) FOR [msrepl_tran_version]
GO
ALTER TABLE [dbo].[MessageValidFor] ADD  CONSTRAINT [DF_MessageValidFor_messageId]  DEFAULT (newid()) FOR [messageId]
GO
ALTER TABLE [dbo].[MessageValidFor] ADD  CONSTRAINT [MSrepl_tran_version_default_B943C3D9_B4D6_48CF_B3B8_C39B69F17028_693577509]  DEFAULT (newid()) FOR [msrepl_tran_version]
GO
ALTER TABLE [dbo].[MessageVersion] ADD  CONSTRAINT [DF_MessageVersion_messageVersionId]  DEFAULT (newid()) FOR [messageVersionId]
GO
ALTER TABLE [dbo].[MessageVersion] ADD  CONSTRAINT [DF_MessageVersion_tsCreated]  DEFAULT (getdate()) FOR [tsCreated]
GO
ALTER TABLE [dbo].[MessageVersion] ADD  CONSTRAINT [MSrepl_tran_version_default_0A063120_1A9C_43B2_9F08_8238E3F0D0A3_725577623]  DEFAULT (newid()) FOR [msrepl_tran_version]
GO
ALTER TABLE [dbo].[PageLayout] ADD  CONSTRAINT [DF_PageLayout_tsCreated]  DEFAULT (getdate()) FOR [tsCreated]
GO
ALTER TABLE [dbo].[PageLayout] ADD  CONSTRAINT [MSrepl_tran_version_default_F79D92FC_1DBA_4EFE_B8AB_D8B5104B2EF7_757577737]  DEFAULT (newid()) FOR [msrepl_tran_version]
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
ALTER TABLE [dbo].[Image]  WITH NOCHECK ADD  CONSTRAINT [FK_Image_ImageCategory] FOREIGN KEY([categoryId])
REFERENCES [dbo].[ImageCategory] ([categoryId])
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[Image] CHECK CONSTRAINT [FK_Image_ImageCategory]
GO
ALTER TABLE [dbo].[LetterTemplate]  WITH NOCHECK ADD  CONSTRAINT [FK_LetterTemplate_LetterApplication1] FOREIGN KEY([letterId])
REFERENCES [dbo].[LetterApplication] ([letterId])
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[LetterTemplate] CHECK CONSTRAINT [FK_LetterTemplate_LetterApplication1]
GO
ALTER TABLE [dbo].[LetterTemplate#TextBlock]  WITH NOCHECK ADD  CONSTRAINT [FK_LetterTemplate#TextBlock_LetterTemplate] FOREIGN KEY([templateId])
REFERENCES [dbo].[LetterTemplate] ([templateId])
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[LetterTemplate#TextBlock] CHECK CONSTRAINT [FK_LetterTemplate#TextBlock_LetterTemplate]
GO
ALTER TABLE [dbo].[LetterVariable]  WITH NOCHECK ADD  CONSTRAINT [FK_LetterVariable_LetterApplication] FOREIGN KEY([letterId])
REFERENCES [dbo].[LetterApplication] ([letterId])
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[LetterVariable] CHECK CONSTRAINT [FK_LetterVariable_LetterApplication]
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
ALTER TABLE [dbo].[MessageArea]  WITH NOCHECK ADD  CONSTRAINT [FK_MessageArea_MessageApplication] FOREIGN KEY([applicationCode])
REFERENCES [dbo].[MessageApplication] ([applicationCode])
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[MessageArea] CHECK CONSTRAINT [FK_MessageArea_MessageApplication]
GO
ALTER TABLE [dbo].[MessageValidFor]  WITH NOCHECK ADD  CONSTRAINT [FK_MessageValidFor_Message] FOREIGN KEY([messageId])
REFERENCES [dbo].[Message] ([messageId])
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[MessageValidFor] CHECK CONSTRAINT [FK_MessageValidFor_Message]
GO
ALTER TABLE [dbo].[MessageValidFor]  WITH NOCHECK ADD  CONSTRAINT [FK_MessageValidFor_MessageArea] FOREIGN KEY([applicationCode], [messageAreaCode])
REFERENCES [dbo].[MessageArea] ([applicationCode], [messageAreaCode])
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[MessageValidFor] CHECK CONSTRAINT [FK_MessageValidFor_MessageArea]
GO
ALTER TABLE [dbo].[PageLayout]  WITH NOCHECK ADD  CONSTRAINT [FK_PageLayout_MessageApplication] FOREIGN KEY([applicationCode])
REFERENCES [dbo].[MessageApplication] ([applicationCode])
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[PageLayout] CHECK CONSTRAINT [FK_PageLayout_MessageApplication]
GO
ALTER TABLE [dbo].[TextBlock]  WITH NOCHECK ADD  CONSTRAINT [FK_TextBlock_LetterApplication] FOREIGN KEY([letterId])
REFERENCES [dbo].[LetterApplication] ([letterId])
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[TextBlock] CHECK CONSTRAINT [FK_TextBlock_LetterApplication]
GO
ALTER TABLE [dbo].[LetterTemplate]  WITH NOCHECK ADD  CONSTRAINT [CK_TLetterTemplate_Draft_status] CHECK NOT FOR REPLICATION (([draft]='N' OR [draft]='Y'))
GO
ALTER TABLE [dbo].[LetterTemplate] CHECK CONSTRAINT [CK_TLetterTemplate_Draft_status]
GO
ALTER TABLE [dbo].[Message]  WITH NOCHECK ADD  CONSTRAINT [CK_Message_Draft_status] CHECK NOT FOR REPLICATION (([draft]='N' OR [draft]='Y'))
GO
ALTER TABLE [dbo].[Message] CHECK CONSTRAINT [CK_Message_Draft_status]
GO
ALTER TABLE [dbo].[TextBlock]  WITH NOCHECK ADD  CONSTRAINT [CK_TextBlock_Draft_status] CHECK NOT FOR REPLICATION (([draft]='N' OR [draft]='Y'))
GO
ALTER TABLE [dbo].[TextBlock] CHECK CONSTRAINT [CK_TextBlock_Draft_status]
GO
