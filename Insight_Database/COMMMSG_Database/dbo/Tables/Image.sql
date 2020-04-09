CREATE TABLE [dbo].[Image](
	[clientCode] [varchar](15) NOT NULL,
	[imageCode] [varchar](100) NOT NULL,
	[imageId] [uniqueidentifier] NOT NULL,
	[tsCreated] [datetime] NOT NULL,
	[tsLastUsed] [datetime] NULL,
	[imageDescription] [varchar](100) NULL,
	[sourceFileName] [varchar](500) NOT NULL,
	[categoryId] [uniqueidentifier] NOT NULL,
	[imageFormat] [varchar](20) NOT NULL,
	[resolution] [money] NOT NULL,
	[imageWidth] [money] NOT NULL,
	[imageHeight] [money] NOT NULL,
	[thumbnailBytes] [varbinary](max) NULL,
	[imageBytes] [varbinary](max) NULL,
	[imageBytesGrayscale] [varbinary](max) NULL,
	[msrepl_tran_version] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_MessageImage] PRIMARY KEY CLUSTERED 
(
	[clientCode] ASC,
	[imageCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[Image]  WITH NOCHECK ADD  CONSTRAINT [FK_Image_ImageCategory] FOREIGN KEY([categoryId])
REFERENCES [dbo].[ImageCategory] ([categoryId])
NOT FOR REPLICATION
GO

ALTER TABLE [dbo].[Image] CHECK CONSTRAINT [FK_Image_ImageCategory]
GO
ALTER TABLE [dbo].[Image] ADD  CONSTRAINT [DF_Image_imageId]  DEFAULT (newid()) FOR [imageId]
GO
ALTER TABLE [dbo].[Image] ADD  CONSTRAINT [DF_Image_tsCreated]  DEFAULT (getdate()) FOR [tsCreated]
GO
ALTER TABLE [dbo].[Image] ADD  CONSTRAINT [MSrepl_tran_version_default_63E8371D_1D9E_4116_B16C_BC99E5D0FCEA_309576141]  DEFAULT (newid()) FOR [msrepl_tran_version]