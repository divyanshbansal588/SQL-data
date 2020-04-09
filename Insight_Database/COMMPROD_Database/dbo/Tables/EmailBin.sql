CREATE TABLE [dbo].[EmailBin](
	[emailId] [uniqueidentifier] NOT NULL,
	[tsCreated] [datetime] NOT NULL,
	[userId] [varchar](50) NOT NULL,
	[recipients] [varchar](500) NOT NULL,
	[subject] [varchar](255) NOT NULL,
	[body] [varchar](5000) NOT NULL,
 CONSTRAINT [PK_EmailBin] PRIMARY KEY NONCLUSTERED 
(
	[emailId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[EmailBin] ADD  CONSTRAINT [DF_EmailBin_emailId]  DEFAULT (newid()) FOR [emailId]
GO
ALTER TABLE [dbo].[EmailBin] ADD  CONSTRAINT [DF__emailBin2__tsCrea__5FB4CE84]  DEFAULT (getdate()) FOR [tsCreated]
GO
ALTER TABLE [dbo].[EmailBin] ADD  CONSTRAINT [DF_EmailBin_userId]  DEFAULT ('') FOR [userId]
GO
ALTER TABLE [dbo].[EmailBin] ADD  CONSTRAINT [DF_EmailBin_recipients]  DEFAULT ('') FOR [recipients]
GO
ALTER TABLE [dbo].[EmailBin] ADD  CONSTRAINT [DF_EmailBin_subject]  DEFAULT ('') FOR [subject]
GO
ALTER TABLE [dbo].[EmailBin] ADD  CONSTRAINT [DF_EmailBinbody]  DEFAULT ('') FOR [body]