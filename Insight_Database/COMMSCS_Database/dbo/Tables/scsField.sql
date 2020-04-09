CREATE TABLE [dbo].[scsField](
	[fieldId] [uniqueidentifier] NOT NULL,
	[dataSourceId] [uniqueidentifier] NOT NULL,
	[displayName] [varchar](100) NOT NULL,
	[dataName] [varchar](50) NOT NULL,
	[dataType] [char](1) NOT NULL,
	[optional] [char](1) NOT NULL,
	[source] [varchar](500) NOT NULL,
	[minLength] [int] NOT NULL,
	[maxLength] [int] NOT NULL,
	[msrepl_tran_version] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PKscsField] PRIMARY KEY CLUSTERED 
(
	[fieldId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[scsField]  WITH NOCHECK ADD  CONSTRAINT [FKscsField#scsDataSource] FOREIGN KEY([dataSourceId])
REFERENCES [dbo].[scsDataSource] ([dataSourceId])
GO

ALTER TABLE [dbo].[scsField] CHECK CONSTRAINT [FKscsField#scsDataSource]
GO
ALTER TABLE [dbo].[scsField] ADD  CONSTRAINT [DF__scsField__fieldI__42ACE4D4]  DEFAULT (newid()) FOR [fieldId]
GO
ALTER TABLE [dbo].[scsField] ADD  CONSTRAINT [DF_scsField_displayName]  DEFAULT ('') FOR [displayName]
GO
ALTER TABLE [dbo].[scsField] ADD  CONSTRAINT [DF_scsField_notes]  DEFAULT ('') FOR [source]
GO
ALTER TABLE [dbo].[scsField] ADD  CONSTRAINT [DF_scsField_minLength]  DEFAULT ((0)) FOR [minLength]
GO
ALTER TABLE [dbo].[scsField] ADD  CONSTRAINT [DF_scsField_maxLength]  DEFAULT ((0)) FOR [maxLength]
GO
ALTER TABLE [dbo].[scsField] ADD  CONSTRAINT [MSrepl_tran_version_default_1388D710_E46E_467B_A027_72C952BF00E5_151671588]  DEFAULT (newid()) FOR [msrepl_tran_version]