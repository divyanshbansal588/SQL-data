CREATE TABLE [dbo].[ImageCategory](
	[clientCode] [varchar](15) NOT NULL,
	[categoryId] [uniqueidentifier] NOT NULL,
	[categoryDescription] [varchar](100) NOT NULL,
	[tsCreated] [datetime] NOT NULL,
	[msrepl_tran_version] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_MessageCategory] PRIMARY KEY CLUSTERED 
(
	[categoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ImageCategory] ADD  CONSTRAINT [DF_MessageCategory_categoryCode]  DEFAULT (newid()) FOR [categoryId]
GO
ALTER TABLE [dbo].[ImageCategory] ADD  CONSTRAINT [DF_ImageCategory_tsCreated]  DEFAULT (getdate()) FOR [tsCreated]
GO
ALTER TABLE [dbo].[ImageCategory] ADD  CONSTRAINT [MSrepl_tran_version_default_B4441F2B_C76E_4A92_A935_EF9642F9BD38_341576255]  DEFAULT (newid()) FOR [msrepl_tran_version]