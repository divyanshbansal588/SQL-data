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
ALTER TABLE [dbo].[LocationAddress]  WITH CHECK ADD  CONSTRAINT [FK_LocationAddress_Client] FOREIGN KEY([clientCode])
REFERENCES [dbo].[Client] ([clientCode])
GO

ALTER TABLE [dbo].[LocationAddress] CHECK CONSTRAINT [FK_LocationAddress_Client]
GO
ALTER TABLE [dbo].[LocationAddress] ADD  CONSTRAINT [DF__LocationA__tsCre__37CB9CC5]  DEFAULT (getdate()) FOR [tsCreated]
GO
ALTER TABLE [dbo].[LocationAddress] ADD  CONSTRAINT [DF__LocationA__addre__38BFC0FE]  DEFAULT ('') FOR [address2]
GO
ALTER TABLE [dbo].[LocationAddress] ADD  CONSTRAINT [DF__LocationA__phone__39B3E537]  DEFAULT ('') FOR [phoneNumber]
GO
ALTER TABLE [dbo].[LocationAddress] ADD  CONSTRAINT [DF_LocationAddress_emailAddress]  DEFAULT ('') FOR [emailAddress]