CREATE TABLE [dbo].[PageLayout](
	[applicationCode] [varchar](20) NOT NULL,
	[pageLayoutCode] [varchar](20) NOT NULL,
	[tsCreated] [datetime] NOT NULL,
	[pageLayoutDescription] [varchar](100) NOT NULL,
	[thumbnailBytes] [varbinary](max) NULL,
	[pdfContent] [varbinary](max) NULL,
	[msrepl_tran_version] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_PageLayout] PRIMARY KEY CLUSTERED 
(
	[applicationCode] ASC,
	[pageLayoutCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[PageLayout]  WITH NOCHECK ADD  CONSTRAINT [FK_PageLayout_MessageApplication] FOREIGN KEY([applicationCode])
REFERENCES [dbo].[MessageApplication] ([applicationCode])
NOT FOR REPLICATION
GO

ALTER TABLE [dbo].[PageLayout] CHECK CONSTRAINT [FK_PageLayout_MessageApplication]
GO
ALTER TABLE [dbo].[PageLayout] ADD  CONSTRAINT [DF_PageLayout_tsCreated]  DEFAULT (getdate()) FOR [tsCreated]
GO
ALTER TABLE [dbo].[PageLayout] ADD  CONSTRAINT [MSrepl_tran_version_default_F79D92FC_1DBA_4EFE_B8AB_D8B5104B2EF7_757577737]  DEFAULT (newid()) FOR [msrepl_tran_version]