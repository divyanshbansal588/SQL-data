CREATE TABLE [dbo].[scsFilter](
	[filterId] [uniqueidentifier] NOT NULL,
	[dataSourceId] [uniqueidentifier] NOT NULL,
	[filterName] [varchar](100) NOT NULL,
	[andOr] [char](1) NOT NULL,
	[filterType] [char](1) NOT NULL,
	[notes] [varchar](500) NOT NULL,
	[msrepl_tran_version] [uniqueidentifier] NOT NULL,
	[enabled] [char](1) NOT NULL,
 CONSTRAINT [PKscsFilter] PRIMARY KEY CLUSTERED 
(
	[filterId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[scsFilter] ADD  CONSTRAINT [DF__scsFilter__filte__4A4E069C]  DEFAULT (newid()) FOR [filterId]
GO
ALTER TABLE [dbo].[scsFilter] ADD  CONSTRAINT [DF_scsFilter_andOrType]  DEFAULT ('A') FOR [andOr]
GO
ALTER TABLE [dbo].[scsFilter] ADD  CONSTRAINT [DF_scsFilter_filterType]  DEFAULT ('S') FOR [filterType]
GO
ALTER TABLE [dbo].[scsFilter] ADD  CONSTRAINT [DF__scsFilter__notes__4B422AD5]  DEFAULT ('') FOR [notes]
GO
ALTER TABLE [dbo].[scsFilter] ADD  CONSTRAINT [MSrepl_tran_version_default_769561A2_3C75_48DF_8CF2_5BA88E5DC518_1095674951]  DEFAULT (newid()) FOR [msrepl_tran_version]
GO
ALTER TABLE [dbo].[scsFilter] ADD  CONSTRAINT [DF_scsFilter_enabled]  DEFAULT ('Y') FOR [enabled]