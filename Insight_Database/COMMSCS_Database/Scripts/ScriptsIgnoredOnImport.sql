USE [COMMSCS]
GO
/****** Object:  User [demoadminuser]    Script Date: 08/04/2020 11:46:23 ******/
CREATE USER [demoadminuser] FOR LOGIN [demoadminuser] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [demodevuser]    Script Date: 08/04/2020 11:46:23 ******/
CREATE USER [demodevuser] FOR LOGIN [demodevuser] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [FrameworkApplication]    Script Date: 08/04/2020 11:46:23 ******/
CREATE USER [FrameworkApplication] FOR LOGIN [FrameworkApplication] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [OPERATIONS\tsnowden2]    Script Date: 08/04/2020 11:46:23 ******/
CREATE USER [OPERATIONS\tsnowden2] FOR LOGIN [OPERATIONS\tsnowden2] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [SERVICES\Abhishek.Sahu]    Script Date: 08/04/2020 11:46:23 ******/
CREATE USER [SERVICES\Abhishek.Sahu] FOR LOGIN [SERVICES\Abhishek.Sahu] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [SERVICES\Vikas.Semra1]    Script Date: 08/04/2020 11:46:23 ******/
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
/****** Object:  Table [dbo].[scsActivityLog]    Script Date: 08/04/2020 11:46:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[scsActivityLog](
	[activityID] [uniqueidentifier] NOT NULL,
	[clientCode] [varchar](10) NOT NULL,
	[tsActivity] [datetime] NOT NULL,
	[userId] [varchar](100) NOT NULL,
	[notes] [varchar](7000) NOT NULL,
	[msrepl_tran_version] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_scsActivityLog] PRIMARY KEY CLUSTERED 
(
	[activityID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[scsApplication]    Script Date: 08/04/2020 11:46:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[scsApplication](
	[applicationCode] [varchar](20) NOT NULL,
	[clientCode] [varchar](10) NOT NULL,
	[dataSourceId] [uniqueidentifier] NULL,
	[applicationName] [varchar](100) NOT NULL,
	[active] [char](1) NOT NULL,
	[notes] [varchar](500) NOT NULL,
	[messagesPerDocument] [char](1) NOT NULL,
	[sampleDataMax] [int] NOT NULL,
	[msrepl_tran_version] [uniqueidentifier] NOT NULL,
	[applicationVersion] [int] NOT NULL,
 CONSTRAINT [PKscsSetup] PRIMARY KEY CLUSTERED 
(
	[applicationCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[scsApplicationTarget]    Script Date: 08/04/2020 11:46:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[scsApplicationTarget](
	[targetID] [uniqueidentifier] NOT NULL,
	[applicationCode] [varchar](20) NOT NULL,
	[sequence] [int] NOT NULL,
	[targetCode] [varchar](50) NOT NULL,
	[targetName] [varchar](500) NOT NULL,
	[messageAreaWidth] [money] NOT NULL,
	[messageAreaHeight] [money] NOT NULL,
	[msrepl_tran_version] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_scsApplicationTarget_1] PRIMARY KEY CLUSTERED 
(
	[targetID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[scsCampaign]    Script Date: 08/04/2020 11:46:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[scsCampaign](
	[campaignId] [uniqueidentifier] NOT NULL,
	[applicationCode] [varchar](20) NOT NULL,
	[effectiveDate] [datetime] NOT NULL,
	[useEnvelopeMessaging] [char](1) NOT NULL,
	[defaultEnvMsgID] [int] NOT NULL,
	[envMsgColor] [char](1) NOT NULL,
	[accumulateMessages] [char](1) NOT NULL,
	[failIfNoMessage] [char](1) NOT NULL,
	[stage] [varchar](4) NOT NULL,
	[mode] [char](1) NOT NULL,
	[QA] [char](1) NOT NULL,
	[notes] [varchar](500) NOT NULL,
	[msrepl_tran_version] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PKscsProgram] PRIMARY KEY CLUSTERED 
(
	[campaignId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[scsCampaignSampleData]    Script Date: 08/04/2020 11:46:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[scsCampaignSampleData](
	[campaignSampleDataId] [uniqueidentifier] NOT NULL,
	[applicationCode] [varchar](20) NOT NULL,
	[tsCreated] [datetime] NOT NULL,
	[ticketNumber] [char](8) NOT NULL,
	[fileNumber] [int] NOT NULL,
	[fileName] [varchar](200) NOT NULL,
	[msrepl_tran_version] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_scsCampaignSampleData] PRIMARY KEY CLUSTERED 
(
	[campaignSampleDataId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[scsCampaignSampleDataItem]    Script Date: 08/04/2020 11:46:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[scsCampaignSampleDataItem](
	[campaignSampleDataItemID] [uniqueidentifier] NOT NULL,
	[campaignSampleDataID] [uniqueidentifier] NOT NULL,
	[accountNumber] [varchar](100) NOT NULL,
	[SLCTdata] [varchar](5000) NOT NULL,
	[msrepl_tran_version] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_scsCampaignSampleDataItem] PRIMARY KEY CLUSTERED 
(
	[campaignSampleDataItemID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[scsCampaignTarget]    Script Date: 08/04/2020 11:46:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[scsCampaignTarget](
	[campaignId] [uniqueidentifier] NOT NULL,
	[targetID] [uniqueidentifier] NOT NULL,
	[msrepl_tran_version] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_scsCampaignTarget] PRIMARY KEY CLUSTERED 
(
	[campaignId] ASC,
	[targetID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[scsCompoundFilter]    Script Date: 08/04/2020 11:46:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[scsCompoundFilter](
	[filterIdOwner] [uniqueidentifier] NOT NULL,
	[filterIdMember] [uniqueidentifier] NOT NULL,
	[msrepl_tran_version] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_scsCompoundFilter] PRIMARY KEY CLUSTERED 
(
	[filterIdOwner] ASC,
	[filterIdMember] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[scsDataSource]    Script Date: 08/04/2020 11:46:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[scsDataSource](
	[dataSourceId] [uniqueidentifier] NOT NULL,
	[clientCode] [varchar](10) NOT NULL,
	[sourceName] [varchar](100) NOT NULL,
	[notes] [varchar](1000) NOT NULL,
	[msrepl_tran_version] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PKscsDataSource] PRIMARY KEY CLUSTERED 
(
	[dataSourceId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[scsError]    Script Date: 08/04/2020 11:46:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[scsError](
	[errorID] [uniqueidentifier] NOT NULL,
	[tsError] [datetime] NOT NULL,
	[errorMessage] [nvarchar](3800) NOT NULL,
	[msrepl_tran_version] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_scsError] PRIMARY KEY CLUSTERED 
(
	[errorID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[scsField]    Script Date: 08/04/2020 11:46:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[scsField](
	[fieldId] [uniqueidentifier] NOT NULL,
	[dataSourceId] [uniqueidentifier] NOT NULL,
	[displayName] [varchar](100) NOT NULL,
	[dataName] [varchar](50) NOT NULL,
	[dataType] [char](1) NOT NULL,
	[optional] [char](1) NOT NULL,
	[source] [varchar](500) NOT NULL,
	[minLength] [int] NOT NULL,
	[maxLength] [int] NOT NULL,
	[msrepl_tran_version] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PKscsField] PRIMARY KEY CLUSTERED 
(
	[fieldId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[scsField#ValueList]    Script Date: 08/04/2020 11:46:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[scsField#ValueList](
	[fieldId] [uniqueidentifier] NOT NULL,
	[valueListId] [uniqueidentifier] NOT NULL,
	[exclusive] [char](1) NOT NULL,
	[validate] [char](1) NOT NULL,
	[msrepl_tran_version] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PKscsField#ValueList] PRIMARY KEY CLUSTERED 
(
	[fieldId] ASC,
	[valueListId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[scsFilter]    Script Date: 08/04/2020 11:46:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[scsFilter](
	[filterId] [uniqueidentifier] NOT NULL,
	[dataSourceId] [uniqueidentifier] NOT NULL,
	[filterName] [varchar](100) NOT NULL,
	[andOr] [char](1) NOT NULL,
	[filterType] [char](1) NOT NULL,
	[notes] [varchar](500) NOT NULL,
	[msrepl_tran_version] [uniqueidentifier] NOT NULL,
	[enabled] [char](1) NOT NULL,
 CONSTRAINT [PKscsFilter] PRIMARY KEY CLUSTERED 
(
	[filterId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[scsFilterCriteria]    Script Date: 08/04/2020 11:46:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[scsFilterCriteria](
	[filterCriteriaId] [uniqueidentifier] NOT NULL,
	[filterId] [uniqueidentifier] NOT NULL,
	[fieldId] [uniqueidentifier] NOT NULL,
	[operator] [varchar](20) NOT NULL,
	[value1] [varchar](100) NOT NULL,
	[value2] [varchar](100) NOT NULL,
	[valueList] [varchar](5000) NOT NULL,
	[msrepl_tran_version] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PKscsFilterCriteria] PRIMARY KEY CLUSTERED 
(
	[filterCriteriaId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[scsPackage]    Script Date: 08/04/2020 11:46:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[scsPackage](
	[packageId] [uniqueidentifier] NOT NULL,
	[schemeId] [uniqueidentifier] NOT NULL,
	[campaignID] [uniqueidentifier] NOT NULL,
	[packageName] [varchar](100) NOT NULL,
	[sequence] [int] NOT NULL,
	[invMsgId] [varchar](20) NOT NULL,
	[envMsgId] [int] NOT NULL,
	[continueFlag] [char](1) NOT NULL,
	[keepTogether] [char](1) NOT NULL,
	[msrepl_tran_version] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PKscsPackage] PRIMARY KEY CLUSTERED 
(
	[packageId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[scsPackageFilter]    Script Date: 08/04/2020 11:46:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[scsPackageFilter](
	[filterId] [uniqueidentifier] NOT NULL,
	[packageId] [uniqueidentifier] NOT NULL,
	[campaignID] [uniqueidentifier] NOT NULL,
	[msrepl_tran_version] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PKscsPackageFilter] PRIMARY KEY CLUSTERED 
(
	[filterId] ASC,
	[packageId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[scsPackageInsert]    Script Date: 08/04/2020 11:46:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[scsPackageInsert](
	[packageId] [uniqueidentifier] NOT NULL,
	[inventoryID] [int] NOT NULL,
	[campaignID] [uniqueidentifier] NOT NULL,
	[msrepl_tran_version] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PKscsPackageInsert] PRIMARY KEY CLUSTERED 
(
	[packageId] ASC,
	[inventoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[scsScheme]    Script Date: 08/04/2020 11:46:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[scsScheme](
	[schemeId] [uniqueidentifier] NOT NULL,
	[campaignId] [uniqueidentifier] NOT NULL,
	[schemeName] [varchar](100) NOT NULL,
	[sequence] [int] NOT NULL,
	[msrepl_tran_version] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PKscsScheme] PRIMARY KEY CLUSTERED 
(
	[schemeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[scsSession]    Script Date: 08/04/2020 11:46:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[scsSession](
	[sessionID] [uniqueidentifier] NOT NULL,
	[tsCreated] [datetime] NOT NULL,
	[userId] [varchar](200) NOT NULL,
	[clientCode] [varchar](10) NOT NULL,
	[otherData] [varchar](1000) NOT NULL,
	[msrepl_tran_version] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_scsSession] PRIMARY KEY CLUSTERED 
(
	[sessionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[scsTargetMessage]    Script Date: 08/04/2020 11:46:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[scsTargetMessage](
	[targetMessageId] [uniqueidentifier] NOT NULL,
	[campaignID] [uniqueidentifier] NOT NULL,
	[targetID] [uniqueidentifier] NOT NULL,
	[sequence] [int] NOT NULL,
	[invMsgId] [varchar](20) NOT NULL,
	[action] [char](1) NOT NULL,
	[msrepl_tran_version] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_scsTargetMessage] PRIMARY KEY CLUSTERED 
(
	[targetMessageId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[scsTargetMessageFilter]    Script Date: 08/04/2020 11:46:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[scsTargetMessageFilter](
	[filterId] [uniqueidentifier] NOT NULL,
	[targetMessageId] [uniqueidentifier] NOT NULL,
	[campaignID] [uniqueidentifier] NOT NULL,
	[msrepl_tran_version] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PKscsTargetMessageFilter] PRIMARY KEY CLUSTERED 
(
	[filterId] ASC,
	[targetMessageId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[scsValueList]    Script Date: 08/04/2020 11:46:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[scsValueList](
	[valueListId] [uniqueidentifier] NOT NULL,
	[clientCode] [varchar](10) NOT NULL,
	[listName] [varchar](100) NOT NULL,
	[minLength] [int] NOT NULL,
	[maxLength] [int] NOT NULL,
	[notes] [varchar](1000) NOT NULL,
	[msrepl_tran_version] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PKscsValueList] PRIMARY KEY CLUSTERED 
(
	[valueListId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[scsValueListItem]    Script Date: 08/04/2020 11:46:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[scsValueListItem](
	[valueListId] [uniqueidentifier] NOT NULL,
	[itemValue] [varchar](100) NOT NULL,
	[itemDescription] [varchar](1000) NOT NULL,
	[msrepl_tran_version] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PKscsValueListItem] PRIMARY KEY CLUSTERED 
(
	[valueListId] ASC,
	[itemValue] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[scsActivityLog] ADD  CONSTRAINT [DF_scsActivityLog_activityID]  DEFAULT (newid()) FOR [activityID]
GO
ALTER TABLE [dbo].[scsActivityLog] ADD  CONSTRAINT [DF__scsActivi__tsAct__4DB4832C]  DEFAULT (getdate()) FOR [tsActivity]
GO
ALTER TABLE [dbo].[scsActivityLog] ADD  CONSTRAINT [MSrepl_tran_version_default_0F4E6A49_DF06_467E_8A43_DA86A65288C2_1319675749]  DEFAULT (newid()) FOR [msrepl_tran_version]
GO
ALTER TABLE [dbo].[scsApplication] ADD  CONSTRAINT [DF__scsSetup__notes__467D75B8]  DEFAULT ('') FOR [notes]
GO
ALTER TABLE [dbo].[scsApplication] ADD  CONSTRAINT [DF_scsApplication_messageMode]  DEFAULT ('1') FOR [messagesPerDocument]
GO
ALTER TABLE [dbo].[scsApplication] ADD  CONSTRAINT [DF_scsApplication_sampleDataMax]  DEFAULT ((5)) FOR [sampleDataMax]
GO
ALTER TABLE [dbo].[scsApplication] ADD  CONSTRAINT [MSrepl_tran_version_default_60F67493_18E7_46B0_BF18_501D573833DE_375672386]  DEFAULT (newid()) FOR [msrepl_tran_version]
GO
ALTER TABLE [dbo].[scsApplication] ADD  CONSTRAINT [DF_scsApplication_version]  DEFAULT ((1)) FOR [applicationVersion]
GO
ALTER TABLE [dbo].[scsApplicationTarget] ADD  CONSTRAINT [DF_scsApplicationTarget_targetID]  DEFAULT (newid()) FOR [targetID]
GO
ALTER TABLE [dbo].[scsApplicationTarget] ADD  CONSTRAINT [DF_scsApplicationTarget_sequence]  DEFAULT ((1)) FOR [sequence]
GO
ALTER TABLE [dbo].[scsApplicationTarget] ADD  CONSTRAINT [DF_scsApplicationTarget_messageAreaWidth]  DEFAULT ((0)) FOR [messageAreaWidth]
GO
ALTER TABLE [dbo].[scsApplicationTarget] ADD  CONSTRAINT [DF_scsApplicationTarget_messageAreaHeight]  DEFAULT ((0)) FOR [messageAreaHeight]
GO
ALTER TABLE [dbo].[scsApplicationTarget] ADD  CONSTRAINT [MSrepl_tran_version_default_77F6A542_40AE_458E_B0DF_2B0453728D79_793769885]  DEFAULT (newid()) FOR [msrepl_tran_version]
GO
ALTER TABLE [dbo].[scsCampaign] ADD  CONSTRAINT [DF__scsProgra__progr__55BFB948]  DEFAULT (newid()) FOR [campaignId]
GO
ALTER TABLE [dbo].[scsCampaign] ADD  CONSTRAINT [DF_scsProgram_envelopeMessaging]  DEFAULT ('N') FOR [useEnvelopeMessaging]
GO
ALTER TABLE [dbo].[scsCampaign] ADD  CONSTRAINT [DF_scsProgram_defaultEnvMsgID]  DEFAULT ((0)) FOR [defaultEnvMsgID]
GO
ALTER TABLE [dbo].[scsCampaign] ADD  CONSTRAINT [DF_scsProgram_envMsgCOlor]  DEFAULT ('M') FOR [envMsgColor]
GO
ALTER TABLE [dbo].[scsCampaign] ADD  CONSTRAINT [DF_scsProgram_packageHandling]  DEFAULT ('N') FOR [accumulateMessages]
GO
ALTER TABLE [dbo].[scsCampaign] ADD  CONSTRAINT [DF_scsCampaign_failIfNoMessage]  DEFAULT ('N') FOR [failIfNoMessage]
GO
ALTER TABLE [dbo].[scsCampaign] ADD  CONSTRAINT [DF_scsProgram_mode]  DEFAULT ('A') FOR [mode]
GO
ALTER TABLE [dbo].[scsCampaign] ADD  CONSTRAINT [DF__scsProgra__notes__56B3DD81]  DEFAULT ('') FOR [notes]
GO
ALTER TABLE [dbo].[scsCampaign] ADD  CONSTRAINT [MSrepl_tran_version_default_6AFD2FFD_101B_4166_84DF_E73B39E18155_775673811]  DEFAULT (newid()) FOR [msrepl_tran_version]
GO
ALTER TABLE [dbo].[scsCampaignSampleData] ADD  CONSTRAINT [DF__scsCampai__campa__75E27017]  DEFAULT (newid()) FOR [campaignSampleDataId]
GO
ALTER TABLE [dbo].[scsCampaignSampleData] ADD  CONSTRAINT [DF_scsCampaignSampleData_tsCreated]  DEFAULT (getdate()) FOR [tsCreated]
GO
ALTER TABLE [dbo].[scsCampaignSampleData] ADD  CONSTRAINT [MSrepl_tran_version_default_E6306739_BCC3_4267_B9AD_2F6FAA5C298F_182291709]  DEFAULT (newid()) FOR [msrepl_tran_version]
GO
ALTER TABLE [dbo].[scsCampaignSampleDataItem] ADD  CONSTRAINT [DF_scsCampaignSampleDataItem_campaignSampleDataItemID]  DEFAULT (newid()) FOR [campaignSampleDataItemID]
GO
ALTER TABLE [dbo].[scsCampaignSampleDataItem] ADD  CONSTRAINT [MSrepl_tran_version_default_74401B30_EE76_4681_8AB9_1CAE7CDD453B_2041774331]  DEFAULT (newid()) FOR [msrepl_tran_version]
GO
ALTER TABLE [dbo].[scsCampaignTarget] ADD  CONSTRAINT [MSrepl_tran_version_default_FC6B346D_FE69_4E80_A68A_AAE3BEEB7018_1981250113]  DEFAULT (newid()) FOR [msrepl_tran_version]
GO
ALTER TABLE [dbo].[scsCompoundFilter] ADD  CONSTRAINT [MSrepl_tran_version_default_6342ADA2_9A25_438F_93BD_A5D64F9F01C7_1821249543]  DEFAULT (newid()) FOR [msrepl_tran_version]
GO
ALTER TABLE [dbo].[scsDataSource] ADD  CONSTRAINT [DF__scsDataSo__dataS__3EDC53F0]  DEFAULT (newid()) FOR [dataSourceId]
GO
ALTER TABLE [dbo].[scsDataSource] ADD  CONSTRAINT [DF__scsDataSo__notes__3FD07829]  DEFAULT ('') FOR [notes]
GO
ALTER TABLE [dbo].[scsDataSource] ADD  CONSTRAINT [MSrepl_tran_version_default_9EF34EA4_7CFE_4AD7_A62D_01F8FD7A65EB_455672671]  DEFAULT (newid()) FOR [msrepl_tran_version]
GO
ALTER TABLE [dbo].[scsError] ADD  CONSTRAINT [DF_scsError_tsError]  DEFAULT (getdate()) FOR [tsError]
GO
ALTER TABLE [dbo].[scsError] ADD  CONSTRAINT [MSrepl_tran_version_default_45971009_1025_41AF_8492_19FB60EDAEE7_727673640]  DEFAULT (newid()) FOR [msrepl_tran_version]
GO
ALTER TABLE [dbo].[scsField] ADD  CONSTRAINT [DF__scsField__fieldI__42ACE4D4]  DEFAULT (newid()) FOR [fieldId]
GO
ALTER TABLE [dbo].[scsField] ADD  CONSTRAINT [DF_scsField_displayName]  DEFAULT ('') FOR [displayName]
GO
ALTER TABLE [dbo].[scsField] ADD  CONSTRAINT [DF_scsField_notes]  DEFAULT ('') FOR [source]
GO
ALTER TABLE [dbo].[scsField] ADD  CONSTRAINT [DF_scsField_minLength]  DEFAULT ((0)) FOR [minLength]
GO
ALTER TABLE [dbo].[scsField] ADD  CONSTRAINT [DF_scsField_maxLength]  DEFAULT ((0)) FOR [maxLength]
GO
ALTER TABLE [dbo].[scsField] ADD  CONSTRAINT [MSrepl_tran_version_default_1388D710_E46E_467B_A027_72C952BF00E5_151671588]  DEFAULT (newid()) FOR [msrepl_tran_version]
GO
ALTER TABLE [dbo].[scsField#ValueList] ADD  CONSTRAINT [DF_scsField#ValueList_validate]  DEFAULT ('N') FOR [validate]
GO
ALTER TABLE [dbo].[scsField#ValueList] ADD  CONSTRAINT [MSrepl_tran_version_default_629EF2BD_F000_4D14_85D0_79FCCA97CD92_905770284]  DEFAULT (newid()) FOR [msrepl_tran_version]
GO
ALTER TABLE [dbo].[scsFilter] ADD  CONSTRAINT [DF__scsFilter__filte__4A4E069C]  DEFAULT (newid()) FOR [filterId]
GO
ALTER TABLE [dbo].[scsFilter] ADD  CONSTRAINT [DF_scsFilter_andOrType]  DEFAULT ('A') FOR [andOr]
GO
ALTER TABLE [dbo].[scsFilter] ADD  CONSTRAINT [DF_scsFilter_filterType]  DEFAULT ('S') FOR [filterType]
GO
ALTER TABLE [dbo].[scsFilter] ADD  CONSTRAINT [DF__scsFilter__notes__4B422AD5]  DEFAULT ('') FOR [notes]
GO
ALTER TABLE [dbo].[scsFilter] ADD  CONSTRAINT [MSrepl_tran_version_default_769561A2_3C75_48DF_8CF2_5BA88E5DC518_1095674951]  DEFAULT (newid()) FOR [msrepl_tran_version]
GO
ALTER TABLE [dbo].[scsFilter] ADD  CONSTRAINT [DF_scsFilter_enabled]  DEFAULT ('Y') FOR [enabled]
GO
ALTER TABLE [dbo].[scsFilterCriteria] ADD  CONSTRAINT [DF_scsFilterCriteria_filterCriteriaId]  DEFAULT (newid()) FOR [filterCriteriaId]
GO
ALTER TABLE [dbo].[scsFilterCriteria] ADD  CONSTRAINT [DF__scsFilter__value__4F12BBB9]  DEFAULT ('') FOR [value1]
GO
ALTER TABLE [dbo].[scsFilterCriteria] ADD  CONSTRAINT [DF__scsFilter__value__5006DFF2]  DEFAULT ('') FOR [value2]
GO
ALTER TABLE [dbo].[scsFilterCriteria] ADD  CONSTRAINT [DF__scsFilter__value__50FB042B]  DEFAULT ('') FOR [valueList]
GO
ALTER TABLE [dbo].[scsFilterCriteria] ADD  CONSTRAINT [MSrepl_tran_version_default_29193225_A875_40D3_BCF3_3401A315A755_951674438]  DEFAULT (newid()) FOR [msrepl_tran_version]
GO
ALTER TABLE [dbo].[scsPackage] ADD  CONSTRAINT [DF__scsPackag__packa__5D60DB10]  DEFAULT (newid()) FOR [packageId]
GO
ALTER TABLE [dbo].[scsPackage] ADD  CONSTRAINT [DF__scsPackag__prior__5E54FF49]  DEFAULT ((1)) FOR [sequence]
GO
ALTER TABLE [dbo].[scsPackage] ADD  CONSTRAINT [DF__scsPackag__invMs__5F492382]  DEFAULT ('') FOR [invMsgId]
GO
ALTER TABLE [dbo].[scsPackage] ADD  CONSTRAINT [DF__scsPackag__ievMs__603D47BB]  DEFAULT ((0)) FOR [envMsgId]
GO
ALTER TABLE [dbo].[scsPackage] ADD  CONSTRAINT [DF_scsPackage_continueFlag]  DEFAULT ('Y') FOR [continueFlag]
GO
ALTER TABLE [dbo].[scsPackage] ADD  CONSTRAINT [DF_scsPackage_keepTogether]  DEFAULT ('Y') FOR [keepTogether]
GO
ALTER TABLE [dbo].[scsPackage] ADD  CONSTRAINT [MSrepl_tran_version_default_08E1089C_0D2B_4A2F_864A_068469BE5DE1_1979154096]  DEFAULT (newid()) FOR [msrepl_tran_version]
GO
ALTER TABLE [dbo].[scsPackageFilter] ADD  CONSTRAINT [MSrepl_tran_version_default_B0535358_00C6_450D_B7FF_A7180F7A2780_1710629137]  DEFAULT (newid()) FOR [msrepl_tran_version]
GO
ALTER TABLE [dbo].[scsPackageInsert] ADD  CONSTRAINT [MSrepl_tran_version_default_A66220E2_9A3D_4C78_AF79_606D74835E6B_1339151816]  DEFAULT (newid()) FOR [msrepl_tran_version]
GO
ALTER TABLE [dbo].[scsScheme] ADD  CONSTRAINT [DF__scsScheme__schem__45544755]  DEFAULT (newid()) FOR [schemeId]
GO
ALTER TABLE [dbo].[scsScheme] ADD  CONSTRAINT [DF__scsScheme__seque__46486B8E]  DEFAULT ((1)) FOR [sequence]
GO
ALTER TABLE [dbo].[scsScheme] ADD  CONSTRAINT [MSrepl_tran_version_default_DB92EC56_772A_452C_AD39_0234A79E9C5A_1131151075]  DEFAULT (newid()) FOR [msrepl_tran_version]
GO
ALTER TABLE [dbo].[scsSession] ADD  DEFAULT (getdate()) FOR [tsCreated]
GO
ALTER TABLE [dbo].[scsSession] ADD  CONSTRAINT [DF_scsSession_otherData]  DEFAULT ('') FOR [otherData]
GO
ALTER TABLE [dbo].[scsSession] ADD  CONSTRAINT [MSrepl_tran_version_default_92009E3A_3AED_48BA_8EC2_19EFA0A576B2_1223675407]  DEFAULT (newid()) FOR [msrepl_tran_version]
GO
ALTER TABLE [dbo].[scsTargetMessage] ADD  CONSTRAINT [DF__scsTarget__targe__4D1564AE]  DEFAULT (newid()) FOR [targetMessageId]
GO
ALTER TABLE [dbo].[scsTargetMessage] ADD  CONSTRAINT [DF__scsTarget__seque__4E0988E7]  DEFAULT ((1)) FOR [sequence]
GO
ALTER TABLE [dbo].[scsTargetMessage] ADD  CONSTRAINT [DF__scsTarget__invMs__4EFDAD20]  DEFAULT ('') FOR [invMsgId]
GO
ALTER TABLE [dbo].[scsTargetMessage] ADD  CONSTRAINT [DF_scsTargetMessage_action]  DEFAULT ('C') FOR [action]
GO
ALTER TABLE [dbo].[scsTargetMessage] ADD  CONSTRAINT [MSrepl_tran_version_default_25DAEFEA_9AA3_41A3_AB5E_FC425F1C8834_2029250284]  DEFAULT (newid()) FOR [msrepl_tran_version]
GO
ALTER TABLE [dbo].[scsTargetMessageFilter] ADD  CONSTRAINT [MSrepl_tran_version_default_E8E091FA_CADB_4E71_A192_0B182D04D8A0_1373247947]  DEFAULT (newid()) FOR [msrepl_tran_version]
GO
ALTER TABLE [dbo].[scsValueList] ADD  CONSTRAINT [DF__scsValueL__value__149C0161]  DEFAULT (newid()) FOR [valueListId]
GO
ALTER TABLE [dbo].[scsValueList] ADD  CONSTRAINT [DF_scsValueList_minLength]  DEFAULT ((0)) FOR [minLength]
GO
ALTER TABLE [dbo].[scsValueList] ADD  CONSTRAINT [DF_scsValueList_maxLength]  DEFAULT ((0)) FOR [maxLength]
GO
ALTER TABLE [dbo].[scsValueList] ADD  CONSTRAINT [DF__scsValueL__notes__1590259A]  DEFAULT ('') FOR [notes]
GO
ALTER TABLE [dbo].[scsValueList] ADD  CONSTRAINT [MSrepl_tran_version_default_9D1F0DE0_CD73_4505_BCFD_810C424FB0B4_985770569]  DEFAULT (newid()) FOR [msrepl_tran_version]
GO
ALTER TABLE [dbo].[scsValueListItem] ADD  DEFAULT (newid()) FOR [valueListId]
GO
ALTER TABLE [dbo].[scsValueListItem] ADD  DEFAULT ('') FOR [itemDescription]
GO
ALTER TABLE [dbo].[scsValueListItem] ADD  CONSTRAINT [MSrepl_tran_version_default_1B89A020_71EC_4A8B_BC2E_2B200C66E99C_377768403]  DEFAULT (newid()) FOR [msrepl_tran_version]
GO
ALTER TABLE [dbo].[scsApplication]  WITH NOCHECK ADD  CONSTRAINT [FKscsSetup#scsDataSource] FOREIGN KEY([dataSourceId])
REFERENCES [dbo].[scsDataSource] ([dataSourceId])
GO
ALTER TABLE [dbo].[scsApplication] CHECK CONSTRAINT [FKscsSetup#scsDataSource]
GO
ALTER TABLE [dbo].[scsApplicationTarget]  WITH CHECK ADD  CONSTRAINT [FK_scsApplicationTarget_scsApplication] FOREIGN KEY([applicationCode])
REFERENCES [dbo].[scsApplication] ([applicationCode])
GO
ALTER TABLE [dbo].[scsApplicationTarget] CHECK CONSTRAINT [FK_scsApplicationTarget_scsApplication]
GO
ALTER TABLE [dbo].[scsCampaign]  WITH NOCHECK ADD  CONSTRAINT [FKscsProgram#scsSetup] FOREIGN KEY([applicationCode])
REFERENCES [dbo].[scsApplication] ([applicationCode])
GO
ALTER TABLE [dbo].[scsCampaign] CHECK CONSTRAINT [FKscsProgram#scsSetup]
GO
ALTER TABLE [dbo].[scsCampaignSampleData]  WITH CHECK ADD  CONSTRAINT [FK_scsCampaignSampleData_scsApplication] FOREIGN KEY([applicationCode])
REFERENCES [dbo].[scsApplication] ([applicationCode])
GO
ALTER TABLE [dbo].[scsCampaignSampleData] CHECK CONSTRAINT [FK_scsCampaignSampleData_scsApplication]
GO
ALTER TABLE [dbo].[scsCampaignSampleDataItem]  WITH CHECK ADD  CONSTRAINT [FK_scsCampaignSampleDataItem_scsCampaignSampleData] FOREIGN KEY([campaignSampleDataID])
REFERENCES [dbo].[scsCampaignSampleData] ([campaignSampleDataId])
GO
ALTER TABLE [dbo].[scsCampaignSampleDataItem] CHECK CONSTRAINT [FK_scsCampaignSampleDataItem_scsCampaignSampleData]
GO
ALTER TABLE [dbo].[scsCampaignTarget]  WITH CHECK ADD  CONSTRAINT [FK_scsCampaignTarget_scsCampaign] FOREIGN KEY([campaignId])
REFERENCES [dbo].[scsCampaign] ([campaignId])
GO
ALTER TABLE [dbo].[scsCampaignTarget] CHECK CONSTRAINT [FK_scsCampaignTarget_scsCampaign]
GO
ALTER TABLE [dbo].[scsCompoundFilter]  WITH CHECK ADD  CONSTRAINT [FK_scsCompoundFilter_scsFilter] FOREIGN KEY([filterIdOwner])
REFERENCES [dbo].[scsFilter] ([filterId])
GO
ALTER TABLE [dbo].[scsCompoundFilter] CHECK CONSTRAINT [FK_scsCompoundFilter_scsFilter]
GO
ALTER TABLE [dbo].[scsCompoundFilter]  WITH CHECK ADD  CONSTRAINT [FK_scsCompoundFilter_scsFilter1] FOREIGN KEY([filterIdMember])
REFERENCES [dbo].[scsFilter] ([filterId])
GO
ALTER TABLE [dbo].[scsCompoundFilter] CHECK CONSTRAINT [FK_scsCompoundFilter_scsFilter1]
GO
ALTER TABLE [dbo].[scsField]  WITH NOCHECK ADD  CONSTRAINT [FKscsField#scsDataSource] FOREIGN KEY([dataSourceId])
REFERENCES [dbo].[scsDataSource] ([dataSourceId])
GO
ALTER TABLE [dbo].[scsField] CHECK CONSTRAINT [FKscsField#scsDataSource]
GO
ALTER TABLE [dbo].[scsFilterCriteria]  WITH NOCHECK ADD  CONSTRAINT [FKscsFilterCriteria#scsField] FOREIGN KEY([fieldId])
REFERENCES [dbo].[scsField] ([fieldId])
GO
ALTER TABLE [dbo].[scsFilterCriteria] CHECK CONSTRAINT [FKscsFilterCriteria#scsField]
GO
ALTER TABLE [dbo].[scsFilterCriteria]  WITH NOCHECK ADD  CONSTRAINT [FKscsFilterCriteria#scsFilter] FOREIGN KEY([filterId])
REFERENCES [dbo].[scsFilter] ([filterId])
GO
ALTER TABLE [dbo].[scsFilterCriteria] CHECK CONSTRAINT [FKscsFilterCriteria#scsFilter]
GO
ALTER TABLE [dbo].[scsPackage]  WITH NOCHECK ADD  CONSTRAINT [FKscsPackage#scsScheme] FOREIGN KEY([schemeId])
REFERENCES [dbo].[scsScheme] ([schemeId])
GO
ALTER TABLE [dbo].[scsPackage] CHECK CONSTRAINT [FKscsPackage#scsScheme]
GO
ALTER TABLE [dbo].[scsPackageFilter]  WITH NOCHECK ADD  CONSTRAINT [FKscsPackageFilter#scsPackage] FOREIGN KEY([packageId])
REFERENCES [dbo].[scsPackage] ([packageId])
GO
ALTER TABLE [dbo].[scsPackageFilter] CHECK CONSTRAINT [FKscsPackageFilter#scsPackage]
GO
ALTER TABLE [dbo].[scsPackageFilter]  WITH NOCHECK ADD  CONSTRAINT [FKscsPackageFilterCriteria#scsFilter] FOREIGN KEY([filterId])
REFERENCES [dbo].[scsFilter] ([filterId])
GO
ALTER TABLE [dbo].[scsPackageFilter] CHECK CONSTRAINT [FKscsPackageFilterCriteria#scsFilter]
GO
ALTER TABLE [dbo].[scsPackageInsert]  WITH NOCHECK ADD  CONSTRAINT [FKscsPackageInsert#scsPackage] FOREIGN KEY([packageId])
REFERENCES [dbo].[scsPackage] ([packageId])
GO
ALTER TABLE [dbo].[scsPackageInsert] CHECK CONSTRAINT [FKscsPackageInsert#scsPackage]
GO
ALTER TABLE [dbo].[scsScheme]  WITH CHECK ADD  CONSTRAINT [FK_scsScheme_scsCampaign] FOREIGN KEY([campaignId])
REFERENCES [dbo].[scsCampaign] ([campaignId])
GO
ALTER TABLE [dbo].[scsScheme] CHECK CONSTRAINT [FK_scsScheme_scsCampaign]
GO
ALTER TABLE [dbo].[scsTargetMessage]  WITH CHECK ADD  CONSTRAINT [FK_scsTargetMessage_scsCampaignTarget] FOREIGN KEY([campaignID], [targetID])
REFERENCES [dbo].[scsCampaignTarget] ([campaignId], [targetID])
GO
ALTER TABLE [dbo].[scsTargetMessage] CHECK CONSTRAINT [FK_scsTargetMessage_scsCampaignTarget]
GO
ALTER TABLE [dbo].[scsTargetMessageFilter]  WITH CHECK ADD  CONSTRAINT [FK_scsTargetMessageFilter_scsFilter] FOREIGN KEY([filterId])
REFERENCES [dbo].[scsFilter] ([filterId])
GO
ALTER TABLE [dbo].[scsTargetMessageFilter] CHECK CONSTRAINT [FK_scsTargetMessageFilter_scsFilter]
GO
ALTER TABLE [dbo].[scsTargetMessageFilter]  WITH CHECK ADD  CONSTRAINT [FK_scsTargetMessageFilter_scsTargetMessage] FOREIGN KEY([targetMessageId])
REFERENCES [dbo].[scsTargetMessage] ([targetMessageId])
GO
ALTER TABLE [dbo].[scsTargetMessageFilter] CHECK CONSTRAINT [FK_scsTargetMessageFilter_scsTargetMessage]
GO
ALTER TABLE [dbo].[scsValueListItem]  WITH CHECK ADD  CONSTRAINT [FK_scsValueListItem_scsValueList] FOREIGN KEY([valueListId])
REFERENCES [dbo].[scsValueList] ([valueListId])
GO
ALTER TABLE [dbo].[scsValueListItem] CHECK CONSTRAINT [FK_scsValueListItem_scsValueList]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'''0'', ''1'' or ''M''' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'scsApplication', @level2type=N'COLUMN',@level2name=N'messagesPerDocument'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'TEST, PROD, orQA' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'scsCampaign', @level2type=N'COLUMN',@level2name=N'stage'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Identifies the campiagn to be used by the SelectionProcessor when run in QA mode' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'scsCampaign', @level2type=N'COLUMN',@level2name=N'QA'
GO
