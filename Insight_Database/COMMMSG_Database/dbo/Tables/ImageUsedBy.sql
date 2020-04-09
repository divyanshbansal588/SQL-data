CREATE TABLE [dbo].[ImageUsedBy](
	[imageId] [uniqueidentifier] NOT NULL,
	[objectId] [uniqueidentifier] NOT NULL,
	[objectType] [char](1) NOT NULL,
	[msrepl_tran_version] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_ImageUsedBy_1] PRIMARY KEY CLUSTERED 
(
	[imageId] ASC,
	[objectId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ImageUsedBy] ADD  CONSTRAINT [DF_ImageUsedBy_objectType]  DEFAULT ('M') FOR [objectType]
GO
ALTER TABLE [dbo].[ImageUsedBy] ADD  CONSTRAINT [MSrepl_tran_version_default_D1753573_7586_407A_8A10_9C95AFFEEF87_373576369]  DEFAULT (newid()) FOR [msrepl_tran_version]