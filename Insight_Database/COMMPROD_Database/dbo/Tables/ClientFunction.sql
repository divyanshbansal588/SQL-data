CREATE TABLE [dbo].[ClientFunction](
	[userId] [varchar](50) NOT NULL,
	[tsUpdated] [datetime] NOT NULL,
	[code] [varchar](15) NOT NULL,
	[description] [varchar](255) NOT NULL,
	[applicationCode] [char](1) NOT NULL,
	[groupName] [varchar](15) NOT NULL,
 CONSTRAINT [pkClientFunction] PRIMARY KEY CLUSTERED 
(
	[code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ClientFunction] ADD  CONSTRAINT [DF__ClientFun__tsUpd__468862B0]  DEFAULT (getdate()) FOR [tsUpdated]
GO
ALTER TABLE [dbo].[ClientFunction] ADD  CONSTRAINT [DF_ClientFunction_applicationCode]  DEFAULT ('I') FOR [applicationCode]
GO
ALTER TABLE [dbo].[ClientFunction] ADD  CONSTRAINT [DF_ClientFunction_groupName]  DEFAULT ('') FOR [groupName]