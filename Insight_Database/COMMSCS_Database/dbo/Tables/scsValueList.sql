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
ALTER TABLE [dbo].[scsValueList] ADD  CONSTRAINT [DF__scsValueL__value__149C0161]  DEFAULT (newid()) FOR [valueListId]
GO
ALTER TABLE [dbo].[scsValueList] ADD  CONSTRAINT [DF_scsValueList_minLength]  DEFAULT ((0)) FOR [minLength]
GO
ALTER TABLE [dbo].[scsValueList] ADD  CONSTRAINT [DF_scsValueList_maxLength]  DEFAULT ((0)) FOR [maxLength]
GO
ALTER TABLE [dbo].[scsValueList] ADD  CONSTRAINT [DF__scsValueL__notes__1590259A]  DEFAULT ('') FOR [notes]
GO
ALTER TABLE [dbo].[scsValueList] ADD  CONSTRAINT [MSrepl_tran_version_default_9D1F0DE0_CD73_4505_BCFD_810C424FB0B4_985770569]  DEFAULT (newid()) FOR [msrepl_tran_version]