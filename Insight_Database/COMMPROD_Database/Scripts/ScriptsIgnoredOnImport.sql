USE [COMMPROD]
GO
/****** Object:  User [demoadminuser]    Script Date: 08/04/2020 11:45:47 ******/
CREATE USER [demoadminuser] FOR LOGIN [demoadminuser] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [demodevuser]    Script Date: 08/04/2020 11:45:47 ******/
CREATE USER [demodevuser] FOR LOGIN [demodevuser] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [FrameworkApplication]    Script Date: 08/04/2020 11:45:47 ******/
CREATE USER [FrameworkApplication] FOR LOGIN [FrameworkApplication] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [OPERATIONS\tsnowden2]    Script Date: 08/04/2020 11:45:47 ******/
CREATE USER [OPERATIONS\tsnowden2] FOR LOGIN [OPERATIONS\tsnowden2] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [SERVICES\Abhishek.Sahu]    Script Date: 08/04/2020 11:45:47 ******/
CREATE USER [SERVICES\Abhishek.Sahu] FOR LOGIN [SERVICES\Abhishek.Sahu] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [SERVICES\Vikas.Semra1]    Script Date: 08/04/2020 11:45:47 ******/
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
/****** Object:  Table [dbo].[AuthorizedClientFunction]    Script Date: 08/04/2020 11:45:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AuthorizedClientFunction](
	[functionCode] [varchar](15) NOT NULL,
	[uid] [varchar](50) NOT NULL,
 CONSTRAINT [pkAuthClientFunction] PRIMARY KEY CLUSTERED 
(
	[uid] ASC,
	[functionCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Client]    Script Date: 08/04/2020 11:45:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Client](
	[clientCode] [varchar](15) NOT NULL,
	[name] [varchar](100) NOT NULL,
	[tsCreated] [datetime] NOT NULL,
	[transmitStatus] [char](1) NOT NULL,
	[ipFilter] [varchar](500) NOT NULL,
	[active] [char](1) NOT NULL,
	[varianceThreshold] [int] NOT NULL,
 CONSTRAINT [PK_Client] PRIMARY KEY CLUSTERED 
(
	[clientCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ClientActivityLog]    Script Date: 08/04/2020 11:45:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ClientActivityLog](
	[clientCode] [varchar](15) NOT NULL,
	[category] [varchar](100) NOT NULL,
	[tsActivity] [datetime] NOT NULL,
	[activityId] [uniqueidentifier] NOT NULL,
	[IPaddress] [varchar](20) NOT NULL,
	[isError] [char](1) NOT NULL,
	[userName] [varchar](100) NOT NULL,
	[summary] [varchar](6000) NOT NULL,
	[detail] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_ActivityLog] PRIMARY KEY NONCLUSTERED 
(
	[activityId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ClientFunction]    Script Date: 08/04/2020 11:45:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ClientFunction](
	[userId] [varchar](50) NOT NULL,
	[tsUpdated] [datetime] NOT NULL,
	[code] [varchar](15) NOT NULL,
	[description] [varchar](255) NOT NULL,
	[applicationCode] [char](1) NOT NULL,
	[groupName] [varchar](15) NOT NULL,
 CONSTRAINT [pkClientFunction] PRIMARY KEY CLUSTERED 
(
	[code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CountAdjustment]    Script Date: 08/04/2020 11:45:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CountAdjustment](
	[ticketNumber] [varchar](8) NOT NULL,
	[fileNumber] [int] NOT NULL,
	[processingType] [varchar](4) NOT NULL,
	[tsCreated] [datetime] NOT NULL,
	[changeInStatementCount] [int] NOT NULL,
	[changeInPageCount] [int] NOT NULL,
	[reason] [varchar](500) NOT NULL,
 CONSTRAINT [pkCountAdjustment] PRIMARY KEY CLUSTERED 
(
	[ticketNumber] ASC,
	[fileNumber] ASC,
	[processingType] ASC,
	[tsCreated] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DataFile]    Script Date: 08/04/2020 11:45:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DataFile](
	[ticketNumber] [varchar](8) NOT NULL,
	[fileNumber] [int] NOT NULL,
	[clientCode] [varchar](15) NOT NULL,
	[tsCreated] [datetime] NOT NULL,
	[dataFileId] [uniqueidentifier] NOT NULL,
	[fileName] [varchar](255) NOT NULL,
	[processingStage] [varchar](4) NOT NULL,
	[processingStatus] [varchar](4) NOT NULL,
	[optionName] [varchar](15) NOT NULL,
	[statementCount] [int] NOT NULL,
	[pageCount] [int] NOT NULL,
	[qcStatementCount] [int] NOT NULL,
	[qcPageCount] [int] NOT NULL,
	[releaseStatus] [char](1) NOT NULL,
	[fileSize] [bigint] NOT NULL,
	[insert1] [varchar](8) NOT NULL,
	[insert2] [varchar](8) NOT NULL,
	[insert3] [varchar](8) NOT NULL,
	[tsProcessingStarted] [datetime] NULL,
	[tsProcessingEnded] [datetime] NULL,
	[processedOn] [varchar](50) NOT NULL,
	[tsProcessingStarted2] [datetime] NULL,
	[tsProcessingEnded2] [datetime] NULL,
	[processedOn2] [varchar](50) NOT NULL,
 CONSTRAINT [PK_DataFile] PRIMARY KEY CLUSTERED 
(
	[ticketNumber] ASC,
	[fileNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EmailBin]    Script Date: 08/04/2020 11:45:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EmailBin](
	[emailId] [uniqueidentifier] NOT NULL,
	[tsCreated] [datetime] NOT NULL,
	[userId] [varchar](50) NOT NULL,
	[recipients] [varchar](500) NOT NULL,
	[subject] [varchar](255) NOT NULL,
	[body] [varchar](5000) NOT NULL,
 CONSTRAINT [PK_EmailBin] PRIMARY KEY NONCLUSTERED 
(
	[emailId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GMCJob]    Script Date: 08/04/2020 11:45:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GMCJob](
	[tsCreated] [datetime] NOT NULL,
	[ticketNumber] [varchar](8) NOT NULL,
	[fileNumber] [int] NOT NULL,
	[sequenceNumber] [int] NOT NULL,
	[GMCClientCode] [varchar](15) NOT NULL,
	[letterCode] [varchar](50) NOT NULL,
	[status] [varchar](4) NOT NULL,
	[WFDmode] [varchar](4) NOT NULL,
	[tsProcessingStarted] [datetime] NULL,
	[tsProcessingEnded] [datetime] NULL,
	[inputFileName] [varchar](200) NOT NULL,
	[DOCUfileName] [varchar](200) NOT NULL,
	[WFDFile] [varchar](100) NOT NULL,
	[JOBFile] [varchar](100) NOT NULL,
	[outputFileNamePDF] [varchar](100) NOT NULL,
	[outputFileNameDOCINFO] [varchar](100) NOT NULL,
	[UDF1] [varchar](100) NOT NULL,
	[UDF2] [varchar](100) NOT NULL,
	[UDF3] [varchar](100) NOT NULL,
	[UDF4] [varchar](100) NOT NULL,
	[UDF5] [varchar](100) NOT NULL,
	[openMinutes] [money] NOT NULL,
	[preprocessMinutes] [money] NOT NULL,
	[jobMinutes] [money] NOT NULL,
	[pagesProcessed] [int] NOT NULL,
	[pagesPerMinute] [int] NOT NULL,
	[tempFileSize] [int] NOT NULL,
	[endlessLoopLimit] [int] NOT NULL,
 CONSTRAINT [PK_GMCJob] PRIMARY KEY CLUSTERED 
(
	[ticketNumber] ASC,
	[fileNumber] ASC,
	[sequenceNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[InserterOutputGroup]    Script Date: 08/04/2020 11:45:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[InserterOutputGroup](
	[tsCreated] [datetime] NOT NULL,
	[ticketNumber] [varchar](8) NOT NULL,
	[fileNumber] [int] NOT NULL,
	[setupCode] [varchar](8) NOT NULL,
	[printerOutputGroupId] [uniqueidentifier] NOT NULL,
	[statementCount] [int] NOT NULL,
	[pageCount] [int] NOT NULL,
	[inserterOutputGroupId] [uniqueidentifier] NOT NULL,
	[outerEnvelopeSize] [varchar](15) NOT NULL,
 CONSTRAINT [PK_InserterOutputGroup] PRIMARY KEY CLUSTERED 
(
	[ticketNumber] ASC,
	[fileNumber] ASC,
	[setupCode] ASC,
	[outerEnvelopeSize] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[InsightUser]    Script Date: 08/04/2020 11:45:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[InsightUser](
	[userId] [varchar](100) NOT NULL,
	[userName] [varchar](100) NOT NULL,
	[clientCode] [varchar](15) NOT NULL,
	[passwordHash] [varchar](500) NOT NULL,
	[salt] [varchar](200) NOT NULL,
	[hashMethod] [char](1) NOT NULL,
	[status] [varchar](4) NOT NULL,
	[emailAddress] [varchar](300) NOT NULL,
	[emailAddressValid] [char](1) NOT NULL,
	[tsLastLogin] [datetime] NULL,
	[tsNextLoginAllowed] [datetime] NOT NULL,
	[passwordChangeRequired] [char](1) NOT NULL,
	[failedLoginCount] [int] NOT NULL,
	[tsCreated] [datetime] NOT NULL,
	[addlClientCodes] [varchar](1500) NOT NULL,
 CONSTRAINT [PK_InsightUser] PRIMARY KEY CLUSTERED 
(
	[userId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LastTicketNumber]    Script Date: 08/04/2020 11:45:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LastTicketNumber](
	[ticketNumber] [decimal](8, 0) NOT NULL,
 CONSTRAINT [PK_LastTicketNumber] PRIMARY KEY CLUSTERED 
(
	[ticketNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LocationAddress]    Script Date: 08/04/2020 11:45:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LocationAddress](
	[tsCreated] [datetime] NOT NULL,
	[clientCode] [varchar](15) NOT NULL,
	[userId] [varchar](30) NOT NULL,
	[locationCode] [varchar](30) NOT NULL,
	[name] [varchar](50) NOT NULL,
	[address1] [varchar](50) NOT NULL,
	[address2] [varchar](50) NOT NULL,
	[city] [varchar](24) NOT NULL,
	[state] [char](2) NOT NULL,
	[ZIP] [varchar](10) NOT NULL,
	[phoneNumber] [varchar](10) NOT NULL,
	[emailAddress] [varchar](300) NOT NULL,
 CONSTRAINT [PK_LocationAddress] PRIMARY KEY CLUSTERED 
(
	[clientCode] ASC,
	[locationCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OptionCode]    Script Date: 08/04/2020 11:45:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OptionCode](
	[optionID] [varchar](20) NOT NULL,
	[optionCode] [varchar](100) NOT NULL,
	[default] [char](1) NOT NULL,
	[description] [varchar](1000) NOT NULL,
 CONSTRAINT [pkOptionCode] PRIMARY KEY CLUSTERED 
(
	[optionID] ASC,
	[optionCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OptionDefinition]    Script Date: 08/04/2020 11:45:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OptionDefinition](
	[optionID] [varchar](20) NOT NULL,
	[level] [char](1) NOT NULL,
	[name] [varchar](100) NOT NULL,
	[description] [varchar](1000) NOT NULL,
 CONSTRAINT [pkOptionDefinition] PRIMARY KEY CLUSTERED 
(
	[optionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OptionSetting]    Script Date: 08/04/2020 11:45:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OptionSetting](
	[clientCode] [varchar](15) NOT NULL,
	[processOptionName] [varchar](20) NOT NULL,
	[optionID] [varchar](20) NOT NULL,
	[optionCode] [varchar](100) NOT NULL,
 CONSTRAINT [pkOptionSetting] PRIMARY KEY CLUSTERED 
(
	[clientCode] ASC,
	[processOptionName] ASC,
	[optionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PrinterOutputGroup]    Script Date: 08/04/2020 11:45:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PrinterOutputGroup](
	[tsCreated] [datetime] NOT NULL,
	[ticketNumber] [varchar](8) NOT NULL,
	[fileNumber] [int] NOT NULL,
	[setupCode] [varchar](8) NOT NULL,
	[processingId] [uniqueidentifier] NOT NULL,
	[handlingCode] [varchar](4) NOT NULL,
	[duplex] [char](1) NOT NULL,
	[color] [char](1) NOT NULL,
	[statementCount] [int] NOT NULL,
	[pageCount] [int] NOT NULL,
	[archiveName] [varchar](255) NOT NULL,
	[printerOutputGroupId] [uniqueidentifier] NOT NULL,
	[perfMode] [char](1) NOT NULL,
	[perfCode] [varchar](4) NOT NULL,
	[paperSize] [varchar](5) NOT NULL,
	[outerEnvelopeStyle] [varchar](15) NOT NULL,
 CONSTRAINT [pkPrintOutputGroup] PRIMARY KEY CLUSTERED 
(
	[ticketNumber] ASC,
	[fileNumber] ASC,
	[setupCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PrinterPiece]    Script Date: 08/04/2020 11:45:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PrinterPiece](
	[tsCreated] [datetime] NOT NULL,
	[ticketNumber] [varchar](8) NOT NULL,
	[fileNumber] [int] NOT NULL,
	[pieceNumber] [int] NOT NULL,
	[clientCode] [varchar](15) NOT NULL,
	[accountNumber] [varchar](25) NOT NULL,
	[documentId] [uniqueidentifier] NOT NULL,
	[printerSegmentId] [uniqueidentifier] NOT NULL,
	[name] [varchar](500) NOT NULL,
	[documentDate] [date] NOT NULL,
	[documentType] [varchar](50) NOT NULL,
	[startPage] [int] NOT NULL,
	[pageCount] [int] NOT NULL,
	[sheetCount] [int] NOT NULL,
	[weight] [money] NOT NULL,
	[enclosures] [varchar](50) NOT NULL,
	[inserterStatus] [char](1) NOT NULL,
	[trayNumber] [int] NOT NULL,
	[trayFlag] [char](1) NOT NULL,
 CONSTRAINT [PK_PrinterPiece] PRIMARY KEY CLUSTERED 
(
	[ticketNumber] ASC,
	[pieceNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PrinterSegment]    Script Date: 08/04/2020 11:45:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PrinterSegment](
	[tsCreated] [datetime] NOT NULL,
	[ticketNumber] [varchar](8) NOT NULL,
	[fileNumber] [int] NOT NULL,
	[setupCode] [varchar](8) NOT NULL,
	[segmentNumber] [int] NOT NULL,
	[printerSegmentId] [uniqueidentifier] NOT NULL,
	[printerOutputGroupId] [uniqueidentifier] NOT NULL,
	[filename] [varchar](255) NOT NULL,
	[description] [varchar](255) NOT NULL,
	[statementCount] [int] NOT NULL,
	[pageCount] [int] NOT NULL,
	[firstPieceNumber] [int] NOT NULL,
	[lastPieceNumber] [int] NOT NULL,
	[pagesToPrint] [int] NOT NULL,
	[pagesPrinted] [int] NOT NULL,
	[printingStatus] [varchar](4) NOT NULL,
	[tsPrintingStarted] [datetime] NULL,
	[tsPrintingEnded] [datetime] NULL,
	[printerId] [varchar](50) NOT NULL,
	[inserterOutputGroupId] [uniqueidentifier] NULL,
	[insertingStatus] [varchar](4) NOT NULL,
	[tsInsertingStarted] [datetime] NULL,
	[tsInsertingEnded] [datetime] NULL,
	[inserterId] [varchar](50) NOT NULL,
 CONSTRAINT [PK_PrinterSegment] PRIMARY KEY CLUSTERED 
(
	[ticketNumber] ASC,
	[fileNumber] ASC,
	[setupCode] ASC,
	[segmentNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Processing]    Script Date: 08/04/2020 11:45:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Processing](
	[tsCreated] [datetime] NOT NULL,
	[ticketNumber] [varchar](8) NOT NULL,
	[fileNumber] [int] NOT NULL,
	[processingType] [varchar](4) NOT NULL,
	[dataFileId] [uniqueidentifier] NOT NULL,
	[qcStatementCount] [int] NOT NULL,
	[qcPageCount] [int] NOT NULL,
	[netStatementCount] [int] NOT NULL,
	[netPageCount] [int] NOT NULL,
	[processingId] [uniqueidentifier] NOT NULL,
 CONSTRAINT [pkProcessing] PRIMARY KEY CLUSTERED 
(
	[ticketNumber] ASC,
	[fileNumber] ASC,
	[processingType] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProcessingInProgress]    Script Date: 08/04/2020 11:45:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProcessingInProgress](
	[ticketNumber] [varchar](8) NOT NULL,
	[processor] [char](60) NOT NULL,
 CONSTRAINT [pkProcessingInProgress] PRIMARY KEY CLUSTERED 
(
	[ticketNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProcessOption]    Script Date: 08/04/2020 11:45:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProcessOption](
	[clientCode] [varchar](15) NOT NULL,
	[tsCreated] [datetime] NOT NULL,
	[optionName] [varchar](15) NOT NULL,
	[description] [varchar](100) NOT NULL,
	[processName] [varchar](15) NOT NULL,
	[active] [char](1) NOT NULL,
	[createPrint] [char](1) NOT NULL,
	[createArchive] [char](1) NOT NULL,
	[createPDF] [char](1) NOT NULL,
	[createEBPP] [char](1) NOT NULL,
	[createEmail] [char](1) NOT NULL,
	[handlingCode] [char](1) NOT NULL,
	[plex] [char](1) NOT NULL,
	[inserts] [char](1) NOT NULL,
	[BRE] [char](1) NOT NULL,
	[BREstyle] [varchar](15) NOT NULL,
	[outerEnvelopeStyle] [varchar](15) NOT NULL,
	[paperSize] [varchar](15) NOT NULL,
	[perfMode] [char](1) NOT NULL,
	[perfCode] [varchar](15) NOT NULL,
	[runCampaignComposer] [char](1) NOT NULL,
	[campaignMode] [char](1) NOT NULL,
	[applicationCode] [varchar](20) NOT NULL,
	[color] [char](1) NOT NULL,
	[batchStatements] [char](1) NOT NULL,
 CONSTRAINT [PK_ProcessOption] PRIMARY KEY CLUSTERED 
(
	[clientCode] ASC,
	[optionName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RegFilename]    Script Date: 08/04/2020 11:45:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RegFilename](
	[tsUpdated] [datetime] NOT NULL,
	[clientCode] [varchar](15) NOT NULL,
	[optionName] [varchar](15) NOT NULL,
	[fileName] [varchar](255) NOT NULL,
 CONSTRAINT [pkRegFilename] PRIMARY KEY CLUSTERED 
(
	[clientCode] ASC,
	[fileName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ScanLog]    Script Date: 08/04/2020 11:45:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ScanLog](
	[programName] [varchar](100) NOT NULL,
	[machineName] [varchar](50) NOT NULL,
	[intervalMinutes] [int] NULL,
	[lastScan] [datetime] NOT NULL,
	[statusLog] [varchar](5000) NULL,
 CONSTRAINT [pkScanLog] PRIMARY KEY CLUSTERED 
(
	[programName] ASC,
	[machineName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Ticket]    Script Date: 08/04/2020 11:45:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ticket](
	[ticketNumber] [varchar](8) NOT NULL,
	[tsReceived] [datetime] NOT NULL,
	[clientCode] [varchar](15) NOT NULL,
	[source] [varchar](3) NOT NULL,
	[mode] [varchar](4) NOT NULL,
	[archiveName] [varchar](255) NOT NULL,
	[archiveSize] [bigint] NOT NULL,
	[uploadServer] [varchar](50) NOT NULL,
	[uploadUser] [varchar](50) NOT NULL,
	[processable] [char](1) NOT NULL,
	[queued] [char](1) NOT NULL,
	[processingStage] [varchar](4) NOT NULL,
	[processingStatus] [varchar](4) NOT NULL,
	[processingMessage] [varchar](255) NOT NULL,
 CONSTRAINT [PK_Ticket] PRIMARY KEY CLUSTERED 
(
	[ticketNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TicketActivityLog]    Script Date: 08/04/2020 11:45:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TicketActivityLog](
	[clientCode] [varchar](15) NOT NULL,
	[ticketNumber] [varchar](8) NOT NULL,
	[tsActivity] [datetime] NOT NULL,
	[activityId] [uniqueidentifier] NOT NULL,
	[userName] [varchar](100) NOT NULL,
	[summary] [varchar](6000) NOT NULL,
	[detail] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_TicketActivityLog] PRIMARY KEY NONCLUSTERED 
(
	[activityId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TicketIssue]    Script Date: 08/04/2020 11:45:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TicketIssue](
	[ticketNumber] [varchar](8) NOT NULL,
	[issueId] [uniqueidentifier] NOT NULL,
	[tsCreated] [datetime] NOT NULL,
	[openedBy] [varchar](50) NOT NULL,
	[fileNumber] [int] NOT NULL,
	[status] [varchar](4) NOT NULL,
	[billable] [varchar](1) NOT NULL,
	[type] [varchar](50) NOT NULL,
	[department] [varchar](4) NOT NULL,
	[assignedBy] [varchar](50) NOT NULL,
	[assignedTo] [varchar](50) NOT NULL,
	[accepted] [char](1) NOT NULL,
	[billableHours] [decimal](7, 2) NOT NULL,
	[description] [varchar](1000) NOT NULL,
	[resolution] [varchar](5000) NOT NULL,
 CONSTRAINT [PK_TicketIssue] PRIMARY KEY NONCLUSTERED 
(
	[issueId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TicketIssueNote]    Script Date: 08/04/2020 11:45:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TicketIssueNote](
	[ticketNumber] [char](8) NOT NULL,
	[tsCreated] [datetime] NOT NULL,
	[noteId] [uniqueidentifier] NOT NULL,
	[issueId] [uniqueidentifier] NOT NULL,
	[createdBy] [varchar](30) NOT NULL,
	[text] [varchar](5000) NOT NULL,
 CONSTRAINT [PK_TicketIssueNote] PRIMARY KEY NONCLUSTERED 
(
	[noteId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Client] ADD  CONSTRAINT [DF_Client_tsCreated]  DEFAULT (getdate()) FOR [tsCreated]
GO
ALTER TABLE [dbo].[Client] ADD  CONSTRAINT [DF_Client_transmitStatus]  DEFAULT ('T') FOR [transmitStatus]
GO
ALTER TABLE [dbo].[Client] ADD  CONSTRAINT [DF_Client_ipFilter]  DEFAULT ('') FOR [ipFilter]
GO
ALTER TABLE [dbo].[Client] ADD  CONSTRAINT [DF_Client_active]  DEFAULT ('Y') FOR [active]
GO
ALTER TABLE [dbo].[Client] ADD  CONSTRAINT [DF_Client_varianceThreshold]  DEFAULT ((0)) FOR [varianceThreshold]
GO
ALTER TABLE [dbo].[ClientActivityLog] ADD  CONSTRAINT [DF_ActivityLog_tsActivity]  DEFAULT (getdate()) FOR [tsActivity]
GO
ALTER TABLE [dbo].[ClientActivityLog] ADD  CONSTRAINT [DF_ActivityLog_activityId]  DEFAULT (newid()) FOR [activityId]
GO
ALTER TABLE [dbo].[ClientFunction] ADD  CONSTRAINT [DF__ClientFun__tsUpd__468862B0]  DEFAULT (getdate()) FOR [tsUpdated]
GO
ALTER TABLE [dbo].[ClientFunction] ADD  CONSTRAINT [DF_ClientFunction_applicationCode]  DEFAULT ('I') FOR [applicationCode]
GO
ALTER TABLE [dbo].[ClientFunction] ADD  CONSTRAINT [DF_ClientFunction_groupName]  DEFAULT ('') FOR [groupName]
GO
ALTER TABLE [dbo].[CountAdjustment] ADD  CONSTRAINT [DF__CountAdju__tsCre__5DA0D232]  DEFAULT (getdate()) FOR [tsCreated]
GO
ALTER TABLE [dbo].[DataFile] ADD  CONSTRAINT [DF_DataFile_tsCreated]  DEFAULT (getdate()) FOR [tsCreated]
GO
ALTER TABLE [dbo].[DataFile] ADD  CONSTRAINT [DF_DataFile_dadaFileId]  DEFAULT (newid()) FOR [dataFileId]
GO
ALTER TABLE [dbo].[DataFile] ADD  CONSTRAINT [DF_DataFile_QCstatementCOunt]  DEFAULT ((0)) FOR [qcStatementCount]
GO
ALTER TABLE [dbo].[DataFile] ADD  CONSTRAINT [DF_DataFile_QCpageCount]  DEFAULT ((0)) FOR [qcPageCount]
GO
ALTER TABLE [dbo].[DataFile] ADD  CONSTRAINT [DF_DataFile_releaseStatus]  DEFAULT ('') FOR [releaseStatus]
GO
ALTER TABLE [dbo].[DataFile] ADD  CONSTRAINT [DF_DataFile_insert1]  DEFAULT ('') FOR [insert1]
GO
ALTER TABLE [dbo].[DataFile] ADD  CONSTRAINT [DF_DataFile_insert2]  DEFAULT ('') FOR [insert2]
GO
ALTER TABLE [dbo].[DataFile] ADD  CONSTRAINT [DF_DataFile_insert3]  DEFAULT ('') FOR [insert3]
GO
ALTER TABLE [dbo].[DataFile] ADD  CONSTRAINT [DF_DataFile_processedOn]  DEFAULT ('') FOR [processedOn]
GO
ALTER TABLE [dbo].[DataFile] ADD  CONSTRAINT [DF_DataFile_procssedOn2]  DEFAULT ('') FOR [processedOn2]
GO
ALTER TABLE [dbo].[EmailBin] ADD  CONSTRAINT [DF_EmailBin_emailId]  DEFAULT (newid()) FOR [emailId]
GO
ALTER TABLE [dbo].[EmailBin] ADD  CONSTRAINT [DF__emailBin2__tsCrea__5FB4CE84]  DEFAULT (getdate()) FOR [tsCreated]
GO
ALTER TABLE [dbo].[EmailBin] ADD  CONSTRAINT [DF_EmailBin_userId]  DEFAULT ('') FOR [userId]
GO
ALTER TABLE [dbo].[EmailBin] ADD  CONSTRAINT [DF_EmailBin_recipients]  DEFAULT ('') FOR [recipients]
GO
ALTER TABLE [dbo].[EmailBin] ADD  CONSTRAINT [DF_EmailBin_subject]  DEFAULT ('') FOR [subject]
GO
ALTER TABLE [dbo].[EmailBin] ADD  CONSTRAINT [DF_EmailBinbody]  DEFAULT ('') FOR [body]
GO
ALTER TABLE [dbo].[GMCJob] ADD  CONSTRAINT [DF_GMCJobs_tsCreated]  DEFAULT (getdate()) FOR [tsCreated]
GO
ALTER TABLE [dbo].[GMCJob] ADD  CONSTRAINT [DF_GMCJob_seq]  DEFAULT ((1)) FOR [sequenceNumber]
GO
ALTER TABLE [dbo].[GMCJob] ADD  CONSTRAINT [DF_GMCJob_letterCode]  DEFAULT ('') FOR [letterCode]
GO
ALTER TABLE [dbo].[GMCJob] ADD  CONSTRAINT [DF_GMCJob_WFDmode]  DEFAULT ('TEST') FOR [WFDmode]
GO
ALTER TABLE [dbo].[GMCJob] ADD  CONSTRAINT [DF_GMCJob_fileNameDOCU]  DEFAULT ('') FOR [DOCUfileName]
GO
ALTER TABLE [dbo].[GMCJob] ADD  CONSTRAINT [DF_GMCJob_outputFileName]  DEFAULT ('') FOR [outputFileNamePDF]
GO
ALTER TABLE [dbo].[GMCJob] ADD  CONSTRAINT [DF_GMCJob_outputFileNameDOCINFO]  DEFAULT ('') FOR [outputFileNameDOCINFO]
GO
ALTER TABLE [dbo].[GMCJob] ADD  CONSTRAINT [DF_GMCJobs_UDF1]  DEFAULT ('') FOR [UDF1]
GO
ALTER TABLE [dbo].[GMCJob] ADD  CONSTRAINT [DF_GMCJobs_UDF2]  DEFAULT ('') FOR [UDF2]
GO
ALTER TABLE [dbo].[GMCJob] ADD  CONSTRAINT [DF_GMCJobs_UDF32]  DEFAULT ('') FOR [UDF3]
GO
ALTER TABLE [dbo].[GMCJob] ADD  CONSTRAINT [DF_GMCJobs_UDF4]  DEFAULT ('') FOR [UDF4]
GO
ALTER TABLE [dbo].[GMCJob] ADD  CONSTRAINT [DF_GMCJobs_UDF5]  DEFAULT ('') FOR [UDF5]
GO
ALTER TABLE [dbo].[GMCJob] ADD  CONSTRAINT [DF_GMCJob_minutesToOpen]  DEFAULT ((0)) FOR [openMinutes]
GO
ALTER TABLE [dbo].[GMCJob] ADD  CONSTRAINT [DF_GMCJob_minutesToPreprocess]  DEFAULT ((0)) FOR [preprocessMinutes]
GO
ALTER TABLE [dbo].[GMCJob] ADD  CONSTRAINT [DF_GMCJob_minutesToProcessJob]  DEFAULT ((0)) FOR [jobMinutes]
GO
ALTER TABLE [dbo].[GMCJob] ADD  CONSTRAINT [DF_GMCJob_totalPages]  DEFAULT ((0)) FOR [pagesProcessed]
GO
ALTER TABLE [dbo].[GMCJob] ADD  CONSTRAINT [DF_GMCJob_pagesPerMinute]  DEFAULT ((0)) FOR [pagesPerMinute]
GO
ALTER TABLE [dbo].[GMCJob] ADD  CONSTRAINT [DF_GMCJob_tempFileSize]  DEFAULT ((0)) FOR [tempFileSize]
GO
ALTER TABLE [dbo].[GMCJob] ADD  CONSTRAINT [DF_GMCJob_endlessLoopLimit]  DEFAULT ((1000)) FOR [endlessLoopLimit]
GO
ALTER TABLE [dbo].[InserterOutputGroup] ADD  CONSTRAINT [DF__InsertingOutputGro__tsUpd__5BED93EA]  DEFAULT (getdate()) FOR [tsCreated]
GO
ALTER TABLE [dbo].[InserterOutputGroup] ADD  CONSTRAINT [DF__InsertingOutputGro__state__5CE1B823]  DEFAULT ((0)) FOR [statementCount]
GO
ALTER TABLE [dbo].[InserterOutputGroup] ADD  CONSTRAINT [DF__InsertingOutputGro__pageC__5DD5DC5C]  DEFAULT ((0)) FOR [pageCount]
GO
ALTER TABLE [dbo].[InserterOutputGroup] ADD  CONSTRAINT [DF_InsertingOutputGroup_InsertingOutputGroupId]  DEFAULT (newid()) FOR [inserterOutputGroupId]
GO
ALTER TABLE [dbo].[InsightUser] ADD  CONSTRAINT [DF_InsightUser_hashMethod]  DEFAULT ('1') FOR [hashMethod]
GO
ALTER TABLE [dbo].[InsightUser] ADD  CONSTRAINT [DF_InsightUser_status]  DEFAULT ('') FOR [status]
GO
ALTER TABLE [dbo].[InsightUser] ADD  CONSTRAINT [DF_InsightUser_emailAddress]  DEFAULT ('') FOR [emailAddress]
GO
ALTER TABLE [dbo].[InsightUser] ADD  CONSTRAINT [DF_InsightUser_emailAddressValid]  DEFAULT ('N') FOR [emailAddressValid]
GO
ALTER TABLE [dbo].[InsightUser] ADD  CONSTRAINT [DF_InsightUser_tsNextLoginAllowed]  DEFAULT (getdate()) FOR [tsNextLoginAllowed]
GO
ALTER TABLE [dbo].[InsightUser] ADD  CONSTRAINT [DF_InsightUser_failedLoginCount]  DEFAULT ((0)) FOR [failedLoginCount]
GO
ALTER TABLE [dbo].[InsightUser] ADD  CONSTRAINT [DF_User_tsCreated]  DEFAULT (getdate()) FOR [tsCreated]
GO
ALTER TABLE [dbo].[InsightUser] ADD  CONSTRAINT [DF_InsightUser_addlClientCodes]  DEFAULT ('') FOR [addlClientCodes]
GO
ALTER TABLE [dbo].[LocationAddress] ADD  CONSTRAINT [DF__LocationA__tsCre__37CB9CC5]  DEFAULT (getdate()) FOR [tsCreated]
GO
ALTER TABLE [dbo].[LocationAddress] ADD  CONSTRAINT [DF__LocationA__addre__38BFC0FE]  DEFAULT ('') FOR [address2]
GO
ALTER TABLE [dbo].[LocationAddress] ADD  CONSTRAINT [DF__LocationA__phone__39B3E537]  DEFAULT ('') FOR [phoneNumber]
GO
ALTER TABLE [dbo].[LocationAddress] ADD  CONSTRAINT [DF_LocationAddress_emailAddress]  DEFAULT ('') FOR [emailAddress]
GO
ALTER TABLE [dbo].[PrinterOutputGroup] ADD  CONSTRAINT [DF__PrintOutputGro__tsUpd__5BED93EA]  DEFAULT (getdate()) FOR [tsCreated]
GO
ALTER TABLE [dbo].[PrinterOutputGroup] ADD  CONSTRAINT [DF__PrintOutputGro__state__5CE1B823]  DEFAULT ((0)) FOR [statementCount]
GO
ALTER TABLE [dbo].[PrinterOutputGroup] ADD  CONSTRAINT [DF__PrintOutputGro__pageC__5DD5DC5C]  DEFAULT ((0)) FOR [pageCount]
GO
ALTER TABLE [dbo].[PrinterOutputGroup] ADD  CONSTRAINT [DF_PrintOutputGroup_archiveName]  DEFAULT (' ') FOR [archiveName]
GO
ALTER TABLE [dbo].[PrinterOutputGroup] ADD  CONSTRAINT [DF_PrintOutputGroup_PrintOutputGroupId]  DEFAULT (newid()) FOR [printerOutputGroupId]
GO
ALTER TABLE [dbo].[PrinterOutputGroup] ADD  CONSTRAINT [DF_PrintOutputGroup_perfMode]  DEFAULT ('') FOR [perfMode]
GO
ALTER TABLE [dbo].[PrinterOutputGroup] ADD  CONSTRAINT [DF_PrintOutputGroup_perCode]  DEFAULT ('') FOR [perfCode]
GO
ALTER TABLE [dbo].[PrinterOutputGroup] ADD  CONSTRAINT [DF_PrintOutputGroup_paperSize]  DEFAULT ('A4') FOR [paperSize]
GO
ALTER TABLE [dbo].[PrinterPiece] ADD  CONSTRAINT [DF_PrinterPiece_tsCreated]  DEFAULT (getdate()) FOR [tsCreated]
GO
ALTER TABLE [dbo].[PrinterPiece] ADD  CONSTRAINT [DF_PrinterPiece_name]  DEFAULT ('') FOR [name]
GO
ALTER TABLE [dbo].[PrinterPiece] ADD  CONSTRAINT [DF_PrinterPiece_documentType]  DEFAULT ('') FOR [documentType]
GO
ALTER TABLE [dbo].[PrinterPiece] ADD  CONSTRAINT [DF_PrinterPiece_startPage]  DEFAULT ((0)) FOR [startPage]
GO
ALTER TABLE [dbo].[PrinterPiece] ADD  CONSTRAINT [DF_PrinterPiece_pageCount]  DEFAULT ((0)) FOR [pageCount]
GO
ALTER TABLE [dbo].[PrinterPiece] ADD  CONSTRAINT [DF_PrinterPiece_sheetCount]  DEFAULT ((0)) FOR [sheetCount]
GO
ALTER TABLE [dbo].[PrinterPiece] ADD  CONSTRAINT [DF_PrinterPiece_enclosures]  DEFAULT ('') FOR [enclosures]
GO
ALTER TABLE [dbo].[PrinterPiece] ADD  CONSTRAINT [DF_PrinterPiece_inserterStatus]  DEFAULT ('') FOR [inserterStatus]
GO
ALTER TABLE [dbo].[PrinterPiece] ADD  CONSTRAINT [DF_PrinterPiece_trayNumber]  DEFAULT ((0)) FOR [trayNumber]
GO
ALTER TABLE [dbo].[PrinterPiece] ADD  CONSTRAINT [DF_PrinterPiece_trayFlag]  DEFAULT ('') FOR [trayFlag]
GO
ALTER TABLE [dbo].[PrinterSegment] ADD  CONSTRAINT [DF_PrinterSegment_tsCreated]  DEFAULT (getdate()) FOR [tsCreated]
GO
ALTER TABLE [dbo].[PrinterSegment] ADD  CONSTRAINT [DF_PrinterSegment_primtSegmentId]  DEFAULT (newid()) FOR [printerSegmentId]
GO
ALTER TABLE [dbo].[PrinterSegment] ADD  CONSTRAINT [DF_PrinterSegment_statementCount]  DEFAULT ((0)) FOR [statementCount]
GO
ALTER TABLE [dbo].[PrinterSegment] ADD  CONSTRAINT [DF_PrinterSegment_pageCount]  DEFAULT ((0)) FOR [pageCount]
GO
ALTER TABLE [dbo].[PrinterSegment] ADD  CONSTRAINT [DF_PrinterSegment_firstPieceNumber]  DEFAULT ((0)) FOR [firstPieceNumber]
GO
ALTER TABLE [dbo].[PrinterSegment] ADD  CONSTRAINT [DF_PrinterSegment_lastPieceNumber]  DEFAULT ((0)) FOR [lastPieceNumber]
GO
ALTER TABLE [dbo].[PrinterSegment] ADD  CONSTRAINT [DF_PrinterSegment_pagesToPrint]  DEFAULT ((0)) FOR [pagesToPrint]
GO
ALTER TABLE [dbo].[PrinterSegment] ADD  CONSTRAINT [DF_PrinterSegment_pagesPrinted]  DEFAULT ((0)) FOR [pagesPrinted]
GO
ALTER TABLE [dbo].[PrinterSegment] ADD  CONSTRAINT [DF_PrinterSegment_printingStatus]  DEFAULT ('') FOR [printingStatus]
GO
ALTER TABLE [dbo].[PrinterSegment] ADD  CONSTRAINT [DF_PrinterSegment_printerId]  DEFAULT ('') FOR [printerId]
GO
ALTER TABLE [dbo].[PrinterSegment] ADD  CONSTRAINT [DF_PrinterSegment_insertingStatus]  DEFAULT ('') FOR [insertingStatus]
GO
ALTER TABLE [dbo].[PrinterSegment] ADD  CONSTRAINT [DF_PrinterSegment_inserterId]  DEFAULT ('') FOR [inserterId]
GO
ALTER TABLE [dbo].[Processing] ADD  CONSTRAINT [DF__Processin__tsUpd__2E3BD7D3]  DEFAULT (getdate()) FOR [tsCreated]
GO
ALTER TABLE [dbo].[Processing] ADD  CONSTRAINT [DF__Processin__qcSta__5C02A283]  DEFAULT ((0)) FOR [qcStatementCount]
GO
ALTER TABLE [dbo].[Processing] ADD  CONSTRAINT [DF__Processin__qcPag__5CF6C6BC]  DEFAULT ((0)) FOR [qcPageCount]
GO
ALTER TABLE [dbo].[Processing] ADD  CONSTRAINT [DF__Processin__recon__5DEAEAF5]  DEFAULT ((0)) FOR [netStatementCount]
GO
ALTER TABLE [dbo].[Processing] ADD  CONSTRAINT [DF__Processin__recon__5EDF0F2E]  DEFAULT ((0)) FOR [netPageCount]
GO
ALTER TABLE [dbo].[Processing] ADD  CONSTRAINT [DF_Processing_processingId]  DEFAULT (newid()) FOR [processingId]
GO
ALTER TABLE [dbo].[ProcessOption] ADD  CONSTRAINT [DF_ProcessOption_tsCreated]  DEFAULT (getdate()) FOR [tsCreated]
GO
ALTER TABLE [dbo].[ProcessOption] ADD  CONSTRAINT [DF_ProcessOption_active]  DEFAULT ('I') FOR [active]
GO
ALTER TABLE [dbo].[ProcessOption] ADD  CONSTRAINT [DF_ProcessOption_paperSize]  DEFAULT ('A4') FOR [paperSize]
GO
ALTER TABLE [dbo].[ProcessOption] ADD  CONSTRAINT [DF_ProcessOption_color]  DEFAULT ('F') FOR [color]
GO
ALTER TABLE [dbo].[ProcessOption] ADD  CONSTRAINT [DF_ProcessOption_batchStatements]  DEFAULT ('N') FOR [batchStatements]
GO
ALTER TABLE [dbo].[ScanLog] ADD  CONSTRAINT [DF__scanLog__interva__62108194]  DEFAULT ((0)) FOR [intervalMinutes]
GO
ALTER TABLE [dbo].[ScanLog] ADD  CONSTRAINT [DF__scanLog__lastSca__6304A5CD]  DEFAULT (getdate()) FOR [lastScan]
GO
ALTER TABLE [dbo].[Ticket] ADD  CONSTRAINT [DF_Ticket_tsCreated]  DEFAULT (getdate()) FOR [tsReceived]
GO
ALTER TABLE [dbo].[Ticket] ADD  CONSTRAINT [DF_Ticket_upoadServer]  DEFAULT ('') FOR [uploadServer]
GO
ALTER TABLE [dbo].[Ticket] ADD  CONSTRAINT [DF_Ticket_uploadUser]  DEFAULT ('') FOR [uploadUser]
GO
ALTER TABLE [dbo].[Ticket] ADD  CONSTRAINT [DF_Ticket_processable]  DEFAULT ('N') FOR [processable]
GO
ALTER TABLE [dbo].[Ticket] ADD  CONSTRAINT [DF_Ticket_ququed]  DEFAULT ('N') FOR [queued]
GO
ALTER TABLE [dbo].[Ticket] ADD  CONSTRAINT [DF_Ticket_processingMessage]  DEFAULT ('') FOR [processingMessage]
GO
ALTER TABLE [dbo].[TicketActivityLog] ADD  CONSTRAINT [DF_TicketActivityLog_tsActivity]  DEFAULT (getdate()) FOR [tsActivity]
GO
ALTER TABLE [dbo].[TicketActivityLog] ADD  CONSTRAINT [DF_TicketActivityLog_activityId]  DEFAULT (newid()) FOR [activityId]
GO
ALTER TABLE [dbo].[TicketIssue] ADD  CONSTRAINT [DF_TicketIssue_issueId]  DEFAULT (newid()) FOR [issueId]
GO
ALTER TABLE [dbo].[TicketIssue] ADD  CONSTRAINT [DF__TicketIss__tsOpe__257C74A0]  DEFAULT (getdate()) FOR [tsCreated]
GO
ALTER TABLE [dbo].[TicketIssue] ADD  CONSTRAINT [DF__TicketIss__fileN__267098D9]  DEFAULT ((0)) FOR [fileNumber]
GO
ALTER TABLE [dbo].[TicketIssueNote] ADD  CONSTRAINT [DF_TicketIssueNote_tsCreated]  DEFAULT (getdate()) FOR [tsCreated]
GO
ALTER TABLE [dbo].[TicketIssueNote] ADD  CONSTRAINT [DF_TicketIssueNote_noteId]  DEFAULT (newid()) FOR [noteId]
GO
ALTER TABLE [dbo].[AuthorizedClientFunction]  WITH CHECK ADD  CONSTRAINT [fkAuthClientFunc#Function] FOREIGN KEY([functionCode])
REFERENCES [dbo].[ClientFunction] ([code])
GO
ALTER TABLE [dbo].[AuthorizedClientFunction] CHECK CONSTRAINT [fkAuthClientFunc#Function]
GO
ALTER TABLE [dbo].[CountAdjustment]  WITH NOCHECK ADD  CONSTRAINT [fkCountAdjustment#Processing] FOREIGN KEY([ticketNumber], [fileNumber], [processingType])
REFERENCES [dbo].[Processing] ([ticketNumber], [fileNumber], [processingType])
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[CountAdjustment] CHECK CONSTRAINT [fkCountAdjustment#Processing]
GO
ALTER TABLE [dbo].[DataFile]  WITH CHECK ADD  CONSTRAINT [FK_DataFile_Ticket] FOREIGN KEY([ticketNumber])
REFERENCES [dbo].[Ticket] ([ticketNumber])
GO
ALTER TABLE [dbo].[DataFile] CHECK CONSTRAINT [FK_DataFile_Ticket]
GO
ALTER TABLE [dbo].[InserterOutputGroup]  WITH CHECK ADD  CONSTRAINT [FK_InsertingOutputGroup_PrintOutputGroup] FOREIGN KEY([printerOutputGroupId])
REFERENCES [dbo].[PrinterOutputGroup] ([printerOutputGroupId])
GO
ALTER TABLE [dbo].[InserterOutputGroup] CHECK CONSTRAINT [FK_InsertingOutputGroup_PrintOutputGroup]
GO
ALTER TABLE [dbo].[InsightUser]  WITH CHECK ADD  CONSTRAINT [FK_InsightUser_Client] FOREIGN KEY([clientCode])
REFERENCES [dbo].[Client] ([clientCode])
GO
ALTER TABLE [dbo].[InsightUser] CHECK CONSTRAINT [FK_InsightUser_Client]
GO
ALTER TABLE [dbo].[LocationAddress]  WITH CHECK ADD  CONSTRAINT [FK_LocationAddress_Client] FOREIGN KEY([clientCode])
REFERENCES [dbo].[Client] ([clientCode])
GO
ALTER TABLE [dbo].[LocationAddress] CHECK CONSTRAINT [FK_LocationAddress_Client]
GO
ALTER TABLE [dbo].[OptionCode]  WITH NOCHECK ADD  CONSTRAINT [fkOptionCode#OptionDefinition] FOREIGN KEY([optionID])
REFERENCES [dbo].[OptionDefinition] ([optionID])
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[OptionCode] CHECK CONSTRAINT [fkOptionCode#OptionDefinition]
GO
ALTER TABLE [dbo].[OptionSetting]  WITH NOCHECK ADD  CONSTRAINT [fkOptionSetting#Client] FOREIGN KEY([clientCode])
REFERENCES [dbo].[Client] ([clientCode])
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[OptionSetting] CHECK CONSTRAINT [fkOptionSetting#Client]
GO
ALTER TABLE [dbo].[OptionSetting]  WITH CHECK ADD  CONSTRAINT [fkOptionSetting#OptionCode] FOREIGN KEY([optionID], [optionCode])
REFERENCES [dbo].[OptionCode] ([optionID], [optionCode])
GO
ALTER TABLE [dbo].[OptionSetting] CHECK CONSTRAINT [fkOptionSetting#OptionCode]
GO
ALTER TABLE [dbo].[PrinterOutputGroup]  WITH CHECK ADD  CONSTRAINT [FK_PrintOutputGroup_Processing] FOREIGN KEY([processingId])
REFERENCES [dbo].[Processing] ([processingId])
GO
ALTER TABLE [dbo].[PrinterOutputGroup] CHECK CONSTRAINT [FK_PrintOutputGroup_Processing]
GO
ALTER TABLE [dbo].[PrinterPiece]  WITH CHECK ADD  CONSTRAINT [FK_PrinterPiece_PrinterSegment] FOREIGN KEY([printerSegmentId])
REFERENCES [dbo].[PrinterSegment] ([printerSegmentId])
GO
ALTER TABLE [dbo].[PrinterPiece] CHECK CONSTRAINT [FK_PrinterPiece_PrinterSegment]
GO
ALTER TABLE [dbo].[PrinterSegment]  WITH CHECK ADD  CONSTRAINT [FK_PrinterSegment_InserterOutputGroup] FOREIGN KEY([inserterOutputGroupId])
REFERENCES [dbo].[InserterOutputGroup] ([inserterOutputGroupId])
GO
ALTER TABLE [dbo].[PrinterSegment] CHECK CONSTRAINT [FK_PrinterSegment_InserterOutputGroup]
GO
ALTER TABLE [dbo].[PrinterSegment]  WITH CHECK ADD  CONSTRAINT [FK_PrinterSegment_PrintOutputGroup] FOREIGN KEY([printerOutputGroupId])
REFERENCES [dbo].[PrinterOutputGroup] ([printerOutputGroupId])
GO
ALTER TABLE [dbo].[PrinterSegment] CHECK CONSTRAINT [FK_PrinterSegment_PrintOutputGroup]
GO
ALTER TABLE [dbo].[Processing]  WITH NOCHECK ADD  CONSTRAINT [fkProcessing#DataFile] FOREIGN KEY([ticketNumber], [fileNumber])
REFERENCES [dbo].[DataFile] ([ticketNumber], [fileNumber])
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[Processing] CHECK CONSTRAINT [fkProcessing#DataFile]
GO
ALTER TABLE [dbo].[ProcessOption]  WITH CHECK ADD  CONSTRAINT [FK_ProcessOption_Client] FOREIGN KEY([clientCode])
REFERENCES [dbo].[Client] ([clientCode])
GO
ALTER TABLE [dbo].[ProcessOption] CHECK CONSTRAINT [FK_ProcessOption_Client]
GO
ALTER TABLE [dbo].[RegFilename]  WITH CHECK ADD  CONSTRAINT [fkRegFilename#ProcessOption] FOREIGN KEY([clientCode], [optionName])
REFERENCES [dbo].[ProcessOption] ([clientCode], [optionName])
GO
ALTER TABLE [dbo].[RegFilename] CHECK CONSTRAINT [fkRegFilename#ProcessOption]
GO
ALTER TABLE [dbo].[Ticket]  WITH CHECK ADD  CONSTRAINT [FK_Ticket_Client] FOREIGN KEY([clientCode])
REFERENCES [dbo].[Client] ([clientCode])
GO
ALTER TABLE [dbo].[Ticket] CHECK CONSTRAINT [FK_Ticket_Client]
GO
ALTER TABLE [dbo].[TicketIssue]  WITH CHECK ADD  CONSTRAINT [FK_TicketIssue_Ticket] FOREIGN KEY([ticketNumber])
REFERENCES [dbo].[Ticket] ([ticketNumber])
GO
ALTER TABLE [dbo].[TicketIssue] CHECK CONSTRAINT [FK_TicketIssue_Ticket]
GO
ALTER TABLE [dbo].[TicketIssueNote]  WITH CHECK ADD  CONSTRAINT [FK_TicketIssueNote_TicketIssue] FOREIGN KEY([issueId])
REFERENCES [dbo].[TicketIssue] ([issueId])
GO
ALTER TABLE [dbo].[TicketIssueNote] CHECK CONSTRAINT [FK_TicketIssueNote_TicketIssue]
GO
/****** Object:  StoredProcedure [dbo].[AddCountChange]    Script Date: 08/04/2020 11:45:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AddCountChange]
	@ticketNumber [varchar](8),
	@fileNumber [int],
	@processingType [varchar](4),
	@changeInStatementCount [int],
	@changeInPageCount [int],
	@reason [varchar](255)
WITH EXECUTE AS CALLER
AS
UPDATE  Processing set 
netStatementCount = netStatementCount + @changeInStatementCount, 
netPageCount = netPageCount + @changeInPageCount
WHERE ticketNumber = @ticketNumber and fileNumber=@fileNumber and processingType = @processingType

INSERT INTO CountAdjustment([ticketNumber],[fileNumber],[processingType],[changeInStatementCount],changeInPageCount,reason)
VALUES(@ticketNumber,@fileNumber,@processingType,@changeInStatementCount,@changeInPageCount,@reason)

/* to prevent duplicate key errors */
WAITFOR DELAY '00:00:01'
GO
/****** Object:  StoredProcedure [dbo].[DeleteProcessingData]    Script Date: 08/04/2020 11:45:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[DeleteProcessingData]
	@ticketNumber [varchar](8),
	@fileNumber [int],
	@processingType [varchar](4)

AS

if @processingType='PRNT'
begin
   delete TOP (500) from PrinterPiece where ticketNumber=@ticketNumber and fileNumber=@fileNumber
   while @@rowcount > 0
   begin
      delete TOP (500) from PrinterPiece where ticketNumber=@ticketNumber and fileNumber=@fileNumber
   end
   delete from PrinterSegment where ticketNumber=@ticketNumber and fileNumber=@fileNumber
   delete from InserterOutputGroup where ticketNumber=@ticketNumber and fileNumber=@fileNumber
   delete from PrinterOutputGroup where ticketNumber=@ticketNumber and fileNumber=@fileNumber
end
delete from CountAdjustment where ticketNumber = @ticketNumber and fileNumber = @fileNumber and processingType = @processingType
delete from Processing where ticketNumber = @ticketNumber and fileNumber = @fileNumber and processingType = @processingType
GO
/****** Object:  StoredProcedure [dbo].[getClientOptionSetting]    Script Date: 08/04/2020 11:45:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[getClientOptionSetting]
	@clientCode [char](15),
	@optionId [varchar](20)
WITH EXECUTE AS CALLER
AS
select 
   coalesce((select optionCode from optionsetting where clientCode=@clientCode and processOptionName='' and optionID=@optionId),
                  (select B.optionCode from OptionDefinition A join OptionCode B on A.optionId=B.optionId  where A.optionId=@optionId and A.[level] = 'C' and B.[default]='Y' ),
                  '###ERROR###') 
as optCode
GO
/****** Object:  StoredProcedure [dbo].[getTicketNumber]    Script Date: 08/04/2020 11:45:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[getTicketNumber]
WITH EXECUTE AS CALLER
AS
declare @newTicketNumber decimal(8,0)
UPDATE LastTicketNumber SET @newTicketNumber = ticketNumber = ticketNumber + 1
RETURN @newTicketNumber
GO
/****** Object:  StoredProcedure [dbo].[RemoteFTPscanComplete]    Script Date: 08/04/2020 11:45:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[RemoteFTPscanComplete]	@ticketNumber [varchar](8)
WITH EXECUTE AS CALLER
AS
/* set the ticket status and stage based on receipt of file via web/ftp and process steps through scan programs*/
DECLARE @status VARCHAR(4)
DECLARE @message VARCHAR(255)

BEGIN TRANSACTION
SELECT @status = processingStatus,@message=processingMessage from ticket where ticketNumber=@ticketNumber

if (@Status = 'WXFR')
  BEGIN
	SET @Status = 'WFTP'
	SET @Message = 'Remote FTP scan complete. Pending Work Order'
	GOTO DONE
  END
if (@Status = 'WWRK')
  BEGIN
	SET @Status = 'WPND'
	SET @Message = 'Remote FTP scan complete, Pending InBox scan'
	GOTO DONE
  END

DONE:
UPDATE ticket set processingStatus = @Status, processingMessage = @Message where ticketNumber = @ticketNumber
COMMIT TRANSACTION

GO
/****** Object:  StoredProcedure [dbo].[SetTicketStatus]    Script Date: 08/04/2020 11:45:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SetTicketStatus](@ticketNumber varchar(8)) AS 
/* set the ticket status and stage to reflect the status of the datafiles */
DECLARE @Stage VARCHAR(4)
DECLARE @Status VARCHAR(4)
DECLARE @CntFiles INT
DECLARE @CntFailed INT
DECLARE @CntUnProcessed INT
DECLARE @CntFinished INT
DECLARE @CntBillable INT
Declare @CntNotDoneProcessing INT
DECLARE @Mode VARCHAR(4)
DECLARE @BillingStatus CHAR(4)
DECLARE @Message VARCHAR(255)
DECLARE @processable CHAR(1)
SELECT @Stage = processingStage,@Mode=mode from ticket where ticketNumber = @ticketNumber
if (@@ROWCOUNT = 0) RETURN 99
SET @Message = ''
SET @processable = 'Y'
if (@Stage = 'VOID') RETURN

SELECT @CntFiles = count(*) from datafile where ticketNumber = @ticketNumber and processingStage <> 'SKIP'
SELECT @CntFailed = count(*) from datafile where ticketNumber = @ticketNumber and processingStage = 'PROC' and processingStatus = 'FAIL'
SELECT @CntBillable = count(*) from datafile where ticketNumber = @ticketNumber and processingStage = 'PROC' and processingStatus = 'CONB'
SELECT @CntUnProcessed = count(*) from datafile where ticketNumber = @ticketNumber and processingStage = 'UNPR'
SELECT @CntNotDoneProcessing = count(*) from datafile where ticketNumber = @ticketNumber and processingStage in ('GMC','PHS2')
if (@CntFiles = 0)
   BEGIN
	SET @Stage = 'VOID'
	SET @Status = 'N/A'
	SET @Message = 'Automatically voided - all files are SKIP'
	GOTO DONE
   END
if (@CntFiles = @CntUnprocessed) 
   BEGIN
	SET @Stage = 'PEND'
	SET @Status = 'N/A'
	GOTO DONE
   END
if (@CntUnprocessed > 0) OR (@CntFailed > 0)  OR (@CntBillable > 0) or (@CntNotDoneProcessing > 0)
   BEGIN
	SET @Stage = 'PROC'
	SET @Status = 'INC'
	GOTO DONE
   END
SET @Stage = 'PROC'
SET @Status = 'DONE'
SET @BillingStatus = 'PNDG'
SET @processable = 'N'
DONE:
UPDATE ticket set  processable=@processable,processingStage=@Stage, processingStatus=@status, processingMessage=@Message where ticketNumber = @ticketNumber

GO
/****** Object:  StoredProcedure [dbo].[UnprocessFile]    Script Date: 08/04/2020 11:45:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[UnprocessFile](@ticketNumber char(8), @fileNumber integer)AS 

delete TOP (500) from PrinterPiece where ticketNumber=@ticketNumber and fileNumber=@fileNumber
while @@rowcount > 0
begin
   delete TOP (500) from PrinterPiece where ticketNumber=@ticketNumber and fileNumber=@fileNumber
end

delete from PrinterSegment where ticketNumber=@ticketNumber and fileNumber=@fileNumber
delete from InserterOutputGroup where ticketNumber=@ticketNumber and fileNumber=@fileNumber
delete from PrinterOutputGroup where ticketNumber=@ticketNumber and fileNumber=@fileNumber
delete from CountAdjustment where ticketNumber=@ticketNumber and fileNumber=@fileNumber
delete from Processing where ticketNumber=@ticketNumber and fileNumber=@fileNumber

UPDATE datafile
SET	processingStage = 'UNPR', 
	processingStatus = 'N/A', 
	tsProcessingStarted = NULL,
	tsProcessingEnded = NULL,
	tsProcessingStarted2 = NULL,
	tsProcessingEnded2 = NULL,
	processedOn = ''
WHERE ticketNumber=@ticketNumber and fileNumber=@fileNumber

exec SetTicketStatus @ticketNumber



GO
/****** Object:  StoredProcedure [dbo].[WorkOrderComplete]    Script Date: 08/04/2020 11:45:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[WorkOrderComplete]	@ticketNumber [varchar](8)
WITH EXECUTE AS CALLER
AS
/* set the ticket status and stage based on receipt of file via web/ftp and process steps through scan programs*/
DECLARE @status VARCHAR(4)
DECLARE @message VARCHAR(255)

BEGIN TRANSACTION
SELECT @status = processingStatus,@message=processingMessage from ticket where ticketNumber=@ticketNumber

if (@Status = 'WXFR')
  BEGIN
	SET @Status = 'WWRK'
	SET @Message = 'Work Order completed. Pending Remote FTP scan'
	GOTO DONE
  END
if (@Status = 'WFTP')
  BEGIN
	SET @Status = 'WPND'
	SET @Message = 'Work Order completed, Pending InBox scan'
	GOTO DONE
  END

DONE:
UPDATE ticket set processingStatus = @Status, processingMessage = @Message where ticketNumber = @ticketNumber
COMMIT TRANSACTION

GO
