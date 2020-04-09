CREATE TABLE [dbo].[scsValueListItem](
	[valueListId] [uniqueidentifier] NOT NULL,
	[itemValue] [varchar](100) NOT NULL,
	[itemDescription] [varchar](1000) NOT NULL,
	[msrepl_tran_version] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PKscsValueListItem] PRIMARY KEY CLUSTERED 
(
	[valueListId] ASC,
	[itemValue] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[scsValueListItem]  WITH CHECK ADD  CONSTRAINT [FK_scsValueListItem_scsValueList] FOREIGN KEY([valueListId])
REFERENCES [dbo].[scsValueList] ([valueListId])
GO

ALTER TABLE [dbo].[scsValueListItem] CHECK CONSTRAINT [FK_scsValueListItem_scsValueList]
GO
ALTER TABLE [dbo].[scsValueListItem] ADD  DEFAULT (newid()) FOR [valueListId]
GO
ALTER TABLE [dbo].[scsValueListItem] ADD  DEFAULT ('') FOR [itemDescription]
GO
ALTER TABLE [dbo].[scsValueListItem] ADD  CONSTRAINT [MSrepl_tran_version_default_1B89A020_71EC_4A8B_BC2E_2B200C66E99C_377768403]  DEFAULT (newid()) FOR [msrepl_tran_version]