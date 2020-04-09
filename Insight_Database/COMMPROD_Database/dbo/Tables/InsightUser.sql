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
ALTER TABLE [dbo].[InsightUser]  WITH CHECK ADD  CONSTRAINT [FK_InsightUser_Client] FOREIGN KEY([clientCode])
REFERENCES [dbo].[Client] ([clientCode])
GO

ALTER TABLE [dbo].[InsightUser] CHECK CONSTRAINT [FK_InsightUser_Client]
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