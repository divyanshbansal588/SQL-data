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
ALTER TABLE [dbo].[scsDataSource] ADD  CONSTRAINT [DF__scsDataSo__dataS__3EDC53F0]  DEFAULT (newid()) FOR [dataSourceId]
GO
ALTER TABLE [dbo].[scsDataSource] ADD  CONSTRAINT [DF__scsDataSo__notes__3FD07829]  DEFAULT ('') FOR [notes]
GO
ALTER TABLE [dbo].[scsDataSource] ADD  CONSTRAINT [MSrepl_tran_version_default_9EF34EA4_7CFE_4AD7_A62D_01F8FD7A65EB_455672671]  DEFAULT (newid()) FOR [msrepl_tran_version]