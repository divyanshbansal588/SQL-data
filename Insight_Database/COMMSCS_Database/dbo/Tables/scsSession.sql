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
ALTER TABLE [dbo].[scsSession] ADD  DEFAULT (getdate()) FOR [tsCreated]
GO
ALTER TABLE [dbo].[scsSession] ADD  CONSTRAINT [DF_scsSession_otherData]  DEFAULT ('') FOR [otherData]
GO
ALTER TABLE [dbo].[scsSession] ADD  CONSTRAINT [MSrepl_tran_version_default_92009E3A_3AED_48BA_8EC2_19EFA0A576B2_1223675407]  DEFAULT (newid()) FOR [msrepl_tran_version]