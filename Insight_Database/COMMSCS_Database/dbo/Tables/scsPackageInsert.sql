CREATE TABLE [dbo].[scsPackageInsert](
	[packageId] [uniqueidentifier] NOT NULL,
	[inventoryID] [int] NOT NULL,
	[campaignID] [uniqueidentifier] NOT NULL,
	[msrepl_tran_version] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PKscsPackageInsert] PRIMARY KEY CLUSTERED 
(
	[packageId] ASC,
	[inventoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[scsPackageInsert]  WITH NOCHECK ADD  CONSTRAINT [FKscsPackageInsert#scsPackage] FOREIGN KEY([packageId])
REFERENCES [dbo].[scsPackage] ([packageId])
GO

ALTER TABLE [dbo].[scsPackageInsert] CHECK CONSTRAINT [FKscsPackageInsert#scsPackage]
GO
ALTER TABLE [dbo].[scsPackageInsert] ADD  CONSTRAINT [MSrepl_tran_version_default_A66220E2_9A3D_4C78_AF79_606D74835E6B_1339151816]  DEFAULT (newid()) FOR [msrepl_tran_version]