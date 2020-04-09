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
ALTER TABLE [dbo].[MessageActivityLog] ADD  CONSTRAINT [DF_MessageActivityLog_tsActivity]  DEFAULT (getdate()) FOR [tsActivity]
GO
ALTER TABLE [dbo].[MessageActivityLog] ADD  CONSTRAINT [DF__MessageAc__activ__79FD19BE]  DEFAULT (newid()) FOR [activityId]
GO
ALTER TABLE [dbo].[MessageActivityLog] ADD  CONSTRAINT [DF_MessageActivityLog_isError]  DEFAULT ('N') FOR [isError]
GO
ALTER TABLE [dbo].[MessageActivityLog] ADD  CONSTRAINT [MSrepl_tran_version_default_C7A4E65D_4379_4841_84D0_3A9762A0F1CC_597577167]  DEFAULT (newid()) FOR [msrepl_tran_version]