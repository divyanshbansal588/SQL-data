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
ALTER TABLE [dbo].[MessageArea]  WITH NOCHECK ADD  CONSTRAINT [FK_MessageArea_MessageApplication] FOREIGN KEY([applicationCode])
REFERENCES [dbo].[MessageApplication] ([applicationCode])
NOT FOR REPLICATION
GO

ALTER TABLE [dbo].[MessageArea] CHECK CONSTRAINT [FK_MessageArea_MessageApplication]
GO
ALTER TABLE [dbo].[MessageArea] ADD  CONSTRAINT [DF_MessageArea_tsCreated]  DEFAULT (getdate()) FOR [tsCreated]
GO
ALTER TABLE [dbo].[MessageArea] ADD  CONSTRAINT [DF_MessageArea_mutlipleMessageHandlingCode]  DEFAULT ('2') FOR [multipleMessageHandlingCode]
GO
ALTER TABLE [dbo].[MessageArea] ADD  CONSTRAINT [DF_MessageArea_messageSpacing]  DEFAULT ((0.1)) FOR [messageSpacing]
GO
ALTER TABLE [dbo].[MessageArea] ADD  CONSTRAINT [MSrepl_tran_version_default_458292B5_27B2_487E_9C25_7F0015FAF44D_661577395]  DEFAULT (newid()) FOR [msrepl_tran_version]