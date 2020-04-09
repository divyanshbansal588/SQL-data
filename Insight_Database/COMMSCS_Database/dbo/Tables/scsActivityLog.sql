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
ALTER TABLE [dbo].[scsActivityLog] ADD  CONSTRAINT [DF_scsActivityLog_activityID]  DEFAULT (newid()) FOR [activityID]
GO
ALTER TABLE [dbo].[scsActivityLog] ADD  CONSTRAINT [DF__scsActivi__tsAct__4DB4832C]  DEFAULT (getdate()) FOR [tsActivity]
GO
ALTER TABLE [dbo].[scsActivityLog] ADD  CONSTRAINT [MSrepl_tran_version_default_0F4E6A49_DF06_467E_8A43_DA86A65288C2_1319675749]  DEFAULT (newid()) FOR [msrepl_tran_version]