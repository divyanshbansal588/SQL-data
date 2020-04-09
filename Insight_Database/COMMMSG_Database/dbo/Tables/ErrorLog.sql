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
ALTER TABLE [dbo].[ErrorLog] ADD  CONSTRAINT [DF_errorLog_errorId]  DEFAULT (newid()) FOR [errorId]
GO
ALTER TABLE [dbo].[ErrorLog] ADD  CONSTRAINT [DF_errorLog_tsCreated]  DEFAULT (getdate()) FOR [tsCreated]
GO
ALTER TABLE [dbo].[ErrorLog] ADD  CONSTRAINT [DF_errorLog_userId]  DEFAULT ('') FOR [userId]
GO
ALTER TABLE [dbo].[ErrorLog] ADD  CONSTRAINT [DF_errorLog_application]  DEFAULT ('') FOR [application]
GO
ALTER TABLE [dbo].[ErrorLog] ADD  CONSTRAINT [MSrepl_tran_version_default_8D7C7544_EC7D_4E38_A5F2_4A1093E43F63_245575913]  DEFAULT (newid()) FOR [msrepl_tran_version]