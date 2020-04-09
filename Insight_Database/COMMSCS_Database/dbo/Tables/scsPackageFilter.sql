CREATE TABLE [dbo].[scsPackageFilter](
	[filterId] [uniqueidentifier] NOT NULL,
	[packageId] [uniqueidentifier] NOT NULL,
	[campaignID] [uniqueidentifier] NOT NULL,
	[msrepl_tran_version] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PKscsPackageFilter] PRIMARY KEY CLUSTERED 
(
	[filterId] ASC,
	[packageId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[scsPackageFilter]  WITH NOCHECK ADD  CONSTRAINT [FKscsPackageFilter#scsPackage] FOREIGN KEY([packageId])
REFERENCES [dbo].[scsPackage] ([packageId])
GO

ALTER TABLE [dbo].[scsPackageFilter] CHECK CONSTRAINT [FKscsPackageFilter#scsPackage]
GO
ALTER TABLE [dbo].[scsPackageFilter]  WITH NOCHECK ADD  CONSTRAINT [FKscsPackageFilterCriteria#scsFilter] FOREIGN KEY([filterId])
REFERENCES [dbo].[scsFilter] ([filterId])
GO

ALTER TABLE [dbo].[scsPackageFilter] CHECK CONSTRAINT [FKscsPackageFilterCriteria#scsFilter]
GO
ALTER TABLE [dbo].[scsPackageFilter] ADD  CONSTRAINT [MSrepl_tran_version_default_B0535358_00C6_450D_B7FF_A7180F7A2780_1710629137]  DEFAULT (newid()) FOR [msrepl_tran_version]