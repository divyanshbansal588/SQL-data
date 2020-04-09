CREATE TABLE [dbo].[MessageVersion](
	[clientCode] [varchar](15) NOT NULL,
	[messageCode] [varchar](100) NOT NULL,
	[messageId] [uniqueidentifier] NOT NULL,
	[messageVersionId] [uniqueidentifier] NOT NULL,
	[tsCreated] [datetime] NOT NULL,
	[contentType] [varchar](4) NOT NULL,
	[tsApproved] [datetime] NOT NULL,
	[tsApprovedOSG] [datetime] NULL,
	[messageDescription] [varchar](100) NOT NULL,
	[messageWidth] [money] NOT NULL,
	[messageHeight] [money] NOT NULL,
	[thumbnailBytes] [varbinary](max) NULL,
	[imageBytes] [varbinary](max) NULL,
	[htmlContent] [nvarchar](max) NULL,
	[pdfContent] [varbinary](max) NULL,
	[msrepl_tran_version] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_MessageHistory] PRIMARY KEY NONCLUSTERED 
(
	[messageVersionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[MessageVersion] ADD  CONSTRAINT [DF_MessageVersion_messageVersionId]  DEFAULT (newid()) FOR [messageVersionId]
GO
ALTER TABLE [dbo].[MessageVersion] ADD  CONSTRAINT [DF_MessageVersion_tsCreated]  DEFAULT (getdate()) FOR [tsCreated]
GO
ALTER TABLE [dbo].[MessageVersion] ADD  CONSTRAINT [MSrepl_tran_version_default_0A063120_1A9C_43B2_9F08_8238E3F0D0A3_725577623]  DEFAULT (newid()) FOR [msrepl_tran_version]